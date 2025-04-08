---
layout: post
title: How to Run a Simple Apache Spark App in CDH 5
date: 2014-04-24
categories: [computer science]
tags: [big data]

---

# How-to: Run a Simple Apache Spark App in CDH 5 

## Article Source
* Title: [How-to: Run a Simple Apache Spark App in CDH 5](http://blog.cloudera.com/blog/2014/04/how-to-run-a-simple-apache-spark-app-in-cdh-5/)
* Authors: [Sandy
    Ryza](http://blog.cloudera.com/blog/author/sandy-ryza/ "Posts by Sandy Ryza")

**Getting started with Spark (now shipping inside CDH 5) is easy using
this simple example.**

[Apache Spark](http://spark.apache.org/) is a general-purpose, cluster
computing framework that, like MapReduce in Apache Hadoop, offers
powerful abstractions for processing large datasets. For various reasons
pertaining to performance, functionality, and APIs, Spark is already
becoming more popular than MapReduce for certain types of workloads.
(For more background about Spark, read [this
post](http://blog.cloudera.com/blog/2013/11/putting-spark-to-use-fast-in-memory-computing-for-your-big-data-applications/).)

In this how-to, you’ll learn how to write, compile, and run a simple
Spark program written in Scala on CDH 5 (in which Spark ships and is
supported by Cloudera). The full code for the example is hosted at
[https://github.com/sryza/simplesparkapp](https://github.com/sryza/simplesparkapp).

Writing
-------

Our example app will be a souped-up version of
[WordCount](http://wiki.apache.org/hadoop/WordCount), the classic
MapReduce example. In WordCount, the goal is to learn the distribution
of letters in the most popular words in our corpus. That is, we want to:

1.  Read an input set of text documents
2.  Count the number of times each word appears
3.  Filter out all words that show up less than a million times
4.  For the remaining set, count the number of times each letter occurs

In MapReduce, this would require two MapReduce jobs, as well as
persisting the intermediate data to HDFS in between them. In constrast,
in Spark, you can write a single job in about 90 percent fewer lines of
code.

Our input is a huge text file where each line contains all the words in
a document, stripped of punctuation. The full Scala program looks like
this:

```java
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
object SparkWordCount {
  def main(args: Array[String]) {
    val sc = new SparkContext(new SparkConf().setAppName("Spark Count"))
    val threshold = args(1).toInt
    // split each document into words
    val tokenized = sc.textFile(args(0)).flatMap(_.split(" "))
    // count the occurrence of each word
    val wordCounts = tokenized.map((_, 1)).reduceByKey(_ + _)
    // filter out words with less than threshold occurrences
    val filtered = wordCounts.filter(_._2 >= threshold)
    // count characters
    val charCounts = filtered.flatMap(_._1.toCharArray).map((_, 1)).reduceByKey(_ + _)
    System.out.println(charCounts.collect().mkString(", "))
    }
}
```

 

Spark uses “lazy evaluation”, meaning that transformations don’t execute
on the cluster until an “action” operation is invoked. Examples of
action operations are `collect`, which pulls data to the client, and
`saveAsTextFile`, which writes data to a filesystem like HDFS.

It’s worth noting that in Spark, the definition of “reduce” is slightly
different than that in MapReduce. In MapReduce, a reduce function call
accepts all the records corresponding to a given key. In Spark, the
function passed to `reduce`, or `reduceByKey` function call, accepts
just two arguments – so if it’s not associative, bad things will happen.
A positive consequence is that Spark knows it can always apply a
combiner. Based on that definition, the Spark equivalent of MapReduce’s
reduce is similar to a `groupBy` followed by a map.

For those more comfortable with Java, here’s the same program using
Spark’s Java API:

```xml
import java.util.ArrayList;
import java.util.Arrays;
import org.apache.spark.api.java.*;
import org.apache.spark.api.java.function.*;
import org.apache.spark.SparkConf;
import scala.Tuple2;
public class JavaWordCount {
  public static void main(String[] args) {
    JavaSparkContext sc = new JavaSparkContext(new SparkConf().setAppName("Spark Count"));
    final int threshold = Integer.parseInt(args[1]);
    // split each document into words
    JavaRDD<String> tokenized = sc.textFile(args[0]).flatMap(
      new FlatMapFunction<String, String>() {
        public Iterable<String> call(String s) {
          return Arrays.asList(s.split(" "));
        }
      }
    );
    // count the occurrence of each word
    JavaPairRDD<String, Integer> counts = tokenized.map(
      new PairFunction<String, String, Integer>() {
        public Tuple2<String, Integer> call(String s) {
          return new Tuple2(s, 1);
        }
      }
    ).reduceByKey(
      new Function2<Integer, Integer, Integer>() {
        public Integer call(Integer i1, Integer i2) {
          return i1 + i2;
        }
      }
    );
    // filter out words with less than threshold occurrences
    JavaPairRDD<String, Integer> filtered = counts.filter(
      new Function<Tuple2<String, Integer>, Boolean>() {
        public Boolean call(Tuple2<String, Integer> tup) {
          return tup._2 >= threshold;
        }
      }
    );
    // count characters
    JavaPairRDD<Character, Integer> charCounts = filtered.flatMap(
      new FlatMapFunction<Tuple2<String, Integer>, Character>() {
        public Iterable<Character> call(Tuple2<String, Integer> s) {
          ArrayList<Character> chars = new ArrayList<Character>(s._1.length());
          for (char c : s._1.toCharArray()) {
            chars.add(c);
          }
          return chars;
        }
      }
    ).map(
      new PairFunction<Character, Character, Integer>() {
        public Tuple2<Character, Integer> call(Character c) {
          return new Tuple2(c, 1);
        }
      }
    ).reduceByKey(
      new Function2<Integer, Integer, Integer>() {
        public Integer call(Integer i1, Integer i2) {
          return i1 + i2;
        }
      }
    );
    System.out.println(charCounts.collect());
  }
}
```

Because Java doesn’t support anonymous functions, the program is
considerably more verbose, but it still requires a fraction of the code
needed in an equivalent MapReduce program.

Compiling
---------

We’ll use Maven to compile our program. Maven expects a specific
directory layout that informs it where to look for source files. Our
Scala code goes under src/main/scala, and our Java code goes under
src/main/java. That is, we place
[SparkWordCount.scala](https://github.com/sryza/simplesparkapp/blob/master/src/main/scala/com/cloudera/sparkwordcount/SparkWordCount.scala)
in the src/main/scala/com/cloudera/sparkwordcount directory and
[JavaWordCount.java](https://github.com/sryza/simplesparkapp/blob/master/src/main/java/com/cloudera/sparkwordcount/JavaWordCount.java)
in the src/main/java/com/cloudera/sparkwordcount directory.

Maven also requires you to place a
[pom.xml](https://github.com/sryza/simplesparkapp/blob/master/pom.xml)
file in the root of the project directory that tells it how to build the
project. A few noteworthy excerpts are included below.

To compile Scala code, include:

```xml
<plugin>
  <groupId>org.scala-tools</groupId>
      <artifactId>maven-scala-plugin</artifactId>
      <executions>
        <execution>
          <goals>
            <goal>compile</goal>
            <goal>testCompile</goal>
          </goals>
        </execution>
      </executions>
</plugin>
```

 

which requires adding the scala-tools plugin repository:

```xml
<pluginRepositories>
<pluginRepository>
    <id>scala-tools.org</id>
    <name>Scala-tools Maven2 Repository</name>
    <url>http://scala-tools.org/repo-releases</url>
  </pluginRepository>
</pluginRepositories>
```

 

Then, include Spark and Scala as dependencies:

```xml
<dependencies>
  <dependency>
    <groupId>org.scala-lang</groupId>
    <artifactId>scala-library</artifactId>
    <version>2.10.2</version>
  </dependency>
  <dependency>
    <groupId>org.apache.spark</groupId>
    <artifactId>spark-core_2.10</artifactId>
    <version>0.9.0-cdh5.0.0</version>
  </dependency>
</dependencies>
```

 

Finally, to generate our app jar, simply run:

```xml
mvn package
```

 

It will show up in the target directory as
`sparkwordcount-0.0.1-SNAPSHOT.jar`.

Running
-------

Running your Spark application is like running any Java program: You
include the application jar and its dependencies in the classpath and
pass apps the main class. In a CDH installation, the Spark and Hadoop
jars are included on every node. Some will recommend packaging these
dependencies inside your Spark application jar itself, but Cloudera
recommends referencing the locally installed jars. Doing so ensures that
the client uses the same versions of these jars as the server, and means
you don’t need to recompile apps when you upgrade the cluster.

The following includes local Hadoop and Spark jars in the classpath and
then runs the application. Before running, place the input file into a
directory on HDFS. The repository supplies an [example input
file](https://github.com/sryza/simplesparkapp/blob/master/data/inputfile.txt)
in its “data” directory.

Spark’s trunk contains a script called spark-submit that abstracts away
the pain of building the classpath. Its inclusion in an upcoming release
will make launching an application much easier.

```xml
source /etc/spark/conf/spark-env.sh
export JAVA_HOME=/usr/java/jdk1.7.0_45-cloudera
# system jars:
CLASSPATH=/etc/hadoop/conf
CLASSPATH=$CLASSPATH:$HADOOP_HOME/*:$HADOOP_HOME/lib/*
CLASSPATH=$CLASSPATH:$HADOOP_HOME/../hadoop-mapreduce/*:$HADOOP_HOME/../hadoop-mapreduce/lib/*
CLASSPATH=$CLASSPATH:$HADOOP_HOME/../hadoop-yarn/*:$HADOOP_HOME/../hadoop-yarn/lib/*
CLASSPATH=$CLASSPATH:$HADOOP_HOME/../hadoop-hdfs/*:$HADOOP_HOME/../hadoop-hdfs/lib/*
CLASSPATH=$CLASSPATH:$SPARK_HOME/assembly/lib/*
# app jar:
CLASSPATH=$CLASSPATH:target/sparkwordcount-0.0.1-SNAPSHOT.jar
$JAVA_HOME/bin/java -cp $CLASSPATH -Dspark.master=local com.cloudera.sparkwordcount.SparkWordCount hdfs:///somedirectory/inputfile.txt 2
```

`-Dspark.master` specifies the cluster against which to run the
application; `local` will run all tasks in the same local process. To
run against a Spark standalone cluster instead, include a URL containing
the master’s address (such as `spark://masterhost:7077`). To run against
a YARN cluster, include `yarn-client` — Spark will determine the YARN
ResourceManager’s address from the YARN configuration file.

The output of the program should look something like this:

    (e,6), (f,1), (a,4), (t,2), (u,1), (r,2), (v,1), (b,1), (c,1), (h,1), (o,2), (l,1), (n,4), (p,2), (i,1)
      

Congratulations, you have just run a simple Spark application in CDH 5.
Happy Sparking!

*Sandy Ryza is an engineer on the data science team at Cloudera. He is
an Apache Hadoop committer and recently led Cloudera’s Spark
development.*

* * * * *

**Spark Summit 2014** is coming (June 30 – July 2)! Register
[here](https://sparksummit2014.eventbrite.com/?discount=Cloudera2014) to
get 20% off the regular conference price.

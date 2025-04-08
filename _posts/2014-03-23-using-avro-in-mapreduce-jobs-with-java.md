---
layout: post
title: Using Avro in MapReduce Jobs with Java 
date: 2014-03-23
categories: [computer science]
tags: [big data]

---

# Using Avro in MapReduce Jobs with Java

[Apache Avro](http://avro.apache.org/) is a very popular data serialization format in the Hadoop technology stack. In this article I show code examples of MapReduce jobs in Java, Hadoop Streaming, Pig and Hive that read and/or write data in Avro format. We will use a small, Twitter-like data set as input for our example MapReduce jobs.

---

## Table of Contents

* <a href="#Requirements">Requirements</a>
* <a href="#Example data">Example data</a>
    * <a href="#Avro schema">Avro schema</a>
    * <a href="#Avro data files">Avro data files</a>
    * <a href="#Preparing the input data">Preparing the input data</a>
* <a href="#Java">Java</a>
    * <a href="#Usage">Usage</a>
    * <a href="#Examples-Java">Examples</a>
    * <a href="#MiniMRCluster and Hadoop MRv2">MiniMRCluster and Hadoop MRv2</a>
    * <a href="#Avro-String-vs-CharSequence-vs-Utf8">Avro: String vs CharSequence vs Utf8</a>
    * <a href="#Further readings on Java">Further readings on Java</a>

---

<iframe width="600" height="400" src="//www.youtube.com/embed/3BOkW1iVQOQ" frameborder="0" allowfullscreen></iframe>

## avro-hadoop-starter 

Example MapReduce jobs in Java, Hadoop Streaming, Pig and Hive that read and/or write data in Avro format.


# Prerequisites
First you must clone my [avro-hadoop-starter](https://github.com/miguno/avro-hadoop-starter) repository on GitHub.

```bash
$ git clone git@github.com:miguno/avro-hadoop-starter.git
$ cd avro-hadoop-starter
```

<a name="Requirements"></a>

# Requirements

The examples require the following software versions:

* [Gradle](http://www.gradle.org/) 1.9 (only for the Java examples)
* Java JDK 7 (only for the Java examples)
    * It is easy to switch to JDK 6.  Mostly you will need to change the `sourceCompatibility` and
      `targetCompatibility` parameters in [build.gradle](build.gradle) from `1.7` to `1.6`  But since there are
        a couple of JDK 7 related gotchas (e.g. problems with its new bytecode verifier) that the Java example code
        solves I decided to stick with JDK 7 as the default.
* [Hadoop](http://hadoop.apache.org/) 2.x with MRv1 (not MRv2/YARN)
* [Pig](http://pig.apache.org/) 0.11
* [Hive](http://hive.apache.org/) 0.10
* [Twitter Bijection](https://github.com/twitter/bijection) 0.6
* [Avro](http://avro.apache.org/) 1.7.6

More precisely, the examples where tested with those Hadoop stack components that ship with
[Cloudera CDH 4.x](http://www.cloudera.com/content/cloudera/en/products/cdh.html).

<a name="Example data"></a>

# Example data

We are using a small, Twitter-like data set as input for our example MapReduce jobs.


<a name="Avro schema"></a>

## Avro schema

[twitter.avro](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.avro) defines a basic schema for storing tweets:

```json
{
  "type" : "record",
  "name" : "Tweet",
  "namespace" : "com.miguno.avro",
  "fields" : [ {
    "name" : "username",
    "type" : "string",
    "doc"  : "Name of the user account on Twitter.com"
  }, {
    "name" : "tweet",
    "type" : "string",
    "doc"  : "The content of the user's Twitter message"
  }, {
    "name" : "timestamp",
    "type" : "long",
    "doc"  : "Unix epoch time in seconds"
  } ],
  "doc:" : "A basic schema for storing Twitter messages"
}
```

The latest version of the schema is always available at [twitter.avsc](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/resources/avro/twitter.avsc).

If you want to generate Java classes from this Avro schema follow the instructions described in section
<a href="#Usage">Usage</a>.  Alternatively you can also use the Avro Compiler directly.

<a name="Avro data files"></a>

## Avro data files

The actual data is stored in the following files:

* [twitter.avro](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.avro) -- encoded (serialized) version of the example data in binary
  Avro format, compressed with Snappy
* [twitter.json](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.json) -- JSON representation of the same example data

You can convert back and forth between the two encodings (Avro vs. JSON) using Avro Tools.  See
[Reading and Writing Avro Files From the Command Line](http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/)
for instructions on how to do that.

Here is a snippet of the example data:

```json
{"username":"miguno","tweet":"Rock: Nerf paper, scissors is fine.","timestamp": 1366150681 }
{"username":"BlizzardCS","tweet":"Works as intended.  Terran is IMBA.","timestamp": 1366154481 }
{"username":"DarkTemplar","tweet":"From the shadows I come!","timestamp": 1366154681 }
{"username":"VoidRay","tweet":"Prismatic core online!","timestamp": 1366160000 }
```

<a name="Requirements"></a>

# Requirements

The examples require the following software versions:

* [Gradle](http://www.gradle.org/) 1.9 (only for the Java examples)
* Java JDK 7 (only for the Java examples)
    * It is easy to switch to JDK 6.  Mostly you will need to change the `sourceCompatibility` and
      `targetCompatibility` parameters in [build.gradle](build.gradle) from `1.7` to `1.6`  But since there are
        a couple of JDK 7 related gotchas (e.g. problems with its new bytecode verifier) that the Java example code
        solves I decided to stick with JDK 7 as the default.
* [Hadoop](http://hadoop.apache.org/) 2.x with MRv1 (not MRv2/YARN)
* [Pig](http://pig.apache.org/) 0.11
* [Hive](http://hive.apache.org/) 0.10
* [Twitter Bijection](https://github.com/twitter/bijection) 0.6
* [Avro](http://avro.apache.org/) 1.7.6

More precisely, the examples where tested with those Hadoop stack components that ship with
[Cloudera CDH 4.x](http://www.cloudera.com/content/cloudera/en/products/cdh.html).


<a name="Example data"></a>

# Example data

We are using a small, Twitter-like data set as input for our example MapReduce jobs.


<a name="Avro schema"></a>

## Avro schema

[twitter.avsc](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/resources/avro/twitter.avsc) defines a basic schema for storing tweets:

```json
{
  "type" : "record",
  "name" : "Tweet",
  "namespace" : "com.miguno.avro",
  "fields" : [ {
    "name" : "username",
    "type" : "string",
    "doc"  : "Name of the user account on Twitter.com"
  }, {
    "name" : "tweet",
    "type" : "string",
    "doc"  : "The content of the user's Twitter message"
  }, {
    "name" : "timestamp",
    "type" : "long",
    "doc"  : "Unix epoch time in seconds"
  } ],
  "doc:" : "A basic schema for storing Twitter messages"
}
```

The latest version of the schema is always available at [twitter.avsc](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/resources/avro/twitter.avsc).

If you want to generate Java classes from this Avro schema follow the instructions described in section
<a href="#Usage">Usage</a>.  Alternatively you can also use the Avro Compiler directly.


<a name="Avro data files"></a>

## Avro data files

The actual data is stored in the following files:

* [twitter.avro](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.avro) -- encoded (serialized) version of the example data in binary
  Avro format, compressed with Snappy
* [twitter.json](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.json) -- JSON representation of the same example data

You can convert back and forth between the two encodings (Avro vs. JSON) using Avro Tools.  See
[Reading and Writing Avro Files From the Command Line](http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/)
for instructions on how to do that.

Here is a snippet of the example data:

```json
{"username":"miguno","tweet":"Rock: Nerf paper, scissors is fine.","timestamp": 1366150681 }
{"username":"BlizzardCS","tweet":"Works as intended.  Terran is IMBA.","timestamp": 1366154481 }
{"username":"DarkTemplar","tweet":"From the shadows I come!","timestamp": 1366154681 }
{"username":"VoidRay","tweet":"Prismatic core online!","timestamp": 1366160000 }
```


<a name="Preparing the input data"></a>

## Preparing the input data

The example input data we are using is [twitter.avro](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.avro).
Upload `twitter.avro` to HDFS to make the input data available to our MapReduce jobs.

```bash
# Upload the input data
$ hadoop fs -mkdir examples/input
$ hadoop fs -copyFromLocal https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.avro examples/input
```

We will also upload the Avro schema [twitter.avsc](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/resources/avro/twitter.avsc) to HDFS because we will use
a schema available at an HDFS location in one of the Hive examples.

```bash
# Upload the Avro schema
$ hadoop fs -mkdir examples/schema
$ hadoop fs -copyFromLocal https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/resources/avro/twitter.avsc examples/schema
```


<a name="Java"></a>

# Java


<a name="Usage"></a>

## Usage

To prepare your Java IDE:

```bash
# IntelliJ IDEA
$ ./gradlew cleanIdea idea   # then File > Open... > avro-hadoop-starter.ipr
# Eclipse
$ ./gradlew cleanEclipse eclipse
```

To build the Java code and to compile the Avro-based Java classes from the schemas (`*.avsc`) in
`https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/resources/avro/`:

```bash
$ ./gradlew clean build
```

The generated Avro-based Java classes are written under the directory tree `generated-sources/`.  The Avro
compiler will generate a Java class `Tweet` from the `twitter.avsc` schema.

To run the unit tests (notably `TweetCountTest`, see section _Examples_ below):

```bash
$ ./gradlew test
```

Note: `./gradlew test` executes any JUnit unit tests.  If you add any TestNG unit tests you need to run
`./gradlew testng` for executing those.

You can also run `./gradlew cobertura` which will generate a test coverage report at
`./build/reports/cobertura/coverage.xml` that you can integrate into your CI setup.


<a name="Examples-Java"></a>

## Examples

### TweetCount

[TweetCount](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/java/com/miguno/avro/hadoop/TweetCount.java) implements a MapReduce job that counts the number
of tweets created by Twitter users.

    TweetCount: Usage: TweetCount <input path> <output path>

### TweetCountTest

[TweetCountTest](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/com/miguno/avro/hadoop/TweetCountTest.java) is very similar to `TweetCount`.  
It uses [twitter.avro](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/resources/avro/twitter.avro) as its input and runs a unit test on it with the same MapReduce job as `TweetCount`.  The unit test includes comparing the actual MapReduce output (in Snappy-compressed Avro format) with expected output.  `TweetCountTest` extends [ClusterMapReduceTestCase](https://github.com/apache/hadoop-common/blob/trunk/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-jobclient/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/hadoop/mapred/ClusterMapReduceTestCase.java)(MRv1), which means that the corresponding MapReduce job is launched in-memory via [MiniMRCluster](https://github.com/apache/hadoop-common/blob/trunk/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-jobclient/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/hadoop/mapred/MiniMRCluster.java).

<a name="MiniMRCluster and Hadoop MRv2"></a>

## MiniMRCluster and Hadoop MRv2

The MiniMRCluster that is used by `ClusterMapReduceTestCase` in MRv1 is deprecated in Hadoop MRv2.  When using MRv2
you should switch to
[MiniMRClientClusterFactory](https://github.com/apache/hadoop-common/blob/trunk/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-jobclient/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/hadoop/mapred/MiniMRClientClusterFactory.java),
which provides a wrapper interface called
[MiniMRClientCluster](https://github.com/apache/hadoop-common/blob/trunk/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-jobclient/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/hadoop/mapred/MiniMRClientCluster.java)
around the
[MiniMRYarnCluster](https://github.com/apache/hadoop-common/blob/trunk/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-jobclient/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/hadoop/mapreduce/v2/MiniMRYarnCluster.java) (MRv2):

### MiniMRClientClusterFactory

A MiniMRCluster factory. In MR2, it provides a wrapper MiniMRClientCluster interface around the MiniMRYarnCluster. While in MR1, it provides such wrapper around MiniMRCluster. This factory should be used in tests to provide an easy migration of tests across MR1 and MR2.

See [Experimenting with MapReduce 2.0](http://blog.cloudera.com/blog/2012/07/experimenting-with-mapreduce-2-0/) for more
information.

<a name="Avro-String-vs-CharSequence-vs-Utf8"></a>

## Avro - String vs CharSequence vs Utf8

One caveat when using Avro in Java (or Scala, ...) is that you may create a new Avro-backed object with a `java.lang.String` parameter (e.g. the username in the Avro schema we use in our examples), but as you convert your data record to binary and back to POJO you will observe that Avro actually gives you an instance of [CharSequence](http://docs.oracle.com/javase/7/docs/api/java/lang/CharSequence.html) instead of a `String`.
Now the problem is that by default Avro generated Java classes expose
[CharSequence](http://docs.oracle.com/javase/7/docs/api/java/lang/CharSequence.html) for string fields in their API *but unfortunately you cannot use just any CharSequence when interacting with your data records* -- such as [java.lang.String](http://docs.oracle.com/javase/7/docs/api/java/lang/String.html), which does implement `CharSequence`.

You *must* use Avro's own [Utf8](http://avro.apache.org/docs/1.7.6/api/java/org/apache/avro/util/Utf8.html) instead.
A typical case where you run into this gotcha is when your unit tests complain that doing a round-trip conversion of a data record does apparently not result in the original record.

One possible remedy to this problem is to instruct Avro to explicitly return an instance of `String`.  This is usually what you want as it provides you with the intuitive behavior that you'd typically expect.  Your mileage may vary though.

For details see [AVRO-803 Java generated Avro classes make using Avro painful and surprising](https://issues.apache.org/jira/browse/AVRO-803).

### Enforce use of String when using sbt

Add the following to your `build.sbt`, assuming you use cavorite's [sbt-avro](https://github.com/cavorite/sbt-avro) plugin.

```
(stringType in avroConfig) := "String"
```


### Enforce use of String when using gradle

Add the following to your `build.gradle`, assuming you use my [avro-gradle-plugin](https://github.com/miguno/avro-gradle-plugin).

```
compileAvro {
  stringType = 'String'
}
```


### Enforce use of String when using maven

Add the following to the configuration of [avro-maven-plugin](http://mvnrepository.com/artifact/org.apache.avro/avro-maven-plugin) in your `pom.xml`.

```xml
<stringType>String</stringType>
```


<a name="Further readings on Java"></a>

## Further readings on Java

* [Package Documentation for org.apache.avro.mapred](http://avro.apache.org/docs/1.7.6/api/java/index.html?org/apache/avro/mapred/package-summary.html)  
	- Run Hadoop MapReduce jobs over Avro data, with map and reduce functions written in Java.  This document provides detailed information on how you should use the Avro Java API to implement MapReduce jobs that read and/or write data in Avro format.
* [Java MapReduce and Avro](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/latest/CDH4-Installation-Guide/cdh4ig_topic_26_5.html)  
	- Cloudera CDH4 documentation



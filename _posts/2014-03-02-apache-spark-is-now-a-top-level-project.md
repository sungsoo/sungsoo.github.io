---
layout: post
title: As MapReduce fades, Apache Spark is now a top-level project
date: 2014-03-02
categories: [computer science]
tags: [big data]

---


### Summary

* Article Source: [As MapReduce fades, Apache Spark is now a top-level project](http://gigaom.com/2014/02/27/as-mapreduce-fades-apache-spark-is-now-a-top-level-project/)
* Author: Derrick Harris

**Apache Spark**, an *in-memory data-processing framework*, is now a top-level Apache project. That’s an important step for Spark’s stability as it increasingly replaces MapReduce in next-generation big data applications.

As MapReduce fades, Apache Spark is now a top-level project
---
**MapReduce** was fun and pretty useful while it lasted, but it looks like [**Spark**](http://spark.apache.org) is set to take the reins as the primary processing framework for new Hadoop workloads. The technology took a meaningful, if not huge, step toward that end on Thursday when the Apache Software Foundation [announced that Spark is now a top-level project](https://blogs.apache.org/foundation/entry/the_apache_software_foundation_announces50).

**Spark** has already garnered a large and vocal community of users and contributors because it’s faster than MapReduce (*in memory* and *on disk*) and easier to program. This means it’s well suited for next-generation big data applications that might require *lower-latency queries*, *real-time processing* or *iterative computations* on the same data (i.e., machine learning). Spark’s creators from the [University of California, Berkeley](http://gigaom.com/2013/04/17/welcome-to-berkeley-where-hadoop-isnt-nearly-fast-enough/), have created a company called [Databricks](http://gigaom.com/2013/09/25/databricks-raises-14m-from-andreessen-horowitz-wants-to-take-on-mapreduce-with-spark/) to commercialize the technology.

Spark is technically a standalone project, but it was always designed to work with the *Hadoop Distributed File System*. It can run directly on HDFS, inside MapReduce and, thanks to YARN, it can now run alongside MapReduce jobs on the same cluster. In fact, Hadoop pioneer Cloudera is now providing enterprise support for customers that want to use Spark.

![The ecosystem of Spark projects. Source: Databricks](http://sungsoo.github.com/images/spark-stack-new.png)

However, MapReduce isn’t yesterday’s news quite yet. Although many new workloads and projects (such as [Hortonworks’ Stinger](http://gigaom.com/2013/05/29/why-hortonworks-is-riding-a-faster-hive-to-the-bitter-end/)) use alternative processing frameworks, there’s still a lot of tooling for MapReduce that Spark doesn’t have yet (e.g., Pig and Cascading), and MapReduce is still quite good for certain batch jobs. Plus, as Cloudera co-founder and Chief Strategy Officer Mike Olson explained in a [recent Structure Show podcast](http://gigaom.com/2013/05/29/why-hortonworks-is-riding-a-faster-hive-to-the-bitter-end/), there are a lot of legacy MapReduce workloads that aren’t going anywhere anytime soon even as Spark takes off.

If you want to hear more about Spark and its role in the future of Hadoop, come to our [Structure Data conference](http://events.gigaom.com/structuredata-2014/?utm_source=data&utm_medium=editorial&utm_campaign=intext&utm_term=820915+as-mapreduce-fades-apache-spark-is-now-a-top-level-project&utm_content=dharrisstructure) March 19-20 in New York. Databricks co-founder and CEO Ion Stoica will be speaking as part of our Structure Data Awards presentation, and we’ll have the CEOs of Cloudera, Hortonworks, and Pivotal talking about the future of big data platforms and how they plan to capitalize on them.

How to build Spark project
---
* Build Envrionements
	* Mac OS X 10.9.2
	* Maven 3

---

1. **Build** project using maven  
```
sungsoo$ mvn install -DskipTests
```
2. **Create** Eclipse project  
```
sungsoo$ mvn eclipse:eclipse -DdownloadSources=true -DdownloadJavadocs=true
```  
	* If Java OutofMemory error occured... then try to  
	```
	sungsoo$ export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"
	```
3. **Import** the existing project from the Eclipse  

Apache Spark
---

Lightning-Fast Cluster Computing - <http://spark.apache.org/>


Online Documentation
---

You can find the latest Spark documentation, including a programming
guide, on the project webpage at <http://spark.apache.org/documentation.html>.
This README file only contains basic setup instructions.


Building
---

Spark requires Scala 2.10. The project is built using Simple Build Tool (SBT),
which can be obtained [here](http://www.scala-sbt.org). If SBT is installed we
will use the system version of sbt otherwise we will attempt to download it
automatically. To build Spark and its example programs, run:

    ./sbt/sbt assembly

Once you've built Spark, the easiest way to start using it is the shell:

    ./bin/spark-shell

Or, for the Python API, the Python shell (`./bin/pyspark`).

Spark also comes with several sample programs in the `examples` directory.
To run one of them, use `./bin/run-example <class> <params>`. For example:

    ./bin/run-example org.apache.spark.examples.SparkLR local[2]

will run the Logistic Regression example locally on 2 CPUs.

Each of the example programs prints usage help if no params are given.

All of the Spark samples take a `<master>` parameter that is the cluster URL
to connect to. This can be a mesos:// or spark:// URL, or "local" to run
locally with one thread, or "local[N]" to run locally with N threads.

Running tests
---

Testing first requires [Building](#building) Spark. Once Spark is built, tests
can be run using:

`./sbt/sbt test`
 
A Note About Hadoop Versions
---

Spark uses the Hadoop core library to talk to HDFS and other Hadoop-supported
storage systems. Because the protocols have changed in different versions of
Hadoop, you must build Spark against the same version that your cluster runs.
You can change the version by setting the `SPARK_HADOOP_VERSION` environment
when building Spark.

For Apache Hadoop versions 1.x, Cloudera CDH MRv1, and other Hadoop
versions without YARN, use:

    # Apache Hadoop 1.2.1
    $ SPARK_HADOOP_VERSION=1.2.1 sbt/sbt assembly

    # Cloudera CDH 4.2.0 with MapReduce v1
    $ SPARK_HADOOP_VERSION=2.0.0-mr1-cdh4.2.0 sbt/sbt assembly

For Apache Hadoop 2.2.X, 2.1.X, 2.0.X, 0.23.x, Cloudera CDH MRv2, and other Hadoop versions
with YARN, also set `SPARK_YARN=true`:

    # Apache Hadoop 2.0.5-alpha
    $ SPARK_HADOOP_VERSION=2.0.5-alpha SPARK_YARN=true sbt/sbt assembly

    # Cloudera CDH 4.2.0 with MapReduce v2
    $ SPARK_HADOOP_VERSION=2.0.0-cdh4.2.0 SPARK_YARN=true sbt/sbt assembly

    # Apache Hadoop 2.2.X and newer
    $ SPARK_HADOOP_VERSION=2.2.0 SPARK_YARN=true sbt/sbt assembly

When developing a Spark application, specify the Hadoop version by adding the
"hadoop-client" artifact to your project's dependencies. For example, if you're
using Hadoop 1.2.1 and build your application using SBT, add this entry to
`libraryDependencies`:

    "org.apache.hadoop" % "hadoop-client" % "1.2.1"

If your project is built with Maven, add this to your POM file's `<dependencies>` section:

    <dependency>
      <groupId>org.apache.hadoop</groupId>
      <artifactId>hadoop-client</artifactId>
      <version>1.2.1</version>
    </dependency>


Configuration
---

Please refer to the [Configuration guide](http://spark.apache.org/docs/latest/configuration.html)
in the online documentation for an overview on how to configure Spark.


## Contributing to Spark

Contributions via GitHub pull requests are gladly accepted from their original
author. Along with any pull requests, please state that the contribution is
your original work and that you license the work to the project under the
project's open source license. Whether or not you state this explicitly, by
submitting any copyrighted material via pull request, email, or other means
you agree to license the material under the project's open source license and
warrant that you have the legal authority to do so.



References
---
[1] Derrick Harris, [*As MapReduce fades, Apache Spark is now a top-level project*](http://gigaom.com/2014/02/27/as-mapreduce-fades-apache-spark-is-now-a-top-level-project/), Feb. 2014.

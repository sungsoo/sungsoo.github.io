---
layout: post
title: Spark Streaming Basic Concepts
date: 2015-04-03
categories: [computer science]
tags: [big data]

---


Basic Concepts
==============

Next, we move beyond the simple example and elaborate on the basics of
Spark Streaming.

Linking
-------

Similar to Spark, Spark Streaming is available through Maven Central. To
write your own Spark Streaming program, you will have to add the
following dependency to your SBT or Maven project.

```xml
    <dependency>
        <groupId>org.apache.spark</groupId>
        <artifactId>spark-streaming_2.10</artifactId>
        <version>1.3.0</version>
    </dependency>
```

```
    libraryDependencies += "org.apache.spark" % "spark-streaming_2.10" % "1.3.0"
```

For ingesting data from sources like Kafka, Flume, and Kinesis that are
not present in the Spark Streaming core API, you will have to add the
corresponding artifact `spark-streaming-xyz_2.10` to the dependencies.
For example, some of the common ones are as follows.

```
  ------------------------------------------------------------------------
  Source     Artifact
  ---------- -------------------------------------------------------------
  Kafka      spark-streaming-kafka\_2.10

  Flume      spark-streaming-flume\_2.10

  Kinesis\   spark-streaming-kinesis-asl\_2.10 [Amazon Software License]
             

  Twitter    spark-streaming-twitter\_2.10

  ZeroMQ     spark-streaming-zeromq\_2.10

  MQTT       spark-streaming-mqtt\_2.10

             
  ------------------------------------------------------------------------
```

For an up-to-date list, please refer to the [Maven
repository](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.apache.spark%22%20AND%20v%3A%221.3.0%22)
for the full list of supported sources and artifacts.


Initializing StreamingContext
-----------------------------

To initialize a Spark Streaming program, a **StreamingContext** object
has to be created which is the main entry point of all Spark Streaming
functionality.

## Scala

A
[StreamingContext](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.streaming.StreamingContext)
object can be created from a
[SparkConf](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.SparkConf) object.

```scala
    import org.apache.spark._
    import org.apache.spark.streaming._
    val conf = new SparkConf().setAppName(appName).setMaster(master)
    val ssc = new StreamingContext(conf, Seconds(1))
```

The `appName` parameter is a name for your application to show on the
cluster UI. `master` is a [Spark, Mesos or YARN cluster
URL](submitting-applications.html#master-urls), or a special
**“local[\*]”** string to run in local mode. In practice, when running
on a cluster, you will not want to hardcode `master` in the program, but
rather [launch the application with
`spark-submit`](submitting-applications.html) and receive it there.
However, for local testing and unit tests, you can pass “local[\*]” to
run Spark Streaming in-process (detects the number of cores in the local
system). Note that this internally creates a
[SparkContext](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.SparkContext)
(starting point of all Spark functionality) which can be accessed as
`ssc.sparkContext`.

The batch interval must be set based on the latency requirements of your
application and available cluster resources. See the [Performance
Tuning](#setting-the-right-batch-size) section for more details.

A `StreamingContext` object can also be created from an existing
`SparkContext` object.

```java
    import org.apache.spark.streaming._
    val sc = ...                // existing SparkContext
    val ssc = new StreamingContext(sc, Seconds(1))
```

## Java

A
[JavaStreamingContext](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/streaming/api/java/JavaStreamingContext.html)
object can be created from a
[SparkConf](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/SparkConf.html) object.

```java
    import org.apache.spark.*;
    import org.apache.spark.streaming.api.java.*;
    SparkConf conf = new SparkConf().setAppName(appName).setMaster(master);
    JavaStreamingContext ssc = new JavaStreamingContext(conf, Duration(1000));
```

The `appName` parameter is a name for your application to show on the
cluster UI. `master` is a [Spark, Mesos or YARN cluster
URL](submitting-applications.html#master-urls), or a special
**“local[\*]”** string to run in local mode. In practice, when running
on a cluster, you will not want to hardcode `master` in the program, but
rather [launch the application with
`spark-submit`](submitting-applications.html) and receive it there.
However, for local testing and unit tests, you can pass “local[\*]” to
run Spark Streaming in-process. Note that this internally creates a
[JavaSparkContext](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/api/java/JavaSparkContext.html)
(starting point of all Spark functionality) which can be accessed as
`ssc.sparkContext`.

The batch interval must be set based on the latency requirements of your
application and available cluster resources. See the [Performance
Tuning](#setting-the-right-batch-size) section for more details.

A `JavaStreamingContext` object can also be created from an existing
`JavaSparkContext`.

```java
    import org.apache.spark.streaming.api.java.*;
    JavaSparkContext sc = ...   //existing JavaSparkContext
    JavaStreamingContext ssc = new JavaStreamingContext(sc, Durations.seconds(1));
```

## Python

A
[StreamingContext](http://spark.apache.org/docs/latest/api/python/pyspark.streaming.html#pyspark.streaming.StreamingContext)
object can be created from a
[SparkContext](http://spark.apache.org/docs/latest/api/python/pyspark.html#pyspark.SparkContext) object.

```python
    from pyspark import SparkContext
    from pyspark.streaming import StreamingContext
    sc = SparkContext(master, appName)
    ssc = StreamingContext(sc, 1)
```

The `appName` parameter is a name for your application to show on the
cluster UI. `master` is a [Spark, Mesos or YARN cluster
URL](submitting-applications.html#master-urls), or a special
**“local[\*]”** string to run in local mode. In practice, when running
on a cluster, you will not want to hardcode `master` in the program, but
rather [launch the application with
`spark-submit`](submitting-applications.html) and receive it there.
However, for local testing and unit tests, you can pass “local[\*]” to
run Spark Streaming in-process (detects the number of cores in the local
system).

The batch interval must be set based on the latency requirements of your
application and available cluster resources. See the [Performance
Tuning](#setting-the-right-batch-size) section for more details.

After a context is defined, you have to do the following.

1.  Define the input sources by creating input DStreams.
2.  Define the streaming computations by applying transformation and
    output operations to DStreams.
3.  Start receiving data and processing it using
    `streamingContext.start()`.
4.  Wait for the processing to be stopped (manually or due to any error)
    using `streamingContext.awaitTermination()`.
5.  The processing can be manually stopped using
    `streamingContext.stop()`.

### Points to remember: 

-   Once a context has been started, no new streaming computations can
    be set up or added to it.
-   Once a context has been stopped, it cannot be restarted.
-   Only one StreamingContext can be active in a JVM at the same time.
-   stop() on StreamingContext also stops the SparkContext. To stop only
    the StreamingContext, set optional parameter of `stop()` called
    `stopSparkContext` to false.
-   A SparkContext can be re-used to create multiple StreamingContexts,
    as long as the previous StreamingContext is stopped (without
    stopping the SparkContext) before the next StreamingContext is
    created.


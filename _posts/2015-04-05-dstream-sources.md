---
layout: post
title: DStream Sources
date: 2015-04-05
categories: [computer science]
tags: [big data]

---

## Basic Sources 

We have already taken a look at the `ssc.socketTextStream(...)` in the
[quick example](#a-quick-example) which creates a DStream from text data
received over a TCP socket connection. Besides sockets, the
StreamingContext API provides methods for creating DStreams from files
and Akka actors as input sources.

-   **File Streams:** For reading data from files on any file system
    compatible with the HDFS API (that is, HDFS, S3, NFS, etc.), a
    DStream can be created as

```scala
streamingContext.fileStream[KeyClass, ValueClass, InputFormatClass](dataDirectory)
streamingContext.fileStream<KeyClass, ValueClass, InputFormatClass>(dataDirectory);
streamingContext.textFileStream(dataDirectory)
```

Spark Streaming will monitor the directory `dataDirectory` and
    process any files created in that directory (files written in nested
    directories not supported). Note that

-   The files must have the same data format.
-   The files must be created in the `dataDirectory` by atomically
        *moving* or *renaming* them into the data directory.
-   Once moved, the files must not be changed. So if the files are
        being continuously appended, the new data will not be read.

For simple text files, there is an easier method
    `streamingContext.textFileStream(dataDirectory)`. And file streams
    do not require running a receiver, hence does not require allocating
    cores.

 Python API `fileStream` is not available in the Python API, only
    `textFileStream` is available.

-   **Streams based on Custom Actors:** DStreams can be created with
    data streams received through Akka actors by using
    `streamingContext.actorStream(actorProps, actor-name)`. See the
    [Custom Receiver Guide](streaming-custom-receivers.html) for more
    details.

    Python API Since actors are available only in the Java and Scala
    libraries, `actorStream` is not available in the Python API.

-   **Queue of RDDs as a Stream:** For testing a Spark Streaming
    application with test data, one can also create a DStream based on a
    queue of RDDs, using `streamingContext.queueStream(queueOfRDDs)`.
    Each RDD pushed into the queue will be treated as a batch of data in
    the DStream, and processed like a stream.

For more details on streams from sockets, files, and actors, see the API
documentations of the relevant functions in
[StreamingContext](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.streaming.StreamingContext)
for Scala,
[JavaStreamingContext](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/streaming/api/java/JavaStreamingContext.html)
for Java, and
[StreamingContext](http://spark.apache.org/docs/latest/api/python/pyspark.streaming.html#pyspark.streaming.StreamingContext)
for Python.

## Advanced Sources 

Python API As of Spark 1.3, out of these sources, *only* Kafka is
available in the Python API. We will add more advanced sources in the
Python API in future.

This category of sources require interfacing with external non-Spark
libraries, some of them with complex dependencies (e.g., Kafka and
Flume). Hence, to minimize issues related to version conflicts of
dependencies, the functionality to create DStreams from these sources
have been moved to separate libraries, that can be [linked](#linking) to
explicitly when necessary. For example, if you want to create a DStream
using data from Twitter’s stream of tweets, you have to do the
following.

1.  *Linking*: Add the artifact `spark-streaming-twitter_2.10` to the
    SBT/Maven project dependencies.
2.  *Programming*: Import the `TwitterUtils` class and create a DStream
    with `TwitterUtils.createStream` as shown below.
3.  *Deploying*: Generate an uber JAR with all the dependencies
    (including the dependency `spark-streaming-twitter_2.10` and its
    transitive dependencies) and then deploy the application. This is
    further explained in the [Deploying
    section](#deploying-applications).


```scala
import org.apache.spark.streaming.twitter._
TwitterUtils.createStream(ssc)
```

```java
import org.apache.spark.streaming.twitter.*;
TwitterUtils.createStream(jssc);
```

Note that these advanced sources are not available in the Spark shell,
hence applications based on these advanced sources cannot be tested in
the shell. If you really want to use them in the Spark shell you will
have to download the corresponding Maven artifact’s JAR along with its
dependencies and it in the classpath.

Some of these advanced sources are as follows.

-   **Kafka:** Spark Streaming 1.3.0 is compatible with Kafka 0.8.1.1.
    See the [Kafka Integration Guide](streaming-kafka-integration.html)
    for more details.

-   **Flume:** Spark Streaming 1.3.0 is compatible with Flume 1.4.0. See
    the [Flume Integration Guide](streaming-flume-integration.html) for
    more details.

-   **Kinesis:** See the [Kinesis Integration
    Guide](streaming-kinesis-integration.html) for more details.

-   **Twitter:** Spark Streaming’s TwitterUtils uses Twitter4j 3.0.3 to
    get the public stream of tweets using [Twitter’s Streaming
    API](https://dev.twitter.com/docs/streaming-apis). Authentication
    information can be provided by any of the
    [methods](http://twitter4j.org/en/configuration.html) supported by
    Twitter4J library. You can either get the public stream, or get the
    filtered stream based on a keywords. See the API documentation
    ([Scala](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.streaming.twitter.TwitterUtils$),
    [Java](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/streaming/twitter/TwitterUtils.html))
    and examples
    ([TwitterPopularTags](https://github.com/apache/spark/blob/master/examples/src/main/scala/org/apache/spark/examples/streaming/TwitterPopularTags.scala)
    and
    [TwitterAlgebirdCMS](https://github.com/apache/spark/blob/master/examples/src/main/scala/org/apache/spark/examples/streaming/TwitterAlgebirdCMS.scala)).

## Custom Sources 

Python API This is not yet supported in Python.

Input DStreams can also be created out of custom data sources. All you
have to do is implement an user-defined **receiver** (see next section
to understand what that is) that can receive data from the custom
sources and push it into Spark. See the [Custom Receiver
Guide](streaming-custom-receivers.html) for details.

## Receiver Reliability 

There can be two kinds of data sources based on their *reliability*.
Sources (like Kafka and Flume) allow the transferred data to be
acknowledged. If the system receiving data from these *reliable* sources
acknowledge the received data correctly, it can be ensured that no data
gets lost due to any kind of failure. This leads to two kinds of
receivers.

1.  *Reliable Receiver* - A *reliable receiver* correctly acknowledges a
    reliable source that the data has been received and stored in Spark
    with replication.
2.  *Unreliable Receiver* - These are receivers for sources that do not
    support acknowledging. Even for reliable sources, one may implement
    an unreliable receiver that do not go into the complexity of
    acknowledging correctly.

The details of how to write a reliable receiver are discussed in the
[Custom Receiver Guide](streaming-custom-receivers.html).


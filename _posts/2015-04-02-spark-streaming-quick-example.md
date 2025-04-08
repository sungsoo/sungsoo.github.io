---
layout: post
title: Spark Streaming Quick Example
date: 2015-04-02
categories: [computer science]
tags: [big data]

---

A Quick Example
===============

Before we go into the details of how to write your own Spark Streaming
program, let’s take a quick look at what a simple Spark Streaming
program looks like. Let’s say we want to count the number of words in
text data received from a data server listening on a TCP socket. All you
need to do is as follows.

## Scala

First, we import the names of the Spark Streaming classes, and some
implicit conversions from StreamingContext into our environment, to add
useful methods to other classes we need (like DStream).
[StreamingContext](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.streaming.StreamingContext)
is the main entry point for all streaming functionality. We create a
local StreamingContext with two execution threads, and batch interval of
1 second.

```scala
    import org.apache.spark._
    import org.apache.spark.streaming._
    import org.apache.spark.streaming.StreamingContext._ // not necessary in Spark 1.3+
    // Create a local StreamingContext with two working thread and batch interval of 1 second.
    // The master requires 2 cores to prevent from a starvation scenario.
    val conf = new SparkConf().setMaster("local[2]").setAppName("NetworkWordCount")
    val ssc = new StreamingContext(conf, Seconds(1))
```

Using this context, we can create a DStream that represents streaming
data from a TCP source, specified as hostname (e.g. `localhost`) and
port (e.g. `9999`).

```scala
    // Create a DStream that will connect to hostname:port, like localhost:9999
    val lines = ssc.socketTextStream("localhost", 9999)
```

This `lines` DStream represents the stream of data that will be received
from the data server. Each record in this DStream is a line of text.
Next, we want to split the lines by space into words.

```scala
    // Split each line into words
    val words = lines.flatMap(_.split(" "))
```

`flatMap` is a one-to-many DStream operation that creates a new DStream
by generating multiple new records from each record in the source
DStream. In this case, each line will be split into multiple words and
the stream of words is represented as the `words` DStream. Next, we want
to count these words.

```scala
    import org.apache.spark.streaming.StreamingContext._ // not necessary in Spark 1.3+
    // Count each word in each batch
    val pairs = words.map(word => (word, 1))
    val wordCounts = pairs.reduceByKey(_ + _)
    // Print the first ten elements of each RDD generated in this DStream to the console
    wordCounts.print()
```

The `words` DStream is further mapped (one-to-one transformation) to a
DStream of `(word, 1)` pairs, which is then reduced to get the frequency
of words in each batch of data. Finally, `wordCounts.print()` will print
a few of the counts generated every second.

Note that when these lines are executed, Spark Streaming only sets up
the computation it will perform when it is started, and no real
processing has started yet. To start the processing after all the
transformations have been setup, we finally call

```scala
    ssc.start()             // Start the computation
    ssc.awaitTermination()  // Wait for the computation to terminate
```

The complete code can be found in the Spark Streaming example
[NetworkWordCount](https://github.com/apache/spark/blob/master/examples/src/main/scala/org/apache/spark/examples/streaming/NetworkWordCount.scala).

## Java

First, we create a
[JavaStreamingContext](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/streaming/api/java/JavaStreamingContext.html)
object, which is the main entry point for all streaming functionality.
We create a local StreamingContext with two execution threads, and a
batch interval of 1 second.

```java
    import org.apache.spark.*;
    import org.apache.spark.api.java.function.*;
    import org.apache.spark.streaming.*;
    import org.apache.spark.streaming.api.java.*;
    import scala.Tuple2;
    // Create a local StreamingContext with two working thread and batch interval of 1 second
    SparkConf conf = new SparkConf().setMaster("local[2]").setAppName("NetworkWordCount")
    JavaStreamingContext jssc = new JavaStreamingContext(conf, Durations.seconds(1))
```

Using this context, we can create a DStream that represents streaming
data from a TCP source, specified as hostname (e.g. `localhost`) and
port (e.g. `9999`).

```java
    // Create a DStream that will connect to hostname:port, like localhost:9999
    JavaReceiverInputDStream<String> lines = jssc.socketTextStream("localhost", 9999);
```

This `lines` DStream represents the stream of data that will be received
from the data server. Each record in this stream is a line of text.
Then, we want to split the the lines by space into words.

```java
    // Split each line into words
    JavaDStream<String> words = lines.flatMap(
      new FlatMapFunction<String, String>() {
        @Override public Iterable<String> call(String x) {
          return Arrays.asList(x.split(" "));
        }
      });
```

`flatMap` is a DStream operation that creates a new DStream by
generating multiple new records from each record in the source DStream.
In this case, each line will be split into multiple words and the stream
of words is represented as the `words` DStream. Note that we defined the
transformation using a
[FlatMapFunction](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.api.java.function.FlatMapFunction)
object. As we will discover along the way, there are a number of such
convenience classes in the Java API that help define DStream
transformations.

Next, we want to count these words.

```java
    // Count each word in each batch
    JavaPairDStream<String, Integer> pairs = words.map(
      new PairFunction<String, String, Integer>() {
        @Override public Tuple2<String, Integer> call(String s) throws Exception {
          return new Tuple2<String, Integer>(s, 1);
        }
      });
    JavaPairDStream<String, Integer> wordCounts = pairs.reduceByKey(
      new Function2<Integer, Integer, Integer>() {
        @Override public Integer call(Integer i1, Integer i2) throws Exception {
          return i1 + i2;
        }
      });
    // Print the first ten elements of each RDD generated in this DStream to the console
    wordCounts.print();
```

The `words` DStream is further mapped (one-to-one transformation) to a
DStream of `(word, 1)` pairs, using a
[PairFunction](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.api.java.function.PairFunction)
object. Then, it is reduced to get the frequency of words in each batch
of data, using a
[Function2](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.api.java.function.Function2)
object. Finally, `wordCounts.print()` will print a few of the counts
generated every second.

Note that when these lines are executed, Spark Streaming only sets up
the computation it will perform after it is started, and no real
processing has started yet. To start the processing after all the
transformations have been setup, we finally call `start` method.

```java
    jssc.start();              // Start the computation
    jssc.awaitTermination();   // Wait for the computation to terminate
```

The complete code can be found in the Spark Streaming example
[JavaNetworkWordCount](https://github.com/apache/spark/blob/master/examples/src/main/java/org/apache/spark/examples/streaming/JavaNetworkWordCount.java).

## Python

First, we import
[StreamingContext](http://spark.apache.org/docs/latest/api/python/pyspark.streaming.html#pyspark.streaming.StreamingContext),
which is the main entry point for all streaming functionality. We create
a local StreamingContext with two execution threads, and batch interval
of 1 second.

```python
    from pyspark import SparkContext
    from pyspark.streaming import StreamingContext
    # Create a local StreamingContext with two working thread and batch interval of 1 second
    sc = SparkContext("local[2]", "NetworkWordCount")
    ssc = StreamingContext(sc, 1)
```

Using this context, we can create a DStream that represents streaming
data from a TCP source, specified as hostname (e.g. `localhost`) and
port (e.g. `9999`).

```python
    # Create a DStream that will connect to hostname:port, like localhost:9999
    lines = ssc.socketTextStream("localhost", 9999)
```

This `lines` DStream represents the stream of data that will be received
from the data server. Each record in this DStream is a line of text.
Next, we want to split the lines by space into words.

```python
    # Split each line into words
    words = lines.flatMap(lambda line: line.split(" "))
```

`flatMap` is a one-to-many DStream operation that creates a new DStream
by generating multiple new records from each record in the source
DStream. In this case, each line will be split into multiple words and
the stream of words is represented as the `words` DStream. Next, we want
to count these words.

```python
    # Count each word in each batch
    pairs = words.map(lambda word: (word, 1))
    wordCounts = pairs.reduceByKey(lambda x, y: x + y)
    # Print the first ten elements of each RDD generated in this DStream to the console
    wordCounts.pprint()
```

The `words` DStream is further mapped (one-to-one transformation) to a
DStream of `(word, 1)` pairs, which is then reduced to get the frequency
of words in each batch of data. Finally, `wordCounts.pprint()` will
print a few of the counts generated every second.

Note that when these lines are executed, Spark Streaming only sets up
the computation it will perform when it is started, and no real
processing has started yet. To start the processing after all the
transformations have been setup, we finally call

```python
    ssc.start()             # Start the computation
    ssc.awaitTermination()  # Wait for the computation to terminate
```

The complete code can be found in the Spark Streaming example
[NetworkWordCount](https://github.com/apache/spark/blob/master/examples/src/main/python/streaming/network_wordcount.py).

If you have already [downloaded](index.html#downloading) and
[built](index.html#building) Spark, you can run this example as follows.
You will first need to run Netcat (a small utility found in most
Unix-like systems) as a data server by using

    $ nc -lk 9999

Then, in a different terminal, you can start the example by using

    $ ./bin/run-example streaming.NetworkWordCount localhost 9999

    $ ./bin/run-example streaming.JavaNetworkWordCount localhost 9999

    $ ./bin/spark-submit examples/src/main/python/streaming/network_wordcount.py localhost 9999

Then, any lines typed in the terminal running the netcat server will be
counted and printed on screen every second. It will look something like
the following.

    # TERMINAL 1:
    # Running Netcat

    $ nc -lk 9999

    hello world



    ...

    # TERMINAL 2: RUNNING NetworkWordCount

    $ ./bin/run-example streaming.NetworkWordCount localhost 9999
    ...
    -------------------------------------------
    Time: 1357008430000 ms
    -------------------------------------------
    (hello,1)
    (world,1)
    ...

    # TERMINAL 2: RUNNING JavaNetworkWordCount

    $ ./bin/run-example streaming.JavaNetworkWordCount localhost 9999
    ...
    -------------------------------------------
    Time: 1357008430000 ms
    -------------------------------------------
    (hello,1)
    (world,1)
    ...

    # TERMINAL 2: RUNNING network_wordcount.py

    $ ./bin/spark-submit examples/src/main/python/streaming/network_wordcount.py localhost 9999
    ...
    -------------------------------------------
    Time: 2014-10-14 15:25:21
    -------------------------------------------
    (hello,1)
    (world,1)
    ...



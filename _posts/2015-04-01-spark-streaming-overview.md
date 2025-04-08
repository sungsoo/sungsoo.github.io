---
layout: post
title: Spark Streaming Overview
date: 2015-04-01
categories: [computer science]
tags: [big data]

---


Overview
========

Spark Streaming is an extension of the core Spark API that enables
scalable, high-throughput, fault-tolerant stream processing of live data
streams. Data can be ingested from many sources like Kafka, Flume,
Twitter, ZeroMQ, Kinesis or TCP sockets can be processed using complex
algorithms expressed with high-level functions like `map`, `reduce`,
`join` and `window`. Finally, processed data can be pushed out to
filesystems, databases, and live dashboards. In fact, you can apply
Spark’s [machine learning](http://spark.apache.org/docs/latest/mllib-guide.html) and [graph
processing](http://spark.apache.org/docs/latest/graphx-programming-guide.html) algorithms on data streams.

![Spark
Streaming](http://spark.apache.org/docs/latest/img/streaming-arch.png "Spark Streaming architecture")

Internally, it works as follows. Spark Streaming receives live input
data streams and divides the data into batches, which are then processed
by the Spark engine to generate the final stream of results in batches.

![Spark Streaming](http://spark.apache.org/docs/latest/img/streaming-flow.png "Spark Streaming data flow")

Spark Streaming provides a high-level abstraction called *discretized
stream* or *DStream*, which represents a continuous stream of data.
DStreams can be created either from input data streams from sources such
as Kafka, Flume, and Kinesis, or by applying high-level operations on
other DStreams. Internally, a DStream is represented as a sequence of
[RDDs](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.rdd.RDD).

This guide shows you how to start writing Spark Streaming programs with
DStreams. You can write Spark Streaming programs in Scala, Java or
Python (introduced in Spark 1.2), all of which are presented in this
guide. You will find tabs throughout this guide that let you choose
between code snippets of different languages.

**Note:** Python API for Spark Streaming has been introduced in Spark
1.2. It has all the DStream transformations and almost all the output
operations available in Scala and Java interfaces. However, it has only
support for basic sources like text files and text data over sockets.
APIs for additional sources, like Kafka and Flume, will be available in
the future. Further information about available features in the Python
API are mentioned throughout this document; look out for the tag Python
API.

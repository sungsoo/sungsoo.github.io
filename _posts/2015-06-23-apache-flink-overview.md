---
layout: post
title: Overview of the Apache Flink 
date: 2015-06-23
categories: [computer science]
tags: [big data]

---

# Apache Flink

**Apache Flink** is an open source platform for scalable batch and
stream data processing.

**Flink’s core** is a [streaming dataflow
engine](http://flink.apache.org/features.html#unified-stream-amp-batch-processing) that provides
data distribution, communication, and fault tolerance for distributed
computations over data streams.

Flink includes **several APIs** for creating applications that use the
Flink engine:

1.  [DataSet API](http://flink.apache.org/features.html#dataset-api) for static data embedded in
    Java, Scala, and Python,
2.  [DataStream API](http://flink.apache.org/features.html#datastream-api) for unbounded streams
    embedded in Java and Scala, and
3.  [Table API](http://flink.apache.org/features.html#table-api) with a SQL-like expression
    language embedded in Java and Scala.

Flink also bundles **libraries for domain-specific use cases**:

1.  [Machine Learning library](http://flink.apache.org/features.html#machine-learning-library),
    and
2.  [Gelly](http://flink.apache.org/features.html#graph-api-amp-library-gelly), a graph
    processing API and library.

You can **integrate** Flink easily with other well-known open source
systems both for [data input and
output](http://flink.apache.org/features.html#deployment-and-integration) as well as
[deployment](http://flink.apache.org/features.html#deployment-and-integration).

Overview
========

Apache Flink is a platform for efficient, distributed, general-purpose
data processing. It features powerful programming abstractions in Java
and Scala, a high-performance runtime, and automatic program
optimization. It has native support for iterations, incremental
iterations, and programs consisting of large DAGs of operations.

If you quickly want to try out the system, please look at one of the
available quickstarts. For a thorough introduction of the Flink API
please refer to the [Programming Guide](http://ci.apache.org/projects/flink/flink-docs-master/apis/programming_guide.html).

Stack
-----

This is an overview of Flink’s stack. Click on any component to go to
the respective documentation.

![Stack](http://sungsoo.github.com/images/overview-stack-0.9.png)

Download
--------

This documentation is for Apache Flink version 0.9-SNAPSHOT, which is
the current development version of the next upcoming major release of
Apache Flink.

You can download the latest pre-built snapshot version from the
[downloads](http://flink.apache.org/downloads.html#latest) page of the
[project website](http://flink.apache.org).

The Scala API uses Scala 2.10. Please make sure to use a compatible
version.

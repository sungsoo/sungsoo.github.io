---
layout: post
title: SIX sparkling features of Apache Spark!
date: 2014-08-10
categories: [computer science]
tags: [big data]

---

## Article Source
* Title:[SIX sparkling features of Apache Spark!](http://orangeslate.com/2014/08/01/six-sparkling-features-of-apache-spark/)


SIX sparkling features of Apache Spark! 
===

[Leave a
reply](http://orangeslate.com/2014/08/01/six-sparkling-features-of-apache-spark/#respond "Comment on SIX sparkling features of Apache Spark!")

What is [Apache Spark](https://spark.apache.org/)? Why there is a
serious buzz going-on about this? If you are into BigData analytics
business then, should you really care about Spark? Hope this post will
help to answer some of these questions which might have coming to your
mind these days.

![](http://docs.sigmoidanalytics.com/images/c/ce/Sparkimage.png)

[Apache Spark](https://spark.apache.org/) is a powerful open source
processing engine for [Hadoop](http://hadoop.apache.org/) data built
around speed, easy to use, and sophisticated analytics. It was
originally developed in [UC Berkeley’s
AMPLab](https://amplab.cs.berkeley.edu/) and later-on it moved to
Apache. [Apache Spark](https://spark.apache.org/) is basically a
parallel data processing framework that can work with
Apache [Hadoop](http://hadoop.apache.org/) to make it extremely easy to
develop fast, Big Data applications combining batch, streaming, and
interactive analytics on all your data.

Lets go through some of its features which are really highlighting it in
the Bigdata world!

## 1. Lighting Fast Processing

When comes to BigData processing speed always matters. We always look
for processing our huge data as fast as possible. Spark enables
applications in Hadoop clusters to run up to 100x faster in memory, and
10x faster even when running on disk. Spark makes it possible by
reducing number of read/write to disc. It stores this intermediate
processing data in-memory. It uses the concept of an Resilient
Distributed Dataset (RDD), which allows it to transparently store data
on memory and persist it to disc only it’s needed. This helps to reduce
most of the disc read and write –  the main time consuming factors – of
data processing.

![](http://blog.cloudera.com/wp-content/uploads/2014/03/spark-dev3.png)

*(Spark Performance over Hadoop. Image Courtesy: [Cloudera. Visit this
link](http://blog.cloudera.com/blog/2014/03/apache-spark-a-delight-for-developers/)
to see how Jai & Matei explains the delightful experience giving
by Spark to its developers.)*

## 2.  Ease of Use as it supports multiple languages

Spark lets you quickly write applications
in [Java](http://www.java.com/), [Scala](http://www.scala-lang.org/), or
Python. This helps developers to create and run their applications on
their familiar programming languages. It comes with a built-in set of
over 80 high-level operators.We can use it interactively to query data
within the shell too.

## 3.  Support for Sophisticated Analytics

In addition to simple “map” and “reduce” operations, Spark supports SQL
queries, streaming data, and complex analytics such as machine learning
and graph algorithms out-of-the-box. Not only that, users can combine
all these capabilities seamlessly in a single workflow.

## 4.  Real time stream processing

Spark can handle real time streaming. Map-reduce mainly handles and
process the data stored already. However Spark can also manipulate data
in real time using Spark Streaming. Not ignoring that there are other
frameworks with their integration we can handle streaming in Hadoop.

Here is what [Cloudera](http://www.cloudera.com/) says about Sparks
Streaming abilities:

-   Easy: Built on Spark’s lightweight yet powerful APIs, Spark
    Streaming lets you rapidly develop streaming applications
-   Fault tolerant: Unlike other streaming solutions
    (e.g. [Storm](https://storm.incubator.apache.org/)), Spark Streaming
    recovers lost work and delivers exactly-once semantics out of the
    box with no extra code or configuration
-   Integrated: Reuse the same code for batch and stream processing,
    even joining streaming data to historical data

*![](http://www.cloudera.com/content/dam/cloudera/diagrams/spark-throughput-125x190.png)*

*(Streaming Performance over Storm. Image
Courtesy: [Cloudera](http://www.cloudera.com/).com)*

## 5.  Ability to integrate with Hadoop and    existing [Hadoop](http://hadoop.apache.org/) Data

Spark can run independently. Apart from that it can run
on [Hadoop](http://hadoop.apache.org/) 2’s YARN cluster manager, and can
read any existing [Hadoop](http://hadoop.apache.org/) data. That’s a BIG
advantage! It can read from any [Hadoop](http://hadoop.apache.org/) data
sources for example HBase, HDFS etc. This feature of Spark makes it
suitable for migration of existing
pure [Hadoop](http://hadoop.apache.org/) applications, if that
application use-case is really suiting Spark. As Spark is using
immutability more all scenarios might not be suitable for migration.

## 6. Active and expanding community

[Apache Spark](https://spark.apache.org/) is built by a wide set of
developers from over 50 companies. The project started in 2009 and as of
now more than 250 developers have contributed to Spark already! It has
active [mailing
lists](https://spark.apache.org/community.html#mailing-lists) and [JIRA](https://issues.apache.org/jira/browse/SPARK) for
issue tracking.

Below are some useful links to start with:

-   [Download](https://spark.apache.org/downloads.html)the latest
    release of Spark!
-   Read the [quick start
    guide](https://spark.apache.org/docs/latest/quick-start.html).
-   Watch some free [training
    videos](http://spark-summit.org/summit-2013/#day2)and [exercises](http://spark-summit.org/2013/exercises/).

If you want to learn basics of Apache Spark then [my previous
post](http://orangeslate.com/2014/07/27/apache-spark-a-promising-future-framework-for-big-data-world/) will
help you. It has a [training
video](http://orangeslate.com/2014/07/27/apache-spark-a-promising-future-framework-for-big-data-world/) link
which explains Spark simple way.

---
layout: post
title: Introduction to the Spark
date: 2015-04-15
categories: [computer science]
tags: [big data, spark]

---

## Spark

*MapReduce* is the primary workhorse at the core of most Hadoop clusters. While highly effective for very large batch-analytic jobs, MapReduce has proven to be suboptimal for applications like graph analysis that require iterative processing and data sharing.


Spark is designed to provide a more *flexible* model that supports many of the multipass applications that falter in MapReduce. It accomplishes this goal by taking advantage of memory whenever possible in order to reduce the amount of data that is written to and read from disk. Unlike Pig and Hive, Spark is not a tool for making MapReduce easier to use. It is a complete replacement for MapRe‐ duce that includes its own work execution engine.


Spark operates with *three* core ideas:


*Resilient Distributed Dataset (RDD)*  
RDDs contain data that you want to transform or analyze. They can either be be read from an external source, such as a file or a database, or they can be created by a transformation.

*Transformation*  
A transformation modifies an existing RDD to create a new RDD. For example, a filter that pulls ERROR messages out of a log file would be a transformation.

*Action*  
An action analyzes an RDD and returns a single result. For example, an action would count the number of results identified by our ERROR filter.


If you want to do any significant work in Spark, you would be wise to learn about Scala, a functional programming language. Scala combines object orientation with functional programming. Because Lisp is an older functional programming language, Scala might be called “*Lisp joins the 21st century.*” This is not to say that Scala is the only way to work with Spark. The project also has strong support for Java and Python, but when new APIs or features are added, they appear first in Scala.


## Tutorial Links


A quick start for Spark can be found on the project home page. 


## Example Code


We’ll start with opening the Spark shell by running *./bin/spark-shell* from the directory we installed Spark in.


In this example, we’re going to count the number of Dune reviews in our review file:

```scala
// Read the csv file containing our reviews
scala> val reviews = spark.textFile("hdfs://reviews.csv") testFile: spark.RDD[String] = spark.MappedRDD@3d7e837f
// This is a two-part operation:
// first we'll filter down to the two
// lines that contain Dune reviews
// then we'll count those lines
scala> val dune_reviews = reviews.filter(line =>
line.contains("Dune")).count() res0: Long = 2
```

---
layout: post
title: Using Avro in MapReduce Jobs With Hadoop, Pig, Hive 
date: 2014-03-23
categories: [computer science]
tags: [hadoop & mapreduce]

---

# Using Avro in MapReduce Jobs With Hadoop, Pig, Hive

[Apache Avro](http://avro.apache.org/) is a very popular data serialization format in the Hadoop technology stack. In this article I show code examples of MapReduce jobs in Java, Hadoop Streaming, Pig and Hive that read and/or write data in Avro format. We will use a small, Twitter-like data set as input for our example MapReduce jobs.

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

[twitter.avsc](src/main/resources/avro/twitter.avsc) defines a basic schema for storing tweets:

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

The latest version of the schema is always available at [twitter.avsc](src/main/resources/avro/twitter.avsc).

If you want to generate Java classes from this Avro schema follow the instructions described in section
<a href="#Usage">Usage</a>.  Alternatively you can also use the Avro Compiler directly.



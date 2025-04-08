---
layout: post
title: Using Avro in MapReduce Jobs with Hadoop Streaming
date: 2014-03-23
categories: [computer science]
tags: [big data]

---

# Using Avro in MapReduce Jobs with Hadoop Streaming

[Apache Avro](http://avro.apache.org/) is a very popular data serialization format in the Hadoop technology stack. In this article I show code examples of MapReduce jobs in Java, Hadoop Streaming, Pig and Hive that read and/or write data in Avro format. We will use a small, Twitter-like data set as input for our example MapReduce jobs.

---

## Table of Contents

* <a href="#Requirements">Requirements</a>
* <a href="#Example data">Example data</a>
    * <a href="#Avro schema">Avro schema</a>
    * <a href="#Avro data files">Avro data files</a>
    * <a href="#Preparing the input data">Preparing the input data</a>
* <a href="#Hadoop Streaming">Hadoop Streaming</a>
    * <a href="#Preliminaries-Streaming">Preliminaries</a>
    * <a href="#Streaming data">How Streaming sees data when reading via AvroAsTextInputFormat</a>
    * <a href="#Examples-Streaming">Examples</a>
    * <a href="#Further readings on Hadoop Streaming">Further readings on Hadoop Streaming</a>
    
---

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

<a name="Hadoop Streaming"></a>

# Hadoop Streaming


<a name="Preliminaries-Streaming"></a>

## Preliminaries

Important: The examples below assume you have access to a running Hadoop cluster.


<a name="Streaming data"></a>

## How Streaming sees data when reading via AvroAsTextInputFormat

When using [AvroAsTextInputFormat](http://avro.apache.org/docs/1.7.6/api/java/org/apache/avro/mapred/AvroAsTextInputFormat.html)
as the input format your streaming code will receive the data in JSON format, one record ("datum" in Avro parlance) per
line.  Note that Avro will also add a trailing TAB (`\t`) at the end of each line.

    <JSON representation of Avro record #1>\t
    <JSON representation of Avro record #2>\t
    <JSON representation of Avro record #3>\t
    ...

Here is the basic data flow from your input data in binary Avro format to our streaming mapper:

    input.avro (binary)  ---AvroAsTextInputFormat---> deserialized data (JSON) ---> Mapper


<a name="Examples-Streaming"></a>

## Examples


### Prerequisites

The example commands below use the Hadoop Streaming jar _for MRv1_ shipped with Cloudera CDH4:

* [hadoop-streaming-2.0.0-mr1-cdh4.3.0.jar](https://repository.cloudera.com/artifactory/cloudera-repos/org/apache/hadoop/hadoop-streaming/2.0.0-mr1-cdh4.3.0/hadoop-streaming-2.0.0-mr1-cdh4.3.0.jar)
  (as of July 2013)

If you are not using Cloudera CDH4 or are using a new version of CDH4 just replace the jar file with the one included
in your Hadoop installation.

The Avro jar files are straight from the [Avro project](https://avro.apache.org/releases.html):

* [avro-1.7.6.jar](http://www.eu.apache.org/dist/avro/avro-1.7.6/java/avro-1.7.6.jar)
* [avro-mapred-1.7.6-hadoop1.jar](http://www.eu.apache.org/dist/avro/avro-1.7.6/java/avro-mapred-1.7.6-hadoop1.jar)
* [avro-tools-1.7.6.jar](http://www.eu.apache.org/dist/avro/avro-1.7.6/java/avro-tools-1.7.6.jar)


### Reading Avro, writing plain-text

The following command reads Avro data from the relative HDFS directory `examples/input/` (which normally resolves
to `/user/<your-unix-username>/examples/input/`).  It writes the
deserialized version of each data record (see section *How Streaming sees data when reading via AvroAsTextInputFormat*
above) as is to the output HDFS directory `streaming/output/`.  For this simple demonstration we are using
the `IdentityMapper` as a naive map step implementation -- it outputs its input data unmodified (equivalently we
coud use the Unix tool `cat`, here) .  We do not need to run a reduce phase here, which is why we disable the reduce
step via the option `-D mapred.reduce.tasks=0` (see
[Specifying Map-Only Jobs](http://hadoop.apache.org/docs/r1.1.2/streaming.html#Specifying+Map-Only+Jobs) in the
Hadoop Streaming documentation).

```bash
# Run the streaming job
$ hadoop jar hadoop-streaming-2.0.0-mr1-cdh4.3.0.jar \
    -D mapred.job.name="avro-streaming" \
    -D mapred.reduce.tasks=0 \
    -files avro-1.7.6.jar,avro-mapred-1.7.6-hadoop1.jar \
    -libjars avro-1.7.6.jar,avro-mapred-1.7.6-hadoop1.jar \
    -input  examples/input/ \
    -output streaming/output/ \
    -mapper org.apache.hadoop.mapred.lib.IdentityMapper \
    -inputformat org.apache.avro.mapred.AvroAsTextInputFormat
```

Once the job completes you can inspect the output data as follows:

```
$ hadoop fs -cat streaming/output/part-00000 | head -4
{"username": "miguno", "tweet": "Rock: Nerf paper, scissors is fine.", "timestamp": 1366150681}
{"username": "BlizzardCS", "tweet": "Works as intended.  Terran is IMBA.", "timestamp": 1366154481}
{"username": "DarkTemplar", "tweet": "From the shadows I come!", "timestamp": 1366154681}
{"username": "VoidRay", "tweet": "Prismatic core online!", "timestamp": 1366160000}
```

Please be aware that the output data just happens to be JSON.  This is because we opted not to modify any of the input
data in our MapReduce job.  And since the input data to our MapReduce job is deserialized by Avro into JSON, the output
turns out to be JSON, too.  with a different MapReduce job you could of course write the output data in TSV or CSV
format, for instance.


### Reading Avro, writing Avro

#### AvroTextOutputFormat (implies "bytes" schema)

To write the output in Avro format instead of plain-text, use the same general options as in the previous example but
also add:

```bash
$ hadoop jar hadoop-streaming-2.0.0-mr1-cdh4.3.0.jar \
    [...]
    -outputformat org.apache.avro.mapred.AvroTextOutputFormat
```

[AvroTextOutputFormat](http://avro.apache.org/docs/1.7.6/api/java/index.html?org/apache/avro/mapred/AvroTextOutputFormat.html)
is the equivalent of TextOutputFormat.  It writes Avro data files with a "bytes" schema.

Note that using `IdentityMapper` as a naive mapper as shown in the previous example will not result in the output file
being identical to the input file.  This is because `AvroTextOutputFormat` will escape (quote) the input data it
receives.  An illustration might be worth a thousand words:

```bash
# After having used IdentityMapper as in the previous example
$ hadoop fs -copyToLocal streaming/output/part-00000.avro .
$ java -jar avro-tools-1.7.6.jar tojson part-00000.avro  | head -4
"{\"username\": \"miguno\", \"tweet\": \"Rock: Nerf paper, scissors is fine.\", \"timestamp\": 1366150681}\t"
"{\"username\": \"BlizzardCS\", \"tweet\": \"Works as intended.  Terran is IMBA.\", \"timestamp\": 1366154481}\t"
"{\"username\": \"DarkTemplar\", \"tweet\": \"From the shadows I come!\", \"timestamp\": 1366154681}\t"
"{\"username\": \"VoidRay\", \"tweet\": \"Prismatic core online!\", \"timestamp\": 1366160000}\t"
```


#### Custom Avro output schema

This looks not to be supported by stock Avro at the moment.  A related JIRA ticket
[AVRO-1067](https://issues.apache.org/jira/browse/AVRO-1067), created in April 2012, is still unresolved as of July
2013.

For a workaround take a look at the section *Avro output for Hadoop Streaming* at
[avro-utils](https://github.com/tomslabs/avro-utils), a third-party library for Avro.


#### Enabling compression of Avro output data (Snappy or Deflate)

If you want to enable compression for the Avro output data, you must add the following parameters to the streaming job:

    # For compression with Snappy
    -D mapred.output.compress=true -D avro.output.codec=snappy

    # For compression with Deflate
    -D mapred.output.compress=true -D avro.output.codec=deflate

Be aware that if you enable compression with `mapred.output.compress` but are NOT specifying an Avro output format
(such as AvroTextOutputFormat) your cluster's configured default compression codec will determine the final format
of the output data.  For instance, if `mapred.output.compression.codec` is set to
`com.hadoop.compression.lzo.LzopCodec` then the job's output files would be compressed with LZO (e.g. you would
see `part-00000.lzo` output files instead of uncompressed `part-00000` files).

See also [Compression and Avro](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/latest/CDH4-Installation-Guide/cdh4ig_topic_26_2.html)
in the CDH4 documentation.


<a name="Further readings on Hadoop Streaming"></a>

## Further readings on Hadoop Streaming

* [Streaming and Avro](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/latest/CDH4-Installation-Guide/cdh4ig_topic_26_6.html)
  -- Cloudera CDH4 documentation


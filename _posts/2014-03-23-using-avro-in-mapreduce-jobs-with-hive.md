---
layout: post
title: Using Avro in MapReduce Jobs with Hive 
date: 2014-03-23
categories: [computer science]
tags: [big data]

---

# Using Avro in MapReduce Jobs with Hive

[Apache Avro](http://avro.apache.org/) is a very popular data serialization format in the Hadoop technology stack. In this article I show code examples of MapReduce jobs in Java, Hadoop Streaming, Pig and Hive that read and/or write data in Avro format. We will use a small, Twitter-like data set as input for our example MapReduce jobs.

---

## Table of Contents

* <a href="#Requirements">Requirements</a>
* <a href="#Example data">Example data</a>
    * <a href="#Avro schema">Avro schema</a>
    * <a href="#Avro data files">Avro data files</a>
    * <a href="#Preparing the input data">Preparing the input data</a>
* <a href="#Hive">Hive</a>
    * <a href="#Preliminaries-Hive">Preliminaries</a>
    * <a href="#Examples-Hive">Examples</a>
    * <a href="#Further readings on Hive">Further readings on Hive</a>
    
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


<a name="Hive"></a>

# Hive

<a name="Preliminaries-Hive"></a>

## Preliminaries

Important: The examples below assume you have access to a running Hadoop cluster.


<a name="Examples-Hive"></a>

## Examples

In this section we demonstrate how to create a Hive table backed by Avro data, followed by running a few simple Hive
queries against that data.


### Defining a Hive table backed by Avro data

#### Using avro.schema.url to point to remote a Avro schema file

The following `CREATE TABLE` statement creates an external Hive table named `tweets` for storing Twitter messages
in a very basic data structure that consists of username, content of the message and a timestamp.

*For Hive version 0.11+:*

Starting with Hive version 0.11 you must use `SERDEPROPERTIES` instead of `with TBLPROPERTIES` to specify the Avro
schema.  If you mistakingly use `TBLPROPERTIES` Hive will complain with a `AvroSerdeException`.

```sql
-- Use the following syntax for Hive 0.11+
--
CREATE EXTERNAL TABLE tweets
    COMMENT "A table backed by Avro data with the Avro schema stored in HDFS"
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
    with SERDEPROPERTIES (
        'avro.schema.url' = 'hdfs:///user/YOURUSER/examples/schema/twitter.avsc'
    )
    STORED AS
    INPUTFORMAT  'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
    LOCATION '/user/YOURUSER/examples/input/';
```

*For Hive versions <= 0.10:*

```sql
-- Use the following syntax for Hive versions <= 0.10
--
CREATE EXTERNAL TABLE tweets_deprecated
    COMMENT "A table backed by Avro data with the Avro schema stored in HDFS"
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
    STORED AS
    INPUTFORMAT  'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
    LOCATION '/user/YOURUSER/examples/input/'
    TBLPROPERTIES (
        'avro.schema.url' = 'hdfs:///user/YOURUSER/examples/schema/twitter.avsc'
    );
```

_Important: Notice how `with SERDEPROPERTIES` is specified after `SERDE` and `TBLPROPERTIES` after `LOCATION`, respectively._

_Note: You must replace `YOURUSER` with your actual username._
_See section [Preparing the input data](#Preparing the input data) above._

The serde parameter `avro.schema.url` can use URI schemes such as `hdfs://`, `http://` and `file://`.  It is
[recommended to use HDFS locations](https://cwiki.apache.org/Hive/avroserde-working-with-avro-from-hive.html) though:

> [If the avro.schema.url points] to a location on HDFS [...], the AvroSerde will then read the file from HDFS, which
> should provide resiliency against many reads at once [which can be a problem for HTTP locations].  Note that the serde
> will read this file from every mapper, so it is a good idea to turn the replication of the schema file to a high value
> to provide good locality for the readers.  The schema file itself should be relatively small, so this does not add a
> significant amount of overhead to the process.

That said, when hosting the schemas on a high-performance web server such as [nginx](http://nginx.org/) that is very
efficient at serving static files then using HTTP locations for Avro schemas should not be a problem either.

If you need to point to a particular HDFS namespace you can include the hostname and port of the NameNode in
`avro.schema.url`:

```sql
CREATE EXTERNAL TABLE [...]
    with SERDEPROPERTIES (
        'avro.schema.url'='hdfs://namenode01:8020/path/to/twitter.avsc'
    )
    [...]
```

_Note: Remember to use `TBLPROPERTIES` (after `LOCATION`) instead of `with SERDEPROPERTIES` (after `SERDE`) for Hive versions <= 0.10._


#### Using avro.schema.literal to embed an Avro schema

An alternative to setting `avro.schema.url` and using an external Avro schema is to embed the schema directly within
the `CREATE TABLE` statement:

```sql
CREATE EXTERNAL TABLE tweets
    COMMENT "A table backed by Avro data with the Avro schema embedded in the CREATE TABLE statement"
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
    with SERDEPROPERTIES (
        'avro.schema.literal' = '{
            "type": "record",
            "name": "Tweet",
            "namespace": "com.miguno.avro",
            "fields": [
                { "name":"username",  "type":"string"},
                { "name":"tweet",     "type":"string"},
                { "name":"timestamp", "type":"long"}
            ]
        }'
    )
    STORED AS
    INPUTFORMAT  'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
    LOCATION '/user/YOURUSER/examples/input/';
```

_Note: Remember to use `TBLPROPERTIES` (after `LOCATION`) instead of `with SERDEPROPERTIES` (after `SERDE`) for Hive versions <= 0.10._

_Note: You must replace `YOURUSER` with your actual username._
_See section [Preparing the input data](#Preparing the input data) above._

Hive can also use variable substitution to embed the required Avro schema at run-time of a Hive script:

```sql
CREATE EXTERNAL TABLE tweets [...]
    with SERDEPROPERTIES ('avro.schema.literal' = '${hiveconf:schema}');
```

_Note: Remember to use `TBLPROPERTIES` (after `LOCATION`) instead of `with SERDEPROPERTIES` (after `SERDE`) for Hive versions <= 0.10._

To execute the Hive script you would then run:

```bash
# SCHEMA must be a properly escaped version of the Avro schema; i.e. carriage returns converted to \n, tabs to \t,
# quotes escaped, and so on.
$ export SCHEMA="..."
$ hive -hiveconf schema="${SCHEMA}" -f hive_script.hql
```


#### Switching from avro.schema.url to avro.schema.literal or vice versa

If for a given Hive table you want to change how the Avro schema is specified you need to use a
[workaround](https://cwiki.apache.org/Hive/avroserde-working-with-avro-from-hive.html):

> Hive does not provide an easy way to unset or remove a property.  If you wish to switch from using url or schema to
> the other, set the to-be-ignored value to none and the AvroSerde will treat it as if it were not set.


### Analyzing the data with Hive

After you have created the Hive table `tweets` with one of the `CREATE TABLE` statements above (no matter which),
you can start analyzing the example data with Hive.  We will demonstrate this via the interactive Hive shell, but you
can also use a Hive script, of course.

First, start the Hive shell:

```bash
$ hive
hive>
```

Let us inspect how Hive interprets the Avro data with `DESCRIBE`.  You can also use `DESCRIBE EXTENDED` to see even
more details, including the Avro schema of the table.

    hive> DESCRIBE tweets;
    OK
    username        string  from deserializer
    tweet   string  from deserializer
    timestamp       bigint  from deserializer
    Time taken: 1.786 seconds

Now we can perform interactive analysis of our example data:

    hive> SELECT * FROM tweets LIMIT 5;
    OK
    miguno        Rock: Nerf paper, scissors is fine.   1366150681
    BlizzardCS    Works as intended.  Terran is IMBA.   1366154481
    DarkTemplar   From the shadows I come!              1366154681
    VoidRay       Prismatic core online!                1366160000
    VoidRay       Fire at will, commander.              1366160010
    Time taken: 0.126 seconds

The following query will launch a MapReduce job to compute the result:

    hive> SELECT DISTINCT(username) FROM tweets;
    Total MapReduce jobs = 1
    Launching Job 1 out of 1
    [...snip...]
    MapReduce Total cumulative CPU time: 4 seconds 290 msec
    Ended Job = job_201305070634_0187
    MapReduce Jobs Launched:
    Job 0: Map: 1  Reduce: 1   Cumulative CPU: 4.29 sec   HDFS Read: 1887 HDFS Write: 47 SUCCESS
    Total MapReduce CPU Time Spent: 4 seconds 290 msec
    OK
    BlizzardCS          <<< Query results start here
    DarkTemplar
    Immortal
    VoidRay
    miguno
    Time taken: 16.782 seconds

As you can see Hive makes working Avro data completely transparent once you have defined the Hive table accordingly.


### Enabling compression of Avro output data

To enable compression add the following statements to your Hive script or enter them into the Hive shell:

    # For compression with Snappy
    SET hive.exec.compress.output=true;
    SET avro.output.codec=snappy;

    # For compression with Deflate
    SET hive.exec.compress.output=true;
    SET avro.output.codec=deflate;

To disable compression again in the same Hive script/Hive shell:

    SET hive.exec.compress.output=false;


### Hive and Hue

There are good and bad news:

1. Good: You can readily browse Avro-backed Hive tables in Hue via a table's "Sample" tab.
2. Bad: You cannot (yet) inspect the table metadata -- e.g. column names and types -- for Avro-backed Hive tables via
   a table's "Columns" tab.  Hue will also display "No data available".

![Browsing data of Avro Hive tables](images/cdh4-hue-hive-table-sample-tab.png?raw=true)
_Figure 1: Browsing data of Avro Hive tables works as expected._

![Displaying metadata of Avro Hive tables](images/cdh4-hue-hive-table-columns-tab.png?raw=true)
_Figure 2: Displaying metadata of Avro Hive tables does not work yet._


<a name="Further readings on Hive"></a>

## Further readings on Hive

* [AvroSerDe - working with Avro from Hive](https://cwiki.apache.org/Hive/avroserde-working-with-avro-from-hive.html)
  -- Hive documentation
  
---
layout: post
title: Using Avro in MapReduce Jobs with Pig
date: 2014-03-23
categories: [computer science]
tags: [big data]

---

# Using Avro in MapReduce Jobs with Pig

[Apache Avro](http://avro.apache.org/) is a very popular data serialization format in the Hadoop technology stack. In this article I show code examples of MapReduce jobs in Java, Hadoop Streaming, Pig and Hive that read and/or write data in Avro format. We will use a small, Twitter-like data set as input for our example MapReduce jobs.

---

Table of Contents

* <a href="#Requirements">Requirements</a>
* <a href="#Example data">Example data</a>
    * <a href="#Avro schema">Avro schema</a>
    * <a href="#Avro data files">Avro data files</a>
    * <a href="#Preparing the input data">Preparing the input data</a>
* <a href="#Pig">Pig</a>
    * <a href="#Preliminaries-Pig">Preliminaries</a>
    * <a href="#Examples-Pig">Examples</a>
    * <a href="#Further readings on Pig">Further readings on Pig</a>
* <a href="#Bijection">Twitter Bijection</a>
    * <a href="#Examples-Bijection">Examples</a>
* <a href="#Related documentation">Related documentation</a>
* <a href="#Contributing">Contributing to avro-hadoop-starter</a>
* <a href="#License">License</a>

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

<a name="Pig"></a>

# Pig


<a name="Preliminaries-Pig"></a>

## Preliminaries

Important: The examples below assume you have access to a running Hadoop cluster.


<a name="Examples-Pig"></a>

## Examples


### Prerequisites

First we must register the required jar files to be able to work with Avro.  In this example I am using the jar files
shipped with CDH4.  If you are not using CDH4 just adapt the paths to match your Hadoop distribution.

    REGISTER /app/cloudera/parcels/CDH/lib/pig/piggybank.jar
    REGISTER /app/cloudera/parcels/CDH/lib/pig/lib/avro-*.jar
    REGISTER /app/cloudera/parcels/CDH/lib/pig/lib/jackson-core-asl-*.jar
    REGISTER /app/cloudera/parcels/CDH/lib/pig/lib/jackson-mapper-asl-*.jar
    REGISTER /app/cloudera/parcels/CDH/lib/pig/lib/json-simple-*.jar
    REGISTER /app/cloudera/parcels/CDH/lib/pig/lib/snappy-java-*.jar

Note: If you also want to work with Python UDFs in PiggyBank you must also register the Jython jar file:

    REGISTER /app/cloudera/parcels/CDH/lib/pig/lib/jython-standalone-*.jar


### Reading Avro

To read input data in Avro format you must use `AvroStorage`.  The following statements show various ways to load
Avro data.

    -- Easiest case: when the input data contains an embedded Avro schema (our example input data does).
    -- Note that all the files under the directory should have the same schema.
    records = LOAD 'examples/input/' USING org.apache.pig.piggybank.storage.avro.AvroStorage();

    --
    -- Next commands show how to manually specify the data schema
    --

    -- Using external schema file (stored on HDFS), relative path
    records = LOAD 'examples/input/'
              USING org.apache.pig.piggybank.storage.avro.AvroStorage('no_schema_check',
                   'schema_file', 'examples/schema/twitter.avsc');

    -- Using external schema file (stored on HDFS), absolute path
    records = LOAD 'examples/input/'
              USING org.apache.pig.piggybank.storage.avro.AvroStorage(
                'no_schema_check',
                'schema_file', 'hdfs:///user/YOURUSERNAME/examples/schema/twitter.avsc');

    -- Using external schema file (stored on HDFS), absolute path with explicit HDFS namespace
    records = LOAD 'examples/input/'
              USING org.apache.pig.piggybank.storage.avro.AvroStorage(
                'no_schema_check',
                'schema_file', 'hdfs://namenode01:8020/user/YOURUSERNAME/examples/schema/twitter.avsc');

_About "no_schema_check":_
`AvroStorage` assumes that all Avro files in sub-directories of an input directory share the same schema, and by
default `AvroStorage` performs a schema check.  This process may take some time (seconds) when the input directory
contains many sub-directories and files.  You can set the option "no_schema_check" to disable this schema check.

See [AvroStorage](https://cwiki.apache.org/confluence/display/PIG/AvroStorage) and
[TestAvroStorage.java](https://github.com/apache/pig/blob/trunk/contrib/piggybank/java/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/pig/piggybank/test/storage/avro/TestAvroStorage.java)
for further examples.


### Analyzing the data with Pig

The `records` relation is already in perfectly usable format -- you do not need to manually define a (Pig) schema as
you would usually do via `LOAD ... AS (...schema follows...)`.

    grunt> DESCRIBE records;
    records: {username: chararray,tweet: chararray,timestamp: long}

Let us take a first look at the contents of the our input data.  Note that the output you will see will vary at each
invocation due to how [ILLUSTRATE](http://pig.apache.org/docs/r0.11.1/test.html) works.

    grunt> ILLUSTRATE records;
    <snip>
    --------------------------------------------------------------------------------------------
    | records     | username:chararray      | tweet:chararray            | timestamp:long      |
    --------------------------------------------------------------------------------------------
    |             | DarkTemplar             | I strike from the shadows! | 1366184681          |
    --------------------------------------------------------------------------------------------

Now we can perform interactive analysis of our example data:

    grunt> first_five_records = LIMIT records 5;
    grunt> DUMP first_five_records;   <<< this will trigger a MapReduce job
    [...snip...]
    (miguno,Rock: Nerf paper, scissors is fine.,1366150681)
    (VoidRay,Prismatic core online!,1366160000)
    (VoidRay,Fire at will, commander.,1366160010)
    (BlizzardCS,Works as intended.  Terran is IMBA.,1366154481)
    (DarkTemplar,From the shadows I come!,1366154681)

List the (unique) names of users that created tweets:

    grunt> usernames = DISTINCT (FOREACH records GENERATE username);
    grunt> DUMP usernames;            <<< this will trigger a MapReduce job
    [...snip...]
    (miguno)
    (VoidRay)
    (Immortal)
    (BlizzardCS)
    (DarkTemplar)


### Writing Avro

To write output data in Avro format you must use `AvroStorage` -- just like for reading Avro data.

It is strongly recommended that you do specify an explicit output schema when writing Avro data.  If you don't then Pig
will try to infer the output Avro schema from the data's Pig schema -- and this may result in undesirable schemas due
to discrepancies of Pig and Avro data models (or problems of Pig itself).  See
[AvroStorage](https://cwiki.apache.org/confluence/display/PIG/AvroStorage) for details.

    -- Use the same output schema as an existing directory of Avro files (files should have the same schema).
    -- This is helpful, for instance, when doing simple processing such as filtering the input data without modifying
    -- the resulting data layout.
    STORE records INTO 'pig/output/'
        USING org.apache.pig.piggybank.storage.avro.AvroStorage(
            'no_schema_check',
            'data', 'examples/input/');

    -- Use the same output schema as an existing Avro file as opposed to a directory of such files
    STORE records INTO 'pig/output/'
        USING org.apache.pig.piggybank.storage.avro.AvroStorage(
            'no_schema_check',
            'data', 'examples/input/twitter.avro');

    -- Manually define an Avro schema (here, we rename 'username' to 'user' and 'tweet' to 'message')
    STORE records INTO 'pig/output/'
        USING org.apache.pig.piggybank.storage.avro.AvroStorage(
            '{
                "schema": {
                    "type": "record",
                    "name": "Tweet",
                    "namespace": "com.miguno.avro",
                    "fields": [
                        {
                            "name": "user",
                            "type": "string"
                        },
                        {
                            "name": "message",
                            "type": "string"
                        },
                        {
                            "name": "timestamp",
                            "type": "long"
                        }
                    ],
                    "doc:" : "A slightly modified schema for storing Twitter messages"
                }
            }');

If you need to store the data in two or more different ways (e.g. you want to rename fields) you must add the parameter
["index"](https://cwiki.apache.org/confluence/display/PIG/AvroStorage) to the `AvroStorage` arguments.  Pig uses this
information as a workaround to distinguish schemas specified by different AvroStorage calls until Pig's StoreFunc
provides access to Pig's output schema in the backend.

    STORE records INTO 'pig/output-variant-A/'
        USING org.apache.pig.piggybank.storage.avro.AvroStorage(
            '{
                "index": 1,
                "schema": { ... }
            }');

    STORE records INTO 'pig/output-variant-B/'
        USING org.apache.pig.piggybank.storage.avro.AvroStorage(
            '{
                "index": 2,
                "schema": { ... }
            }');

See [AvroStorage](https://cwiki.apache.org/confluence/display/PIG/AvroStorage) and
[TestAvroStorage.java](https://github.com/apache/pig/blob/trunk/contrib/piggybank/java/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/pig/piggybank/test/storage/avro/TestAvroStorage.java)
for further examples.


#### TODO: Show how to store the `usernames` relation

_Note: This example is not working yet._

To store the `usernames` relation from the _Reading Avro_ section above:

    -- TODO: WHY DOES THIS STATEMENT FAIL DURING MAPREDUCE RUNTIME with
    --          java.io.IOException: org.apache.avro.file.DataFileWriter$AppendWriteException:
    --              java.lang.RuntimeException: Unsupported type in record:class java.lang.String
    --
    STORE usernames INTO 'pig/output/'
        USING org.apache.pig.piggybank.storage.avro.AvroStorage(
            '{
                "index": 1,
                "schema": {
                    "type":"record",
                    "name":"User",
                    "namespace": "com.miguno.avro",
                    "fields": [
                        {"name":"username","type":"string"}
                    ]
                }
            }');


    -- TODO: THIS STATEMENT FAILS, TOO, with THE SAME RUNTIME EXCEPTION
    --
    STORE usernames INTO 'pig/output/'
        USING org.apache.pig.piggybank.storage.avro.AvroStorage(
            '{
                "schema_file": "examples/schema/user.avsc",
                "field0": "def:username"
            }');


#### Enabling compression of Avro output data

To enable compression add the following statements to your Pig script or enter them into the Pig Grunt shell:

    -- We also enable compression of map output (which should be enabled by default anyways) because some Pig jobs
    -- skip the reduce phase;  this ensures that we always generate compressed job output.
    SET mapred.compress.map.output true;
    SET mapred.output.compress true;
    SET mapred.output.compression.codec org.apache.hadoop.io.compress.SnappyCodec
    SET avro.output.codec snappy;

To disable compression again in the same Pig script/Pig Grunt shell:

    SET mapred.output.compress false;
    -- Optionally: disable compression of map output (normally you want to leave this enabled)
    SET mapred.compress.map.output false;


<a name="Further readings on Pig"></a>

### Further readings on Pig

* [AvroStorage](https://cwiki.apache.org/confluence/display/PIG/AvroStorage) on the Pig wiki
* [AvroStorage.java](https://github.com/apache/pig/blob/trunk/contrib/piggybank/java/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/java/org/apache/pig/piggybank/storage/avro/AvroStorage.java)
* [TestAvroStorage.java](https://github.com/apache/pig/blob/trunk/contrib/piggybank/java/https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/test/java/org/apache/pig/piggybank/test/storage/avro/TestAvroStorage.java)
  -- many unit test examples that demonstrate how to use `AvroStorage`


<a name="Bijection"></a>

# Twitter Bijection


<a name="Examples-Bijection"></a>

[Bijection](https://github.com/twitter/bijection) is a very nifty library to convert between different kinds of data
formats including Avro.  The examples below use Scala but of course you can also use any other JVM language (including
good old Java) to work with Bijection.


## Examples

The following Scala example assumes that you have an Avro-backed instance of `Tweet`
(see [twitter.avsc](https://github.com/sungsoo/avro-hadoop-starter/tree/master/src/main/resources/avro/twitter.avsc)) that you want to convert to, say, an array of bytes and back.

```scala
import com.twitter.bijection.Injection
import com.twitter.bijection.avro.SpecificAvroCodecs
import com.miguno.avro.Tweet // Your Avro-generated Java class, based on twitter.avsc
val tweet = new Tweet("miguno", "Terran is the cheese race.", 1366190000)
// From POJO to byte array
val bytes = Injection[Tweet, Array[Byte]](tweet)
// From byte array back to POJO
val recovered_tweet = Injection.invert[Tweet, Array[Byte]](bytes)
```


<a name="Related documentation"></a>

# Related documentation

* [Reading and Writing Avro Files From the Command Line](http://www.michael-noll.com/blog/2013/03/17/reading-and-writing-avro-files-from-the-command-line/)


<a name="Contributing"></a>

## Contributing to avro-hadoop-starter

Code contributions, bug reports, feature requests etc. are all welcome.

If you are new to GitHub please read [Contributing to a project](https://help.github.com/articles/fork-a-repo) for how
to send patches and pull requests to avro-hadoop-starter.


<a name="License"></a>

## License

Copyright © 2013-2014 Michael G. Noll

See [LICENSE](LICENSE) for licensing information.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/3783cb35c77123156b11034f93bc9c1c "githalytics.com")](http://githalytics.com/miguno/avro-hadoop-starter)

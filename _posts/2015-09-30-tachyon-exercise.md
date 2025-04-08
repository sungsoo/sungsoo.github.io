---
layout: post
title: Explore In-Memory Data Store Tachyon
date: 2015-09-30
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Explore In-Memory Data Store Tachyon](http://ampcamp.berkeley.edu/5/exercises/tachyon.html)

---

# Explore In-Memory Data Store Tachyon

Memory is the key to fast Big Data processing. This has been realized by
many, and frameworks such as Spark already leverage memory performance.
As data sets continue to grow, storage is increasingly becoming a
critical bottleneck in many workloads.

To address this need, we have developed
[Tachyon](http://tachyon-project.org/), a memory centric fault-tolerant
distributed file system, which enables reliable file sharing at
memory-speed across cluster frameworks, such as Spark and MapReduce. The
result of over two years of research, Tachyon achieves memory-speed and
fault-tolerance by using memory aggressively and leveraging lineage
information. Tachyon caches working set files in memory, and enables
different jobs/queries and frameworks to access cached files at memory
speed. Thus, Tachyon avoids going to disk to load datasets that are
frequently read.

Tachyon is Hadoop compatible. Existing Spark and MapReduce programs can
run on top of it without any code changes. Tachyon is the default
off-heap option in Spark, which means that RDDs can automatically be
stored inside Tachyon to make Spark more resilient and avoid GC
overheads. The project is open source and is already deployed at
multiple companies. In addition, Tachyon has more than [50
contributors](https://github.com/amplab/tachyon/graphs/contributors)
from over 20 institutions, including Yahoo, Intel, Redhat, and Pivotal.
The project is the storage layer of the [Berkeley Data Analytics Stack
(BDAS)](https://amplab.cs.berkeley.edu/software/) and also part of the
[Fedora
distribution](http://timothysc.github.io/blog/2014/02/17/bdas-tachyon/).

In this chapter we first go over basic operations of Tachyon, and then
run a Spark program on top of it. For more information, please visit
Tachyon’s [website](http://tachyon-project.org) or Github
[repository](https://github.com/amplab/tachyon). We also host regular
[meetups](http://www.meetup.com/Tachyon/) in the bay area.

Prerequisites
=============

Assumptions
-----------

-   You have a laptop
-   Your laptop has Java 6 or 7 installed
-   Mac OS or Linux (Windows is not supported)

Launch Tachyon
--------------

## Configurations

All system’s configuration is under `tachyon/conf` folder. Please find
them, and see how much memory is configured on each worker node.

```
$ grep "TACHYON_WORKER_MEMORY_SIZE=" conf/tachyon-env.sh
export TACHYON_WORKER_MEMORY_SIZE=1GB
```

You can also read the through the file and try to understand those
parameters. For more information on configuration, you can visit Tachyon
[Configuration Settings
webpage](http://tachyon-project.org/Configuration-Settings.html).

## Format the storage

Note that if you are running Linux, Tachyon will need root permission to
create and use a RAM disk. To start a superuser shell, run `sudo su` and
enter your password.

Before starting Tachyon for the first time, we need to format the
system. It can be done by using `tachyon` script in the `tachyon/bin`
folder. Please type the following command:

```
$ ./bin/tachyon format
Connection to localhost... Formatting Tachyon Worker @ HYMac-2.local
Removing local data under folder: /Users/haoyuan/Downloads/test/tachyon/libexec/../ramdisk/tachyonworker/
Formatting Tachyon Master @ localhost
Formatting JOURNAL_FOLDER: /Users/haoyuan/Downloads/test/tachyon/libexec/../journal/
Formatting UNDERFS_DATA_FOLDER: /Users/haoyuan/Downloads/test/tachyon/libexec/../../data/tmp/tachyon/data
Formatting UNDERFS_WORKERS_FOLDER: /Users/haoyuan/Downloads/test/tachyon/libexec/../../data/tmp/tachyon/workers
```

## Start the system

After formatting the storage, we can try to start the system. This can
be done by using `tachyon/bin/tachyon-start.sh` script.

```
$ ./bin/tachyon-start.sh local
Killed 0 processes
Killed 0 processes
Connection to localhost... Killed 0 processes
Starting master @ localhost
Starting worker @ HYMac-2.local
```

Interacting with Tachyon
------------------------

In this section, we will go over three approaches to interact with
Tachyon:

1.  Command Line Interface
2.  Application Programming Interface
3.  Web User Interface

## Command Line Interface

You can interact with Tachyon using the following command:

```
$ ./bin/tachyon tfs
```

Then, it will return a list of options:

```
    Usage: java TFsShell
           [cat <path>]
           [count <path>]
           [ls <path>]
           [lsr <path>]
           [mkdir <path>]
           [rm <path>]
           [tail <path>]
           [touch <path>]
           [mv <src> <dst>]
           [copyFromLocal <src> <remoteDst>]
           [copyToLocal <src> <localDst>]
           [fileinfo <path>]
           [location <path>]
           [report <path>]
           [request <tachyonaddress> <dependencyId>]
           [pin <path>]
           [unpin <path>]
```

Please try to put the local file `tachyon/LICENSE` into Tachyon file
system as /LICENSE using command line.

    $ ./bin/tachyon tfs copyFromLocal LICENSE /LICENSE
    Copied LICENSE to /LICENSE

You can also use command line interface to verify this:

    $ ./bin/tachyon tfs ls /
    11.40 KB  02-07-2014 23:23:44:008  In Memory      /LICENSE

Now, you want to check out the content of the file:

    $ ./bin/tachyon tfs cat /LICENSE
                                     Apache License
                              Version 2.0, January 2004
                           http://www.apache.org/licenses/
      TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
    ....

## Application Programming Interface

After using command line to interact with Tachyon, you can also use its
API. We have several sample
[applications](https://github.com/amplab/tachyon/tree/master/core/src/main/java/tachyon/examples).
For example,
[BasicOperations.java](https://github.com/amplab/tachyon/blob/master/core/src/main/java/tachyon/examples/BasicOperations.java)
shows how to user file create, write, and read operations.

You have put these into our script, you can simply use the following
command to run this sample program. The following command runs
[BasicOperations.java], and also verifies Tachyon’s installation.

    $ ./bin/tachyon runTests
    $ /root/tachyon/bin/tachyon runTest Basic MUST_CACHE
    $ /BasicFile_MUST_CACHE has been removed
    $ 2014-02-07 23:46:57,529 INFO   (TachyonFS.java:connect) - Trying to connect master @ ec2-23-20-202-253.compute-1.amazonaws.com/10.91.151.150:19998
    $ 2014-02-07 23:46:57,599 INFO   (MasterClient.java:getUserId) - User registered at the master ec2-23-20-202-253.compute-1.amazonaws.com/10.91.151.150:19998 got UserId 6
    $ 2014-02-07 23:46:57,600 INFO   (TachyonFS.java:connect) - Trying to get local worker host : ip-10-91-151-150.ec2.internal
    $ 2014-02-07 23:46:57,618 INFO   (TachyonFS.java:connect) - Connecting local worker @ ip-10-91-151-150.ec2.internal/10.91.151.150:29998
    $ 2014-02-07 23:46:57,661 INFO   (CommonUtils.java:printTimeTakenMs) - createFile with fileId 3 took 133 ms.
    $ 2014-02-07 23:46:57,707 INFO   (TachyonFS.java:createAndGetUserTempFolder) - Folder /mnt/ramdisk/tachyonworker/users/6 was created!
    $ 2014-02-07 23:46:57,714 INFO   (BlockOutStream.java:<init>) - /mnt/ramdisk/tachyonworker/users/6/3221225472 was created!
    $ Passed the test!
    $ /root/tachyon/bin/tachyon runTest BasicRawTable MUST_CACHE
    $ /BasicRawTable_MUST_CACHE has been removed
    $ 2014-02-07 23:46:58,633 INFO   (TachyonFS.java:connect) - Trying to connect master @ ec2-23-20-202-253.compute-1.amazonaws.com/10.91.151.150:19998
    $ 2014-02-07 23:46:58,705 INFO   (MasterClient.java:getUserId) - User registered at the master ec2-23-20-202-253.compute-1.amazonaws.com/10.91.151.150:19998 got UserId 8
    $ 2014-02-07 23:46:58,706 INFO   (TachyonFS.java:connect) - Trying to get local worker host : ip-10-91-151-150.ec2.internal
    $ 2014-02-07 23:46:58,725 INFO   (TachyonFS.java:connect) - Connecting local worker @ ip-10-91-151-150.ec2.internal/10.91.151.150:29998
    $ 2014-02-07 23:46:58,859 INFO   (TachyonFS.java:createAndGetUserTempFolder) - Folder /mnt/ramdisk/tachyonworker/users/8 was created!
    $ 2014-02-07 23:46:58,866 INFO   (BlockOutStream.java:<init>) - /mnt/ramdisk/tachyonworker/users/8/8589934592 was created!
    $ 2014-02-07 23:46:58,904 INFO   (BlockOutStream.java:<init>) - /mnt/ramdisk/tachyonworker/users/8/9663676416 was created!
    $ 2014-02-07 23:46:58,914 INFO   (BlockOutStream.java:<init>) - /mnt/ramdisk/tachyonworker/users/8/10737418240 was created!
    $ Passed the test!
    $ ...

## Web User Interface

After using commands and API to interact with Tachyon, let’s take a look
at its web user interface. The URI is `http://localhost:19999`.

The first page is the overview of the running system. The second page is
the system configuration

If you click on the `Browse File System`, it shows you all the files you
just created and copied.

You can also click a particular file or folder. e.g. `/LICENSE` file,
and then you will see the detailed information about it.

Run Spark on Tachyon
--------------------

## Input/Output with Tachyon

In this section, we run a Spark program to interact with Tachyon. The
first one is to do a word count on `/LICENSE` file. In `/root/spark`
folder, execute the following command to start Spark shell.

```scala
    $ ./bin/spark-shell
    sc.hadoopConfiguration.set("fs.tachyon.impl", "tachyon.hadoop.TFS")
    var file = sc.textFile("tachyon://localhost:19998/LICENSE")
    val counts = file.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _)
    counts.saveAsTextFile("tachyon://localhost:19998/result")
```

```java
    JavaRDD<String> file = spark.textFile("tachyon://localhost:19998/LICENSE");
    JavaRDD<String> words = file.flatMap(new FlatMapFunction<String, String>()
      public Iterable<String> call(String s) { return Arrays.asList(s.split(" ")); }
    });
    JavaPairRDD<String, Integer> pairs = words.map(new PairFunction<String, String, Integer>()
      public Tuple2<String, Integer> call(String s) { return new Tuple2<String, Integer>(s, 1); }
    });
    JavaPairRDD<String, Integer> counts = pairs.reduceByKey(new Function2<Integer, Integer>()
      public Integer call(Integer a, Integer b) { return a + b; }
    });
    counts.saveAsTextFile("tachyon://localhost:19998/result");
```

```python
    file = sc.textFile("tachyon://localhost:19998/LICENSE")
    counts = file.flatMap(lambda line: line.split(" ")) \
                 .map(lambda word: (word, 1)) \
                 .reduceByKey(lambda a, b: a + b)
    counts.saveAsTextFile("tachyon://localhost:19998/result")
```

The results are stored in `/result` folder. You can verfy the results
through Web UI or commands. Because `/LICENSE` is in memory, when a new
Spark program comes up, it can load in memory data directly from
Tachyon. In the meantime, we are also working on other features to make
Tachyon further enhance Spark’s performance.

## Store RDD OFF_HEAP in Tachyon 

Storing RDD as OFF_HEAP storage in Tachyon has several advantages
([more
info](http://spark.apache.org/docs/latest/programming-guide.html)):

-   It allows multiple executors to share the same pool of memory in
    Tachyon.
-   It significantly reduces garbage collection costs.
-   Cached data is not lost if individual executors crash.

Please try to the following example:

```scala
    sc.hadoopConfiguration.set("fs.tachyon.impl", "tachyon.hadoop.TFS")
    var file = sc.textFile("tachyon://localhost:19998/LICENSE")
    val counts = file.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _)
    counts.persist(org.apache.spark.storage.StorageLevel.OFF_HEAP)
    counts.take(10)
    counts.take(10)
```

You will notice the second time take(10) is much faster than the first
time because that the counts RDD has been stored OFF_HEAP in Tachyon.

This brings us to the end of the Tachyon chapter of the tutorial. We
encourage you to continue playing with the code and to check out the
[project website](http://tachyon-project.org/), Github
[repository](https://github.com/amplab/tachyon), and [meetup
group](http://www.meetup.com/Tachyon/) for further information.

Bug reports and feature requests are welcomed.


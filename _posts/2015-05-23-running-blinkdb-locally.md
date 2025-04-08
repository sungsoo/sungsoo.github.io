---
layout: post
title: Running BlinkDB Locally
date: 2015-05-23
categories: [computer science]
tags: [big data]

---


## Article Source

* Title: [Running BlinkDB Locally](https://github.com/sameeragarwal/blinkdb/wiki/Running-BlinkDB-Locally)
* Authors: Sameer Agarwal

---


# Running BlinkDB Locally


This wiki is closely mirrored after the Shark Wiki and describes how to
get BlinkDB running locally. It creates a small custom BlinkDB Hive
installation on one machine and allows you to execute simple queries.
The only prerequisite for this guide is that you have Java and [Scala
2.9.3](http://www.scala-lang.org/) installed on your machine. If you
don't have Scala 2.9.3, you can download it by running:

    $ wget http://www.scala-lang.org/files/archive/scala-2.9.3.tgz
    $ tar xvfz scala-2.9.3.tgz

Get the latest version of BlinkDB.

    $ git clone -b alpha-0.1.0 https://github.com/sameeragarwal/blinkdb.git

BlinkDB requires the (patched) development package of BlinkDB Hive which
is added as a submodule in the BlinkDB repository. Clone it from github
and package it:

    $ cd blinkdb
    $ git submodule init
    $ git submodule update
    $ cd hive_blinkdb
    $ ant package

`ant package` builds all Hive jars and put them into `build/dist`
directory. If you are trying to build Hive on your local machine and (a)
your distribution doesn't have yum or (b) the above yum commands don't
work out of the box with your distro, then you probably want to upgrade
to a newer version of ant. ant \>= 1.8.2 should work. Download ant
binaries at <http://ant.apache.org/bindownload.cgi>. You might also be
able to upgrade to a newer version of ant using a package manager,
however on older versions of CentOS, e.g. 6.4, yum can't install ant 1.8
out of the box so installing ant by downloading the binary installation
package is recommended.

The BlinkDB code is in the `blinkdb/` directory. To setup your
environment to run BlinkDB locally, you need to set HIVE\_HOME and
SCALA\_HOME environmental variables in a file
`blinkdb/conf/blinkdb-env.sh` to point to the folders you just
downloaded. BlinkDB comes with a template file `blinkdb-env.sh.template`
that you can copy and modify to get started:

    $ cd blinkdb/conf
    $ cp blinkdb-env.sh.template blinkdb-env.sh

Edit `blinkdb/conf/blinkdb-env.sh` and set the following for running
local mode:

    #!/usr/bin/env bash
    export SHARK_MASTER_MEM=1g
    export HIVE_DEV_HOME="/path/to/hive"
    export HIVE_HOME="$HIVE_DEV_HOME/build/dist"
    SPARK_JAVA_OPTS="-Dspark.local.dir=/tmp "
    SPARK_JAVA_OPTS+="-Dspark.kryoserializer.buffer.mb=10 "
    SPARK_JAVA_OPTS+="-verbose:gc -XX:-PrintGCDetails -XX:+PrintGCTimeStamps "
    export SPARK_JAVA_OPTS
    export SCALA_VERSION=2.9.3
    export SCALA_HOME="/path/to/scala-home-2.9.3"
    export SPARK_HOME="/path/to/spark"
    export HADOOP_HOME="/path/to/hadoop-1.2.0"
    export JAVA_HOME="/path/to/java-home-1.7_21-or-newer"

Next, package and publish Spark and BlinkDB

    $ cd $SPARK_HOME
    $ sbt/sbt publish-local
    $ cd $BLINKDB_HOME
    $ sbt/sbt package

Next, create the default Hive warehouse directory. This is where Hive
will store table data for native tables.

    $ sudo mkdir -p /user/hive/warehouse
    $ sudo chmod 0777 /user/hive/warehouse  # Or make your username the owner

You can now start the BlinkDB CLI:

    $ ./bin/blinkdb

To verify that BlinkDB is running, you can try the following example,
which creates a table with sample data:

    CREATE TABLE src(key INT, value STRING);
    LOAD DATA LOCAL INPATH '${env:HIVE_HOME}/examples/files/kv1.txt' INTO TABLE src;
    SELECT COUNT(1) FROM src;
    CREATE TABLE src_cached AS SELECT * FROM SRC;
    SELECT COUNT(1) FROM src_cached;

In addition to the BlinkDB CLI, there are several executables in
`blinkdb/bin`:

-   `bin/blinkdb-withdebug`: Runs BlinkDB CLI with DEBUG level logs
    printed to the console.
-   `bin/blinkdb-withinfo`: Runs BlinkDB CLI with INFO level logs
    printed to the console.


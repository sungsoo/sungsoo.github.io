---
layout: post
title: Apache MRQL Installation Instructions
date: 2015-06-19
categories: [computer science]
tags: [big data]

---

# Apache MRQL Installation Instructions

Apache MRQL can run in four modes: in Map-Reduce mode using Apache
Hadoop, in BSP mode (Bulk Synchronous Parallel mode) using Apache Hama,
in Spark mode using Apache Spark, and in Flink mode using Apache Flink.

The MRQL MapReduce mode has been tested on Apache Hadoop MapReduce
releases 1.x, and 2.x (Yarn). You can download the latest tarball from
[Apache Hadoop](http://hadoop.apache.org/releases.html). The BSP mode
has been tested on Apache Hama 0.6.2, 0.6.3, and 0.6.4. You can download
the latest tarball from [Apache Hama](http://hama.apache.org/). The
Spark mode has been tested on Apache Spark 1.0.0 through 1.3.0 in local,
standalone deploy, and Yarn modes. You can download the latest tarball
prebuilt for Hadoop1 or Hadoop2 from [Apache
Spark](http://spark.apache.org/). The Flink mode has been tested on
Apache Flink 0.6-incubating through 0.8.0 in local and Yarn modes. You
can download the latest tarball prebuilt for Hadoop2 from [Apache
Flink](http://flink.apache.org/downloads.html).

The following instructions assume that you have already installed Apache
Hadoop MapReduce and you have deployed it on your cluster successfully.

## How to install MRQL

Download the latest stable MRQL binary release from
[http://www.apache.org/dyn/closer.cgi/incubator/mrql](http://www.apache.org/dyn/closer.cgi/incubator/mrql)
and extract the files. The scripts `bin/mrql`, `bin/mrql.bsp`,
`bin/mrql.spark`, and `bin/mrql.flink` evaluate MRQL queries in Hadoop,
Hama, Spark, and Flink modes, respectively.

## How to run MRQL on a Hadoop MapReduce cluster

Change the configuration file `conf/mrql-env.sh` to match your Hadoop
installation. For a test, run the [PageRank
example](https://wiki.apache.org/mrql/Pagerank) or the [k-means
clustering example](https://wiki.apache.org/mrql/Kmeans) on a small
Hadoop MapReduce cluster.

## How to run MRQL on a Hama cluster

Follow the instructions in [Getting Started with
Hama](http://hama.apache.org/getting_started_with_hama.html) to set up
and start Hama. Change the configuration file `conf/mrql-env.sh` to
match your Hama installation. For a test, run the [PageRank
example](https://wiki.apache.org/mrql/Pagerank) or the [k-means
clustering example](https://wiki.apache.org/mrql/Kmeans) on a Hama
cluster.

## How to run MRQL on a Spark standalone cluster

Follow the instructions in [Spark Standalone
Mode](http://spark.apache.org/docs/latest/spark-standalone.html) to set
up and start Apache Spark in standalone deploy mode. Change the
configuration file `conf/mrql-env.sh` to match your Spark installation.
For a test, run the [PageRank
example](https://wiki.apache.org/mrql/Pagerank) or the [k-means
clustering example](https://wiki.apache.org/mrql/Kmeans) on a Spark
cluster.

## How to run MRQL in Spark mode on a Yarn cluster

Set SPARK\_MASTER=yarn-client in conf/mrql-env.sh (see [Running Spark on
YARN](http://spark.apache.org/docs/latest/running-on-yarn.html)).

## How to run MRQL in Flink mode on a Yarn cluster

First, start the Flink application manager on Yarn using
\${FLINK\_HOME}/bin/yarn-session.sh -n \#\_of\_nodes (see [Yarn
Setup](http://flink.apache.org/docs/0.8/yarn_setup.html)). Then run the
[PageRank example](https://wiki.apache.org/mrql/Pagerank) using the
bin/mrql.flink script.

How to Recompile MRQL
---------------------

Download the latest stable MRQL source release from
[http://www.apache.org/dyn/closer.cgi/incubator/mrql](http://www.apache.org/dyn/closer.cgi/incubator/mrql)
and extract the files. You can get the latest source code using:

    git clone https://git-wip-us.apache.org/repos/asf/incubator-mrql.git

To build MRQL on Hadoop 1.x using maven, use `mvn clean install`. To
build MRQL on Yarn (Hadoop 2.x), use `mvn -Dyarn clean install`. To
validate the installation use `mvn -DskipTests=false clean install`,
which runs the queries in `tests/queries` in memory, local Hadoop mode,
local Hama mode, local Spark mode, and local Flink mode.




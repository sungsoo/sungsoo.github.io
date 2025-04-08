---
layout: post
title: Apache Tajo™ 0.8.0 Documentation
date: 2014-05-03
categories: [computer science]
tags: [big data, yarn]

---

## Article Source
* Title: [Apache Tajo™ 0.8.0 Documentation](http://tajo.apache.org/docs/0.8.0/index.html)

[![](http://sungsoo.github.com/images/tajo-documentation.png)](http://sungsoo.github.com/images/tajo-documentation.png)

# Introduction

The main goal of Apache Tajo project is to build an advanced open source
data warehouse system in Hadoop for processing web-scale data sets. 
Basically, Tajo provides SQL standard as a query language.
Tajo is designed for both interactive and batch queries on data sets
stored on HDFS and other data sources. Without hurting query response
times, Tajo provides fault-tolerance and dynamic load balancing which
are necessary for long-running queries. Tajo employs a cost-based and
progressive query optimization techniques for reoptimizing running
queries in order to avoid the worst query plans.


# Getting Started

In this section, we explain setup of a standalone Tajo instance. It will run against the local filesystem. In later sections, we will present how to run Tajo cluster instance on Apache Hadoop’s HDFS, a distributed filesystem. This section shows you how to start up a Tajo cluster, create tables in your Tajo cluster, submit SQL queries via Tajo shell, and shutting down your Tajo cluster instance. The below exercise should take no more than ten minutes.

## Prerequisites

* Hadoop 2.2.0 or higher
* Java 1.6 or higher
* Protocol buffer 2.5.0

## Dowload and unpack the source code of Apache Tajo


You can get either the source code release of Apache Tajo or check out the development code base from Git.

### Dowload the latest source release

Choose a download site from this list of [Apache Download Mirrors](http://www.apache.org/dyn/closer.cgi/incubator/tajo).
Click on the suggested mirror link. This will take you to a mirror of Tajo Releases. 
Download the file that ends in .tar.gz to your local filesystem; e.g. tajo-0.8.0-incubating.tar.gz. 

Decompress and untar your download and then change into the unpacked directory. 

	tar xzvf tajo-0.8.0-incubating.tar.gz

## Get the source code via Git

The development codebase can also be downloaded from [the Apache git repository](https://git-wip-us.apache.org/repos/asf/tajo.git) as follows: ::

	git clone https://git-wip-us.apache.org/repos/asf/tajo.git

A read-only git repository is also mirrored on [Github](https://github.com/apache/tajo).

Once you have downloaded Tajo, follow the [getting started instructions](http://tajo.apache.org/tajo-0.8.0-doc.html#GettingStarted), and take a look at the rest of the Tajo documentation.

# Build source code
You prepare the prerequisites and the source code, you can build the source code now.

The first step of the installation procedure is to configure the source tree for your system and choose the options you would like. This is done by running the configure script. For a default installation simply enter:

You can compile source code and get a binary archive as follows:

	$ cd tajo-x.y.z
	$ mvn clean package -DskipTests -Pdist -Dtar
	$ ls tajo-dist/target/tajo-x.y.z-SNAPSHOT.tar.gz
	
Then, after you move some proper directory, discompress the tar.gz file as follows:

	$ cd [a directory to be parent of tajo binary]
	$ tar xzvf ${TAJO_SRC}/tajo-dist/target/tajo-x.y.z-SNAPSHOT.tar.gz
	
# Setting up a local Tajo cluster

Apache Tajo™ provides two run modes: local mode and fully distributed mode. Here, we explain only the local mode where a Tajo instance runs on a local file system. A local mode Tajo instance can start up with very simple configurations.

First of all, you need to add the environment variables to conf/tajo-env.sh.

	# Hadoop home. Required
	export HADOOP_HOME= ...

	# The java implementation to use.  Required.
	export JAVA_HOME= ...

To launch the tajo master, execute start-tajo.sh.

	$ $TAJO_HOME/bin/start-tajo.sh

### Note

If you want to how to setup a fully distributed mode of Tajo, please see [Cluster Setup](http://tajo.apache.org/docs/0.8.0/configuration/cluster_setup.html).

# First query execution

First of all, we need to prepare some table for query execution. For example, you can make a simple text-based table as follows:

```
$ mkdir /home/x/table1
$ cd /home/x/table1
$ cat > data.csv
1|abc|1.1|a
2|def|2.3|b
3|ghi|3.4|c
4|jkl|4.5|d
5|mno|5.6|e
<CTRL + D>
```

Apache Tajo™ provides a SQL shell which allows users to interactively submit SQL queries. In order to use this shell, please execute bin/tsql

```
$ $TAJO_HOME/bin/tsql
tajo>
```

In order to load the table we created above, we should think of a schema of the table. Here, we assume the schema as (int, text, float, text).

```
$ $TAJO_HOME/bin/tsql
tajo> create external table table1 (
      id int,
      name text,
      score float,
      type text)
      using csv with ('csvfile.delimiter'='|') location 'file:/home/x/table1';
```
      
To load an external table, you need to use ‘create external table’ statement. In the location clause, you should use the absolute directory path with an appropriate scheme. If the table resides in HDFS, you should use ‘hdfs’ instead of ‘file’.

If you want to know DDL statements in more detail, please see Query Language.

	tajo> \d
	table1

	``\d`` command shows the list of tables. ::

	tajo> \d table1

	table name: table1
	table path: file:/home/x/table1
	store type: CSV
	number of rows: 0
	volume (bytes): 78 B
	schema:
	id      INT
	name    TEXT
	score   FLOAT
	type    TEXT
	
`\d [table name]` command shows the description of a given table.

Also, you can execute SQL queries as follows:


	tajo> select * from table1 where id > 2;
	final state: QUERY_SUCCEEDED, init time: 0.069 sec, response time: 0.397 sec
	result: file:/tmp/tajo-hadoop/staging/q_1363768615503_0001_000001/RESULT, 3 rows ( 35B)

	id,  name,  score,  type
	- - - - - - - - - -  - - -
	3,  ghi,  3.4,  c
	4,  jkl,  4.5,  d
	5,  mno,  5.6,  e

	tajo> exit
	bye
	
Feel free to enjoy Tajo with SQL standards. If you want to know more explanation for SQL supported by Tajo, please refer [SQL Language](http://tajo.apache.org/docs/0.8.0/sql_language.html).


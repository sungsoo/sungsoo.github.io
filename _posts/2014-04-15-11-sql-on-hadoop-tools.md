---
layout: post
title: 11 SQL-on-Hadoop Tools
date: 2014-04-15
categories: [computer science]
tags: [big data, big data, tez]

---

# Article Source
* Title: [11 SQL-on-Hadoop Tools](/blog/2014/04/11-sql-on-hadoop-tools/)
* Authors: [Saggi Neumann](/blog/2014/04/11-sql-on-hadoop-tools/)

# 11 SQL-on-Hadoop Tools 


In our recent post, [8 SQL-on-Hadoop
challenges](http://sungsoo.github.io/2014/04/15/eight-sql-on-hadoop-challenges.html),
we quickly listed several tools that help to bridge the gap between the
two technologies without going into details. This time we’ll dive in and
learn about 11 tools that bring SQL to Hadoop in various ways.

# Open Source SQL-on-Hadoop Tools

## Apache Hive

![](http://assets.xplenty.com/blog/assets/2014/04/logos/hive.png)

Initially developed by Facebook, [Apache Hive](https://hive.apache.org/)
is a data warehouse infrastructure that is built on top of Hadoop. It
allows querying data stored on HDFS for analysis via HQL, an SQL-like
language that is translated to MapReduce jobs. Although it seems to
provide SQL functionality, Hive still runs jobs on Hadoop as batch
processing and does not provide interactive querying. It stores metadata
in a relational database and requires maintaining a schema for the data.
Only four file formats are supported by Hive: text, SequenceFile, ORC
and RCFile. Hive supports processing compressed on Hadoop and also user
defined functions.

Bottom line - batch processing on Hadoop with an SQL like language

## Apache Sqoop

![](http://assets.xplenty.com/blog/assets/2014/04/logos/sqoop.png)

[Apache Sqoop](http://sqoop.apache.org/) allows importing and exporting
data from relational databases to Hadoop via JDBC, the standard API for
connecting to databases with Java. It can also work without JDBC as long
as the relevant tools allow bulk import/export of data. Sqoop works by
running a query on the relational database and exporting the resulting
rows into files in either one of these formats: text, binary, Avro, or
Sequence Files. These files can then be saved on Hadoop’s HDFS. They can
also be exported from Hadoop back into a relational database. Finally,
Sqoop [integrates with
HCatalog](http://sqoop.apache.org/docs/1.4.4/SqoopUserGuide.html#_sqoop_hcatalog_integration),
a table and storage management service for Hadoop that allows querying
Sqoop’s imported files via Hive or Pig. See our [Sqoop blog
post](http://www.xplenty.com/blog/2014/04/integrating-relational-databases-with-apache-hadoop/)
for more info.

Bottom line - import/export data from SQL databases to/from Apache
Hadoop

## BigSQL

![](http://assets.xplenty.com/blog/assets/2014/04/logos/bigsql.png)  

[BigSQL](http://www.bigsql.org/se/) is a pre-made package of PostgreSQL
and Hadoop that you can easily download and install to try out on your
local machine. Aside from Apache Hadoop and PostgreSQL, it also includes
Cassandra, Tez, Hive, Zookeeper, and HadoopFDW. Extra components such as
Pig, Sqoop, and HBase can be downloaded additionally.

Bottom line - pre-made package for trying out Hadoop with PostgreSQL on
your machine

## Lingual

![](http://assets.xplenty.com/blog/assets/2014/04/logos/cascading.png)

While other tools provide SQL-like syntax, Cascading’s
[Lingual](http://www.cascading.org/projects/lingual/) claims to provide
a full ANSI SQL interface for Hadoop, thus allowing for easier
integration with existing BI tools and helping SQL skilled personnel to
use Hadoop immediately. Lingual supports JDBC and also includes an SQL
shell. Despite the SQL interface, it still executes queries on Hadoop in
batch processing.

Bottom line - ANSI SQL interface for Hadoop

## Apache Phoenix

![](http://assets.xplenty.com/blog/assets/2014/04/logos/apache-phoenix.png)

[Apache Phoenix](http://phoenix.incubator.apache.org/) is an SQL skin
for interactive queries over HBase. It compiles SQL queries into a
series of HBase scans and produces JDBC result sets. Note that it
requires maintaining a schema which could be built from scratch or
mapped from an existing HBase table. Furthermore, there are several
features Phoenix doesn’t support: full transaction support, derived
tables, relational operators, and misc built-in functions (although they
can be added manually). The project is mainly maintained by Salesforce,
Intel, and Hortonworks.

Bottom line - interactive SQL over HBase

![](http://assets.xplenty.com/blog/assets/2014/04/sql-on-hadoop-tools2.jpg)

([Image](https://www.flickr.com/photos/jannem/3312115991/in/photostream/)
by [JanneM](https://www.flickr.com/photos/jannem/), [Some rights
reserved](https://creativecommons.org/licenses/by-sa/2.0/))

## Impala

![](http://assets.xplenty.com/blog/assets/2014/04/logos/cloudera-impala.png)

Cloudera’s
[Impala](http://www.cloudera.com/content/cloudera/en/products-and-services/cdh/impala.html)
is a query engine that runs on top of Hadoop and executes interactive
SQL queries on HDFS and HBase. While Hive runs in batch processing,
Impala runs the queries in real-time, thus integrating SQL based
business intelligence tools with Hadoop. Although Cloudera is the main
developer behind this tool, it is fully open source and supports the
following file formats:  text, LZO, SequenceFile, Avro and RCFile.
Impala can also run on the cloud via Amazon’s Elastic MapReduce.

Bottom line - Cloudera’s solution for interactive SQL queries over HDFS
and HBase

## Presto

![presto.png](http://assets.xplenty.com/blog/assets/2014/04/logos/presto.png)

[Presto](http://prestodb.io/)is also an interactive SQL query engine. It
runs on top of Hive, HBase, and even relational databases and
proprietary data stores, thus combining data from multiple sources
across the organization. Facebook is the main developer behind Presto
and the company uses it to query internal data stores, including a 300PB
data warehouse. Airbnb and Dropbox also use Presto, so it seems tried
and tested for the enterprise.

Bottom line - Facebook’s solution for interactive SQL queries over Hive
and HBase

## CitusDB

![](http://assets.xplenty.com/blog/assets/2014/04/logos/citusdata.png)

[CitusDB](http://www.citusdata.com/) (not to be confused with
[CitrusDB](http://www.citrusdb.org/)) is another interactive querying
engine with SQL-like functionality that works over Hadoop. It’s based on
Dremel, Google’s version of a real-time analytics database to process
Big Data, and unlike Impala and Presto it uses PostgreSQL as the SQL
engine that works behind the scenes. CitusDB can run on-premise or in
the cloud and supports features such as full-text search and geo search
as well as ODBC/JDBC compatibility. However, being an analytical
database it only supports loading the data in batches.

Bottom line - SQL on Hadoop interactive querying with PostgreSQL

# Commercial SQL-on-Hadoop Tools

## Hadapt

![](http://assets.xplenty.com/blog/assets/2014/04/logos/hadapt.png)

[Hadapt](http://hadapt.com/) is a commercial product that brings a
native SQL implementation to Hadoop. Because it combines Hadoop with a
storage layer of a relational database, it allows querying Hadoop via
SQL interactively rather than as a batch process. They can handle
structured and unstructured data without a predefined schema.

Bottom line - interactive SQL querying on Hadoop

## Jethro

![](http://assets.xplenty.com/blog/assets/2014/04/logos/jethro-data.png)

[Jethro](http://jethrodata.com/) claims the title of “fastest SQL on
Hadoop” by providing an SQL engine for Hadoop that automatically indexes
the data as soon as it is written to Hadoop. According to them, it
executes queries 100 times faster than Hive and 10 times faster than
Impala. Jethro can be added to an existing Hadoop cluster and is
supposed to be non-intrusive and it isn’t installed on any of the Hadoop
storage nodes.

Bottom line - fast non-intrusive SQL-on-Hadoop via auto-indexing

## HAWQ

![](http://assets.xplenty.com/blog/assets/2014/04/logos/hawq.png)

[HAWQ](http://www.gopivotal.com/sites/default/files/Hawq_WP_042313_FINAL.pdf)
(HAdoop With Query) is a commercial SQL-on-Hadoop platform by Pivotal, a
subsidiary of EMC. It provides a parallel SQL query engine using
Pivotal’s Greenplum Analytic Database and Hadoop’s HDFS for data
storage. This engine is supposed to be useful for analytics with full
transaction support and [supports](http://www.pivotalguru.com/?p=642)
creating external tables on HDFS that read text, Hive, HBase, and soon
Parquet. Pivotal received some
[criticism](http://hortonworks.com/blog/did-emc-just-say-fork-you-to-hadoop-community/)
about a year ago that this is not a true Hadoop product because they
claim to have over 300 engineers working on Hadoop, yet none of them
contribute to any of the Hadoop related projects. As these lines are
written, that’s still true.

Bottom line - Pivotal’s SQL-on-Hadoop


# References
[1] [Saggi Neumann](/blog/2014/04/11-sql-on-hadoop-tools/), [11 SQL-on-Hadoop Tools](/blog/2014/04/11-sql-on-hadoop-tools/).
---
layout: post
title: War of the Hadoop SQL engines. And the winner is …? 
date: 2014-07-23
categories: [computer science]
tags: [big data, big data]

---


## Article Source

* Title: [War of the Hadoop SQL engines. And the winner is …?](http://sonra.io/war-of-the-hadoop-sql-engines-and-the-winner-is/)
* Authors: [Uli Bethke](http://sonra.io/author/ubet/ "Posts by Uli Bethke")

War of the Hadoop SQL engines. And the winner is …?
===================================================


You may have wondered why we were quiet over the last couple of weeks?
Well, we locked ourselves into the basement and did some research and a
couple of projects and PoCs on Hadoop, Big Data, and distributed
processing frameworks in general. We were also looking at Clickstream
data and Web Analytics solutions. Over the next couple of weeks we will
update our website with our new offerings, products, and services. The
article below summarises some of our research on using SQL on Hadoop.

I believe that one of the pre-requisites for Hadoop to make inroads into
the Enterprise Data Warehouse space is to have the following three items
in place: (1) Subsecond response times for SQL queries (often refered to
as interactive or real time queries). Performance similar to existing
MPP RDBMS such as Teradata. (2) Support for a rich SQL feature set (3)
Support for Update and Delete DML operations. Currently, I don’t see any
of the existing solutions ticking all of these boxes. However, we are
getting closer and closer. The post will shed some light on the current
status of SQL on Hadoop and my own recommendations, which of these
solutions you should bet your house on.

## Hive

Initially developed by Facebook, Hive is the original SQL framework on
Hadoop. The motivation to develop Hive was to provide an abstraction
layer on top of Map Reduce (M/R) to make it easier for analysts and data
scientists to query data on the Hadoop File System. Rather than write
hundreds of lines of Java code to get answers to relatively simple
questions the objective was to offer SQL, the natural choice of the data
analyst. While this approach works well in a batch oriented environment
it does not perform well for interactive workloads in near real time.
The problem with the original M/R framework was that it works in stages
and at each stage the data is set down to disk and then again read from
disk in the next phase. In addition the various stages can not be
parallelized. This is highly inefficent and the rationale for the Apache
Tez project. Similar to M/R, Tez is a Hive execution engine developed by
Hortonworks (also committers from Facebook, Microsoft, and Yahoo).

## Hive on Apache Tez

[Tez](http://hortonworks.com/hadoop/tez/)  is part of the
[Stinger](http://hortonworks.com/labs/stinger/) initiative led by
Hortonworks to make Hive enterprise ready and suitable for realtime SQL
queries. The two main objectives of the initiative were to increase
performance and offer a rich set of SQL features such as analytic
functions, query optimization, and standard data types such as timestamp
etc. Tez is the underlying engine that creates more efficient execution
plans in comparison to Map Reduce. The Tez design is based on [research
done by Microsoft](http://research.microsoft.com/en-us/projects/dryad/)
on parallel and distributed computing. The two main objectives were
delivered as part of the recent Hive 0.13 release. The roadmap for
release 0.14 includes DML functionality such as Updates and Inserts for
lookup tables.

## Hive on Spark

Recently, Cloudera together with MapR, Intel, and Databricks spearheaded
[a new initiative](https://issues.apache.org/jira/browse/HIVE-7292) to
add a third execution engine to the mix. They propose to add Spark as a
third Hive execution engine. Developers then will be able to choose
between Map Reduce, Tez, and Spark as their execution engine for Hive.
Based on the [design
document](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Spark)
the three engines will be fully interchangeable and compatible. Cloudera
see Spark as the next generation distributed processing engine, which
has various advantages over the Map Reduce paradigm, e.g. intermediate
resultsets can be cached in memory. Going forward, Spark will underpin
many of the components in the Cloudera platform. The rationale for Hive
on Spark then is to make Spark available to the vast amount of Hive
users and establish Hive on the Spark framework. It will also allow
users to run faster Hive queries without having to install Tez. Contrary
to Hortonworks, Cloudera don’t see Hive on Spark (or Hive on Tez) to be
suitable as a realtime SQL query engine. Their flagship product for
interactive SQL queries is Impala, while Databricks see Spark SQL as the
tool of choice for realtime queries.

## Cloudera Impala

Impala is a massively parallel SQL query engine. It is based on Google
Dremel and Google Big Query.

Based on their own benchmarks Cloudera conclude that Presto and Hive Tez
are not fit for purpose for interactive query loads. Cloudera see Hive
as a batch processing engine. Of course, Hortonworks see this
differently and they believe that Hive on Tez is also useful for
interactive queries. The jury is out on this one.

You can install and test Impala as part of the Cloudera distribution.
Cloudera have been accused of using Impala as vehicle to lock customers
into their own distribution. However, you can also [download Impala from
GitHub](https://github.com/cloudera/impala).

## Presto 

Facebook was and is a heavy user of Hive. However, for some of their
workloads they required low latency response times in an interactive
fashion. This is behind
the[rationale](https://www.facebook.com/notes/facebook-engineering/presto-interacting-with-petabytes-of-data-at-facebook/10151786197628920)of
Presto.

One of the advantages of Presto is that you can also query non HDFS data
sources such as an RDBMS. It seems to be relatively easy to write your
own connectors.

## Spark SQL and Shark 

[Spark](http://spark.apache.org/)is the new darling on the Big Data
scene and widely seen as the replacement for Map Reduce. Originally
developed by AMPLab at UC Berkeley it is now developed by Databricks and
also runs on Hadoop YARN. There are various components that ship with
Spark. A micro batch near realtime processing module (Spark Streaming),
a machine learning component (MLLIB), a graph database (alpha release),
SparkR (alpha release), and what we are interested for the purpose of
this article Spark SQL.Spark SQL to some extent borrows from Shark its
predecssor, which was based on the Hive codebase but similar to Tez came
with its own execution engine. The big advantage of Spark SQL over the
other engines is that it is easy to [mix machine learning with
SQL](http://databricks.com/blog/2014/03/26/spark-sql-manipulating-structured-data-using-spark-2.html).
BTW, an alternative to this is to use the
[HiveMall](https://github.com/myui/hivemall)machine learning library
(unfortunately, there is very little documentation). This is similar to
in database analytics as offered by vendors such as Oracle and has the
advantage that you don’t have to move around the data between different
tools and technologies. While you can write resultsets back into Hive,
in my opinion Spark SQL is currently not really an option for doing SQL
based ETL/batch as you would have to intermix it with Scala code to
perform more complex transformations, which makes things somewhat ugly.
So the primary use case is to use it as an interactive query tool and
mix it with machine learning. It also does not offer a rich SQL feature
set right now, e.g. analytic functions are missing. Like the other
engines, Spark SQL also has its own optimizer named Catalyst. Based on
[performance
benchmarks](https://databricks-training.s3.amazonaws.com/slides/SparkSQLTraining.Summit.July2014.pdf)by
Databricks, Spark SQL seems to be able to trump its predecessor Shark in
terms of performance (last slide in deck).

## Apache Drill 

Similar to Impala, [Apache Drill](http://incubator.apache.org/drill/) is
another MPP SQL query engine inspired by the Google Dremel paper. Apache
Drill is mainly supported by MapR. At the moment it is in alpha release.
Together with Spark SQL It is at the moment of this writing the least
mature SQL solution on Hadoop. As outlined by MapR Apache Drill will be
available Q2 2014.

Similar to Presto, Apache Drill will also support non Hadoop data
sources.

## InfiniDB

[InfiniDB](http://infinidb.co/)is rather different to any of the other
SQL engines on Hadoop. I want to include it here as it is an interesting
product that we will hear about more in the future. InfiniDB is an open
source MPP columnar RDBMS. As such it falls more into the category of
the likes of Amazon Redshift, Teradata, or Vertica. Unlike its
competitors, it allows for its data to sit on the Hadoop File System
(HDFS). The only and pretty fundamental caveat, however, is that you
would have to load the data into the InfinDB proprietary data format. It
currently does not support popular data serialization formats such as
Parquet or Sequence Files. They may add this feature in a future
release. However, this will negatively impact performance. I will keep
an eye on this product as it as an excellent and open source alternative
to MPPs such as Teradata, Vertica, Netezza etc. However, the data
duplication issue is a problem if you have subscribed to the paradigm of
bringing the processing to the data rather than the other way around. On
the other hand InfiniDB (as you would expect from an MPP RDBMS) supports
Updates and Deletes.

## Others 

There are various other SQL engines on top of Hadoop including
[Cascading Lingual](http://www.cascading.org/projects/lingual/)built as
a SQL abstraction layer on top of Cascading, Hadapt, and various other
commercial products. Another open source solution is [Apache
Tajo](http://tajo.apache.org/).



## Benchmarks 

[This
benchmark](http://blog.cloudera.com/blog/2014/05/new-sql-choices-in-the-apache-hadoop-ecosystem-why-impala-continues-to-lead/)
by Cloudera compares Impala to Shark (disk and memory), Hive Tez (0.13),
and Presto. Unsurprisingly, Cloudera Impala scores best here :-).

[This
benchmark](http://blog.cloudera.com/blog/2014/01/impala-performance-dbms-class-speed/)
by Cloudera compares Impala to Hive (0.12 and not 0.13) and to an
unnamed MPP RDBMS. Surprise surprise, Cloudera Impala scores best here
:-).

[This
benchmark](http://infinidb.co/blog/open-source-sql-hadoop-query-engines-benchmark)
by InfiniDB compares InfinDB to Presto, Impala, Hive on M/R. For all
workloads InfinDB is the performance winner.

[This benchmark](https://amplab.cs.berkeley.edu/benchmark/) by AMPLab at
UC Berkley compares Redshift to Hive on M/R, Hive on Tez, Impala, and
Shark. Performance winner for most workloads is Amazon Redshift

[This
benchmark](http://hortonworks.com/blog/benchmarking-apache-hive-13-enterprise-hadoop/)
by Hortonworks compares performance between Hive M/R (0.10) and Hive Tez
(0.13). Interestingly there is no comparison to other Hadoop SQL
engines. You can draw or own conclusions why this is.

[This
benchmark](http://www.slideshare.net/gruter/tajo-case-studybayareahugmeetupevent20131105)
by Gruter compares Hive M/R to Impala and Apache Tajo.

## Conclusion and Recommendation

As of this writing the most mature product with the richest feature set
is Apache Hive (running on Tez). Crucially it offers analytic functions,
support for the widest set of file formats, and ACID support (full
support in release 0.14)

As of the current release, Impala lacks important SQL features. However,
this is about to change in Impala 2.0.

Once it has matured Hive on Spark should be a very good alternative to
Hive on Tez.

While Hortonworks claims that Hive can be used for interactive queries,
Cloudera questions this. The various benchmarks are not conclusive. As
always you should test yourself if Hive is suitable for realtime queries
for your workload and use case.

All of the different solutions follow a similar approach in that they
all first create a logical query plan in a Directed Acyclic Graph (DAG).
This is then translated into a physical execution plan and the various
components and operators of the explain plan are then executed in a
distributed fashion.

There are various benchmarks out there, which suggest that Impala is the
fastest for various workloads. However, I wouldn’t trust any of these
too much and would suggest for you to perform your own benchmarks for
your specific workload.

Spark SQL looks very promising for use cases where you want to use SQL
to run machine learning algorithms  (similar to in database analytics,
e.g. in Oracle). As an alternative you could look at using HiveMall. It
also looks promising for interactive SQL.

Performance benchmarks suggest that none of the Hadoop SQL execution
frameworks currently match the performance of an MPP RDBMS such as
InfiniDB, Amazon Redshift, or Teradata. One Cloudera benchmark suggests
otherwise. However, this benchmark is criticised for not implementing
the full set of the TPC-DS benchmark and various other items and as a
result is [somewhat
questionable](http://sheffieldview.com/2014/01/17/cloudera-impala-a-closer-look/%20).
This does not come as a surprise really as decades of experience have
gone into these relational engines.

**So what to do**? Right now I would run both batch style queries (ETL)
and interactive queries on Hive Tez as Hive offers the richest SQL
feature set, especially analytic functions and supports a wide set of
file formats. If you don’t get satisfactory query performance for your
realtime queries you may want to look at some of the other engines.
Impala is a mature solution. However, it lacks support for analytic
functions, which are crucially important for data analysis tasks.
Analytic functions will be added to the next release of Impala though.
Another option is Presto, which offers this feature set. At this stage
Spark SQL is only in alpha release and does not yet look very mature
especially in terms of the SQL features. However, it is quite promising
for in database style machine learning and predictive analytics (bring
the processing to the data rather than data to processing). Apache Drill
is also only in alpha release and may not be mature enough for your use
case. If I had to bet my house on which of the solutions will prevail I
would put it on a combination of Hive on Spark (for batch ETL) and Spark
SQL (interactive queries and in database style machine learning and
predictive analytics) to cover all use cases and workloads. If Spark SQL
matures further in terms of the SQL feature set (analytic functions
etc.) and allows for ETL based on the SQL paradigm I would exclusively
put my money on it.
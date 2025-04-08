---
layout: post
title: HIVE as a Service
date: 2014-08-07
categories: [computer science]
tags: [big data, big data]

---


Hive as a Service
=================

### Background 

Hive as a Service introduces a SQL (Structured Query Language) interface
to Big Data without the complexity of Hadoop and cloud computing, or the
cost usually associated with Hadoop. The service is designed for both
data professionals, e.g. data engineers and data scientists, as well as
data consumers like business analysts. The latter are regularly highly
skilled with SQL but not trained to use Big Data architectures like
Hadoop. Hive as a Service reduces the data access, exploration, and
analytics to SQL to access, define and manipulate data without the need
to understand the underlying architecture.

### Hive as a Service vs. Traditional RDBMS

Hive as a Service is different from traditional RDBMS (Relational
Database Management System) because it incorporates transparently –
independent from user know-how – the benefits of Hadoop and cloud
computing, i.e. it auto-scales inexpensively horizontally on demand and
offers a pay as you go billing. Data users can concentrate on working
with the data and not on technology while enjoying the benefits of
combining multiple data sources of any size and a balance between cost
and performance. Businesses do not need to hire scarce talents and
invest in uncertain technologically complex projects anymore to access
Big Data with Hadoop.

### What is Apache Hive 

Apache Hive is a data warehouse system for Hadoop. Hive’s original goal
is to provide a SQL-like interface to data stored in HDFS (Hadoop
Distributed File System).  Hive’s variant of SQL is called HiveQL (Hive
Query Language) and it covers most of the common SQL standards plus some
Hive specific extensions. The benefit of Hive is the ability to easily
ETL (Extract, Transform, and Load) large datasets stored in Hadoop
without the need to write elaborate map-reduce programs. This in turn
means that any SQL savvy user can access, interrogate, and manipulate
the data stored in HDFS.

A common workflow would start, just like with a RDBMS, by defining a
table in Hive with a CREATE TABLE statement similar to SQL. Hive,
furthermore, allows the user to define the location of where the data is
stored in HDFS and how the file format translates into columns in the
table. Hive supports simple comma separated values, JSON (JavaScript
Object Notation), log files, and many more advanced formats including
compressed files.

Hive permits splitting the metadata (the table definition and data
format) and querying from the data management. These table definitions
are called external tables and defined as such by using a CREATE
EXTERNAL TABLE statement. Data can be added and removed on a file system
level by any process, e.g. a process regularly adding log files to a
directory. This makes Hive a great choice to integrate data of any size
from multiple sources.

Hive, at query time, will make a best effort to read the data available
in the table’s location at the time. The usual SELECT and JOIN data
retrieval queries are available. Note that a Hive user can still chose
to leave the data management to Hive, i.e. create a table, insert into
it, or drop it with simple SQL statements as the user may do with
traditional systems.

Hive initially did not support indexing and embraced Hadoop’s parallel
data processing speed. Nowadays indexes are available but not widely
used. Hive data access optimisation usually focuses on compressing data
on disk, partitioning, and data file formats. It supports popular
compression algorithms transparently, i.e. writes, read, compresses and
decompresses data automatically based on settings and file endings.
Another common optimisation, especially for time series data, is the
ability to partition data by a hierarchical directory structure, e.g.
dates are common with schemas like `/data\_directory/year/month/day`.
Hive, given a partitioned table definition, optimises queries to access
only the data in question, e.g. to read only a month or day of data
depending on the query. Further developments have culminated in
specialised file formats like ORC, which is easy to use (merely requires
a `STORED AS ORC` in a create table statement) and combine faster data
access with better compression characteristics.

Today Hadoop and Hive also support Amazon Web Services S3 file system
besides HDFS. It provides a virtually unlimited durable data sink easily
accessible by other systems to store and exchange data. It decoupled the
use of Hive from a permanent Hadoop cluster and made Hive as a Service a
viable and reliable solution.

Hive is an open source project under the Apache 2.0 license, which
combined with its extendable structure, makes it versatile. One aspect
is its ability to be extended easily for file formats with a pluggable
SerDe (Serializer/Deserializer). It comes with support for Avro, ORC,
Regular Expressions, Thrift, and there are open source ones for JSON.
Extending to custom legacy or additional common formats is a simple
task.

Qubole demonstrates the flexibility of Hive by providing a MongoDB
SerDe, which allows users to define tables in Hive relating to
collections in MongoDB making importing and exporting data as simple as
writing SQL. One of Hive’s strength and reasons for success has been its
data agnostic approach. It lends itself to combine data from various
inputs, e.g. RDBMS, NoSQL, and data sinks. Hive subsequently has become
essential in many data pipelines rivalling functionalities of expensive
data warehouse solutions. This popularity has been at the core of the
increase of the custom SQL on Hadoop solutions in the market. However,
none has the same broad user base and maturity Hive has.

Another reason for Hive’s success is its close integration with Hadoop.
It relies on Hadoop, a popular battle proven platform, for processing
queries. A HiveQL statement is translated automatically into a series of
optimised map-reduce jobs executed with Hadoop. Consequently, Hive’s
processing power is directly linked to Hadoop and it can be employed to
process a wide variety of data of any size. This is no coincident. Hive
has been developed at Facebook by the founders of Qubole to process
Petabytes of data. It has been so successful that it is now used by
thousands of users at Facebook most of who have never written a
map-reduce program.

### Why Hive as a Service? 

Until recently, the simplicity of Hive to ETL a variety and large volume
of data came at the expense of running a complex Hadoop cluster. In
large-scale environments the operation of a Hadoop cluster is efficient
and inexpensive to comparable solutions. Yet, for many situations a
permanent cluster is not cost-efficient or the know-how not available;
hiring an experience Hadoop engineer is difficult and technical support
for Hadoop distributions is expensive.

There are a limited number of solutions in the market providing Hadoop
as a Service to address this. Qubole has gone a step further by
providing a fully auto-scaling, on demand, pay as you go Hadoop as a
Service and extended it significantly to add Hive as a Service on top of
it. Effectively a data scientist or engineer can use the same service as
a business user but in different ways.

QDS (Qubole Data Service) supports professional requirements for Hadoop
as a Service with complex data pipelines including a wide range of
data(base) adapters and scheduled workflows. Latter of which can consist
of traditional map-reduce jobs, Pig Latin scripts, or Hadoop streaming.
 Beyond this sophisticated Big Data solution QDS provides an easy to use
graphical web interface to Hive. It reduces data analysis to simple SQL
querying and provides wizards to help integrating data sources as well
as tutorials and webinars to get started.

Many users have an existing toolset like Microsoft Excel or Tableau, and
are a very skilled with it. These users can use Qubole’s ODBC driver to
integrate with Hive. This incredibly easy to use integration makes
Hadoop processing power available to any business user in a company
without the overhead of owning a cluster.

### What Qubole does for you 

Qubole has brought together the founders behind Apache Hive and a team
of excellent Hadoop engineers to provide you with a cloud based on
demand Hadoop cluster. You can start using Hive and Hadoop for 15 days
as soon as you sign up with Qubole without the need for a credit card. A
cluster is started for you as soon as you need it. For example, when you
query data with Hive Qubole will detect the processing power required
and start an appropriate cluster made up of virtual cloud computing
instances for you and pass your query on to it. The progress of the
query and the subsequent result of the query will appear on the web
interface where you entered the query. Once you stop using the cluster
you do not have turn it off. Qubole will detect an idle cluster and shut
it down for you.

In the same fashion Qubole will detect changes in utilisation on a
cluster and grow or shrink it to ensure you do not waste your money. You
will only pay for the time and size of cluster you actually used and you
can define the bounds of the cluster size and desired compute instance
types to avoid any surprises.

Importantly, all of this intelligent starting, stopping, and scaling of
clusters is done transparently in the background without the need of any
action by you. The web interface will retain any history of queries,
table definitions, and logs. You can pick up your work at any time.

You can [try Qubole](http://qubole2.wpengine.com/try)for 15 days for
free including 300GB free storage on Amazon S3.

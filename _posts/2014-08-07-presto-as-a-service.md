---
layout: post
title: Presto as a Service
date: 2014-08-07
categories: [computer science]
tags: [big data, big data]

---


Presto as a Service
===================

![presto as a
service](http://qubole2.wpengine.com/wp-content/uploads/2014/02/Presto-as-a-service-1170-x-300.png)

Presto, developed by Facebook, is a real-time SQL (Structured Query
Language) engine to query a wide range of data store types including
Hadoop. Hadoop as a technology is dominating Big Data projects due to
its popularity, attractive ecosystem of tools, and cost effectiveness.
SQL on Hadoop has been an important development to democratize Big Data
by giving easy data access to business users, analysts, data scientists,
and programmers, to previously locked away large data sets.

Related Blog: [Real-Time Data Query: The Next Competitive
Advantage](http://www.qubole.com/real-time-data-query-next-competitive-advantage/)

Hive and Presto
---------------

The original SQL on Hadoop engine is Apache Hive, which in its earliest
form translated SQL queries to map-reduce programs to read, transform,
and aggregate data stored on Hadoop’s distributed file system or S3
cloud storage. Naturally, this approach is exceptionally scalable,
extensible and fault tolerant since it employs Hadoop’s core data
processing engine. Hive and democratizing data access was a huge success
at Facebook where it was developed by the now founders of Qubole. It
permitted thousands of business users to utilise the full data sets of
Facebook to build the most successful social media website in the world.

Today, [Hive as a
Service](http://qubole2.wpengine.com/hive-as-a-service/) is an important
offering for businesses to trial, test and develop big data projects.
Hive excels in analytics tasks that do not require real-time performance
and is a complementary tool for ETL (Extract, Transform, and Load)
workflows besides [Pig](http://qubole2.wpengine.com/pig-as-a-service/).
Current developments on the Hive project focus on enriching it with more
SQL features and speeding it up to allow simple queries to complete in
interactive fashion. These are being brought to the fore through the
Stringer project lead by Hortonworks.

Facebook, potentially the biggest user of Hive today, found that for a
certain class of workloads, a faster query engine was needed to offer
interactive speeds for data exploration. Many business analytics and
visualisation tools that use SQL interfaces expect responses in seconds
or less. These queries and tools traditionally required data warehouse
solutions costing many millions of dollars. Presto aims to achieve this
level of performance at a fraction of a cost and at a scale beyond
traditional data warehouse deployments.

Presto: Real-time SQL access for heterogeneous data architectures
------

At Facebook, over 1,000 users, run over 30,000 queries a day on hundreds
of Petabytes of data with Presto today ([source](http://prestodb.io/)).
Being battle tested at such a large scale is something that separates
Presto from many other fast SQL-on-Hadoop solutions. Facebook was
convinced that Presto fills an architectural gap in the Hadoop ecosystem
and therefore open sourced it. Consequently, users of Presto are not
locking themselves in with a vendor or have to blindly rely on vendor
promises. Every user can download and try out Presto, or use a Presto as
a Service solution to experience the performance instantly.

An important aspect of Presto is its support of ANSI SQL (American
National Standards Institute Structured Query Language). Presto also
includes useful additions for today’s complex data environment, i.e.
functions for JSON (JavaScript Object Notation) and URL (Uniform
Resource Locator) strings. The ANSI SQL support makes Presto also
compatible with many analytics tools that business users rely on for
reporting and visualisations. These tools regularly presume fast SQL
query engine responses to function correctly.

A distinguishing feature of Presto is its design to support a wide range
of data sources. Presto can access data stored in Hive, i.e. on HDFS
(Hadoop Distributed File System) or Amazon Web Services’ S3, HBase,
relational database management systems, Scribe, or any other data
source. Presto’s pluggable data backend design makes it extendable to
accommodate even legacy or custom data stores.

[![presto
backends](http://qubole2.wpengine.com/wp-content/uploads/2014/02/presto-pluggable-backend.png)](http://qubole2.wpengine.com/wp-content/uploads/2014/02/presto-pluggable-backend.png)

*Presto has a pluggable data backend
([source](https://www.facebook.com/notes/facebook-engineering/presto-interacting-with-petabytes-of-data-at-facebook/10151786197628920))*

Importantly, in the future any number of data sources can be accessed
and their data easily combined with Presto. For example, various SQL,
NoSQL, and data sinks can be accessed from one interface and data from
them can be combined and loaded into any of them (the latter is in
development at the moment). This makes Presto ideal to combine a variety
of data of any volume and solves two important aspects of contemporary
big data challenges.

Qubole is providing the first Presto as a Service in the cloud –
inexpensive and scalable – to everyone. You can sign up for our
[development preview](http://info.qubole.com/presto-alpha-program) and
try it out yourself. Qubole also provides [Hadoop as a
Service](http://qubole2.wpengine.com/hadoop-as-a-service/), Hive as a
Service and Pig as a Service which complement the Presto offering.

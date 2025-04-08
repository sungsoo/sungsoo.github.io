---
layout: post
title: Common Misconceptions about SQL on Hadoop
date: 2015-06-18
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Common misconceptions about SQL on Hadoop](http://www.odbms.org/2015/06/common-misconceptions-about-sql-on-hadoop/)
* Authors: [Roberto Zicari](http://www.odbms.org/author/rzicari/ "Posts by Roberto Zicari") 

---

Common Misconceptions about SQL on Hadoop 
=========================================

> Now that many Hadoop-based Big Data platforms offer SQL support,
> misconceptions about SQL on Hadoop seem to proliferating.   In this
> short article, I’ll explore a few common misconceptions . . . .

> -[Cynthia M. Saracco](http://www.odbms.org/2014/03/cynthia-m-saracco-ibm/), *Senior
Solutions Architect, IBM*

Implementations are largely the same
------------------------------------

SQL is SQL, so it’s basically a software commodity, right? 
Well, not really. If you look beyond the basics – like writing a simple SELECT
statement – you’ll find substantial differences across today’s
SQL-on-Hadoop implementations. These differences span

-   Breadth of language support and ISO SQL compliance
-   Integration with the Hadoop ecosystem, including native storage and
    meta data storage facilities
-   Query optimization, indexing, performance tuning, and monitoring
    capabilities
-   Integration with popular enterprise software, including relational
    DBMSs, business intelligence tools, and others

Sharing data between SQL and other Hadoop applications is unrealistic
----

Actually, some SQL-on-Hadoop implementations are designed to facilitate
sharing data across various applications. In particular, implementations
that store data in the Hadoop Distributed File System (HDFS) in
non-proprietary formats promote access for both SQL and non-SQL
applications. Use of HCatalog for meta data management can also help
certain tools and applications consume the same data readily. When you
consider the high data volumes and various APIs popular in the Hadoop
ecosystem, having one copy of the data easily shared across multiple
applications can be quite important.

For my projects, I often use Big SQL to define external tables over data
that’s already in HDFS. Doing so allows existing applications to
continue to work with the data and makes that same data available to me
for complex queries and analysis. If you’re curious about this approach,
I’ve provided examples in [some materials I’ve posted to
SlideShare](http://www.slideshare.net/CynthiaSaracco/documents). See Lab
4.6 of [Getting Started with Big SQL
4.0](http://www.slideshare.net/CynthiaSaracco/big-sql40-hol) and Lab 4.1
of [Working with HBase and Big
SQL](http://www.slideshare.net/CynthiaSaracco/h-base-introlabv4). I’ve
also begun experimenting with using Spark to access data modeled as Big
SQL tables – an approach that lets me leverage capabilities unique to
Big SQL and capabilities unique Spark over the same data.

SQL can’t work with “raw” data commonly stored in Hadoop
--------------------------------------------------------

Support for data types and data formats varies with each SQL-on-Hadoop
implementation. Although many organizations use Hadoop to store
“traditional” data (including transactional data readily modeled in
tabular structures), semi-structured and unstructured data are also
popular. Approaches to modeling such data with SQL on Hadoop include
using large objects (LOB), converting or shredding a nested data
structure into a “flat” table of traditional column types, or using
[SerDes](https://cwiki.apache.org/confluence/display/Hive/SerDe)
(serializers/deserializers) to process the data. The latter is a Hive
concept that supports SQL access to a greater range of data often found
in Hadoop-based systems. Today, a wide variety of SerDes are available
publicly and organizations can write their own as needed.

SQL’s the best way to get started with Hadoop
---------------------------------------------

SQL can provide an easy, familiar on-ramp to Hadoop for relational DBMS
professionals and certainly provides strong query capabilities over Big
Data stored in Hadoop.  However, it’s only one of several options
available for processing Hadoop data. Certain application requirements –
such an analyzing sentiments expressed in social media posts – can be
better satisfied through other available APIs or tools. Examine your
project’s needs and the skills of your staff closely to determine
whether or not SQL on Hadoop is your best starting point.


---
layout: post
title: 5 Ways to Make Your Hive Queries Run Faster  
date: 2015-04-23
categories: [computer science]
tags: [big data]

---

[![cbo\_1](http://sungsoo.github.com/images/hive-query.png)](http://sungsoo.github.com/images/hive-query.png)

---

# 5 Ways to Make Your Hive Queries Run Faster 


> A data scientist's perspective

As a data scientist working with Hadoop, I often use [Apache
Hive](http://hortonworks.com/hadoop/hive "Apache Hive") to explore data,
make ad-hoc queries or build data pipelines.

Until recently, optimizing Hive queries focused mostly on data layout
techniques such as partitioning and bucketing or using custom file
formats.

In the last couple of years, driven largely by the innovation of the
Hive community around the [Stinger
initiative](http://hortonworks.com/blog/100x-faster-hive/), Hive query
time has improved dramatically, enabling Hive to support both batch and
interactive workloads at speed and at scale.

However, many data scientists remain unfamiliar with basic techniques
and best practices for running their Hive queries at maximum speed. In
this blog post, I will highlight a few simple techniques I use most
often to improve performance of my HIVE queries.

## Technique \#1: Use Tez

Hive can use the [Apache
Tez](http://hortonworks.com/hadoop/tez "Apache Tez") execution engine
instead of the venerable Map-reduce engine. I won’t go into details
about the many benefits of using Tez which are mentioned here; instead,
I want to make a simple recommendation: if it’s not turned on by default
in your environment, use Tez by setting to ‘true’ the following in the
beginning of your Hive query:

```
set hive.execution.engine=tez;
```

With the above setting, every HIVE query you execute will take advantage
of Tez.

## Technique \#2: Use ORCFile

Hive supports ORCfile, a new table storage format that sports fantastic
speed improvements through techniques like [predicate push-down,
compression](http://hortonworks.com/blog/orcfile-in-hdp-2-better-compression-better-performance/)
and more.

Using ORCFile for every HIVE table should really be a no-brainer and
extremely beneficial to get fast response times for your HIVE queries.

As an example, consider two large tables A and B (stored as text files,
with some columns not all specified here), and a simple query like:

```sql
SELECT  A.customerID, A.name, A.age, A.address join 
                B.role, B.department, B.salary 
        ON A.customerID=B.customerID;
```

This query may take a long time to execute since tables A and B are both
stored as TEXT. Converting these tables to ORCFile format will usually
reduce query time significantly:

```sql
CREATE TABLE A_ORC (
    customerID int, name string, age int, address string
) STORED AS ORC tblproperties (“orc.compress" = “SNAPPY”);

INSERT INTO TABLE A_ORC SELECT * FROM A;

CREATE TABLE B_ORC (
    customerID int, role string, salary float, department string
) STORED AS ORC tblproperties (“orc.compress" = “SNAPPY”);

INSERT INTO TABLE B_ORC SELECT * FROM B;

SELECT  A_ORC.customerID, A_ORC.name, 
        A_ORC.age, A_ORC.address join 
                B_ORC.role, B_ORC.department, B_ORC.salary 
        ON A_ORC.customerID=B_ORC.customerID;
```

ORC supports compressed storage (with ZLIB or as shown above with
SNAPPY) but also uncompressed storage.

Converting base tables to ORC is often the responsibility of your ingest
team, and it may take them some time to change the complete ingestion
process due to other priorities. The benefits of ORCFile are so tangible
that I often recommend a do-it-yourself approach as demonstrated above –
convert A into A\_ORC and B into B\_ORC and do the join that way, so
that you benefit from faster queries immediately, with no dependencies
on other teams.

## Technique \#3: Use Vectorization

Vectorized query execution improves performance of operations like
scans, aggregations, filters and joins, by performing them in batches of
1024 rows at once instead of single row each time.

Introduced in Hive 0.13, this feature significantly improves query
execution time, and is easily enabled with two parameters settings:

```
set hive.vectorized.execution.enabled = true;
set hive.vectorized.execution.reduce.enabled = true;
```

## Technique \#4: cost based query optimization

Hive optimizes each query’s logical and physical execution plan before
submitting for final execution. These optimizations are not based on the
cost of the query – that is, until now.

A recent addition to Hive, [Cost-based
optimization](http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.2.0/Cost_based_SQL_Optimization_v22/index.html#Item1.1 "CBO"),
performs further optimizations based on query cost, resulting in
potentially different decisions: how to order joins, which type of join
to perform, degree of parallelism and others.

To use cost-based optimization (also known as CBO), set the following
parameters at the beginning of your query:

```
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;
```

Then, prepare the data for CBO by running Hive’s “analyze” command to
collect various statistics on the tables for which we want to use CBO.

For example, in a table tweets we want to collect statistics about the
table and about 2 columns: “sender” and “topic”:

```
analyze table tweets compute statistics;
analyze table tweets compute statistics for columns sender, topic;
```

With HIVE 0.14 (on HDP 2.2) the analyze command works much faster, and
you don’t need to specify each column, so you can just issue:

```
analyze table tweets compute statistics for columns;
```

That’s it. Now executing a query using this table should result in a
different execution plan that is faster because of the cost calculation
and different execution plan created by Hive.

## Technique \#5: Write good SQL

SQL is a powerful declarative language. Like other declarative
languages, there is more than one way to write a SQL statement. Although
each statement’s functionality is the same, it may have strikingly
different performance characteristics.

Let’s look at an example. Consider a click-stream event table:

```sql
CREATE TABLE clicks (
        timestamp date, sessionID string, url string, source_ip string
) STORED as ORC tblproperties (“orc.compress” = “SNAPPY”);
```

Each record represents a click event, and we would like to find the
latest URL for each sessionID.

One might consider the following approach:

```sql
SELECT clicks.* FROM clicks inner join 
    (select sessionID, max(timestamp) as max_ts from clicks 
     group by sessionID) latest
ON  clicks.sessionID = latest.sessionID and 
        clicks.timestamp = latest.max_ts;
```

In the above query, we build a sub-query to collect the timestamp of the
latest event in each session, and then use an inner join to filter out
the rest.

While the query is a reasonable solution—from a functional point of
view—it turns out there’s a better way to re-write this query as
follows:

```sql
SELECT * FROM
    (SELECT *, RANK() over (partition by sessionID, 
     order by timestamp desc) as rank        
FROM clicks) ranked_clicks
WHERE ranked_clicks.rank=1;
```

Here we use Hive’s OLAP functionality (OVER and RANK) to achieve the
same thing, but without a Join.

Clearly, removing an unnecessary join will almost always result in
better performance, and when using big data this is more important than
ever. I find many cases where queries are not optimal — so look
carefully at every query and consider if a rewrite can make it better
and faster.

## Summary

Apache Hive is a powerful tool in the hands of data analysts and data
scientists, and supports a variety of batch and interactive workloads.

In this blog post, I’ve discussed some useful techniques—the ones I use
most often and find most useful for my day-to-day work as a data
scientist—to make Hive queries run faster.

Thankfully, the Hive community is not finished yet. Even between HIVE
0.13 and HIVE 0.14, there are dramatic improvements in ORCFiles,
vectorization and CBO and how they positively impact query performance.

I’m really excited about
[Stinger.next](http://hortonworks.com/blog/stinger-next-enterprise-sql-hadoop-scale-apache-hive/),
bringing performance improvements to the [sub-second
range](http://hortonworks.com/blog/stinger-next-enterprise-sql-hadoop-scale-apache-hive/).

I can’t wait.
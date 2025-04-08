---
layout: post
title: NewSQL Vs. SQL on Hadoop
date: 2014-04-22
categories: [computer science]
tags: [big data]

---

# Article Source
* Title: [NewSQL Vs. SQL on Hadoop](http://blog.clustrix.com/2014/02/03/newsql-vs-sql-hadoop/#.U1RQnl4mwWk)
* Authors: [Raj Bains](http://blog.clustrix.com/author/raj/ "View all posts by Raj Bains")

# NewSQL Vs. SQL on Hadoop

NoSQL, NewSQL, SQL on Hadoop – SQL seems to be everywhere these days.
The data management landscape is complex and moving very fast. Since
real-time analytics is used by both the NewSQL and SQL on Hadoop
communities, let’s dig in and see the differences.

## SQL Is in Vogue

[![images-1](http://blog.clustrix.com/wp-content/uploads/sites/2/2014/02/images-1-150x150.jpeg)](http://blog.clustrix.com/wp-content/uploads/sites/2/2014/02/images-1.jpeg)

SQL is back in vogue – as customers use proprietary NoSQL interfaces and
begin to understand the tradeoffs in production environments, they’re
coming to appreciate the ease of SQL, and the ACID guarantees that come
with it. In operational databases, data warehousing and everything in
between, vendors are now implementing SQL. CQL for Cassandra, SQL on
Hadoop and the recent SumAll move to use a SQL layer on top of MongoDB
to get better analytics are all part of this shift in the industry.
Let’s explore some of the latest offerings…

## SQL on Hadoop: Interactive Data Warehousing

Enterprises want to run their analyses on petabytes of data, but they
want the simplicity of SQL too. Hadoop is powerful, but too slow for
many tasks – customers are used to fast queries and interactive usage by
the data scientist rather than “start the batch job and go get lunch”
model of Hadoop. Here, real-time analytics refers to the fact that the
query comes back in a few seconds – keeping the user engaged, but the
data the query is running on might be a day old.

Cloudera Impala, Apache Drill (MapR), Presto (Facebook), Stinger
initiative and Tez (Hortonworks) are all aimed at running SQL queries
faster than Hive, many with similarities to Dremel. Shark from UC
Berkeley adds in-memory processing. Pivotal HAWQ is a port of the
Hortonworks MPP engine to HDFS. With columnar storage (e.g. Parquet) and
fast SQL processing, these products are aimed at closing the gap with
data warehouses. Cloudera recently wrote a blog to emphasize this,
titled, [“Impala Performance Update: Now Reaching DBMS-Class
Speed”](http://blog.cloudera.com/blog/2014/01/impala-performance-dbms-class-speed/).

There has been talk to bringing SQL transactions to Hadoop, but these
solutions are years away and it’s not clear whether they’ll have any
advantage over the existing solutions.

## NewSQL: Analytics on Fast Moving Transactions

[![images](http://blog.clustrix.com/wp-content/uploads/sites/2/2014/02/images-150x150.jpeg)](http://blog.clustrix.com/wp-content/uploads/sites/2/2014/02/images.jpeg)

However, there are more pieces to the puzzle. Some of the newest data lives in
the data warehouse – e.g. logs can be pushed directly in Hadoop.
However, a lot of valuable data lives in the transactional database.
This is the database that companies in e-commerce, travel and various
other sectors run their primary businesses on. Here, ACID guarantees
rule and many workloads might be update-heavy. This includes data about
customers, orders in e-commerce, or metadata about files in a cloud
storage service and is where NewSQL comes into the picture.

NewSQL databases – ClustrixDB, Google F1, VoltDB and MemSQL all allow
you to have fast and scalable transactions – and we’re in the
millisecond range here. They are all distributed and allow you to
scale-out in the cloud by adding more servers. Google runs AdWords on
F1, its proprietary NewSQL database that is not available outside the
company. ClustrixDB has focused on real-time analytics with
multi-version concurrency control and massively parallel processing –
the core technology allowing real-time analytics on the transactional
database at the same time.

MemSQL and VoltDB are also beefing up their analytics capabilities;
however, they are very limited, and it will take years for them to catch
up. For example, MemSQL requires you to build your schema taking into
account the join queries you later want to run, and joining two
distributed tables does not quite work. VoltDB started by rejecting MVCC
with a view that only transactions will happen on it and all analytics
will be moved to a warehouse. Now they are adding analytics
functionality, but performance is still a question.

These systems have the latest, most valuable and fastest moving data.
Running analytics on this data can give users insights in real-time and
on data that has not made it into the Hadoop warehouse yet. E-Commerce
companies want to try offering different deals, analyze the results and
provide the ones that get the most uptakes – right in the middle of a
traffic spike on Cyber Monday. There is no running of batch jobs here –
this is the holy grail of data processing.

## So What to Choose…

[![images-2](http://blog.clustrix.com/wp-content/uploads/sites/2/2014/02/images-2-150x150.jpeg)](http://blog.clustrix.com/wp-content/uploads/sites/2/2014/02/images-2.jpeg)

These
technologies are quite complementary.****SQL on Hadoop technologies are
maturing fast. It usually takes about 5 years to get a SQL-based
database up to acceptable maturity. They are certainly good for data
warehousing on Hadoop, making it faster and providing higher developer
productivity. ClustrixDB on the other hand has been in production now
for 5 years with customers running more than a trillion transactions
with over five 9s of availability.

However, in this noise, companies need to ensure they are getting
insights from their most valuable data in real-time to get a competitive
edge. For this, a NewSQL database is the right tool.

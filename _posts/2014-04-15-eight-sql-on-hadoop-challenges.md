---
layout: post
title: Eight SQL on Hadoop Challenges
date: 2014-04-15
categories: [computer science]
tags: [big data]

---

# Article Source
* Title: [Eight SQL on Hadoop Challenges](http://www.xplenty.com/blog/2014/04/eight-sql-on-hadoop-challenges/)
* Authors: [Yaniv Mor](http://www.xplenty.com/blog/2014/04/eight-sql-on-hadoop-challenges/)

# Introduction

Introducing Apache Hadoop to an organization can be difficult - everyone is trained and experienced in the old ways of SQL and all the analytics tools integrate with it as well. But there comes a point when the data becomes just too big for a MySQL server and the only way to proceed is to step up to the world of Big Data.

Variety is one of the key elements of Big Data, that is, the ability to store both structured and unstructured data without a predefined schema. SQL based technologies can only handle structured data with a predefined schema. There are solutions for storing semi-structured data such as JSON, XML, or BLOB to SQL via additional engines that are usually prepackaged with the database. However this limits the kind of data that can be collected and adds maintenance to keep the schema up to date, something that’s completely unnecessary with Big Data which supports Agile methodologies and unpredictable schemas.


# SQL-on-Hadoop Tools

Certain tools can help make the transition to Hadoop easier by providing support for SQL on Hadoop. [Apache Hive](https://hive.apache.org/) is one of them. Hive supports HQL, an SQL like language that is translated to MapReduce on Hadoop. Although it can help to run jobs without learning any new code and integrate with existing SQL based tools, these MapReduce jobs run as batch processing, meaning it could take much more than the expected seconds or minutes to return results. SQL users, who are used to interactive queries that take anywhere from seconds to minutes to return results, may not be satisfied with this behavior.

There are additional SQL-on-Hadoop technologies such as [Hadapt](https://hadapt.com/), [Impala](http://www.cloudera.com/content/cloudera/en/products-and-services/cdh/impala.html), [Presto](http://prestodb.io/), and [Jethro](http://jethrodata.com/), many of which support interactive querying on Hadoop. These tools can help, but they still run on top of Hadoop’s filesystem HDFS which works quite differently from SQL’s relational tables. HDFS stores files which it cuts into blocks of data that are spread over a cluster of machines. It keeps duplicate copies of the data and maintains integrity automatically. This means there are several challenges when using these technologies.

# SQL-on-Hadoop Challenges

## 1. File Formats

While Hadoop supports storing all file formats, SQL-on-Hadoop technologies require data to be in rigid formats in order to process it. Therefore, they might not support storing and querying all of an organization’s data, which can arrive in various formats or in no format at all. Jethro and other tools require using their own file structure. Impala is fully compatible with text files and Parquet, a columnar storage format for Hadoop, while providing partial support for other formats. Presto is supposed to work with Hadoop file formats such as text, RCFile, and SquenceFile. Hive supports implementing a custom serializer/deserializer function that can read/write any file format, but this requires extra programming.

## 2. Server Maintenance

Some SQL-on-Hadoop technologies such as CitusDB, Hadapt, and BigSQL require PostgreSQL to be installed on each node in the cluster. This could be cumbersome to deploy and maintain, especially when dealing with large clusters.

## 3. Schema Maintenance

One of Hadoop’s advantages is the lack of schema. However, making SQL available on Hadoop requires defining and managing a schema, something which may present a problem when new data comes in that does not fit the schema. Hadapt, one of the SQL-on-Hadoop solutions, claims it does not require schema definition for self descriptive JSON or XML formats, but this ability is already available with standard SQL databases.

## 4. ACID

SQL databases support [ACID](http://en.wikipedia.org/wiki/ACID) (Atomicity, Consistency, Isolation, Durability) to guarantee reliable database transactions. Hadoop does not support it, so it is up to the relevant technology to provide it, if it does provide it at all. Hive plans to [support ACID](http://hortonworks.com/blog/adding-acid-to-apache-hive/) in the future.

## 5. OLTP

Since Hadoop is based on sequential reads and does not support updates, it is a lot more useful for On-line Analytical Processing (OLAP) by definition. Therefore, Hive, which is based on MapReduce, does not support On-line Transaction Processing (OLTP) since MapReduce does not do single row operations (future support is planned as part of ACID). Although other tools are not based on MapReduce, they still target analytical queries. HBase does provide transactional functionality, although it isn’t ACID compliant yet.

## 6. SQL Functionality

SQL supports more features than just queries such as views, stored procedures, and user defined functions. Most SQL-on-Hadoop tools do not support them and require writing extra code instead - e.g. Java for Hive and C++ for Impala.

## 7. Update Statements

Unlike SQL, HDFS does not support update statements. SQL-on-Hadoop tools may implement it, but it isn’t clear exactly how since it requires random read/write access to all the data on Hadoop, a feature that Hadoop does not provide. Maybe they implement it like HBase which uses in-memory indexes and compacts files once in a while to remove older versions.

## 8. Joins & Dimensions

HDFS automatically manages how to spread blocks of data over the cluster, and this process cannot be controlled manually. In certain cases this could be counter-productive. Saving several pieces of data together on the same node or maybe on all of the cluster nodes could be necessary to help execute joins and dimensions more efficiently, data such as product names, categories, or clients. Otherwise it could take much more time to bring all the relevant data together from across the network.

Summary
Hadoop works quite differently from SQL and requires learning new concepts and technologies. SQL-on-Hadoop tools can help bridge this knowledge gap. The best strategy though is to use each technology for its strength rather than to bend it into something else - SQL for transactional queries and Hadoop for batch processing.


# References
[1] Yaniv Mor, [Eight SQL on Hadoop Challenges](http://www.xplenty.com/blog/2014/04/eight-sql-on-hadoop-challenges/).
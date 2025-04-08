---
layout: post
title: Apache Tajo Table Partitioning
date: 2014-05-12
categories: [computer science]
tags: [big data, yarn]

---

## Article Source
* Title: [Apache Tajo™ 0.8.0 Documentation](http://tajo.apache.org/docs/0.8.0/table_partitioning.html)

[![](http://sungsoo.github.com/images/tajo-documentation.png)](http://sungsoo.github.com/images/tajo-documentation.png)

# Introduction to Partitioning

Table partitioning provides two benefits: easy table management and data pruning by partition keys. Currently, Apache Tajo only provides Apache Hive-compatible column partitioning.

## Partitioning Methods

Tajo provides the following partitioning methods:

* Column Partitioning
* Range Partitioning (TODO)
* Hash Partitioning (TODO)

## Column Partitioning
The column table partition is designed to support the partition of Apache Hive™.

How to Create a Column Partitioned Table
You can create a partitioned table by using the `PARTITION BY` clause. For a column partitioned table, you should use the `PARTITION BY COLUMN` clause with partition keys.

For example, assume there is a table orders composed of the following schema.

```
id          INT,
item_name   TEXT,
price       FLOAT
```

Also, assume that you want to use `order_date TEXT` and `ship_date TEXT` as the partition keys. Then, you should create a table as follows:

```sql
CREATE TABLE orders (
  id INT,
  item_name TEXT,
  price
) PARTITION BY COLUMN (order_date TEXT, ship_date TEXT);
```

## Partition Pruning on Column Partitioned Tables
The following predicates in the `WHERE` clause can be used to prune unqualified column partitions without processing during query planning phase.

* =
* <>
* >
* <
* >=
* <=
* LIKE predicates with a leading wild-card character
* IN list predicates

## Compatibility Issues with Apache Hive™

If partitioned tables of Hive are created as external tables in Tajo, Tajo can process the Hive partitioned tables directly. There haven’t known compatibility issues yet. 
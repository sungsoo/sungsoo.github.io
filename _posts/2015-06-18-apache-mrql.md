---
layout: post
title: Apache MRQL
date: 2015-06-18
categories: [computer science]
tags: [big data]

---



# Apache MRQL

*MRQL* is a *query processing* and *optimization system* for large-scale,
distributed data analysis, built on top of Apache Hadoop, Hama, Spark,
and Flink.

MRQL (pronounced miracle) is a query processing and optimization system
for large-scale, distributed data analysis. MRQL (the MapReduce Query
Language) is an SQL-like query language for large-scale data analysis on
a cluster of computers. The MRQL query processing system can evaluate
MRQL queries in four modes:

1.  in Map-Reduce mode using Apache Hadoop,
2.  in BSP mode (Bulk Synchronous Parallel mode) using Apache Hama,
3.  in Spark mode using Apache Spark, and
4.  in Flink mode using Apache Flink.

The MRQL query language is powerful enough to express most common data
analysis tasks over many forms of raw in-situ data, such as XML and JSON
documents, binary files, and CSV documents. MRQL is more powerful than
other current high-level MapReduce languages, such as Hive and PigLatin,
since it can operate on more complex data and supports more powerful
query constructs, thus eliminating the need for using explicit MapReduce
code. With MRQL, users are able to express complex data analysis tasks,
such as PageRank, k-means clustering, matrix factorization, etc, using
SQL-like queries exclusively, while the MRQL query processing system is
able to compile these queries to efficient Java code.




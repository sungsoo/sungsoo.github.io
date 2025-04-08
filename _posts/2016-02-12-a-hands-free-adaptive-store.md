---
layout: post
title: A Hands-free Adaptive Store 
date: 2016-02-12
categories: [computer science]
tags: [data management]

---

# A Hands-free Adaptive Store

## Abstract

Modern state-of-the-art database systems are designed around a single data storage layout. This is a fixed decision that drives the whole architectural design of a database system, i.e., row-stores, column-stores. However, none of those choices is a universally good solution; different workloads require different storage layouts and data access methods in order to achieve good performance.

In this paper, we present the H2O system which introduces two novel concepts. First, it is flexible to support *multiple storage layouts* and *data access patterns* in a single engine. Second, and most importantly, it decides *on-the-fly*, i.e., during query processing, which design is best for classes of queries and the respective data parts. At any given point in time, parts of the data might be materialized in various patterns purely depending on the *query workload*; as the workload changes and with every single query, the storage and access patterns continuously adapt. In this way, H2O makes no a priori and fixed decisions on how data should be stored, allowing each single query to enjoy a storage and access pattern which is tailored to its specific properties.

We present a detailed analysis of H2O using both synthetic benchmarks and realistic scientific workloads. We demonstrate that while existing systems cannot achieve maximum performance across all workloads, H2O can always match the best case performance without requiring any tuning or workload knowledge.


* [*H2O: A Hands-free Adaptive Store*](http://sungsoo.github.com/papers/h2o.pdf), SIGMOD 2014. 
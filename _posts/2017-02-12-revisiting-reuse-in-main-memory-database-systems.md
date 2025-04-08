---
layout: post
title: Revisiting Reuse in Main Memory Database Systems
date: 2017-02-12
categories: [computer science]
tags: [data management]

---


Revisiting Reuse in Main Memory Database Systems
===

* Authors: Kayhan Dursun, Carsten Binnig, Ugur Cetintemel, and Tim Kraska
* Affiliation: Brown University
* Published: SIGMOD 2017
* [Revisiting Reuse in Main Memory Database Systems](http://15721.courses.cs.cmu.edu/spring2017/papers/23-scansharing/1608.05678v1.pdf)

## Abstract

Reusing intermediates in databases to *speed-up analytical query processing* has been studied in the past. Existing solutions typically require intermediate results of individual operators to be materialized into temporary tables to be considered for reuse in subsequent queries. However, these approaches are fundamentally ill-suited for use in modern main memory databases. The reason is that modern main memory DBMSs are typically limited by the *bandwidth* of the memory bus, thus query execution is heavily optimized to keep tuples in the CPU caches and registers. To that end, adding additional materialization operations into a query plan not only add additional traffic to the memory bus but more importantly prevent the important *cache-* and *register-locality* opportunities resulting in high performance penalties.

In this paper we study a *novel reuse model for intermediates*, which caches internal physical data structures materialized during query processing (due to pipeline breakers) and externalizes them so that they become reusable for upcoming operations. We focus on hash tables, the most commonly used internal data structure in main memory databases to perform join and aggregation operations. As queries arrive, our *reuse-aware optimizer* reasons about the reuse opportunities for hash tables, employing cost models that take into account hash table statistics together with the CPU and data movement costs within the cache hierarchy. Experimental results, based on our HashStash prototype demonstrate performance gains of 2× for typical analytical workloads with no additional overhead for materializing intermediates.

![](http://sungsoo.github.com/images/hashstash.png)
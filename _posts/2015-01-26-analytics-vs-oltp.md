---
layout: post
title: Analytics vs. OLTP
date: 2015-01-26
categories: [computer science]
tags: [big data]

---


## Analytics vs. OLTP

*Transactional processing* is characterized by a large number of short, discrete, atomic transactions. The emphasis of OLTP systems is (a) *high throughput* (transactions per second), and (b) maintaining *data integrity* in multi-user environments. OLTP systems are architected accordingly. OLTP databases are usually highly normalized, with many tables. Other characteristic architectural features include strongly codified and restricted code paths, infrastructure (indexes, partitioning, clustering, caches, etc.) to optimize predictable usage patterns and ensure integrity, and so on.


*Analytics processing* is characterized by fewer users submitting fewer requests, but queries can be *very complex* and *resource-intensive*. Response time is a key measure (not transactions per second), and analytics systems are architected accordingly. For example, databases tend to be denormalized, with fewer tables, in a star or snowflake schema; *massive parallelism* is employed to favor fast scanning and ingestion over fast selection; and data movement is minimized by in-database processing.


Conventional database systems exhibit dramatically variable performance when asked to process analytic workloads; this variability is exacerbated when the same system handles transactional workloads as well. On these systems, indexes, caches, partitioning, and clustering are all access optimizations designed to accelerate a particular data traversal pattern. Unfortunately, retrieval optimizations that benefit one access path are likely to penalize alternative paths. It is essential to be aware of this, and to tune the system repeatedly when attempting to deploy analytics on conventional or multi-use systems. This problem of unpredictable performance frequently plagues database professionals’ early forays into the analytic realm.

## Transactional/OLTP Environments


Transactional processing systems are typically characterized by small, simple, precise operations, and these systems exhibit the following characteristics:


* Optimization for short, atomic, repetitive, select-oriented operations and transactions—finding or updating very specific bits of data. Note that these access patterns lend themselves very much to tuning, hence the proliferation of indexes, caches, and tuning parameters in a typical
OLTP environment.

* Prescribed, codified, discrete code paths.

* Heavy reliance on *caching*.

* *Shared resources*: shared data structures; shared memory; and the indexes, locks, latches, triggers, and other infrastructure required to manage concurrency and referential integrity.

* Data partitioning, data clustering, colocation, indexes, caches, and other tuning and configuration options that can be used to tune a system for the expected access patterns and data traversal paths.


In summary, the OLTP environment includes substantial infrastructure to support getting to one piece of data or one record very quickly, by any subset of a potentially large user population. Note also that the data partitions, indexes, caching, and tuning regimens result in a de facto “*grain*”—a set of optimized traversal paths—in the data. This is desirable in an OLTP system, where you know in advance (or come to know after a short time) exactly how you will need to traverse the data. However, these structural elements—indexes, shared memory, locks, caches, etc.—all impose performance and complexity penalties in an analytics environment, where unpredictable (“against the grain”) access paths and patterns are the rule.


---
layout: post
title: Aggregate Cache
date: 2016-01-14
categories: [computer science]
tags: [data management, htap]

---


# Aggregate Cache

The *aggregate cache* leverages the concept of the *main-delta architecture* in SAP HANA. Separating a table into a main and delta storage has one main benefit: it allows to have a *read-optimized main storage* for faster scans and a *write-optimized delta storage* for high insert throughput. All records in the delta storage are periodically propagated into the main storage in an operation called *delta-merge*. The fact that new records are added to the main storage only during a merge operation is leveraged by the aggregate cache which is designed to cache only the results computed on the main storage. For a current query using the aggregate cache, the records from the delta storage are aggregated on-the-fly which compensates the corresponding cache entry to build the result set of the query, a process we refer to as delta compensation. 

![](http://sungsoo.github.com/images/aggregate-cache.png)

In the general main-delta architecture, *records are not updated in place*. 
Instead, the updated record is inserted in the delta partition whereas the old record in the main (or delta) partition is *invalidated*. 
Other database implementations with a *delta storage* or *differential buffers* such as C-Store, Sybase IQ, MonetDB/X100, Hyrise, or memoryoptimized tables in SQL Server handle updates very similarly to the mechanism implemented in SAP HANA. During the next merge, all invalidated records can either be removed from the main storage or kept so that temporal query processing on historical data can be supported. To handle invalidations in the main partition, we apply a *main compensation* process as described in Section 2.2.
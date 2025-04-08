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

## Architecture

As illustrated in Fig. 1, the aggregate cache is implemented inside the column store engine of SAP HANA. The *aggregate cache manager* is the core component of the aggregate cache, managing aggregate cache entries.

![](http://sungsoo.github.com/images/structure-aggregate-cache.png)

An aggregate cache entry, depicted in Fig. 2, consists of a key, a value, visibility vectors, and profit metrics. The *aggregate cache key* is a unique identifier based on the query definition including the table name, table id, the grouping attributes, the aggregate functions, and the filter predicates of the related aggregate query. The *aggregate cache value*, the extent of the aggregate query, is a structure consisting of the grouping combinations and the corresponding aggregate functions: it contains the result set of the aggregate computed only on the main storage. The aggregate cache entry further contains dirty counters that indicates if records have been invalidated in the main partitions, and the visibility vectors of the main partitions at the time of last computation. The aggregate cache entry is first created during query processing (Fig. 3) and it is maintained during the deltamerge operations. *Aggregate cache metrics* are maintained for each entry including the aggregate’s size, the number of aggregated records, execution times for delta and main compensations, maintenance times, and usage information. The metrics are required to calculate the profit of an aggregate cache entry to be used for dynamic cache admission, eviction, and maintenance decisions.

![](http://sungsoo.github.com/images/qp-ac.png)

Query execution using the aggregate cache is shown in Fig. 3: the query executor delegates aggregate query blocks that qualify for the aggregate cache to the *aggregate cache manager*. The aggregate cache supports queries with *self-maintainable* aggregate functions including SUM, COUNT, and AVG. When the aggregate cache matching process is not successful, the aggregate cache manager attempts to create a cache entry by executing the aggregate query on the main partitions with the global record visibility which is retrieved through the *consistent view manager*. If the aggregate is profitable enough for cache admission, the result is used to create an aggregate cache entry. In both cases, when aggregate entry is retrieved from the cache or it is just cached by the current transaction, the *main compensation* and the *delta compensation* must be applied.
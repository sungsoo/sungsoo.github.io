---
layout: post
title: A Better B-Tree in Hekaton
date: 2016-02-27
categories: [computer science]
tags: [big data]

---

# A Better B-Tree in Hekaton

Microsoft Research has been releasing details of how **Hekaton**, the *in-memory database* that will ship with the next version of SQL Server, is achieving up to **100x performance** increases.

Hekaton was first revealed at PASS 2012 in November, where Ted Kummert, Corporate Vice President of Microsoft’s Business Platform Division, described it as “a fully in-memory transactional engine delivered as a part of SQL Server.” For a fuller description, check out [our report](http://www.i-programmer.info/news/84-database/5076-hekaton-adds-in-memory-transaction-support-to-sql.html). Now we can begin understand the mechanisms that give Hekaton its advantages.

According to Paul Larson, who is part of the Hekaton team:
> “In traditional models, the assumption is that data lives on disk and is stored on disk pages. This creates a lot of overhead when you try to access records. When data lives totally in memory, we can use much, much simpler data structures. Hekaton’s index data structures and storage structures are optimized on the basis that when a table is declared memory-optimized, all of its records live in memory.”

Part of the improvement in Hekaton comes from the move away from a traditional partitioned approach that essentially treats a multicore processor as a distributed system, to a latch-free, also called lock-free, design. Latches are used to synchronize transactions to avoid data corruption when multiple users try to modify the same data. This has the side effect of creating bottlenecks for high-performance software systems running on multicore processors. Latch-free techniques instead update in an “optimistic” way, never locking records or data structures. This is much more efficient in avoiding bottlenecks, but does risk data corruption.

The approach used by the Hekaton team is to use *multi-version concurrency control* (MVCC). When updates are made, the old data is marked as obsolete, and a newer version is added. At any time, there could be multiple versions of the data, but only one is the latest. The big benefit is that update transactions can add new versions without interfering with concurrent read activity. The way this is handled in Hekaton is described in [*High-Performance Concurrency Control Mechanisms for Main-Memory Databases*](http://vldb.org/pvldb/vol5/p298_per-akelarson_vldb2012.pdf), a paper that was presented in August to the International Conference on Very Large Databases.
Alongside the change in *transaction locking*, Hekaton also has a new indexing system that is designed to be faster than the traditional B-tree index. The new **Bw-tree** has improved *processor-cache performance*. The Bw-tree is based on the idea that a table mapping page identifiers to page locations would enable both *latch-free* page updating and *log-structured* page storage on flash memory.

The problem the bw-tree addresses is two-fold. By using multi-core CPUs, you can achieve *high concurrency*, but this brings the problem of blocking as one process attempts to change data locked by another process. In addition, achieving a good *multi-core processor performance* depends on high CPU cache hit ratios, but updating memory in place results in cache invalidations.

The Bw-tree is latch-free, which means that a thread is not affected by conflicts. It overcomes the problem of cache misses by avoiding updating pages in place.

In addition, the Bw-tree is organized around a mapping table that virtualizes both the location and the size of pages. Bw-tree nodes are updated by adding update deltas as prefixes to the prior page state. The new node state is stored at a new storage location, so atomic compare and swap instructions can be used to update the state. This means the Bw-tree is *latch-free* in the classic sense of *allowing concurrent access* to pages by multiple threads.

In tests, the Bw-tree was faster by several factors than an alternative latch-free technology based on *skiplists*. The Bw-tree also performed significantly better than the *BerkeleyDB latch-based B-tree implementation*. When tested in a high contention scenario that usually causes severe performance degradation, where all the threads continually attempt to update the last page of a B-tree index, the Bw-tree performed better by a **factor of 24** over another, well-engineered latch-based implementation.

## More Information
* [*High-Performance Concurrency Control Mechanisms for Main-Memory Databases*](http://vldb.org/pvldb/vol5/p298_per-akelarson_vldb2012.pdf)
* [*Bw-tree: A B-tree for New Hardware Platforms*](http://research.microsoft.com/pubs/178758/bw-tree-icde2013-cr.pdf)
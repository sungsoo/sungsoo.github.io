---
layout: post
title: Why Impala Continues to Lead?
date: 2014-06-02
categories: [computer science]
tags: [data management, big data]

---

## Article Source
* Title: [New SQL Choices in the Apache Hadoop Ecosystem: Why Impala Continues to Lead](http://blog.cloudera.com/blog/2014/05/new-sql-choices-in-the-apache-hadoop-ecosystem-why-impala-continues-to-lead/)
* Authors: Justin Erickson, Marcel Kornacker, and Dileep Kumar

[![](http://sungsoo.github.com/images/new-sql-choices.png)](http://sungsoo.github.com/images/new-sql-choices.png)

---

# New SQL Choices in the Apache Hadoop Ecosystem: Why Impala Continues to Lead? 

**Impala continues to demonstrate performance leadership compared to
alternatives (by 950% or more), while providing greater query throughput
and with a far smaller CPU footprint.**

In our [previous
post](http://blog.cloudera.com/blog/2014/01/impala-performance-dbms-class-speed/)
from January 2014, we reported that Impala had achieved query
performance over Apache Hadoop equivalent to that of an analytic DBMS
over its own proprietary storage system. We believed this was an
important milestone because Impala’s objective has been to support a
high-quality BI experience on Hadoop data, not to produce a “faster
Apache Hive.” An enterprise-quality BI experience requires low latency
and high concurrency (among other things), so surpassing a well-known
proprietary MPP DBMS in these areas was important evidence of progress.

  
 In the past nine months, we’ve also all seen additional public
validation that the original technical design for Hive, while effective
for batch processing, was a dead-end for BI workloads. Recent examples
have included the launch of Facebook’s Presto engine (Facebook was the
inventor and world’s largest user of Hive), the emergence of Shark (Hive
running on the Apache Spark DAG), and the “Stinger” initiative (Hive
running on the Apache Tez [incubating] DAG).
  
 Given the introduction of a number of new *SQL-on-Hadoop implementations*
it seemed like a good time to do a roundup of the latest versions of
each engine to see how they differ. We find that Impala maintains a
significant performance advantage over the various other open source
alternatives — ranging from 5x to 23x depending on the *workload* and the
*implementations* that are compared. This advantage is due to some
inherent design differences among the various systems, which we’ll
explain below. Impala’s advantage is strongest for multi-user workloads,
which arguably is the most relevant measure for users evaluating their
options for BI use cases.

# Configuration


## Cluster

All tests were run on precisely the same cluster, which was torn down
between runs to ensure fair comparisons. The cluster comprised 21 nodes,
each equipped with:

-   2 processors, 12 cores, Intel Xeon CPU E5-2630L 0 at 2.00GHz
-   12 disk drives at 932GB each (one for the OS, the rest for HDFS)
-   384GB of memory

## Comparative Set

-   [Impala](http://impala.io) 1.3.0
-   [Hive-on-Tez](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez):
    The final phase of the 18-month Stinger initiative (aka Hive 0.13)
-   [Shark](http://shark.cs.berkeley.edu/) 0.9.2: A port of Hive from UC
    Berkeley AMPLab that is architecturally similar to Hive-on-Tez, but
    based on Spark instead of Tez. Shark testing was done on a native
    in-memory dataset (RDD) as well as HDFS.
-   [Presto](http://prestodb.io) 0.60: Facebook’s query engine project

## Queries

-   To ensure a realistic Hadoop workload with representative
    data-size-per-node, queries were run on a 15TB scale-factor dataset
    across 20 nodes.
-   We ran precisely the same [open decision-support
    benchmark](https://github.com/cloudera/impala-tpcds-kit) derived
    from TPC-DS described in our [previous
    testing](http://blog.cloudera.com/blog/2014/01/impala-performance-dbms-class-speed/)
    (with queries categorized into Interactive, Reporting, and Deep
    Analytics buckets).
-   Due to the lack of a cost-based optimizer and predicate propagation
    in all tested engines excepting Impala, we ran the same queries that
    had been converted to SQL-92-style joins from the previous testing
    and also [manually propagated predicates where semantically
    equivalent](https://github.com/cloudera/impala-tpcds-kit/tree/master/queries-sql92-modified).
    For consistency, we ran those same queries against Impala — although
    Impala produces identical results without these modifications.
-   In the case of Shark, manual query hints were needed in addition to
    the modifications above to complete the query runs. Furthermore,
    Shark required more memory than available in the cluster to run the
    Reporting and Deep Analytics queries on RDDs (and thus those queries
    could not be completed).
-   We selected comparable file formats across all engines, consistently
    using Snappy compression to ensure apples-to-apples comparisons.
    Furthermore, each engine was tested on a file format that ensures
    the best possible performance and a fair, consistent comparison:
    Impala on Apache Parquet (incubating), Hive-on-Tez on ORC, Presto on
    RCFile, and Shark on ORC. (Note that native support for Parquet in
    Shark as well as Presto is forthcoming.)
-   Standard methodical testing techniques (multiple runs, tuning, and
    so on) were used for each of the engines involved.

# Results


## Single User

Impala on Parquet was the performance leader by a substantial margin,
running on average 5x faster than its next best alternative (Shark
0.9.2).

![](http://blog.cloudera.com/wp-content/uploads/2014/05/single-user.png "single-user")

(Note: The results are not shown here, but the queries were also run on
Impala/RCFile as a direct comparison to Presto/RCFile — and performance
was consistently 20-30% slower than that of Impala/Parquet.)

The two Hive-on-DAG implementations produced similar results, which is
consistent with what one would have expected given they have highly
similar designs. Presto is the youngest implementation of the four and
is held back by the fact that it runs on RCFile, which is a much less
effective columnar format than Parquet. We look forward to re-running
these benchmarks in a few months when Presto runs on Parquet.

Although these results are exciting in themselves, as previously
explained, we believe that measuring latency under a multi-user workload
is a more valuable metric — because you would very rarely, if ever,
commit your entire cluster to a single query at a time.

## Multiple Users

In this test of a concurrent workload, we ran seven Interactive queries
(q42, q52, q55, q63, q68, q73, q98) 10 times concurrently. To prevent
all processes from running the same queries at the same time, queries
were run consistently back-to-back and randomized. Furthermore, because
we could not run the full query set for Shark on RDDs, we used only the
partition necessary for the Interactive queries to do the single-user
and 10-user comparisons.

In this run, Impala widened its performance advantage, performing 9.5x
better than the next best alternative:

![](http://blog.cloudera.com/wp-content/uploads/2014/05/multi-user.png "multi-user")

## Throughput and Hardware Utilization

In the above chart you can see that under the (simulated) load of 10
concurrent users, Impala slows down by 1.9x, whereas for other SQL
implementations, query performance slows by 2.6x – 8.6x under the same
load. This performance difference translates into quality of experience
as perceived by the BI user.

We also measured total throughput, or how many queries the system could
process in a given hour — which has an impact on the quantity of
hardware required to run a SQL workload at a targeted performance level.
This metric is a big influence on TCO, where the carrying cost of
hardware is typically two-thirds of the TCO of a Hadoop system.

It’s perhaps surprising to see Shark running on data cached as RDDs
resulting in slightly slower single-user queries than Shark running
directly on HDFS — because the data in HDFS was already in memory (local
cache) and RDDs only added overhead. This disparity will widen over time
now that HDFS supports in-memory reads
([HDFS-4949](https://issues.apache.org/jira/browse/HDFS-4949)), which
are more efficient than the OS buffer cache. In addition, in-memory
writes are planned for an upcoming HDFS release
([HDFS-5851](https://issues.apache.org/jira/browse/HDFS-5851)). (In the
coming months, we plan to re-run these benchmarks using updated versions
and with HDFS caching configured.)

![](http://blog.cloudera.com/wp-content/uploads/2014/05/query-throughput.png "query-throughput")

CPU efficiency explains how Impala is able to provide lower latency and
higher throughput than the alternatives, and why a native
high-performance MPP query engine offers benefits that just porting Hive
onto a DAG (either Tez or Spark) does not. While utilizing a DAG removes
additional I/O costs beyond the initial scan of the data, most of the
performance and concurrency gains come from the CPU efficiency of the
query engine itself.

![](http://blog.cloudera.com/wp-content/uploads/2014/05/cpu2.png "total-cpu-time")

# Beyond Performance


Based on these results, Impala not only outperforms its nearest
competitors, but also proved itself to be a more robust system that
requires less manual tuning:

-   *The other systems required significant rewrites of the [original
    queries](https://github.com/cloudera/impala-tpcds-kit) in order to
    run, while Impala could run the original as well as [modified
    queries](https://github.com/cloudera/impala-tpcds-kit/tree/master/queries-sql92-modified).*
    
    Deep knowledge about how to rewrite SQL statements was required to
    ensure a head-to-head comparison across non-Impala systems to avoid
    even slower response times and outright query failures, in some
    cases. For most users of applications or BI tools, such manual
    writing of queries is highly undesirable, if not impossible. 
     
     In contrast, Impala’s cost-based optimizer and predicate
    propagation capability allows it to run the queries in the original
    SQL-89 form of the TPC-DS-derived benchmark or the modified versions
    with identical performance. Manual predicate propagation in
    particular is often challenging for users; traditional databases
    provide automatic propagation similar to that of Impala and
    incorrect placements can lead to wrong results.

-   *Some systems require manual tuning of the JVM’s garbage collection
    parameters.*
    Presto in particular required manual tuning of Java garbage
    collection in order to achieve its results. Likewise, Shark’s
    inability to run without manual query hints was partially due to
    Shark’s dependence on JVM memory management. And Tez either needs
    more time for startup and smaller queries when running queries in
    separate containers, or runs into similar challenges when reusing
    containers. 
     
     Impala’s query execution, however, is written in native code, which
    not only leads to greater performance and CPU efficiency as
    demonstrated above, but also offers a more stable multi-user service
    similar to traditional MPP query engines.

# Conclusion


In summary, these new results prove out that Impala achieves better
concurrent latency than its competitors while providing high query
throughput, and with a far smaller CPU footprint. Furthermore, out of
the entire comparative set, only Impala was able to run the queries in
their original SQL-89-style join format without modification.

The results above help demonstrate that despite significant engineering
investments into alternatives, Impala uniquely delivers on the
requirements for BI and SQL analytics by combining:

-   Interactive SQL
-   Ability to handle highly-concurrent workloads
-   Efficient resource usage (so Impala is a “good citizen” in a shared
    workload environment)
-   Open formats for accessing any data
-   Multi-vendor support (from Cloudera, MapR, and Amazon) to avoid
    lock-in, and
-   Broad ISV support

As usual, we invite you to do the same testing for yourselves using our
[openly published benchmark
kit](https://github.com/cloudera/impala-tpcds-kit) — any and all
feedback is welcome and appreciated. We’ll bring you more news over time
as Impala continues to hit its milestones!

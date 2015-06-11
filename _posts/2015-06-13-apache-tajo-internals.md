---
layout: post
title: Apache Tajo Internal
date: 2015-06-13
categories: [computer science]
tags: [tajo]

---


## Article Source 
* Title: [Apache Tajo Internal](https://jihoonson.wordpress.com/2014/09/22/apache-tajo-internal/)
* Authors: [Jihoon
Son](https://jihoonson.wordpress.com/author/jihoonson/ "View all posts by Jihoon Son")

---

Apache Tajo Internal 
====================

Hadoop has been regarded as a de-facto standard storage for web-scale
data. Since SQL is popularly used for analytic works, the needs for SQL
processing on Hadoop has been increased. As a result, many SQL-on-Hadoop
systems have been proposed for the last few years.

[Apache Tajo](http://tajo.apache.org) is one of the most promising
SQL-on-Hadoop systems. It is designed to converge the technologies of
Hadoop and parallel databases. As a result, it can provide scalable and
efficient SQL processing. In this article, I’ll describe the internal
architecture and interesting features of Tajo.

# Architectural characteristics

Tajo has its own query engine based on the traditional shared-nothing
architecture. This query engine adopts promising features from both of
MapReduce and parallel databases.

## Sequential stage execution & native execution engine

Tajo executes consecutive stages sequentially during execution of a
query. This is similar to that the reduce stage is executed after the
map stage is completed in MapReduce. For example, let’s consider a query
that joins two relations. This query is executed in two stages in Tajo.
Both relations are scanned in the first stage, and then read tuples are
joined in the second stage.

In each stage, workers execute the query using a database-inspired
native engine. This engine exploits pipelined operator execution of
databases. In addition, advanced database techniques are adopted for
operator execution.

The query processing in Tajo has interesting features as follows.

-   By exploiting sequential stage execution, the entire resources of
    the cluster can be utilized for each stage. Thus, Tajo can work
    effectively even when the remaining cluster resources are very
    small.
-   Different to Hive or Shark, parallel execution is performed by the
    native engine rather than other distributed processing frameworks.
    In this architecture, query optimizer can be more tightly integrated
    with query executor. Thus, more fine-grained optimization can be
    achieved.

## Dynamic load balancing

A stage is divided into many small tasks. During execution of a stage, a
query master progressively assigns tasks to workers according to their
status, such as remaining resources, average throughput, etc. As a
result, load balancing can be achieved according to dynamically changing
cluster environments during query execution.

## Fault tolerance

Tajo provides MapReduce-like fault-tolerance strategy. A Tajo master
continuously gathers worker status information. If some workers do not
send their status, they are marked as failed workers and excluded from
query execution. Even when a worker fails in the middle of a query,
tasks assigned to that worker are simply re-assigned to healthy workers.

## Additional features

-   *Dynamic query optimization*. Tajo dynamically refines the execution
    plan of running queries. Please note that consecutive stage are
    sequentially executed. During execution of a stage, some statistics
    such as partition size, record counts, and histograms, can be
    collected. After that, at the beginning of the next stage, the
    operator type or the degree of parallelism of the stage can be
    chosen based on the collected statistics.
-   *Columnar storage support*. Parquet is inspired from Google’s
    Dremel, and one of the most popular columnar file formats. Tajo can
    provide more efficient query processing by using Parquet.

# Future

Tajo has been rapidly developed in the last few years, and there are
more interesting features that will be developed.

-   *Improved query scheduler*. Currently, Tajo only supports the
    FIFO-style query scheduling. This is not appropriate for most real
    applications. In [this
    issue](https://issues.apache.org/jira/browse/TAJO-540), a
    [Sparrow](https://github.com/radlab/sparrow)-like improved query
    scheduler have been being implemented.
-   *Vectorized execution & run-time code generation*. Columnar store
    and related techniques have been interested for many years, because
    they greatly improve the processing performance of analytic queries.
    There are several ongoing issues to adopt these techniques to the
    Tajo query engine. [This
    slide](http://www.slideshare.net/gruter/hadoop-summit-2014-query-optimization-and-jitbased-vectorized-execution-in-apache-tajo)
    will give more information.
-   *Index support*. Indexing is a representative technique to improve
    the performance by reducing I/O overheads. Tajo is also considering
    the index support. Here is a [related
    issue](https://issues.apache.org/jira/browse/TAJO-835).

In addition to the above features, there are a lot of ongoing interesting issues for more stable, more scalable, and more efficient query execution.


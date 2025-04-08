---
layout: post
title: Stinger - Interactive Query for Hive
date: 2014-04-29
categories: [computer science]
tags: [big data, nosql]

---

# Article Source
* Title: [Stinger : Interactive Query for Hive](http://hortonworks.com/labs/stinger/)
* Authors: [Alan
Gates](http://hortonworks.com/blog/author/alan_gates/ "Posts by Alan Gates")

[![](http://sungsoo.github.com/images/stinger-initiative.png)](http://sungsoo.github.com/images/stinger-initiative.png)

# Stinger : Interactive Query for Hive

### Speed, Scale and SQL Compatibility with Apache Hive

[![](http://sungsoo.github.com/images/stinger-timeline.png)](http://sungsoo.github.com/images/stinger-timeline.png)

Apache Hive is the de facto standard for SQL-in-Hadoop with more
enterprises relying on this open source project than any
alternative. The Stinger Initiative is a broad, community-based effort
to drive the future of Apache Hive, delivering 100x performance
improvements at petabyte scale with familiar SQL semantics.

Project Goals
-------------

**Speed**

Deliver interactive query through 100x performance increases as compared
to Hive 10.

**Scale**

The only SQL interface to Hadoop designed for queries that scale from
Terabytes to Petabytes.

**SQL**

Support the broadest array of SQL semantics for analytic applications
running in Hadoop.

Status
------

The Stinger initiative outlined three phases, and the Apache community
delivered each on schedule. During Stinger’s thirteen months of
continuous community collaboration 145 developers from 44 companies
closed 1,672 Jira and added 392,000 lines of Java code. In just over one
year, Stinger delivered speed, scale and SQL semantics.

In the first phase of delivery, with HDP 1.3, we saw:

-   Performance improvements of 35x-45x for common analytical queries
    and
-   Introduction of SQL windowing functions such as Rank, Lead, Lag,
    etc.
-   Introduction of the ORCFile format

The release of HDP 2.0 marked the second major milestone of Stinger
based improvements for Hive, introducing:

-   A preview of the vectorized query engine, jointly developed with
    Microsoft and other community contributors, that speeds all types of
    queries, adding another 5x-10x improvement.
-   Simplified SQL interoperability through the new VARCHAR and DATE
    datatypes and
-   A new query optimizer that speeds complex queries by several
    factors.

Phase 3, delivered with HDP 2.1, will complete the Stinger Initiative on
schedule with:

-   Apache Hive on  Apache Tez, with pre-launched hot containers
-   Vectorized query execution
-   ACID framework for managing dimension tables and other master data
-   Support for additional SQL functions and operators
-   Support for data access: HTTP, SSL, Kerberos authentication

The improvements to Apache Hive—through the Stinger Initiative—delivered
order-of-magnitude improvements in query latency and pushed several
types of queries past 100x faster than in Hive 0.10.

## Speed

HDP 2.0 introduced several major new performance features that benefit
both small reporting queries and deep analytical queries. Some of which
are described in this table:

![](http://hortonworks.com/wp-content/uploads/2013/09/hive1.png)

We looked at TPC-DS Query 27, a fairly simple reporting query, back in
February 2013 and showed that some improvements to the Hive query
planner led to massive performance benefits. HDP 2.0 brings incremental
progress by introducing vectorized query, which makes the map stages far
more efficient.

![](http://hortonworks.com/wp-content/uploads/2013/09/hive2.png)

HDP 2.1 delivers Apache Hive 0.13 on Apache Tez. With Hive on Tez, users
have the option of executing queries on Tez. Tez’s dataflow model on a
DAG of nodes facilitates simpler, more efficient query plans, which
translates to significant performance improvements.

Hive 0.13 also delivers vectorized query execution mode that performs
CPU computations 5-10x faster, translating to a 2-3x improvement in
query performance.

**[Further discussion on speed
here…](http://hortonworks.com/blog/stinger-phase-2-the-journey-to-100x-faster-hive/)**

## Scale

ORCFile was introduced in Hive 0.11 and offered excellent compression,
delivered through a number of techniques including run-length encoding,
dictionary encoding for strings and bitmap encoding. These improvements
meant:

-   **Sustained Query Times.** Apache Hive 0.12 provides sustained
    acceptable query times even at petabyte scale.
-   **Smaller Footprint**. Better encoding with ORCFile in Apache Hive
    12 reduces resource requirements for a cluster.

This picture shows the sizes of the TPC-DS dataset at Scale 500 in
various encodings. This dataset contains randomly generated data
including strings, floating point and integer data.

![ORCFile](http://hortonworks.com/wp-content/uploads/2013/10/ORCFile.png)

We’ve already seen customers whose clusters were maxed out for storage
move to ORCFile as a way to free up space while preserving complete
compatibility with existing jobs.

Data stored in ORCFile can be read or written through HCatalog, so any
Pig or Map/Reduce process works seamlessly. Hive 0.12 built on Hive
0.11’s impressive compression ratios and delivered deep integration at
the Hive and execution layers, which further accelerated queries even
over larger datasets.

**[Further discussion on ORCFile
here…](http://hortonworks.com/blog/orcfile-in-hdp-2-better-compression-better-performance/)**

## SQL Semantics

Our goal with SQL support is simple: Make Apache Hive a comprehensive
and compliant SQL engine that meets enterprise needs. Hive 0.13
introduces the DECIMAL and CHAR datatypes. With the SQL standard-based
authorization feature in Hive 0.13, users can now define their
authorization policies in an SQL-compliant fashion. The Apache Hive
community extended SQL language to support *grant* and *revoke* on
entities. Hive also now supports *show roles*, *user privileges*, and
*active privileges*.

![SQLSemantics](http://hortonworks.com/wp-content/uploads/2014/04/SQL-In-Stinger-Phase-3.png)
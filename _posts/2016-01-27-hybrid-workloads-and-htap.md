---
layout: post
title: HYBRID WORKLOADS AND HTAP 
date: 2016-01-27
categories: [computer science]
tags: [big data]

---



## Article Source
* Title: [HYBRID WORKLOADS AND HTAP](http://www.nuodb.com/use-cases/hybrid-workloads-HTAP)
* Authors: Barry Devlin

---

# HYBRID WORKLOADS AND HTAP

Supporting Hybrid Transaction / Analytical Processing 
----

NuoDB’s [peer-to-peer
architecture](http://www.nuodb.com/product/distributed-cloud-database-architecture)
allows the database to configure in-memory peers independently of each
other. This enables you to optimize your compute resources and meet
hybrid workload requirements within a single logical database. In a
mixed read/write workload scenario, for instance, NuoDB can support
one set of peers focused on transactional processing and another set
configured to execute long-lived analytical queries without blocking the
ongoing operational workloads.

A perfect example of this is the area of hybrid transaction/analytical
processing (HTAP), the ability to perform both online transaction
processing and real-time operational intelligence processing
simultaneously and within the same database.

The underlying architectures for transactional and analytical databases
have traditionally been separate and distinct, with each offering
optimized to perform only their own specific and distinct functions.
NuoDB’s peer-to-peer architecture overcomes this hurdle by allowing you
to dedicate database and hardware resources to perform either near
real-time analytics or low-latency, high-throughput transaction
processing.

Big data analytics hype has tended to focus on discovery - essentially
putting together data lakes and pointing Hadoop at them. However, the
reality of many data-driven businesses is their need for real-time
optimization. Businesses want repeatable analytics on very recent data.
This provides immediately valuable operational intelligence without the
time and effort required to offload data to a separate analytics
database. Unfortunately, traditional lock-based database management
systems are very poor at this.

The unique advantages of NuoDB’s architecture are to provide very low
latency SQL analytics on fully up-to-date data. The architecture was
further optimized to enable these HTAP capabilities. Advantages inherent
in the architecture include:

-   Ability to run transactional and analytical workloads against a
    single operational data store (ODS) without experiencing performance
    degradation due to lock contention.
-   Ability to utilize dedicated high spec analytics servers to process
    long-running SQL queries for improved query performance.
-   Ability to scale out/in analytical workloads on-demand.
-   Ability to access and query the NuoDB database with leading JDBC and
    ODBC-compliant data visualization and reporting tools.

![](http://sungsoo.github.com/images/HTAP-with-NuoDB.jpg)

## How It Works

NuoDB is a transactional system, meaning that it’s well suited to
support both online transaction processing (OLTP) tasks and operational
workloads like account management or session tracking. The operational
model is typical of scale-out web applications, which need a database
that can support many concurrent clients doing regular, small, localized
updates. While techniques like database sharding or replication are hard
to apply to OLTP, they can be used for operational workloads that have
strong locality. The problem is that these approaches make it hard to do
real-time analysis of the data.

NuoDB provides a [scale-out
architecture](http://www.nuodb.com/use-cases/elastic-scalability), supporting transactions
that need to read large quantities of data. Because [multi-version
concurrency
control](http://dev.nuodb.com/techblog/2013/03/12/mvcc-part-1-an-overview)
(MVCC) is used to enforce consistency, those long-running transactions
can execute without causing conflict with the many short-running updates
happening across the database. In this way, NuoDB supports scale-out
operational data deployments where real-time reporting and analytics
operations need to be run on the same data set.

Because NuoDB has a flexible load-balancing policy, it’s also possible
to dedicate specific transaction-focused peers (Transaction Engines in
NuoDB) to specific roles. For instance, a single database can be scaled
out across smaller systems for typical operational access patterns. One
or a few larger systems (with more memory and processing power) can be
dedicated to running analytic transactions. The application is still
viewing a single, logical database that is always consistent across all
the hosts but with appropriate resources dedicated to specific tasks.




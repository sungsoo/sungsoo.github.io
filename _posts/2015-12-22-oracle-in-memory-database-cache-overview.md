---
layout: post
title: Oracle In-Memory Database Cache Overview
date: 2015-12-22
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [Oracle In-Memory Database Cache Overview](http://www.oracle.com/technetwork/products/timesten/overview/timesten-imdb-cache-101293.html)

---

# Oracle In-Memory Database Cache Overview


Oracle In-Memory Database Cache (IMDB Cache) is an Oracle Database
product option ideal for **caching a performance-critical subset of an
Oracle database in the application tier** for improved response time.
Applications perform read/write operations on the cache tables using SQL
and PL/SQL with automatic persistence, transactional consistency, and
data synchronization with the Oracle database. ([Product Data
Sheet](/technetwork/database/database-technologies/timesten/overview/ds-imdb-cache-1470955.pdf))

For many enterprise applications, the majority of data in the corporate
databases is historical and infrequently accessed. However, buried
within this data are pockets of information that must be instantly
accessible. For example, current active customers/users, open orders,
recent transactions, product catalogs, etc.; caching these data in
memory can yield significant improvement for application response time.


![](http://www.oracle.com/technetwork/database/database-technologies/timesten/overview/cache-overview-1415032.png)


Oracle In-Memory Database Cache is built using [Oracle TimesTen In-Memory Database](http://www.oracle.com/technetwork/database/database-technologies/timesten/overview/ds-timesten-imdb-129255.pdf)
(TimesTen) and is deployed in the application tier for multi-user and
multi-threaded applications. Applications connect to the cache database
and access the cached tables using standard SQL via JDBC, ODBC, ADO.NET,
Oracle Call Interface (OCI), Pro*C/C++, and Oracle PL/SQL programming
interfaces. Cached tables operate like regular relational tables inside
the TimesTen database and are persistent and recoverable.

Applications using IMDB Cache may choose to configure a combination of
**caching options:**

-   Read-only caches - transactions are performed in the Oracle Database
    and the changes are refreshed to the TimesTen cache database.
-   Read-write (or write-through) caches – transactions are performed in
    the TimesTen cache database and then propagated to the
    Oracle Database.
-   On-demand and preloaded cached - data may be loaded on-demand or
    preloaded, and may be shared across the cache grid members, or
    reside only in a specific cache node.

**Data synchronization** with the Oracle Database is performed
automatically.

-   **Asynchronous write-through** cache leverages the speed of TimesTen
    by first committing the transactions locally in the cache database,
    and asynchronously sending the updates to the Oracle Database.
    Asynchronous write-through cache groups provide faster application
    response time and higher transaction throughput.
-   **Synchronous write-through** cache will ensure that if the Oracle
    Database cannot accept the update(s), the transaction is rolled back
    from the cache database; with synchronous write-through, the
    application must wait for the commits to complete in both the Oracle
    Database and the TimesTen database.
-   For **read-only caches**, incremental updates in the Oracle Database
    are asynchronously refreshed to the in-memory cache tables in the
    application-tier at user-specified intervals.

IMDB Cache is designed to continue running even after the Oracle
Database server or network connection has been lost. Committed
transactions to the cache database are tracked and persisted; and once
the connection to the Oracle Database is restored, the transactions are
propagated to the Oracle Database. Similarly, committed transactions on
the source tables in the Oracle Database are tracked and refreshed to
the TimesTen database once connection between the databases is
re-established.


![](http://www.oracle.com/technetwork/database/database-technologies/timesten/overview/cache-grid-1415036.png)


IMDB Cache **provides horizontal scalability** in performance and
capacity through the in-memory cache grid, which consists of a
collection of IMDB Caches for an application’s cached data. Cached data
is distributed among the grid members and is available to the
application with location transparency and transactional consistency.
Online addition and removal of cache grid members can be performed
without service interruption to the application.

Depending on data access patterns and performance requirements, an
application may choose to allocate specific data partitions to some grid
members for locality optimizations, or make all data available to all
grid members for location transparency. The cache grid software manages
cache coherency and transactional consistency across the grid members.

Similar to the stand-alone TimesTen databases, IMDB Cache offers
built-in mechanisms for transactional replication to provide high
availability for the cache databases. Most enterprise applications
cannot afford application down time, hence majority of the deployments
add IMDB Cache replication for high availability and load balancing.


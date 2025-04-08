---
layout: post
title: Hybrid Trasansaction/Analytical Processing (HTAP)
date: 2015-08-05
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Hybrid Transaction/Analytical Processing](http://www.nuodb.com/explore/newsql-cloud-database-product/hybrid-transaction-analytical-processing)

---

# Hybrid Transaction/Analytical Processing 

![real time operational
intelligence](http://sungsoo.github.com/images/real-time-operational-intelligence2-1.jpg)

<span style="font-size:14px">Hybrid Transaction/Analytical Processing
(HTAP) is a term coined by Gartner, Inc., the leading technology
research firm, to describe the ability of a single database capable of
performing both online transaction processing and real time operational
intelligence processing.</span>

<span style="font-size:14px">The underlying architectures for
transactional and analytical databases have traditionally been separate
and distinct with each offering optimized to perform only their own
specific and distinct functions. NuoDB’s peer-to-peer architecture
overcomes this hurdle by allowing you to dedicate database and hardware
resources to perform either function.</span>

<span style="font-size:14px">Big Data analytics hype has tended to focus
on discovery - essentially putting together data lakes and pointing
Hadoop at them. However, the reality of many data-driven businesses is
their need for real-time optimization. There is a desire by businesses
to do repeatable analytics on very recent data. This provides
immediately valuable operational intelligence without the time and
effort required to offload data to a separate analytics database.
Unfortunately traditional lock-based database management systems are
very poor at this.</span>

<span style="font-size:14px">The unique advantages of NuoDB’s patented,
[three-tier
architecture](http://www.nuodb.com/explore/newsql-cloud-database-how-it-works)
are able to provide very low latency SQL analytics on fully up-to-date
data. The architecture was further optimized in NuoDB Swifts Release 2.1
to enable these HTAP capabilities. Advantages inherent in the
architecture include:</span>

-   <span style="font-size:14px">Ability to run transactional and
    analytical workloads against a single operational data store (ODS)
    without experiencing performance degradation due to lock
    contention.</span>
-   <span style="font-size:14px">Ability to utilize dedicated high spec
    analytics servers to process long-running SQL queries for improved
    query performance.</span>
-   <span style="font-size:14px">Ability to scale out/in analytical
    workloads on-demand.</span>
-   <span style="font-size:14px">Ability to access and query the NuoDB
    database with leading JDBC and ODBC-compliant data visualization and
    reporting tools.</span>

![](http://sungsoo.github.com/images/htap.jpg)

**<span style="font-size:14px">How It Works</span>**

<span style="font-size:14px">NuoDB is a transactional system, meaning
that it’s well suited to support both Online Transaction Processing
(OLTP) tasks and operational workloads like account management or
session tracking. The operational model is typical of scale-out web
applications, which need a database that can support many concurrent
clients doing regular, small, localized updates. While techniques like
database sharding or replication are hard to apply to OLTP they can be
used for operational workloads that have strong locality. The problem is
that these approaches make it hard to do real-time analysis of the
data.</span>

<span style="font-size:14px">NuoDB provides a scale-out architecture,
supporting transactions that need to read large quantities of data.
Because MVCC is used to enforce consistency, those long-running
transactions can execute without causing conflict with the many
short-running updates happening across the database. In this way NuoDB
supports scale-out operational data deployments where real-time
reporting and analytics operations need to be run on the same data
set.</span>

<span style="font-size:14px">Because NuoDB has a flexible load-balancing
policy, it’s also possible to dedicate specific [Transaction
Engines](http://go.nuodb.com/white-paper) to specific roles. For
instance, a single database can be scaled out across smaller systems for
typical operational access patterns. One or a few larger systems (with
more memory and processing power) can be dedicated to running analytic
transactions. The application is still viewing a single, logical
database that is always consistent across all the hosts but with
appropriate resources dedicated to specific tasks.</span>


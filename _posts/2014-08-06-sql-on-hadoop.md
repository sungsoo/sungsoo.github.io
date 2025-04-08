---
layout: post
title: Understanding the world of SQL on Hadoop.
date: 2014-08-06
categories: [computer science]
tags: [big data, big data, tez]

---

## Article Source
* Title: [Is there a Database in Big Data Heaven? Understanding the world of SQL on Hadoop.](http://drawntoscale.com/is-there-a-database-in-big-data-heaven-understanding-the-world-of-sql-on-hadoop/)
* Authors: [Bradford](http://drawntoscale.com/author/bradford/)

# Understanding the world of SQL on Hadoop. 

## Is there a Database in Big Data Heaven?

2012 was certainly a watershed year of widespread adoption of Hadoop —
and with it, the emerging adoption of SQL on Hadoop. We have strong
regard for all the work ISVs have done to educate the market and deliver
first generation solutions. Many firms, from large enterprises to
start-ups are, are now on the path of developing Big Data strategies
that ultimately drive revenue, growth and differentiation. But Gartner’s
Svetlana Sicular recently declared that Big Data is falling into what
Gartner calls the “[Trough of
Disillusionment](http://blogs.gartner.com/svetlana-sicular/big-data-is-falling-into-the-trough-of-disillusionment/)”…yet
the good news is “[Big data is moving from closets full of hidden Hadoop
clusters into CEO’s corner
offices”](http://blogs.gartner.com/svetlana-sicular/magic-realism-of-big-data/)

The market is primed and Hadoop solutions are certainly demonstrating
the ability to store and process data at scale — but there’s a lack of
satisfaction from customers.  Expectations of being able to run
operational applications on Hadoop are not being met. So if Hadoop/HBase
is heaven for large data sets, is there a database in Big Data Heaven?

To answer this, Drawn to Scale has been working on the hard problem of
building an operational infrastructure on Hadoop with a SQL interface.

Currently, Hadoop is stuck in the world of Analytical applications. Yet
there is a much larger need for user-facing apps with real-time reads
and writes — like powering websites and mobile apps.  Developers now
know that Hadoop scales data storage cheaply, but building applications
without actual database functionality is a chasm of complexity.  It’s a
clear example of “[The Law of Conservation of
Complexity](http://en.wikipedia.org/wiki/Law_of_conservation_of_complexity)”
which states that every application has an inherent amount of
irreducible complexity. This complexity cannot be wished away and has to
be dealt with, either in product development or in user interaction.   A
SQL interface on Hadoop infrastructure is still not a database.

The three fundamental aspects keeping Hadoop from being used
operationally are:

 1. MapReduce and HBase are low-level programming interfaces
 2. MapReduce is a batch-oriented processing system
 3. MapReduce is not built for concurrency

 

## INTERFACES ARE NOT INFRASTRUCTURE

SQL and the RDBMS have been the standard way we interact with data for
decades — these concepts have become almost synonymous. SQL is the
language to interface and manipulate data, and the RDBMS the storage and
execution infrastructure.

However, you can have a SQL interface without a database infrastructure
behind it. Today, we’re seeing a similar approach with Hive, Phoenix,
and Cloudera’s Impala — SQL interfaces focused on non-Operational
infrastructure whose goal is to make data manipulation faster and easier
for analytical use cases.

Think of the concept of a Vending Machine. The vending machine is the
Interface to food (data) and the warehouse is where all the rest of the
food is actually stored.

1.  Vending machines store only a sub-set of data that’s in the
    warehouse
2.  Vending machines have to be re-stocked in batch (by delivery trucks)
3.  Vending machines service single or few users at a time. (Analysts
    insert coins here)

Let’s take a look at the open source projects — Hive, Impala, and
Phoenix — to better understand their Infrastructures relative to their
SQL Interfaces.

## Fly on, Albatross — a survey of current SQL on Hadoop solutions

## Hive – A SQL Interface to MapReduce  
**Interface: HiveQL**  
**Infrastructure: MapReduce**  
**Storage: HadoopFS**

Hive was one of the first non-native interfaces to MapReduce, Hadoop’s
batch processing framework. Developers, not analysts, write scripts with
the interface of HiveQL.  Scripts are then compiled into MapReduce jobs.
 This cycle repeats for every new query manipulation needed preventing
the analyst from ever having a free form conversation with the data.

It’s also the least performant of the three due to the way MapReduce
execution works — it scans over an entire data set, often with little
structure. It then performs computations, moves the results of the
computation across a network, performs more computations, moves it
across the network again, and then stores results.

Hive makes it easier to write pure Java code against a dataset, the
computations are highly customizable, if you are a developer. Results
are typically stored in a flat file format in the Hadoop distributed
filesystem.

If Hive were a vending machine, a developer would make the request to an
empty vending machine, then wait for a truck to deliver the requested
data in the structure requested.  Not bad if you have the time to wait.
 The chasm of complexity to get to operational functionality is just too
large to even try.

## Impala – SQL for low-latency data warehousing
**Interface: Similar to HiveQL**  
**Infrastructure: Massively Parallel Processing (MPP)**  
**Storage: HadoopFS (occasionally HBase)**

Cloudera’s Impala is an implementation of Google’s Dremel. Dremel relies
on massive parallelization and brute force to arrive at answers to
analytics queries in low minutes to seconds.  Similar to an MPP data
warehouse, queries in Impala originate at a client node. This query is
then sent to *every* data storage node which stores part of the
dataset. Results are partially aggregated locally, then combined on the
client machine.

Imagine the overhead of every query hitting every machine in an
operational context.  Impala would fall down unable to handle more than
a handful of concurrent requests.

Also unlike an RDBMS, Impala lacks indexes, optimization, and a true
distributed execution environment.  Without indexes, many queries need
to scan over the entire dataset to return results, which often results
in *every query* running on *every machine*.  This approach leads to
unpredictable performance based on query type and data set size.  In
addition, without metrics gathering and optimization, Impala cannot
determine how to minimize query execution time. This is especially
important when it comes to filter and joins.

Without a distributed execution environment that can *move data between
nodes*, operations like JOINs become much more difficult. Since joins
require sorting and then matching aspects of a dataset together, the
Impala client will need to bring large portions of the entire dataset to
a single client (one server),  and then ‘join’ the information there.
The dataset will also need to fit in memory.

We’re going to need a bigger vending machine and the operational
viability is limited to patient internal users.

## Phoenix – A SQL Interface to HBase
**Interface: Small subset of SQL**
**Infrastructure: Coprocessor and Client-Side execution and filtering**
**Storage: HBase (key-value store)**

Phoenix is a new open source project from Salesforce that provides a SQL
interface to data that is stored in HBase. Claiming higher performance
than Impala or MapReduce, Phoenix abstracts away a lot of tricky
concepts with HBase, such as serialization, filters, and a basic ability
to “push computation to the data” so network traffic is minimized.
However, Phoenix lacks many aspects of functionality an operational
database requires.

Similar to Impala, Phoenix cannot handle more than a handful of
concurrent requests, unless the queries are simple, because it lacks
indexes, optimization, and distributed execution.

The execution environment for Phoenix relies on HBase Coprocessors and a
client which combines results from multiple machines. These provide
‘hooks’ into the HBase engine and allows one to run code on events such
as scanning for data or writing data. Therefore, Phoenix makes running
queries like “Group all my employees by department” simpler, by
retrieving data, aggregating it on the same machine it’s retrieved from,
then sending that smaller dataset over the network — there’s the
delivery truck again.

This vending machine can only store so much before it has to be
restocked, and meanwhile users are lining up waiting for access.

Phoenix provides a good story for analytics and simple applications as a
SQL Interface bolt on to HBase.  The infrastructure, however, limits its
viability to only analytical application verticals, but anyone seeking
operational capabilities will need to look elsewhere.

## Pearls Before Swine

Climbing out of the trough requires vendors to enable firms to realize
deeper business value with operational Big Data applications. This takes
a radically new approach beyond just adding a SQL interface to Hadoop.
 One that focuses on the infrastructure behind the SQL.  We modeled
Spire after Google’s F1 — to combine the scale of BigTable with the
simplicity of SQL, and a complete distributed execution environment.

We took this construct and applied it to the world of Big Data, and have
developed a true operational database with purpose built infrastructure
to provide:

-   Complete SQL interface for data storage and retrieval
-   Distributed indexing and query execution for predictable and
    manageable performance as user concurrency and data set grows
-   Optimization for rapid queries and joins to enable small reads and
    small writes against the entire data set in real time

Spire allows you to put the vending machine in the back of the building
(for the analyst), while opening the doors of the warehouse to thousands
of users with access to all the data in the warehouse, make changes to
the data and see the changes made by other users in real time.  It’s
like trying to do your grocery shopping through a vending machine vs.
walking into a Costco store.

If your application requires an operational infrastructure with a SQL
interface capable of thousands of reads/writes a second at Hadoop scale,
[check out Spire. ](http://www.drawntoscale.com)


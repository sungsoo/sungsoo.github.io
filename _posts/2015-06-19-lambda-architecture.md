---
layout: post
title: Lambda Architecture
date: 2015-06-19
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Lambda architecture](https://en.wikipedia.org/wiki/Lambda_architecture)
* Authors: From Wikipedia, the free encyclopedia

---


Lambda Architecture 
===================

**Lambda architecture** is a
[data-processing](https://en.wikipedia.org/wiki/Data_processing "Data processing") architecture
designed to handle massive quantities of data by taking advantage of
both [batch](https://en.wikipedia.org/wiki/Batch_processing "Batch processing")- and
[stream-processing](https://en.wikipedia.org/wiki/Stream_processing "Stream processing")
methods. This approach to architecture attempts to balance latency,
throughput, and fault-tolerance by using batch processing to provide
comprehensive and accurate views of batch data, while simultaneously
using real-time stream processing to provide views of online data. The
two view outputs may be joined before presentation. The rise of lambda
architecture is correlated with the growth of [big
data](https://en.wikipedia.org/wiki/Big_data "Big data"), real-time analytics, and the drive to
mitigate the latencies of
[map-reduce](https://en.wikipedia.org/wiki/Map-reduce "Map-reduce").

Lambda architecture depends on a data model with an append-only,
immutable data source that serves as a system of
record. It is intended for
ingesting and processing timestamped events that are appended to
existing events rather than overwriting them. State is determined from
the natural time-based ordering of the data.

![](http://sungsoo.github.com/images/Diagram_of_Lambda_Architecture_generic.png)

*Flow of data through the processing and serving layers of a generic
lambda architecture*


Overview
-----

Lambda architecture describes a system consisting of three layers: batch
processing, speed (or real-time processing), and a serving layer for
responding to queries. 
The processing layers ingest from an immutable master copy of the entire data set.

## Batch layer

The batch layer precomputes results using a distributed processing
system that can handle very large quantities of data. The batch layer
aims at perfect accuracy by being able to process *all* available data
when generating views. This means it can fix any errors by recomputing
based on the complete data set, then updating existing views. Output is
typically stored in a read-only database, with updates completely
replacing existing precomputed views.

[Apache Hadoop](https://en.wikipedia.org/wiki/Hadoop "Hadoop") is the de facto standard
batch-processing system used in most high-throughput
architectures.

## Speed layer

![](http://sungsoo.github.com/images/Diagram_of_Lambda_Architecture_named_components.png)

*Diagram showing the flow of data through the processing and serving
layers of lambda architecture. Example named components are shown.*

The speed layer processes data streams in real time and without the
requirements of fix-ups or completeness. This layer sacrifices
throughput as it aims to minimize latency by providing real-time views
into the most recent data. Essentially, the speed layer is responsible
for filling the "gap" caused by the batch layer's lag in providing views
based on the most recent data. This layer's views may not be as accurate
or complete as the ones eventually produced by the batch layer, but they
are available almost immediately after data is received, and can be
replaced when the batch layer's views for the same data become
available.

Stream-processing technologies typically used in this layer include
[Apache Storm](https://en.wikipedia.org/wiki/Storm_(event_processor) "Storm (event processor)"),
[SQLstream](https://en.wikipedia.org/wiki/Sqlstream "Sqlstream") and [Apache
Spark](https://en.wikipedia.org/wiki/Apache_Spark "Apache Spark"). Output is typically stored on
fast NoSQL databases.

## Serving layer

![](http://sungsoo.github.com/images/Diagram_of_Lambda_Architecture_Druid_data_store.png)

*Diagram showing a lambda architecture with a Druid data store.*

Output from the batch and speed layers are stored in the serving layer,
which responds to ad-hoc queries by returning precomputed views or
building views from the processed data.

Examples of technologies used in the serving layer include
[Druid](https://en.wikipedia.org/wiki/Druid_(open-source_data_store) "Druid (open-source data store)"),
which provides a single cluster to handle output from both
layers. Dedicated stores used in
the serving layer include [Apache
Cassandra](https://en.wikipedia.org/wiki/Apache_Cassandra "Apache Cassandra") or [Apache
HBase](https://en.wikipedia.org/wiki/Apache_HBase "Apache HBase") for speed-layer output, and
[Elephant DB](https://github.com/nathanmarz/elephantdb) or [Cloudera
Impala](https://en.wikipedia.org/wiki/Cloudera_Impala "Cloudera Impala") for batch-layer
output.

Optimizations
------

To optimize the data set and improve query efficiency, various rollup
and aggregation techniques are executed on raw
data, while estimation
techniques are employed to further reduce computation
costs. And while expensive full recomputation is
required for fault tolerance, incremental computation algorithms may be
selectively added to increase efficiency, and techniques such as
*partial computation* and resource-usage optimizations can effectively
help lower latency.

Lambda architecture in use
-------

Metamarkets, which provides analytics for companies in the programmatic
advertising space, employs a version of the lambda architecture that
uses
[Druid](https://en.wikipedia.org/wiki/Druid_(open-source_data_store) "Druid (open-source data store)")
for storing and serving both the streamed and batch-processed
data.

For running analytics on its advertising data warehouse,
[Yahoo](https://en.wikipedia.org/wiki/Yahoo "Yahoo") has taken a similar approach, also using
[Apache Storm](https://en.wikipedia.org/wiki/Storm_(event_processor) "Storm (event processor)"),
[Apache Hadoop](https://en.wikipedia.org/wiki/Hadoop "Hadoop"), and
[Druid](https://en.wikipedia.org/wiki/Druid_(open-source_data_store) "Druid (open-source data store)").

The [Netflix](https://en.wikipedia.org/wiki/Netflix "Netflix") Suro project has separate
processing paths for data, but does not strictly follow lambda
architecture since the paths may be intended to serve different purposes
and not necessarily to provide the same type of
views. Nevertheless, the overall idea is
to make selected real-time event data available to queries with very low
latency, while the entire data set is also processed via a batch
pipeline. The latter is intended for applications that are less
sensitive to latency and require a map-reduce type of processing.

Criticism
----------

Criticism of lambda architecture has focused on its inherent complexity
and its limiting influence. The batch and streaming sides each require a
different code base that must be maintained and kept in sync so that
processed data produces the same result from both paths. Yet attempting
to abstract the code bases into a single framework puts many of the
specialized tools in the batch and real-time ecosystems out of
reach.

In a technical discussion over the merits of employing a pure streaming
approach, it was noted that using a flexible streaming framework such as
[Apache Samza](https://en.wikipedia.org/wiki/Apache_Samza "Apache Samza") could provide some of
the same benefits as batch processing without the
latency. Such a streaming framework could allow
for collecting and processing arbitrarily large windows of data,
accommodate blocking, and handle state.

References
---------

1.  Schuster, Werner. ["Nathan Marz on Storm,
    Immutability in the Lambda Architecture,
    Clojure"](http://www.infoq.com/interviews/marz-lambda-architecture).
    *www.infoq.com*.  Interview with Nathan Marz, 6 April 2014
2.  Bijnens, Nathan. ["A
    real-time architecture using Hadoop and
    Storm"](http://lambda-architecture.net/architecture/2013-12-11-a-real-time-architecture-using-hadoop-and-storm-devoxx/).
    11 December 2013.
3.  Marz, Nathan; Warren, James.
    *Big Data: Principles and best practices of scalable realtime data
    systems*. Manning Publications, 2013.
4.  Kar, Saroj. ["Hadoop Sector will Have Annual
    Growth of 58% for
    2013-2020"](http://cloudtimes.org/2014/05/28/hadoop-sector-will-have-annual-growth-of-58-for-2013-2020/),
    28 May 2014. *Cloud Times*.
5.  Kinley, James. ["The Lambda
    architecture: principles for architecting realtime Big Data
    systems"](http://jameskinley.tumblr.com/post/37398560534/the-lambda-architecture-principles-for-architecting),
    retrieved 26 August 2014.
6.  Ferrera Bertran, Pere. ["Lambda Architecture:
    A
    state-of-the-art"](http://www.datasalt.com/2014/01/lambda-architecture-a-state-of-the-art/).
    17 January 2014, Datasalt.
7.  Yang, Fangjin, and
    Merlino, Gian. ["Real-time Analytics with Open Source
    Technologies"](https://speakerdeck.com/druidio/real-time-analytics-with-open-source-technologies-1).
    30 July 2014.
8.  Ray, Nelson. ["The Art of Approximating
    Distributions: Histograms and Quantiles at
    Scale"](https://metamarkets.com/2013/histograms/). 12 September 2013. Metamarkets.
9.  Rao, Supreeth; Gupta, Sunil.
    ["Interactive Analytics in Human
    Time"](http://www.slideshare.net/Hadoop_Summit/interactive-analytics-in-human-time?next_slideshow=1).
    17 June 2014
10. Bae, Jae Hyeon; Yuan, Danny; Tonse,
    Sudhir. ["Announcing Suro: Backbone of Netflix's Data
    Pipeline"](http://techblog.netflix.com/2013/12/announcing-suro-backbone-of-netflixs.html),
    *[Netflix](https://en.wikipedia.org/wiki/Netflix "Netflix")*, 9 December 2013
11. Kreps, Jay. ["Questioning the Lambda
    Architecure"](http://radar.oreilly.com/2014/07/questioning-the-lambda-architecture.html).
    *radar.oreilly.com*. Oreilly. Retrieved 15 August 2014. 
12. [Hacker News](https://news.ycombinator.com/item?id=7976785) retrieved 20
    August 2014

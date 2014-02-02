---
layout: post
title: Introduction to the Tez
date: 2014-01-14 
categories: [computer science]
tags: [hadoop, mapreduce, tez]

---



Introducing… Tez: Accelerating processing of data stored in HDFS
--

MapReduce has served us well.  For years it has been the processing engine for Hadoop and has been the backbone upon which a huge amount of value has been created.  While it is here to stay, new paradigms are also needed in order to enable Hadoop to serve an even greater number of usage patterns.  A key and emerging example is the need for *interactive query*, which today is challenged by the *batch-oriented nature* of MapReduce.  A key step to enabling this new world was *Apache YARN* and today the community proposes the next step… *Tez*

What is Tez?
--

**Tez** – Hindi for “*speed*” – (currently under [incubation vote](http://people.apache.org/~brane/incubator/votes.html) within Apache) provides a general-purpose, highly customizable framework that creates simplifies data-processing tasks across both small scale (low-latency) and large-scale (high throughput) workloads in Hadoop. It generalizes the MapReduce paradigm to a more powerful framework by providing the ability to execute a complex **DAG** (*directed acyclic graph*) of tasks for a single job so that projects in the Apache Hadoop ecosystem such as Apache Hive, Apache Pig and Cascading can meet requirements for human-interactive response times and extreme throughput at petabyte scale (clearly MapReduce has been a key driver in achieving this).

What Tez Does
---
Tez is the logical next step for Apache Hadoop after **Apache Hadoop YARN**. With YARN the community generalized Hadoop MapReduce to provide a *general-purpose resource management framework* wherein MapReduce became merely one of the applications that could process data in a Hadoop cluster. Tez provides a more general data-processing application to the benefit of the entire ecosystem.

Tez will speed Pig and Hive workloads by an order of magnitude. By eliminating unnecessary tasks, synchronization barriers, and reads from and write to HDFS, Tez speeds up data processing across both small-scale, low-latency and large-scale, high-throughput workloads.

![](http://sungsoo.github.com/images/hadoopstack.png)

With the emergence of Apache Hadoop YARN as the basis of next generation data-processing architectures, there is a strong need for an application which can execute a complex DAG of tasks which can then be shared by Apache Pig, Apache Hive, Cascading and others.  The constrained DAG expressible in MapReduce (one set of maps followed by one set of reduces) often results in multiple MapReduce jobs which harm latency for short queries (overhead of launching multiple jobs) and throughput for large-scale queries (too much overhead for materializing intermediate job outputs to the filesystem). With Tez, we introduce a more expressive DAG of tasks, within a single application or job, that is better aligned with the required processing task – thus, for e.g., any *given SQL query can be expressed as a single job* using Tez.

The below graphic illustrates the advantages provided by Tez for complex SQL queries in Apache Hive or complex Apache Pig scripts.

#### Pig/Hive - MR vs. Pig/Hive - Tez 
![](http://sungsoo.github.com/images/pighivetez.png)

Tez is critical to the [**Stinger Initiative**](http://hortonworks.com/blog/100x-faster-hive) and goes a long way in helping Hive support both interactive queries and batch queries. Tez provides a single underlying framework to support both latency and throughput sensitive applications, there-by obviating the need for multiple frameworks and systems to be installed, maintained and supported, a *key advantage to enterprises looking to rationalize their data architectures*.

Essentially, Tez is the logical next step for Apache Hadoop after Apache Hadoop YARN. With YARN the community generalized Hadoop MapReduce to provide a [general-purpose resource management framework](http://hortonworks.com/blog/introducing-apache-hadoop-yarn/)(YARN) where-in MapReduce became merely *one of the applications* that could process data in your Hadoop cluster. With Tez, we build on YARN and our experience with the MapReduce to provide a more general data-processing application to the benefit of the entire ecosystem i.e. Apache Hive, Apache Pig etc.

What has been completed? Where can Tez go?
--

An early version of the project has been donated to the ASF as part of the initial code grant to establish the Incubation project.   Through the work done in the Stinger initiative, it is already clear that Tez enables and order of magnitude increase in the performance of Apache Hive.

The community is also designing a re-usable set of libraries of data-processing primitives such as sorting, merging, data-shuffling, intermediate data management etc. which are necessary for Tez and may be used directly by other projects.  This is just the beginning.  It is an extensible architecture that will undoubtedly be contributed to widely.

For the community, by the community
--

At Hortonworks we believe that innovation happens fastest by working with a community of like-minded individuals to address the requirements for Hadoop without being bounded by artificial boundaries such as employment. As such, even though the Hortonworks MapReduce/Hive/Pig team seeded the project, we’ve had the benefit of both positive feedback and constructive criticism from several leading contributors and committers across the Apache Hadoop MapReduce, Apache Hive & Apache Pig projects.  These inventors and peers are employed at Hortonworks, Yahoo, Facebook, Microsoft, Twitter and many others.  The initial committer list has 22 participants with deep domain expertise in these unique challenges and comprises a who’s who in the Hadoop world.  Of course, now that we are nearly in a position where we can co-develop via the Apache Software Foundation where we have proposed Tez as an Incubator project, we expect a very quick acceleration of project development.

When will it be available?
--

We plan to donate the code from our internal repository to the ASF as part of the Incubator proposal.  Also, Hortonworks will ship Tez in the next alpha release of **Hortonworks Data Platform 2** (HDP2), based on Apache Hadoop 2.0, very soon to showcase some of the very exciting advances we have made for Apache Hive via Project Stinger.


Apache Tez
--

**Apache Tez** is a *generic data-processing pipeline engine* envisioned as a low-level engine for higher abstractions
such as Apache Hadoop Map-Reduce, Apache Pig, Apache Hive etc.

At it's heart, tez is very simple and has just two components:

*   The **data-processing pipeline engine** where-in one can plug-in input, processing and output implementations to 
    perform arbitrary data-processing. Every 'task' in tez has the following:
	- Input to consume key/value pairs from.
	- Processor to process them.
	- Output to collect the processed key/value pairs.



*  A master for the **data-processing application**, where-by one can put together arbitrary data-processing 'tasks'described above into a task-DAG to process data as desired. 
   The generic master is implemented as a Apache Hadoop YARN ApplicationMaster.


References
--
[1] [Introducing… Tez: Accelerating processing of data stored in HDFS](http://hortonworks.com/blog/introducing-tez-faster-hadoop-processing/)
---
layout: post
title: As MapReduce fades, Apache Spark is now a top-level project
date: 2014-03-02
categories: [computer science]
tags: [hadoop, mapreduce]

---


### Summary

* Article Source: [As MapReduce fades, Apache Spark is now a top-level project](http://gigaom.com/2014/02/27/as-mapreduce-fades-apache-spark-is-now-a-top-level-project/)
* Author: Derrick Harris

**Apache Spark**, an *in-memory data-processing framework*, is now a top-level Apache project. That’s an important step for Spark’s stability as it increasingly replaces MapReduce in next-generation big data applications.

As MapReduce fades, Apache Spark is now a top-level project
---
**MapReduce** was fun and pretty useful while it lasted, but it looks like [**Spark**](http://spark.apache.org) is set to take the reins as the primary processing framework for new Hadoop workloads. The technology took a meaningful, if not huge, step toward that end on Thursday when the Apache Software Foundation [announced that Spark is now a top-level project](https://blogs.apache.org/foundation/entry/the_apache_software_foundation_announces50).

**Spark** has already garnered a large and vocal community of users and contributors because it’s faster than MapReduce (*in memory* and *on disk*) and easier to program. This means it’s well suited for next-generation big data applications that might require *lower-latency queries*, *real-time processing* or *iterative computations* on the same data (i.e., machine learning). Spark’s creators from the [University of California, Berkeley](http://gigaom.com/2013/04/17/welcome-to-berkeley-where-hadoop-isnt-nearly-fast-enough/), have created a company called [Databricks](http://gigaom.com/2013/09/25/databricks-raises-14m-from-andreessen-horowitz-wants-to-take-on-mapreduce-with-spark/) to commercialize the technology.

Spark is technically a standalone project, but it was always designed to work with the *Hadoop Distributed File System*. It can run directly on HDFS, inside MapReduce and, thanks to YARN, it can now run alongside MapReduce jobs on the same cluster. In fact, Hadoop pioneer Cloudera is now providing enterprise support for customers that want to use Spark.

![The ecosystem of Spark projects. Source: Databricks](http://sungsoo.github.com/images/spark-stack-new.png)

However, MapReduce isn’t yesterday’s news quite yet. Although many new workloads and projects (such as [Hortonworks’ Stinger](http://gigaom.com/2013/05/29/why-hortonworks-is-riding-a-faster-hive-to-the-bitter-end/)) use alternative processing frameworks, there’s still a lot of tooling for MapReduce that Spark doesn’t have yet (e.g., Pig and Cascading), and MapReduce is still quite good for certain batch jobs. Plus, as Cloudera co-founder and Chief Strategy Officer Mike Olson explained in a [recent Structure Show podcast](http://gigaom.com/2013/05/29/why-hortonworks-is-riding-a-faster-hive-to-the-bitter-end/), there are a lot of legacy MapReduce workloads that aren’t going anywhere anytime soon even as Spark takes off.

If you want to hear more about Spark and its role in the future of Hadoop, come to our [Structure Data conference](http://events.gigaom.com/structuredata-2014/?utm_source=data&utm_medium=editorial&utm_campaign=intext&utm_term=820915+as-mapreduce-fades-apache-spark-is-now-a-top-level-project&utm_content=dharrisstructure) March 19-20 in New York. Databricks co-founder and CEO Ion Stoica will be speaking as part of our Structure Data Awards presentation, and we’ll have the CEOs of Cloudera, Hortonworks, and Pivotal talking about the future of big data platforms and how they plan to capitalize on them.

References
---
[1] Derrick Harris, [*As MapReduce fades, Apache Spark is now a top-level project*](http://gigaom.com/2014/02/27/as-mapreduce-fades-apache-spark-is-now-a-top-level-project/), Feb. 2014.

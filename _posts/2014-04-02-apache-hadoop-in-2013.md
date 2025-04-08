---
layout: post
title: Apache Hadoop in 2013 - The State of the Platform
date: 2014-04-02
categories: [computer science]
tags: [big data, yarn]

---

## Summary

* Article Source: *Apache Hadoop in 2013: The State of the Platform*
* Authors: [Rob Weltman](http://blog.cloudera.com/blog/author/robw/ "Posts by Rob Weltman")

# Apache Hadoop in 2013: The State of the Platform

For several good reasons, 2013 is a Happy New Year for Apache Hadoop
enthusiasts.

In 2012, we saw continued progress on developing the [next generation of
the MapReduce processing
framework](http://blog.cloudera.com/blog/2012/02/mapreduce-2-0-in-hadoop-0-23/)
(MRv2), work that will bear fruit this year. HDFS experienced major
progress toward becoming a lights-out, fully enterprise-ready
distributed filesystem with the addition of [high availability
features](http://blog.cloudera.com/blog/2012/10/quorum-based-journaling-in-cdh4-1/)
and increased performance. And a hint of the future of the Hadoop
platform was provided with the [Beta release of Cloudera
Impala](http://blog.cloudera.com/blog/2012/10/cloudera-impala-real-time-queries-in-apache-hadoop-for-real/),
a real-time query engine for analytics across HDFS and Apache HBase
data.

Let’s look at the highlights of the 2012 developments around projects
supported by Cloudera.

Apache Hadoop Releases
----------------------

The Hadoop 1 code line produced four bug fix releases and two minor
releases (1.1.0 and 1.1.1). Among the new features was the addition of
snappy compression/decompression.

Hadoop 2 saw a renaming from 0.23 and four bug fix releases. Major
elements of the releases:

-   Support/integration for HBase, Pig, Oozie, and other Hadoop family
    members
-   HDFS High Availability (HA)
-   HDFS Federation
-   Performance enhancements in both MapReduce and HDFS

The 0.23 code line (Yahoo only) saw four minor updates. That code line
does not include HDFS HA.

Hadoop Family Releases
----------------------

[Apache](http://zookeeper.apache.org/)[ZooKeeper](http://zookeeper.apache.org/) (distributed
lock manager) produced five bug fix releases.

[Apache HBase](http://hbase.apache.org/) (distributed key-value store on
HDFS) offered two major releases and five minor releases:

-   0.92 – Security, coprocessors, a new and improved storage format,
    distributed log splitting
-   0.94 – Performance, MultiGet functionality for increments and
    appends, online automated table and region repair

[Apache Avro](http://avro.apache.org/) (data serialization) saw six bug
fix releases.

[Apache Hive](http://hive.apache.org/) (SQL-like interface to Hadoop)
had one minor release and one major release:

-   0.9 – Access primitive binary types in HBase, BETWEEN, several
    useful UDFs

[Apache Mahout](http://mahout.apache.org/) (machine learning with
Hadoop) produced two major releases:

-   0.6 – Implementations of AVF algorithm, Lucene filter for
    Collocations, Conjugate Gradient for solving large linear systems,
    Online Passive Aggressive learner, Random Walk with Restarts, and
    many more
-   0.7 – Outlier removal capability in K-Means, Fuzzy K, Canopy and
    Dirichlet Clustering, New Clustering implementation for K-Means,
    Implicit Alternating Least Squares SVD

[Apache Pig](http://pig.apache.org/) (data flow language for Hadoop) had
one minor and one major release:

-   0.10 – boolean datatype, nested cross/foreach, JRuby UDF, limit by
    expression, split default destination, tuple/bag/map syntax support
    and map-side aggregation

[Apache Hama](http://hama.apache.org/) (bulk synchronous parallel
computing for e.g. matrix, graph, and network algorithms) graduated from
the Apache Incubator and provided four major releases. Major additions:

-   Streaming, K-Means, gradient descent BSP, Sparse Matrix-Vector
    multiplication, partitioned files

[Apache Whirr](http://whirr.apache.org/) (libraries for running Cloud
services) had one major and one minor release:

-   0.8 – Support EC2 Cluster Compute Groups for Hadoop, CloudStack;
    Solr as a service

[Apache Flume](http://flume.apache.org/) (streaming data into Hadoop)
graduated from the Incubator and produced four minor releases of the
rewritten high performance Flume NG

[Apache Bigtop](http://bigtop.apache.org/) (packaging, deployment, and
test framework for Hadoop) graduated from the Incubator and had three
major releases:

-   0.3 – Apache Hadoop 1.0
-   0.4 – bootable ISO, box grinder appliance, HDFS HA name nodes,
    Apache Giraph, Hue
-   0.5 – Apache Solr, Apache Crunch (incubating), DataFu

[Apache Giraph](http://giraph.apache.org) (graph processing with Hadoop)
graduated to a Top Level Project after releasing 0.1 as an Incubator
project.

[Apache HCatalog](http://incubator.apache.org/hcatalog/) (extension of
Hive MetaStore) released 0.4.0 as an Incubator project.

[Apache Oozie](http://oozie.apache.org/) (workflow management for
MapReduce, Hive, Pig, and other Hadoop jobs) graduated from the
Incubator and provided one bug fix release and two minor releases:

-   3.2.0 – Hive, Sqoop, and Shell actions, Kerberos SPNEGO
    authentication
-   3.3.0 – Direct submission of MapReduce jobs, parameterization in
    workflow and coordinator jobs

[Apache Sqoop](http://sqoop.apache.org/) (data transfer between Hadoop
and relational databases) graduated from the Incubator and did three bug
fix releases along with a first cut of the next-generation Sqoop 2
(client-server).

[Apache Crunch](http://incubator.apache.org/crunch/) (Java library for
MapReduce pipelines) provided two minor releases as an Incubator
project:

-   0.3 – Map-side joins
-   0.4 – Bloom filters, read from database, launch pipeline from a REPL

[Hue](http://cloudera.github.com/hue/) (Web interface to Hadoop, Hive,
Impala, Oozie, Pig) produced a major release 2.0 and a minor release 2.1
on Github:

-   Redesigned full-page paradigm, LDAP authentication, per-application
    authorization, Oozie workflow/coordinator dashboard and designer,
    localization for eight languages

Hadoop-related Conferences
--------------------------

-   2012 saw the first ever HBase conference –
    [HBaseCon](http://www.hbasecon.com/) in San Francisco in May – with
    over 600 participants.
-   Hadoop World merged with Strata East and had 2,500 attendees –
    almost twice the number of Strata East last year – and it sold out
    in advance.
-   Hadoop Summit went from over 1,600 in 2011 to over 2,100 in 2012.
-   Hadoop was featured at many other conferences during the year,
    including GigaOM Structure, CeBIT Big Data, DataWeek, Berlin
    BuzzWords, ApacheCon, Cloud Computing Expo, OSCON, Strange Loop and
    CloudCon.

Other Hadoop News
-----------------

-   Hadoop [won the “Duke’s Choice”
    award](http://blog.cloudera.com/blog/2012/09/apache-hadoop-wins-dukes-choice-award-is-a-java-ecosystem-mvp/)
    for “extreme innovation” in Java.
-   10gen announced [support for
    Hadoop](http://blog.mongodb.org/post/24610529795/hadoop-streaming-support-for-mongodb),
    as did
    [VMware/](http://www.google.com/url?q=http%3A%2F%2Fwww.infoworld.com%2Fd%2Fapplication-development%2Fspring-java-developers-get-hadoop-integration-187597&sa=D&sntz=1&usg=AFQjCNG8vE0VrjrW2BGp9nX15DJXy8doLg)[SpringSource](http://www.google.com/url?q=http%3A%2F%2Fwww.infoworld.com%2Fd%2Fapplication-development%2Fspring-java-developers-get-hadoop-integration-187597&sa=D&sntz=1&usg=AFQjCNG8vE0VrjrW2BGp9nX15DJXy8doLg),
    [Splunk](http://gigaom.com/2011/11/08/splunk-connects-with-hadoop-to-master-machine-data/),
    [Revolution
    Analytics](http://www.businesswire.com/news/home/20121108005480/en/Revolution-Analytics-Brings-Big-Data-Decision-Trees),
    [SAS](http://www.eweek.com/c/a/Application-Development/SAS-Delivers-Hadoop-Integration-for-Big-Data-Support-868475/),
    [TIBCO](http://www.computerworld.com/s/article/9226918/Tibco_adds_Hadoop_support_to_Spotfire_analytics_tool),
    [QlikTech](http://www.qlikview.com/us/company/press-room/press-releases/2012/en/1114-qliktech-integrates-with-cloudera-impala-deliver-big-data-analytics) and
    others.
-   Cloudera announced the public Beta
    of [Impala](http://www.cloudera.com/content/cloudera/en/about/press-center/press-releases/release.html?ReleaseID=1749377),
    the first real-time SQL query interface to HDFS and HBase data.

Other Hadoop Indicators
-----------------------

-   The percentage of all job postings analyzed
    by [Indeed](http://www.indeed.com/jobanalytics/jobtrends?q=hadoop&l=)
    that mentioned Hadoop almost doubled again over 2011, as it did the
    year before.
-   The Hadoop family mailing lists saw about 101k messages in 2011,
    129k in 2012 (going
    by [markmail.org](http://apache.markmail.org/search/?q=hadoop+date%3A201201-201212+)).
-   The “Powered By” list
    at [http://wiki.apache.org/hadoop/PoweredBy](http://wiki.apache.org/hadoop/PoweredBy)
    went from 157 to 165 entries during the year.
-   Ten new committers were added to core Hadoop in 2012, many more to
    the various Hadoop family projects.

*Rob runs the Platform Engineering team at Cloudera. *

#### Filed under:

-   [Avro](http://blog.cloudera.com/blog/category/avro/ "View all posts in Avro")
-   [CDH](http://blog.cloudera.com/blog/category/cdh/ "View all posts in CDH")
-   [Flume](http://blog.cloudera.com/blog/category/flume/ "View all posts in Flume")
-   [Hadoop](http://blog.cloudera.com/blog/category/hadoop/ "View all posts in Hadoop")
-   [HBase](http://blog.cloudera.com/blog/category/hbase/ "View all posts in HBase")
-   [HDFS](http://blog.cloudera.com/blog/category/hdfs/ "View all posts in HDFS")
-   [Hive](http://blog.cloudera.com/blog/category/hive/ "View all posts in Hive")
-   [Hue](http://blog.cloudera.com/blog/category/hue/ "View all posts in Hue")
-   [Impala](http://blog.cloudera.com/blog/category/impala/ "View all posts in Impala")
-   [Mahout](http://blog.cloudera.com/blog/category/mahout-2/ "View all posts in Mahout")
-   [MapReduce](http://blog.cloudera.com/blog/category/mapreduce/ "View all posts in MapReduce")
-   [Oozie](http://blog.cloudera.com/blog/category/oozie/ "View all posts in Oozie")
-   [Pig](http://blog.cloudera.com/blog/category/pig/ "View all posts in Pig")
-   [Sqoop](http://blog.cloudera.com/blog/category/sqoop/ "View all posts in Sqoop")
-   [Whirr](http://blog.cloudera.com/blog/category/whirr/ "View all posts in Whirr")
-   [YARN](http://blog.cloudera.com/blog/category/yarn/ "View all posts in YARN")
-   [ZooKeeper](http://blog.cloudera.com/blog/category/zookeeper/ "View all posts in ZooKeeper")


# References

[1] Rob Weltman, [*Apache Hadoop in 2013: The State of the Platform*](http://blog.cloudera.com/blog/2013/01/apache-hadoop-in-2013-the-state-of-the-platform/), 2013.
---
layout: post
title: Building a Data Warehouse with Hadoop
date: 2014-07-10
categories: [computer science]
tags: [big data, big data]

---



## Article Source
* Title: [Building a Data Warehouse with Hadoop](http://www.iolap.com/blog/building-a-data-warehouse-with-hadoop/)
* Authors: Prakash Sukumar, Principal Consultant at iOLAP, Inc.

[![](http://sungsoo.github.com/images/datawarehousehadoop.png)](http://sungsoo.github.com/images/datawarehousehadoop.png)



# Building a Data Warehouse with Hadoop 

There have been several advancements within the Hadoop world that have
positioned Hadoop closer to the data warehousing community than ever
before. With a series of Hadoop 2.0 releases starting in October 2013,
Hadoop is now much closer to being a platform for a data warehouse.

Hadoop is moving towards an architecture that is similar to a massively
parallel processing (MPP) platform for data warehouses.  It now has the
added capability of being able to pick and choose hardware and software
that churn huge amounts of data, including the capability of processing
non-relational data.

In a nutshell, the new Hadoop platform, combined with new offerings from
third-party vendors, has potential to be both:

-   A data warehouse by itself.
-   A platform for pre-processing data before loading data to a data
    warehouse.

With respect to the use of Hadoop within a data warehouse, it can be any
or all of the following:

-   A pre-processing staging area for large amounts of data that will be
    used as source for a data warehouse.
-   A platform that holds large amounts of data on inexpensive commodity
    hardware that can be scaled up or down on an as-needed basis for
    exploratory-type data analysis.
-   A platform where non-relational data can be stored, which then
    extends traditional data warehousing analytical capabilities. For
    instance, a data warehouse “confirmed” customer can be used in a
    Hadoop cluster to also analyze that confirmed customer’s call to do
    sentiment analysis.
-   A place for archiving data that is “queryable” unlike traditional
    tapes/flat files where data cannot be easily queried or accessed.

While it has been a much discussed fact that a Hadoop platform augments
an existing data warehouse, it is far from the reality of completely
replacing an existing data warehouse with Hadoop platform.

The concept of replacing an existing data warehouse with Hadoop is still
in its early stages.  However, it is promising to see the new Hadoop
capabilities, in combination with interfaces supported by vendors, that
are making it a strong contender.

Bill Inmon has written in various places that he sees no relationship
between Big Data and data warehouses, and still believes the Hadoop file
system is only good to augment existing data warehouses. Ralph Kimball
has taken a step forward in making it clear that Hadoop can be used as a
platform for a destination data warehouse.

He has observed there are now major BI and Data Integration vendors that
have interfaces in their tools for accessing data in the Hadoop platform
that leverages features from the latest Hadoop release.

Below are three key advancements in Hadoop that promote the case for
data warehousing:

## YARN resource manager

YARN is a sub-project of Apache Hadoop 2.0 that separates resource
management and processing components. Previously every tool/application
that interfaces with Hadoop had to use Map/Reduce to access and process
data stored in Hadoop. Developers were constrained to the limitations of
Map/Reduce.

With YARN, applications can now manage resources independently of
Map/Reduce and use Map/Reduce just for processing data. Due to the
separation, applications can use their own logic for data processing
other than Map/Reduce.

For instance, for Hadoop 1.0, IBM had Adaptive Map/Reduce technology for
managing jobs that needed low latency isolated from batch processing.
Now this capability is supported by YARN such that every vendor can
utilize the resource scheduling/prioritization based on need.

[![Hadoop
2.0](http://www.iolap.com/blog/wp-content/uploads/2014/04/Hadoop-2.0.png)](http://www.iolap.com/blog/wp-content/uploads/2014/04/Hadoop-2.0.png)
   
## No longer reliant on Map/Reduce

Until now, Map/Reduce was the biggest bottleneck due to its higher
latency batch processing architecture. Map/Reduce was meant for
indexing/sorting web pages and it worked very well for the purpose. Now
with support of data processing other than Map/Reduce, vendors such as
IBM and Cloudera are coming up with their own data processing
capabilities that retrieve data faster than ever before.  For example,
Cloudera’s Impala query engine now can process SQL queries on Hadoop
about 10x faster compared to regular Hive SQL that uses Map/Reduce
behind the scenes. Cloudera uses in-memory data processing for accessing
data using SQL.

Similarly there are other vendors, such as MammothDB, who are also
providing in-memory capability to reduce query latency thus helping
tools query Hadoop similar to a traditional data warehouse. Same goes
with IBM’s BigSQL that claims faster processing than Map/Reduce based
Hive SQL processing.

The Microsoft/HortonWorks Stinger query engine claims 100X faster than
Hive SQL for accessing data directly on Hadoop.

The tedious, painstaking Map/Reduce component is no longer a mandatory
skillset necessary for developers.

## In-Memory data processing

Today Hadoop is primarily used for batch processing where the data is
written once and data processing is performed multiple times over the
entire set sequentially. HDFS is not suitable for real time or online
applications that require random access and support thousands of
concurrent users at predictably low latencies. As a result, Hadoop is
plagued with the same challenges as other MPP technologies in keeping up
with the user concurrency requirement of their BI needs. With in-memory
data processing, it brings the important potential of having enormous
user concurrency and very low latency for data in a Hadoop cluster. This
is very similar to the in-memory solution in a regular data warehouse.
With the architecture of HDFS, you can leverage distributed memory
across a large farm of commodity servers to offer very low latency SQL
queries and updates.

Similar to other in-memory databases/solutions, a key thing to consider
is that every dataset needing to utilize in-memory access will still
need to be cached in advance.

With the Hadoop 2.0/YARN, Spark is included in the release. SPARK
performs in-memory data processing on the HDFS file system.  It is about
100x faster than regular Hadoop map/reduce data processing.

In March, 2014, Gartner ([www.gartner.com](http://www.gartner.com/))
released its *Magic Quadrant for Data Warehouse Database Management
Systems*—and for first time it included the Big Data vendor, Cloudera,
in its database recommendations.  While Cloudera is within the “niche
player” category and not within the challengers/leaders, it is still
promising to see its entry among the database management systems.

[![Gartner
Quad](http://www.iolap.com/blog/wp-content/uploads/2014/04/Gartner-Quad.png)](http://www.iolap.com/blog/wp-content/uploads/2014/04/Gartner-Quad.png)

In their analysis, Gartner does have a cautionary disclaimer,
*“Cloudera**is moving forward with its ‘data hub’ alternative to
traditional data warehousing (a form of LDW). This is a diverse model
that will be a challenge for its bandwidth to deliver.”*

Despite all that is being discussed, the actual question of “can Hadoop
really replace a Data Warehouse?” is still in its infancy.  Although
vendors are now providing SQL capabilities that are getting data out of
Hadoop much faster than before, it is still no match for the traditional
SQL capabilities of a regular RDBMS.  There is still a long way to go in
getting the performance of normal SQL queries on Hadoop.

## Summary

All query engines discussed above have limitations and are not as robust
and mature as the standard SQL query that runs on traditional
warehouses. We still cannot expect to build a data warehouse on Hadoop
in its entirety and expect business users to easily and quickly access
data using these tools—yet.   An in-memory solution is not suitable for
all type of data warehouse needs either.  But this is definitely a huge
step forward considering where Hadoop 1.0 was just a year ago.

### About the Author

Prakash Sukumar is a Principal Consultant at iOLAP, Inc., and
specializes in Data Architecture.  He has had many years of experience
architecting data warehouses in various capacities. Prakash has special
interest in emerging technologies and is always looking for new and
promising methods and technologies that help businesses perform better.



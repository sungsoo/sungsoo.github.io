---
layout: post
title: Big Data Architecture Capabilities
date: 2014-06-17
categories: [computer science]
tags: [big data]

---



[![](http://sungsoo.github.com/images/capabilities.png)](http://sungsoo.github.com/images/capabilities.png)

---

# Big Data Architecture Capabilities

Here is a brief outline of *Big Data capabilities* and their primary technologies:


## Storage and Management Capability

### Hadoop Distributed File System (HDFS)


* An Apache open source distributed file system, [http://hadoop.apache.org](http://hadoop.apache.org)
* Expected to run on *high-performance commodity hardware*
* Known for highly scalable storage and automatic data replication across three nodes for fault tolerance
* Automatic data replication across three nodes eliminates need for backup
* Write once, read many times 

### Cloudera Manager


* Cloudera Manager is an end-to-end management application for Cloudera’s Distribution of Apache Hadoop, [http://www.cloudera.com](http://www.cloudera.com)
* Cloudera Manager gives a cluster-wide, real-time view of nodes and services running; provides a single, central place to enact configuration changes across the cluster; and incorporates a full range of reporting and diagnostic tools to help optimize cluster performance and utilization.

## ￼Database Capability

### Oracle NoSQL

* *Dynamic* and *flexible* schema design. High performance key value pair database. Key value
pair is an alternative to a pre-defined schema. Used for *non-predictive* and dynamic data.
* Able to efficiently process data without a row and column structure. Major + Minor key paradigm allows multiple record reads in a single API call
* Highly scalable multi-node, multiple data center, fault tolerant, *ACID operations*
* Simple programming model, random index reads and writes
* Not Only SQL. Simple pattern queries and custom-developed solutions to access data such as Java APIs.


### Apache HBase 


* Allows random, real time read/write access
* Strictly consistent reads and writes
* Automatic and configurable *sharding* of tables
* Automatic failover support between Region Servers


### Apache Cassandra


* Data model offers column indexes with the performance of log-structured updates, materialized views, and built-in caching
* Fault tolerance capability is designed for every node, replicating across multiple datacenters
* Can choose between synchronous or asynchronous replication for each update 


### Apache Hive


* Tools to enable easy data *extract/transform/load* (ETL) from files stored either directly in Apache HDFS or in other data storage systems such as Apache HBase
* Uses a simple SQL-like query language called HiveQL
* Query execution via MapReduce

## Processing Capability

### MapReduce

* Defined by Google in 2004. 
* Break problem up into smaller sub-problems
* Able to distribute data workloads across thousands of nodes
* Can be exposed via SQL and in SQL-based BI tools

### Apache Hadoop


* Leading MapReduce implementation
* Highly scalable parallel batch processing
* Highlycustomizableinfrastructure
* Writes multiple copies across cluster for fault tolerance

## Data Integration Capability

### Oracle Big Data Connectors, Oracle Loader for Hadoop, Oracle Data Integrator


* Exports MapReduce results to RDBMS, Hadoop, and other targets
* Connects Hadoop to relational databases for SQL processing
* Includes a graphical user interface integration designer that generates Hive scripts to move and transform MapReduce results
* Optimized processing with parallel data import/export
* Can be installed on Oracle Big Data Appliance or on a generic Hadoop cluster

## Statistical Analysis Capability
### Open Source Project R and Oracle R Enterprise


* Programming language for statistical analysis 
* Introduced into Oracle Database as a SQL extension to perform high performance in- database statistical analysis 
* Oracle R Enterprise allows reuse of pre-existing R scripts with no modification


# References
[1] *Oracle Information Architecture: An Architect’s Guide to Big Data*, An Oracle White Paper in Enterprise Architecture, August 2012.
￼￼￼￼￼￼￼￼
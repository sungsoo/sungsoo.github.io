---
layout: post
title: Apache Drill
date: 2014-03-05 
categories: [computer science]
tags: [hadoop, mapreduce]

---

Drill Overview
---

Apache Drill is an open-source software framework that supports data-intensive distributed applications for interactive analysis of large-scale datasets. Drill is the open source version of [Google's Dremel](http://research.google.com/pubs/pub36632.html) system which is available as an IaaS service called Google BigQuery. One explicitly stated design goal is that Drill is able to scale to 10,000 servers or more and to be able to process petabyes of data and trillions of records in seconds. Currently, Drill is incubating at Apache.

High Level Concept
---

There is a strong need in the market for low-latency interactive analysis of large-scale datasets, including nested data (eg, JSON, Avro, Protocol Buffers). This need was identified by Google and addressed internally with a system called Dremel.

In recent years open source systems have emerged to address the need for scalable batch processing (Apache Hadoop) and stream processing (Storm, Apache S4). Apache Hadoop, originally inspired by Google's internal MapReduce system, is used by thousands of organizations processing large-scale datasets. Apache Hadoop is designed to achieve very high throughput, but is not designed to achieve the sub-second latency needed for interactive data analysis and exploration. Drill, inspired by Google's internal Dremel system, is intended to address this need.

It is worth noting that, as explained by Google in the original paper, Dremel complements MapReduce-based computing. Dremel is not intended as a replacement for MapReduce and is often used in conjunction with it to analyze outputs of MapReduce pipelines or rapidly prototype larger computations. Indeed, Dremel and MapReduce are both used by thousands of Google employees.

Like Dremel, Drill supports a nested data model with data encoded in a number of formats such as JSON, Avro or Protocol Buffers. In many organizations nested data is the standard, so supporting a nested data model eliminates the need to normalize the data. With that said, flat data formats, such as CSV files, are naturally supported as a special case of nested data.

# How to build and run Apache Drill

Prerequisites
---

Currently, the Apache Drill build process is known to work on Linux, Windows and OSX.  To build, you need to have the following software installed on your system to successfully complete a build. 
  * Java 7+
  * protoc 2.5.x compiler
  * Maven 3.0+

Confirm settings
---

    # protoc --version
    libprotoc 2.5.0
    
    # java -version
    java version "1.7.0_09"
    Java(TM) SE Runtime Environment (build 1.7.0_09-b05)
    Java HotSpot(TM) 64-Bit Server VM (build 23.5-b02, mixed mode)
    
    # mvn --version
    Apache Maven 3.0.3 (r1075438; 2011-02-28 09:31:09-0800)

Checkout
---

    git clone https://github.com/apache/incubator-drill.git
    
Build
---

    cd incubator-drill
    mvn clean install
    
Start SQLLine
---

    ./sqlline -u jdbc:drill:schema=parquet-local -n admin -p admin

Run a query
---

    SELECT 
      _MAP['R_REGIONKEY'] AS region_key, 
      _MAP['R_NAME'] AS name, _MAP['R_COMMENT'] AS comment
    FROM "sample-data/region.parquet";
    
More information 
---

For more information including how to run a Apache Drill cluster, visit the [Apache Drill Wiki](https://cwiki.apache.org/confluence/display/DRILL/Apache+Drill+Wiki)




References
---
[1] [*Apache Drill Overview*](http://incubator.apache.org/drill/drill_overview.html), 2012.


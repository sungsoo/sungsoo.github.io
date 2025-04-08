---
layout: post
title: Apache Drill
date: 2014-03-05 
categories: [computer science]
tags: [big data]

---

What is Apache Drill?
---

Apache Drill is a distributed system for *interactive* analysis of *large-scale* datasets. Drill is similar to [**Google's Dremel**](http://research.google.com/pubs/pub36632.html), with the additional flexibility needed to support a broader range of query languages, data formats and data sources. It is designed to efficiently process *nested* data. It is a design goal to scale to 10,000 servers or more and to be able to process *petabyes* of data and *trillions* of records in seconds.

Many organizations have the need to run *data-intensive* applications, including *batch processing*, *stream processing* and *interactive analysis*. In recent years open source systems have emerged to address the need for scalable *batch* processing (Apache Hadoop) and *stream* processing (Storm, Apache S4). In 2010 Google published a paper called “*Dremel: Interactive Analysis of Web-Scale Datasets*,” describing a scalable system used internally for interactive analysis of nested data. No open source project has successfully replicated the capabilities of Dremel.

Why is MapR involved in the Drill Project?
---

**MapR** is a recognized as the leading **Hadoop** innovator and is dedicated to providing the best Big Data processing capabilities. MapR is committed to a highly transparent, open source project so that best architecture can be put in place to ensure a high quality and flexible solution. This includes developing and defining open APIs to ensure a robust ecosystem. Apache Drill represents a huge leap forward for organizations looking to augment their *Big Data processing with interactive queries* across massive data sets. Driving Drill as an open source project reduces the barriers to adopting a new set of Big Data APIs.

How is Apache Drill different from HBase™?
---

Drill provides a *distributed execution engine* for interactive queries. HBase™ represents a supported data source for Drill.

 	
How is Apache Drill different from Hive, Pig and Cascading?
---

Today these systems compile higher-level languages (eg, HiveQL, Pig Latin) into MapReduce jobs. Once Drill is available, these systems may support Drill as an underlying low-latency execution engine, enabling interactive queries across billions of records. Chris Wensel, the author of Cascading, is collaborating with MapR on this project and is one of the initial committers.

Where can I find more information about Drill?
---

[http://incubator.apache.org/drill/](http://incubator.apache.org/drill/)  
 
Please contact drill@mapr.com with questions.  
Follow @ApacheDrill on Twitter.

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
[2] [*Apache Drill MapR*](http://www.mapr.com/resources/community-resources/apache-drill), 2012.  
[3] [ApacheDrill; Interactive Ad-Hoc Analysis at Scale](http://www.mapr.com/sites/default/files/apache_drill_interactive_ad-hoc_query_at_scale-hausenblas_nadeau1.pdf), White Paper, 



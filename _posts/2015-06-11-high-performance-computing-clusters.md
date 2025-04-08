---
layout: post
title: High-Performance Computing Cluster
date: 2015-06-11
categories: [computer science]
tags: [big data, parallel computing]

---

## Article Source
* Title: [HPCC](http://en.wikipedia.org/wiki/HPCC)
* Authors: Nicole Hemsoth



---

High-Performance Computing Cluster 
====


**HPCC** (High-Performance Computing Cluster), also known as **DAS**
(Data Analytics Supercomputer), is an open source, [data-intensive
computing](http://en.wikipedia.org/wiki/Data-intensive_computing "Data-intensive computing")
system platform developed by [LexisNexis](http://en.wikipedia.org/wiki/LexisNexis "LexisNexis")
Risk Solutions. The HPCC platform incorporates a [software
architecture](http://en.wikipedia.org/wiki/Software_architecture "Software architecture")
implemented on [commodity computing
clusters](http://en.wikipedia.org/wiki/Commodity_computing "Commodity computing") to provide
high-performance, data-parallel processing for applications utilizing
[big data](http://en.wikipedia.org/wiki/Big_data "Big data"). The HPCC platform includes system
configurations to support both parallel batch data processing (Thor) and
high-performance online query applications using indexed data files
(Roxie). The HPCC platform also includes a data-centric declarative
programming language for parallel data processing called
[ECL](http://en.wikipedia.org/wiki/ECL_(data-centric_programming_language) "ECL (data-centric programming language)").

The public release of HPCC was announced in 2011, after ten years of
in-house development (according to LexisNexis). It competes directly
with [Hadoop](http://en.wikipedia.org/wiki/Hadoop "Hadoop").


## System architecture

[![](http://sungsoo.github.com/images/Fig2_Thor_Cluster.jpg)](http://sungsoo.github.com/images/Fig2_Thor_Cluster.jpg)  

**Figure 2. Thor processing cluster**

The HPCC system architecture includes two distinct cluster processing
environments, each of which can be optimized independently for its
parallel data processing purpose. The first of these platforms is called
a data refinery whose overall purpose is the general processing of
massive volumes of raw data of any type for any purpose but typically
used for data cleansing and hygiene, [extract, transform,
load](http://en.wikipedia.org/wiki/Extract,_transform,_load "Extract, transform, load")
processing of the raw data, record linking and entity resolution,
large-scale ad-hoc complex analytics, and creation of keyed data and
indexes to support high-performance structured queries and data
warehouse applications. The data refinery is also referred to as
[Thor](http://en.wikipedia.org/wiki/Thor "Thor"), a reference to the mythical Norse god of
thunder with the large hammer symbolic of crushing large amounts of raw
data into useful information. A Thor cluster is similar in its function,
execution environment, filesystem, and capabilities to the Google and
Hadoop MapReduce platforms.

Figure 2 shows a representation of a physical Thor processing cluster
which functions as a batch job execution engine for scalable
data-intensive computing applications. In addition to the Thor master
and slave nodes, additional auxiliary and common components are needed
to implement a complete HPCC processing environment.

[![](http://sungsoo.github.com/images/Fig3_Roxie_Cluster.jpg)](http://sungsoo.github.com/images/Fig3_Roxie_Cluster.jpg)  

**Figure 3. Roxie processing cluster**

The second of the parallel data processing platforms is called Roxie and
functions as a rapid data delivery engine. This platform is designed as
an online high-performance structured query and analysis platform or
data warehouse delivering the parallel data access processing
requirements of online applications through Web services interfaces
supporting thousands of simultaneous queries and users with sub-second
response times. Roxie utilizes a [distributed indexed
filesystem](http://en.wikipedia.org/wiki/Distributed_file_system "Distributed file system") to
provide parallel processing of queries using an optimized execution
environment and filesystem for high-performance online processing. A
Roxie cluster is similar in its function and capabilities to Hadoop with
HBase and Hive capabilities added, and provides for near real time
predictable query latencies. Both Thor and Roxie clusters utilize the
ECL programming language for implementing applications, increasing
continuity and programmer productivity.

Figure 3 shows a representation of a physical Roxie processing cluster
which functions as an online query execution engine for high-performance
query and data warehousing applications. A Roxie cluster includes
multiple nodes with server and worker processes for processing queries;
an additional auxiliary component called an ESP server which provides
interfaces for external client access to the cluster; and additional
common components which are shared with a Thor cluster in an HPCC
environment. Although a Thor processing cluster can be implemented and
used without a Roxie cluster, an HPCC environment which includes a Roxie
cluster should also include a Thor cluster. The Thor cluster is used to
build the distributed index files used by the Roxie cluster and to
develop online queries which will be deployed with the index files to
the Roxie cluster.

[![](http://sungsoo.github.com/images/Fig4b_HPCC.jpg)](http://sungsoo.github.com/images/Fig4b_HPCC.jpg)  

**Figure 4. HPCC software architecture**

## Software architecture

The HPCC software architecture incorporates the Thor and Roxie clusters
as well as common [middleware](http://en.wikipedia.org/wiki/Middleware "Middleware")
components, an external communications layer, client interfaces which
provide both end-user services and system management tools, and
auxiliary components to support monitoring and to facilitate loading and
storing of filesystem data from external sources. An HPCC environment
can include only Thor clusters, or both Thor and Roxie clusters. The
overall HPCC software architecture is shown in Figure 4.


## References

1.  ["LexisNexis Will Open-Source Its Hadoop
    Alternative for Handling Big
    Data"](http://readwrite.com/2011/06/15/lexisnexis-open-sources-its-hadoop-alternative).
    *ReadWrite*. 15 June 2011. Retrieved 20 November 2014. 

## External links

-   [Sandia sees data management challenges
    spiral](http://www.hpcprojects.com/news/news_story.php?news_id=922)
-   [Sandia National Laboratories Leverages the Data Analytics
    Supercomputer (DAS) by LexisNexis Risk & Information Analytics
    Group, Which Offers Breakthrough High Performance Computing to
    Address Data Management and Analysis
    Challenges](http://www.businesswire.com/news/home/20090728005267/en/Sandia-National-Laboratories-Leverages-Data-Analytics-Supercomputer)
-   [Programming models for the LexisNexis High Performance Computing
    Cluster](http://www.lanl.gov/orgs/hpc/salishan/salishan2010/pdfs/John%20Holt.pdf)
-   [LexisNexis Data Analytics
    Supercomputer](http://www.gtra.org/attachments/567_Data%20Sheet%20-%20LexisNexis%20Data%20Analytics%20Supercomputer.pdf)
-   [LexisNexis HPCC Systems](http://hpccsystems.com)
-   [Reference to the term BORPS (Billions of Records Per
    Second)](http://findarticles.com/p/articles/mi_m0EIN/is_2001_Feb_28/ai_70924764/)
-   [LexisNexis Brings Its Data Management Magic To Bear on Scientific
    Data](http://www.hpcwire.com/hpcwire/2009-07-23/lexisnexis_brings_its_data_management_magic_to_bear_on_scientific_data.html)



---
layout: post
title: Tez Design - Introduction
date: 2014-02-10 
categories: [computer science]
tags: [hadoop, mapreduce, tez]

---


Tez Design - Introduction
---
Apache Hadoop 2.0 (aka **YARN**) continues to make its way through the open source community process at the Apache Software Foundation and is getting closer to being declared “ready” from a community development perspective. YARN on its own provides many *benefits* over Hadoop 1.x and its Map-Reduce job execution engine:  

* Concurrent cluster applications via multiple independent AppMasters  
* Reduced job startup overheads  
* Pluggable scheduling policy framework  
* Improved security framework


The support for 3rd party AppMasters is the crucial aspect to flexibility in YARN. It permits new job runtimes in addition to classical map-reduce, whilst still keeping M/R available and allowing both the old and new to co-exist on a single cluster. **Apache Tez** is one such job runtime that provides richer capabilities than traditional map- reduce. The motivation is to provide a better runtime for scenarios such as *relational-querying* that do not have a strong affinity for the map-reduce primitive. This need arises because the Map-Reduce primitive mandates a very particular shape to every job and although this mandatory shape is very general and can be used to implement essentially any batch-oriented data processing job, it conflates too many details and provides too little flexibility.  

### Behavior of a Map-Reduce job under Hadoop 1.x

1. Client-side determination of input pieces2. Job startup3. Map phase, with optional in-process combinerEach mapper reads input from durable storage4. Hash partition with local per-bucket sort.5. Data movement via framework initiated by reduce-side pullmechanism6. Ordered merge7. Reduce phase8. Write to durable storage

The map-reduce primitive has proved to be very useful as the basis of a *reliable* cluster computation runtime and it is well suited to data processing tasks that involve a small number of jobs that benefit from the standard behavior. However, algorithms that require many *iterations* suffer from the *high overheads* of job startup and from frequent reads and writes to durable storage. **Relation query languages** such as **Hive** suffer from those issues and from the need to massage multiple datasets into homogeneous inputs as a M/R job can only consume one physical dataset (excluding support for side-data channels such as *distributed cache*).

Tez aims to be a general purpose execution runtime that enhances various scenarios that are not well served by classic Map-Reduce. In the short term the major focus is to support **Hive** and **Pig**, specifically to enable performance improvements to batch and ad-hoc interactive queries. Specific support for additional scenarios may be added in the future.
Systems similar in spirit to Tez have been developed academically and commercially. Some notable examples are Dryad, HTCondor, Clustera, Hyracks, and Nephele-PACTS.Tez pre-requisites
---
For normal operation, Tez assumes:
* A *cluster* running YARN
* Access to a *durable shared filesystem* accessible through Hadoop Filesystem 
interface
Tez can operate in debugging scenarios that do not require a full cluster. This mode uses instantiations of HDFS and YARN running in a *single process*.What services will Tez provide
---
Tez provides *runtime components*:  

* An execution environment that can handle traditional map-reduce jobs  
* An execution environment that handles *DAG-based jobs* comprising various built-in and extendable primitives.  
* Cluster-side determination of input pieces.  
* Runtime planning such as *task cardinality determination* and *dynamic modification* to the DAG structure.

Tez provides *APIs* to access these services:  

* Traditional map-reduce functionality is accessed via java classes written to the Job interface: org.apache.hadoop.mapred.Job and/or org.apache.hadoop.mapreduce.v2.app.job.Job; and by specifying in yarn-site that the map-reduce framework should be Tez.  
* DAG-based execution is accessed via the new Tez DAG API: org.apache.tez.dag.api.** , org.apache.tez.engine.api.***.


Tez provides pre-made primitives for use with the **DAG API** (org.apache.tez.engine.common.*)

* Vertex Input  
* Vertex Output  
* Sorting  
* Shuffling  
* Merging  
* Data transferReferences
---
[1] [http://hortonworks.com/blog/introducing-tez-faster-hadoop-processing/](http://hortonworks.com/blog/introducing-tez-faster-hadoop-processing/)  
[2] [http://hortonworks.com/blog/45x-performance-increase-for-hive/](http://hortonworks.com/blog/45x-performance-increase-for-hive/)   
[3] [http://hortonworks.com/blog/moving-hadoop-beyond-batch-with-apache-yarn/](http://hortonworks.com/blog/moving-hadoop-beyond-batch-with-apache-yarn/)  
[4] [http://hortonworks.com/blog/moving-hadoop-beyond-batch-with-apache- yarn/?mkt_tok=3RkMMJWWfF9wsRolsqTPZKXonjHpfsX57uUkXKO2lMI%2F0ER3fOvrPUfGjI4DRcRjI%2BSLDwEYGJlv 6SgFT7TMMbFh1rgNUxc%3D](http://hortonworks.com/blog/moving-hadoop-beyond-batch-with-apache- yarn/?mkt_tok=3RkMMJWWfF9wsRolsqTPZKXonjHpfsX57uUkXKO2lMI%2F0ER3fOvrPUfGjI4DRcRjI%2BSLDwEYGJlv 6SgFT7TMMbFh1rgNUxc%3D)  
[5] [*Clustera: An Integrated ComputationAnd Data Management System*](http://www.vldb.org/pvldb/1/1453865.pdf), PVLDB '08, August 23-28, 2008, Auckland, New ZealandCopyright 2008 VLDB Endowment.
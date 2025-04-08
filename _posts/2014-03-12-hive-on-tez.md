---
layout: post
title: Hive on Tez
date: 2014-03-12 
categories: [computer science]
tags: [big data, tez]

---

### Summary

* Article Source: [*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages)  
* Author: Gunther Hagleitner

tez-autobuild
=============

To set up hive-tez on an HDP2 Sandbox VM, log in as root and in this repo, do

    # make dist install

That should pull tez, hive-tez, build it and install it locally in /opt/hive/

To test this out, you can do

    # /opt/hive/bin/hive
    hive> select count(1) from sample_07;

and it should use Tez instead of the default MR API.

FYI, disabling Tez after you run 1 query doesn't work quite right, but I gave it a perf run


To compare performance, you can disable it at the beginning

    # /opt/hive/bin/hive
    hive> set hive.optimize.tez=false;   
    hive> select count(1) from sample_07;
    ...
    Time taken: 39.176 seconds, Fetched: 1 row(s)
    hive> select count(1) from sample_07;
    Time taken: 37.782 seconds, Fetched: 1 row(s)

versus the Tez run 

    # /opt/hive/bin/hive
    hive> select count(1) from sample_07;
    Time taken: 15.517 seconds, Fetched: 1 row(s)
    hive> select count(1) from sample_07;
    Time taken: 4.207 seconds, Fetched: 1 row(s)

The tez memory settings have been tuned down to fit inside a 4Gb VM.

If you have a bigger VM/actual HDP2 cluster, it makes sense to edit the tez-site.xml where it says 512 & -Xmx400m to 8192 & -Xmx7168.

And for anything you want to override in local settings (like HIVE_CONF_DIR), create a file named local.mk and add the Makefile variables to that file.

# Overview


[Tez](http://incubator.apache.org/projects/tez.html) is a new application framework built on Hadoop Yarn that can execute *complex directed acyclic graphs* of general data processing tasks. In many ways it can be thought of as a more flexible and powerful successor of the *map-reduce framework*.

It generalizes map and reduce tasks by exposing interfaces for generic data processing tasks, which consist of a triplet of interfaces: **input**, **output** and **processor**. These tasks are the *vertices* in the execution graph. *Edges* (i.e.: data connections between tasks) are first class citizens in Tez and together with the input/output interfaces greatly increase the *flexibility* of how data is transferred between tasks.

Tez also greatly extends the possible ways of which individual tasks can be linked together; In fact any arbitrary **DAG** can be executed directly in Tez.

In Tez parlance a map-reduce job is basically a simple DAG consisting of a *single map and reduce vertice* connected by a *“bipartite” edge* (i.e.: the edge connects every map task to every reduce task). Map input and reduce outputs are HDFS inputs and outputs respectively. The map output class locally sorts and partitions the data by a certain key, while the reduce input class merge-sorts its data on the same key.

Tez also provides what basically is a *map-reduce compact layer* that let’s one run MR jobs on top of the *new execution layer* by implementing Map/Reduce concepts on the new execution framework.

More information about Tez can be found here. 

* Tez apache page: [http://incubator.apache.org/projects/tez.html](http://incubator.apache.org/projects/tez.html)
* Tez design doc: [https://issues.apache.org/jira/browse/TEZ-65](https://issues.apache.org/jira/browse/TEZ-65)
* Tez presentation: [http://www.youtube.com/watch?v=9ZLLzlsz7h8]()http://www.youtube.com/watch?v=9ZLLzlsz7h8)
* Tez slides: [http://www.slideshare.net/Hadoop_Summit/murhty-saha-june26255pmroom212](http://www.slideshare.net/Hadoop_Summit/murhty-saha-june26255pmroom212)

**Hive** uses map-reduce as its execution engine. Any query will produce a graph of MR jobs potentially interspersed with some local/client-side work. This leads to many inefficiencies in the planning and execution of queries. Here are some examples that can be improved by using the more flexible Tez primitives.

Multiple reduce stages
---

Whenever a query has multiple reduce sinks (that cannot be combined, i.e.: no correlation between the partition keys), hive will break the plan apart and submit one MR job per sink. All of the MR jobs in this chain need to be scheduled one-by-one and each one has to re-read the output of the previous job from HDFS and shuffle it. In Tez several reduce sinks can be linked directly and data can be pipelined without the need of temporary HDFS files. This pattern is referred to as MRR (**Map - reduce - reduce**).

Pipelining
---

More than just MRR, Tez allows for sending the entire query plan at once thus enabling the framework to allocate resources more intelligently as well as pipelining data through the various stages. This is a huge improvement for more complicated queries as it eliminates IO/sync barriers and scheduling overhead between individual stages. An example would be a query that aggregates two tables in subqueries in the from clause and joins the resulting relations.

In memory versus disk writes
---

Currently any shuffle is performed the same way regardless of the data size. Sorted partitions are written to disk, pulled by the reducers, merge-sorted and then fed into the reducers. Tez allows for small datasets to be handled entirely in memory, while no such optimization is available in map-reduce. Many warehousing queries sort or aggregate small datasets after the heavy lifting is done. These would benefit from an in memory shuffle.

Joins
---

Distributed join algorithms are difficult to express in map-reduce. A regular shuffle join for instance has to process different inputs in the same map task, use tags to be written to disk for distinguishing tables, use secondary sort to get the rows from each table in a predictable order, etc. Tez is a much more natural platform to implement these algorithms.
For example, It is possible to have one Tez task take multiple bipartite edges as input thus exposing the input relations directly to the join implementation. The case where multiple tasks feed into the same shuffle join task will be referred to as multi-parent shuffle join.

Fine-tuned algorithms
---

All sorting in map-reduce happens using the same binary sort, regardless of the data type. Hive might for instance choose to use a more effective integer-only sort when possible. Tez makes that available.
Since hive uses map-reduce to compute aggregations, processing will always boil down to a sort-merge even though we’re not actually interested in the sort order. Tez will allow for more efficient hash-based algorithms to do the same.

Limit processing
---

Tez allows complete control over the processing, including being able to stop processing when limits are met (without simply skipping records or relying on file formats/input formats.) It’s also possible to define specific edge semantics, which could be used to provide a generic top-k edge to simplify “limit” processing.
ache Tez team

# RefeGunther Hagleitner
[[*Hive on Tez*](https://cwiki.apache.org/confluence/display/Hive/Hive+on+Tez#HiveonTez-Multiplereducestages)-0Apache Hive Design DocumentationOMJanD3E TEAM, March 10, 2014.
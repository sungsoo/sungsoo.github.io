---
layout: post
title: SpatialSpark
date: 2015-04-13
categories: [computer science]
tags: [big data]

---


# SpatialSpark: Big Spatial Data Process using Spark

* Article Source: [SpatialSpark: Big Spatial Data Process using Spark](http://simin.me/projects/spatialspark/)


Introduction
------------

We aim to implement a set of spatial operations dedicated for big
spatial data using [Apache Spark](http://spark.apache.org/). Since
Aparch Spark claims that its significant improvement comparing with
Hadoop MapReduce (10\~100X faster, according the [project
page](http://spark.apache.org/)), we decide to develop this project
natively in Spark.

Spatial Join Processing
-----------------------

We have developed two different spatial join operators, namely broadcast
spatial join and partitioned spatial join. Broadcast spatial join is
designed for joining one big dataset with another small dataset
efficiently. For example, reverse geocoding a very large geo-tagged
tweets dataset to city/county boundaries. This kind of spatial join
involves a big dataset (geo-tagged tweets) and a considerable small
datasets (political boundaries). Partitioned spatial join is more
general for joining two big datasets. The basic idea is
divide-and-conquer and follows similar designs of
[HadoopGIS](https://sites.google.com/site/hadoopgis/). The two big
datasets are divided into small pieces via space decomposition, and each
small piece is processed by a executor.

![broadcast](http://simin.me/projects/spatialspark/figures/broadcast_join.svg)
![partition](http://simin.me/projects/spatialspark/figures/partitioned_join.svg)

More details are in our [technical
report](http://www-cs.ccny.cuny.edu/~jzhang/papers/spatial_cc_tr.pdf).

Spatial Query
-------------

We have implemented range query (window query) with/without index
support. A full scan will be performed to generate query results if no
index exists. Otherwise, an indexed query will be performed using
pre-built index. We plan to develop more efficient index support for
range queries, as well as kNN queries.

![full\_scan](http://simin.me/projects/spatialspark/figures/full_scan.svg)

Code and Report
---------------

Source code is available at
[github](https://github.com/syoummer/SpatialSpark), a techinical report
is [here](http://www-cs.ccny.cuny.edu/~jzhang/papers/spatial_cc_tr.pdf).




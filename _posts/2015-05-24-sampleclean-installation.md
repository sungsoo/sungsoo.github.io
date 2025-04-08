---
layout: post
title: Programming With SampleClean
date: 2015-05-24
categories: [computer science]
tags: [big data]

---


## Article Source

* Title: [sampleclean](http://sampleclean.org)

---

# Programming With SampleClean

Download
========

The SampleClean project is hosted on Github:
[https://github.com/sjyk/sampleclean-async](https://github.com/sjyk/sampleclean-async).

### Latest Release: SampleClean-0.1 [(Jar)](https://github.com/sjyk/sampleclean-async/releases/download/v0.1/sampleclean-v0.1.jar) [(GZip Tar)](https://github.com/sjyk/sampleclean-async/archive/v0.1.tar.gz) [(Zip)](https://github.com/sjyk/sampleclean-async/archive/v0.1.zip)

### Requirements: JDK 1.6+, Scala 2.10.x, Spark 1.0-1.2

Features
========

We provide a set of Scala libraries for Entity Resolution, Crowd
Sourcing, and Approximate Query Processing.

![](http://sampleclean.org/figures/er.png)
**Entity Resolution:** The problem of linking multiple database
representations of the same real world "entity". SampleClean provides a
library and programming API for constructing distributed entity
resolution pipelines.

![](http://sampleclean.org/figures/cs.png)
**Crowd Sourcing:** Entity resolution tasks can be hard to automate and
for reliable results crowdsourcing is a preferred solution. SampleClean
provides a library of crowd sourcing tools that also adaptively learns
through Active Learning. To use crowd sourcing, a pre-requisite is to
run the **[AMPCrowd server](https://amplab.github.io/ampcrowd/)**.

![](http://sampleclean.org/figures/aqp.png)
**Approximate Query Processing:** We often want to know aggregate
statistics of the database (SUM, COUNT, AVG), and to answer these
queries with high accuracy it often suffices to clean a small sample of
data. SampleClean provides the primitives to sample and extrapolate
query results on the sample. 

Programming With SampleClean
============================

You can download the SampleClean jar to include with any Spark programs
or you can clone our github repository to check out the source code. We
have provided a programming guide to help you get started.

[Programming Guide](http://sampleclean.org/guide/)

[Scala Docs](http://sampleclean.org/api/#sampleclean.package)

Quick Start
===========

We will walk through a basic tutorial on how to get SampleClean running
using Spark Shell either locally or on a cluster.

Pre-requisites
--------------

​1. Java Development Kit 7+
[Download](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 2. Scala 2.10.x
[Download](http://www.scala-lang.org/download/2.10.5.html)

Spark and SampleClean Local Installation
----------------------------------------

​1. First create a new directory `mkdir sampleclean`
 2. Download Spark 1.2.x to this directory
[Download](http://www.webhostingjams.com/mirror/apache/spark/spark-1.2.2/spark-1.2.2.tgz)
 3. Untar Spark `tar xvzf spark-1.2.2.tgz`
 4. Build Spark
 `cd spark-1.2.2`
 `sbt/sbt -Phive assembly/assembly`
 5. Download SampleClean to the spark directory
 6. To avoid permission issues on a local deployment, configure hive
with our default config. Download the config to the spark directory
[Download](https://raw.githubusercontent.com/sjyk/sampleclean-async/master/deploy/hive-site.xml.default)

 7. Put the config in the spark configuration folder
`mv hive-site.xml.default conf/hive-site.xml`

Testing Your Installation
-------------------------

​8. Download the example dataset to the spark folder
[Download](https://raw.githubusercontent.com/sjyk/sampleclean-async/master/src/main/resources/restaurant.csv)
 9. Open the Spark shell `./bin/spark-shell --jars sampleclean-v0.1.jar`
10. Import SampleClean `import sampleclean.api.SampleCleanContext` 11.
Create New SampleCleanContext and HiveContext
`val scc = new SampleCleanContext(sc)` 12. Load Example Dataset

```scala
scc.hql("CREATE TABLE 
        restaurant(id String, 
             entity String,
             name String,
             category String,
             city String) 
  ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY 'n'")

scc.hql("LOAD DATA LOCAL INPATH 'restaurant.csv' OVERWRITE INTO TABLE restaurant")
```


 13. Create a working set

```scala
scc.initialize("restaurant","restaurant_working")
```


 14. Count the number of distinct restaurants

```scala
scc.hql("select count(distinct name) from restaurant").collect().foreach(println)
```


 15. Do Entity Resolution

```scala
import sampleclean.clean.deduplication.EntityResolution

val algorithm = EntityResolution.longAttributeCanonicalize(scc,"restaurant_working","name",0.7)

algorithm.exec()

scc.writeToParent("restaurant_working")
```


 16. Count the number of distinct restaurants

```scala
scc.hql("select count(distinct name) from restaurant").collect().foreach(println)
```



Using the Crowd
---------------

​19. Configure crowd tasks (if you installed AMPCrowd earlier):

```scala
import sampleclean.crowd._
val crowdConfig = CrowdConfiguration(crowdName=”internal”, 
     crowdServerHost=”127.0.0.1”, 
     crowdServerPort=443)

val taskParams = CrowdTaskConfiguration(votesPerPoint=1, maxPointsPerTask=10)
```


 20. Add a crowd matching step to the entity resolution algorithm

```scala
val crowdMatcher = EntityResolution.createCrowdMatcher(scc, “name” , “restaurant_working”)
crowdMatcher.alstrategy.setCrowdParameters(crowdConfig)
crowdMatcher.alstrategy.setTaskParameters(taskParams)
val crowdAlgorithm = EntityResolution.longAttributeCanonicalize(scc,"restaurant_working","name",0.6)
crowdAlgorithm.components.addMatcher(crowdMatcher) 
```


 21. Run the crowd-driven entity resolution (creating crowd tasks)
`crowdAlgorithm.exec()`
 22. Do some crowd tasks (navigate your browser to
http://127.0.0.1:8000/crowds/internal/) 
 23. Persist the new results `scc.writeToParent("restaurant_working")`
 24. Count the number of distinct restaurants

```scala
scc.hql("select count(distinct name) from restaurant").collect().foreach(println)
```


 25. Exit `exit`

Cluster Installation
--------------------

You can also use SampleClean on a Spark cluster using our provided
scripts. Note that you must have valid AWS credentials to start your
cluster. The scripts configure all requirements necessary. Check
sampleclean-async/deploy/README to learn about deploying EC2 clusters
for Sample Clean. After starting the cluster, you can login remotely and
use Sample Clean with Spark Submit or Spark Shell (similar to the local
usage mode). Remember to load your datasets into HDFS using ephemeral or
persistent storage before running your application.



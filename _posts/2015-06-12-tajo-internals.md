---
layout: post
title: Tajo Cluster Architecture
date: 2015-06-12
categories: [computer science]
tags: [tajo]

---



# Tajo Cluster Architecture 


A single Tajo cluster consists of the main components as follows:

-   TajoMaster (1 \<= N)
-   TajoWorker (1 \<= N)

TajoMaster is responsible for coordinating a number of TajoWorkers and
provides a client services. <span
style="line-height: 1.4285715;background-color: transparent;">TajoWorker
actually processes data. As the number of TajoWorkers increases, the
processing capacity will increase linearly. The detailed description are
as follows:</span>

TajoMaster 
----------

<span
style="line-height: 1.4285715;background-color: transparent;">TajoMaster
has three sub components:</span>

**QueryCoordinator**: decides whether each query should be executed in a
distributed way or be executed immediately in TajoMaster. If a query
needs distributed execution, QueryCooordinator enqueues the query into
query scheduler. If required cluster resources become available, the
query scheduler will start queries. QueryCoordinator forwards a starting
query to an arbitrary worker, and then the worker creates a
QueryMasterTask instance which will controls and coordinates multiple
stages and lots of tasks which will be executed across a number of
nodes.

**Resource Tracker**: manages membership of cluster nodes. It detects a
joining node to a Tajo cluster and leaving a node from a Tajo cluster.
Resource Tracker receives heartbeat messages of them periodically, and
maintains resources and healthy status of nodes via heartbeat messages.
If some node is outage, Resource Tracker is responsible for notifying
its node failure to QueryCoordinator. Then, QueryCoordinator will decide
how to deal with the failure depending on the failure cases.

**Client Service Provider**: provides a set of remote APIs. Client
Service Provider routes client API calls to proper QueryCoordinator
or ResourceTracker.

Basically, one TajoMaster runs in a Tajo cluster, but in HA mode, two or
more TajoMaster can run in a single Tajo cluster. 

TajoWorker 
----------

TajoWorker has two sub components:

**NodeResourceManager**:<span
style="line-height: 1.4285715;background-color: transparent;"> manages
resource of worker node. It decides allocating requests to the node. if
available resources is not enough, part of request can be rejected, and
sends an accepted tasks to TaskManager</span>

**TaskManager**: <span
style="line-height: 1.4285715;background-color: transparent;">launches
task to the TaskExecutor and It uses multiple threads equal to the
number of cpu-cores. </span><span
style="line-height: 1.4285715;background-color: transparent;">When a
task is completed, TaskManager releases the allocated resource and
NodeStatusUpdater sends node status with latest resource status to the
ResourceTracker in TajoMaster</span>

![](http://sungsoo.github.com/images/TajoWorker.001.jpg)

CatalogServer 
-------------

Tajo System Directory Hierarchy 
===============================

The default system directory hierarchy is as follows:


```
    [HDFS ROOT]
         |
         |-- tajo
         |     |
         |     |-- system
         |     |     |-- resource
         |     |             |-- system_conf.xml
         |     |-- warehouse
         |           |- [database  A]
         |           |        |- [table a]
         |           |        |- [table b]
         |           |
         |           |- [database ..]
         |           |
         |           |- [database  N]
         |                    |- [table x]
         |                    |- [table z]
         |
         |-- tmp
              |-- staging
                     |- q_1378468137418_0001
                     |           |- RESULT
                     |
                     |- q_1378468137418_0002
                     |           |- RESULT
                     |
                     |- q_1378468137418_000N
```


## root directory 

-    Tajo has a root directory (config key - 'tajo.rootdir')
-    tajo.rootdir is configurable.
-    tajo.rootdir contains a subdirectory 'system'.

## System directory 

-   system directory location is not configurable.
-   system/resource directory contains 'system\_conf.xml' which contains
    a global configuration used across a number of workers.

## Warehouse directory 

-   It contains a subdirectory per table.
-   If you execute CREATE TABLE statement, the table is stored in here
    as a subdirectory.

## staging directory 

-   It contains a temporary directory for each query.
-   Each temporary directory has a query id as a directory name.
-   For each query, query results are stored temporarily in here. But
    these results will be removed after a while.
-   If a query is either CREATE TABLE or INSERT TABLE, the query result
    is moved to the warehouse directory.               




---
layout: post
title: Data Processing API in Apache Tez
date: 2014-01-16 
categories: [computer science]
tags: [hadoop, mapreduce, tez]

---


Overview
--

Apache Tez models data processing as a *dataflow graph*, with the **vertices** in the graph representing *processing of data* and **edges** representing *movement of data* between the processing. Thus *user logic*, that analyses and modifies the data, sits in the **vertices**. Edges determine the consumer of the data, how the data is transferred and the *dependency* between the *producer* and *consumer* vertices. This model concisely captures the *logical definition of the computation*. When the Tez job executes on the cluster, it expands this *logical graph* into a *physical graph* by adding parallelism at the vertices to scale to the data size being processed. Multiple tasks are created per logical vertex to perform the computation in parallel.

DAG Definition API
--

More technically, the data processing is expressed in the form of a *directed acyclic graph* (**DAG**). The processing starts at the root vertices of the DAG and continues down the *directed edges* till it reaches the leaf vertices. When all the vertices in the DAG have completed then the data processing job is done. The graph does not have cycles because the *fault tolerance mechanism* used by Tez is **re-execution** of failed tasks. When the input to a task is lost then the producer task of the input is re-executed and so Tez needs to be able to *walk up* the graph edges to locate a non-failed task from which to re-start the computation. *Cycles* in the graph can make this walk *difficult* to perform. In some cases, cycles may be handled by *unrolling* them to create a DAG.

Tez defines a simple Java API to express a DAG of data processing. The API has three components

* **DAG.** this defines the overall job. The user creates a DAG object for each data processing job.  
* **Vertex.** this defines the user logic and the resources & environment needed to execute the user logic. The user creates a Vertex object for each step in the job and adds it to the DAG.  
* **Edge.** this defines the connection between producer and consumer vertices. The user creates an Edge object and connects the producer and consumer vertices using it.


![tez1](http://sungsoo.github.com/images/tez11.png)

The diagram shows a *dataflow graph* and its definition using the DAG API (simplified). The job consists of 2 vertices performing a “**Map**” operation on 2 datasets. Their output is consumed by 2 vertices that do a “**Reduce**” operation. Their output is brought together in the last vertex that does a “**Join**” operation.

Tez handles expanding this *logical graph* at runtime to perform the operations *in parallel* using multiple tasks. The diagram shows a runtime expansion in which the first M-R pair has a parallelism of 2 while the second has a parallelism of 3. Both branches of computation merge in the **Join operation** that has a parallelism of 2. *Edge properties* are at the heart of this runtime activity.

![tez2](http://sungsoo.github.com/images/tez21.png)

Edge Properties
--

The following edge properties enable Tez to instantiate the tasks, configure their inputs and outputs, schedule them appropriately and help *route* the data between the tasks. The parallelism for each vertex is determined based on *user guidance*, *data size* and *resources*.

* **Data movement.** Defines *routing* of data between tasks  
	- *One-To-One*: Data from the *i*th producer task routes to the *i*th consumer task.  
	- *Broadcast*: Data from a producer task routes to *all* consumer tasks.  
	- *Scatter-Gather*: Producer tasks *scatter* data into *shards* and consumer tasks *gather* the *shards*. The *i*th shard from all producer tasks routes to the *i*th consumer task.    
* **Scheduling.** Defines when a *consumer* task is scheduled  
	- *Sequential*: Consumer task may be scheduled after a *producer task* completes.  
	- *Concurrent*: Consumer task must be *co-scheduled* with a producer task.  
* **Data source.** Defines the *lifetime*/*reliability* of a task output  
	- *Persisted*: Output will be available after the task exits. Output may be lost later on.
	- *Persisted-Reliable*: Output is reliably stored and will always be available  
	- *Ephemeral*: Output is available only while the producer task is running

![tez3](http://sungsoo.github.com/images/tez31.png)

Some real life use cases will help in clarifying the edge properties. **Mapreduce** would be expressed with the *scatter-gather*, *sequential* and *persisted* edge properties. **Map tasks** *scatter* partitions and reduce tasks gather them. **Reduce tasks** are *scheduled* after the map tasks complete and the map task outputs are written to local disk and hence available after the map tasks have completed. When a vertex *checkpoints* its output into HDFS then its *output edge* has a *persisted-reliable* property. If a producer vertex is *streaming data* directly to a consumer vertex then the edge between them has *ephemeral* and *concurrent* properties. A *broadcast* property is used on a *sampler vertex* that produces a **global histogram** of data ranges for *range partitioning*.

We hope that the Tez dataflow definition API will be able to express a broad spectrum of *data processing topologies* and enable higher level languages to elegantly transform their queries into Tez jobs.

References
---
[1] Bikas Saha, [*Data Processing API in Apache Tez*](http://hortonworks.com/blog/expressing-data-processing-in-apache-tez/), Hortonworks, September 17th, 2013.
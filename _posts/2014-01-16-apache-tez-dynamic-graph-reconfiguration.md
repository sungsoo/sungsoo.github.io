---
layout: post
title: Apache Tez Dynamic Graph Reconfiguration
date: 2014-01-16 
categories: [computer science]
tags: [hadoop, mapreduce, tez]

---

Case Study: Automatic Reduce Parallelism
--

Motivation
--
tez1Distributed data processing is dynamic by nature and it is extremely difficult to statically determine optimal concurrency and data movement methods a priori. More information is available during runtime, like data samples and sizes, which may help optimize the execution plan further. We also recognize that Tez by itself cannot always have the smarts to perform these dynamic optimizations. The design of Tez includes support for pluggable vertex management modules to collect relevant information from tasks and change the dataflow graph at runtime to optimize for performance and resource usage. The diagram shows how we can determine an appropriate number of reducers in a MapReduce like job by observing the actual data output produced and the desired load per reduce task.

Performance & Efficiency via Dynamic Graph Reconfiguration
--
Tez envisions running computation by the most resource efficient and high-performance means possible given the runtime conditions in the cluster and the results of the previous steps of the computation. This functionality is constructed using a couple of basic building blocks

Pluggable Vertex Management Modules: The control flow architecture of Tez incorporates a per-vertex pluggable module for user logic that deeply understands the data and computation. The vertex state machine invokes this user module at significant transitions of the state machine such as vertex start, source task completion etc. At these points the user logic can examine the runtime state and provide hints to the main Tez execution engine on attributes like vertex task parallelism.
Event Flow Architecture: Tez defines a set of events by which different components like vertices, tasks etc. can pass information to each other. These events are routed from source to destination components based on a well-defined routing logic in the Tez control plane. One such event is the VertexManager event that can be used to send any kind of user-defined payload to the VertexManager of a given vertex.

Case Study: Reduce task parallelism and Reduce Slow-start
--
Determining the correct number of reduce tasks has been a long standing issue for Map Reduce jobs. The output produced by the map tasks is not known a priori and thus determining that number before job execution is hard. This becomes even more difficult when there are several stages of computation and the reduce parallelism needs to be determined for each stage. We take that as a case study to demonstrate the graph reconfiguration capabilities of Tez.

tez2Reduce Task Parallelism: Tez has a ShuffleVertexManager that understands the semantics of hash based partitioning performed over a shuffle transport layer that is used in MapReduce. Tez defines a VertexManager event that can be used to send an arbitrary user payload to the vertex manager of a given vertex. The partitioning tasks (say the Map tasks) use this event to send statistics such as the size of the output partitions produced to the ShuffleVertexManager for the reduce vertex. The manager receives these events and tries to model the final output statistics that would be produced by the all the tasks. It can then advise the vertex state machine of the Reduce vertex to decrease the parallelism of the vertex if needed. The idea being to first over-partition and then determine the correct number at runtime. The vertex controller can cancel extra tasks and proceed as usual.

tez3Reduce Slow-start/Pre-launch: Slow-start is a MapReduce feature where-in the reduce tasks are launched before all the map tasks complete. The hypothesis being that reduce tasks can start fetching the completed map outputs while the remaining map tasks complete. Determining when to pre-launch the reduce tasks is tricky because it depends on output data produced by the map tasks. It would be inefficient to run reduce tasks so early that they finish fetching the data and sit idle while the remaining maps are still running. In Tez, the slow-start logic is embedded in the ShuffleVertexManager. The vertex state controller informs the manager whenever a source task (here the Map task) completes. The manager uses this information to determine when to pre-launch the reduce tasks and how many to pre-launch. It then advises the vertex controller.

Its easy to see how the above can be extended to determine the correct parallelism for range-partitioning scenarios. The data samples could be sent via the VertexManager events to the vertex manager that can create the key-range histogram and determine the correct number of partitions. It can then assign the appropriate key-ranges to each partition. Thus, in Tez, this operation could be achieved without the overhead of a separate sampling job.



References
--
[1] Bikas Saha, [*Apache Tez: Dynamic Graph Reconfiguration*](http://hortonworks.com/blog/apache-tez-dynamic-graph-reconfiguration/), Hortonworks, October 8th, 2013.
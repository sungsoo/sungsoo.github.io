---
layout: post
title: Apache Hadoop YARN – Background & Overview
date: 2014-02-28 
categories: [computer science]
tags: [hadoop, yarn]

---

Apache Hadoop YARN – Background & Overview

Celebrating the significant milestone that was Apache Hadoop YARN being promoted to a full-fledged sub-project of Apache Hadoop in the ASF we present the first blog in a multi-part series on Apache Hadoop YARN – a general-purpose, distributed, application management framework that supersedes the classic Apache Hadoop MapReduce framework for processing data in Hadoop clusters.

MapReduce – The Paradigm
Essentially, the MapReduce model consists of a first, embarrassingly parallel, map phase where input data is split into discreet chunks to be processed. It is followed by the second and final reduce phase where the output of the map phase is aggregated to produce the desired result. The simple, and fairly restricted, nature of the programming model lends itself to very efficient and extremely large-scale implementations across thousands of cheap, commodity nodes.

Apache Hadoop MapReduce is the most popular open-source implementation of the MapReduce model.

In particular, when MapReduce is paired with a distributed file-system such as Apache Hadoop HDFS, which can provide very high aggregate I/O bandwidth across a large cluster, the economics of the system are extremely compelling – a key factor in the popularity of Hadoop.

One of the keys to this is the lack of data motion i.e. move compute to data and do not move data to the compute node via the network. Specifically, the MapReduce tasks can be scheduled on the same physical nodes on which data is resident in HDFS, which exposes the underlying storage layout across the cluster. This significantly reduces the network I/O patterns and keeps most of the I/O on the local disk or within the same rack – a core advantage.

Apache Hadoop MapReduce, circa 2011 – A Recap
Apache Hadoop MapReduce is an open-source, Apache Software Foundation project, which is an implementation of the MapReduce programming paradigm described above. Now, as someone who has spent over six years working full-time on Apache Hadoop, I normally like to point out that the Apache Hadoop MapReduce project itself can be broken down into the following major facets:

The end-user MapReduce API for programming the desired MapReduce application.
The MapReduce framework, which is the runtime implementation of various phases such as the map phase, the sort/shuffle/merge aggregation and the reduce phase.
The MapReduce system, which is the backend infrastructure required to run the user’s MapReduce application, manage cluster resources, schedule thousands of concurrent jobs etc.
This separation of concerns has significant benefits, particularly for the end-users – they can completely focus on the application via the API and allow the combination of the MapReduce Framework and the MapReduce System to deal with the ugly details such as resource management, fault-tolerance, scheduling etc.

The current Apache Hadoop MapReduce System is composed of the JobTracker, which is the master, and the per-node slaves called TaskTrackers.



The JobTracker is responsible for resource management (managing the worker nodes i.e. TaskTrackers), tracking resource consumption/availability and also job life-cycle management (scheduling individual tasks of the job, tracking progress, providing fault-tolerance for tasks etc).

The TaskTracker has simple responsibilities – launch/teardown tasks on orders from the JobTracker and provide task-status information to the JobTracker periodically.

For a while, we have understood that the Apache Hadoop MapReduce framework needed an overhaul. In particular, with regards to the JobTracker, we needed to address several aspects regarding scalability, cluster utilization, ability for customers to control upgrades to the stack i.e. customer agility and equally importantly, supporting workloads other than MapReduce itself.

We’ve done running repairs over time, including recent support for JobTracker availability and resiliency to HDFS issues (both of which are available in Hortonworks Data Platform v1 i.e. HDP1) but lately they’ve come at an ever-increasing maintenance cost and yet, did not address core issues such as support for non-MapReduce and customer agility.

Why support non-MapReduce workloads?
MapReduce is great for many applications, but not everything; other programming models better serve requirements such as graph processing (Google Pregel / Apache Giraph) and iterative modeling (MPI). When all the data in the enterprise is already available in Hadoop HDFS having multiple paths for processing is critical.

Furthermore, since MapReduce is essentially batch-oriented, support for real-time and near real-time processing such as stream processing and CEPFresil are emerging requirements from our customer base.

Providing these within Hadoop enables organizations to see an increased return on the Hadoop investments by lowering operational costs for administrators, reducing the need to move data between Hadoop HDFS and other storage systems etc.

Why improve scalability?
Moore’s Law… Essentially, at the same price-point, the processing power available in data-centers continues to increase rapidly. As an example, consider the following definitions of commodity servers:

2009 – 8 cores, 16GB of RAM, 4x1TB disk
2012 – 16+ cores, 48-96GB of RAM, 12x2TB or 12x3TB of disk.
Generally, at the same price-point, servers are twice as capable today as they were 2-3 years ago – on every single dimension.  Apache Hadoop MapReduce is known to scale to production deployments of ~5000 nodes of hardware of 2009 vintage. Thus, ongoing scalability needs are ever present given the above hardware trends.

What are the common scenarios for low cluster utilization?
In the current system, JobTracker views the cluster as composed of nodes (managed by individual TaskTrackers) with distinct map slots and reduce slots, which are not fungible.  Utilization issues occur because maps slots might be ‘full’ while reduce slots are empty (and vice-versa).  Fixing this was necessary to ensure the entire system could be used to its maximum capacity for high utilization.

What is the notion of customer agility?
In real-world deployments, Hadoop is very commonly deployed as a shared, multi-tenant system. As a result, changes to the Hadoop software stack affect a large cross-section if not the entire enterprise. Against that backdrop, customers are very keen on controlling upgrades to the software stack as it has a direct impact on their applications. Thus, allowing multiple, if limited, versions of the MapReduce framework is critical for Hadoop.

Enter Apache Hadoop YARN

The fundamental idea of YARN is to split up the two major responsibilities of the JobTracker i.e. resource management and job scheduling/monitoring, into separate daemons: a global ResourceManager and per-application ApplicationMaster (AM).

The ResourceManager and per-node slave, the NodeManager (NM), form the new, and generic, system for managing applications in a distributed manner.

The ResourceManager is the ultimate authority that arbitrates resources among all the applications in the system. The per-application ApplicationMaster is, in effect, a framework specific entity and is tasked with negotiating resources from the ResourceManager and working with the NodeManager(s) to execute and monitor the component tasks.

The ResourceManager has a pluggable Scheduler, which is responsible for allocating resources to the various running applications subject to familiar constraints of capacities, queues etc. The Scheduler is a pure scheduler in the sense that it performs no monitoring or tracking of status for the application, offering no guarantees on restarting failed tasks either due to application failure or hardware failures. The Scheduler performs its scheduling function based on the resource requirements of the applications; it does so based on the abstract notion of a Resource Container which incorporates resource elements such as memory, cpu, disk, network etc.

The NodeManager is the per-machine slave, which is responsible for launching the applications’ containers, monitoring their resource usage (cpu, memory, disk, network) and reporting the same to the ResourceManager.

The per-application ApplicationMaster has the responsibility of negotiating appropriate resource containers from the Scheduler, tracking their status and monitoring for progress. From the system perspective, the ApplicationMaster itself runs as a normal container.

Here is an architectural view of YARN:



One of the crucial implementation details for MapReduce within the new YARN system that I’d like to point out is that we have reused the existing MapReduce framework without any major surgery. This was very important to ensure compatibility for existing MapReduce applications and users. More on this later.

The next post will dive further into the intricacies of the architecture and its benefits such as significantly better scaling, support for multiple data processing frameworks (MapReduce, MPI etc.) and cluster utilization.
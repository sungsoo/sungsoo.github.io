---
layout: post
title: Elasticity with YARN
date: 2016-04-20
categories: [computer science]
tags: [data management, yarn]

---

## Article Source
* Title: VectorH: Taking SQL-on-Hadoop to the next level
* Authors: Andrei Costea et al

---

# Elasticity with YARN

## Workers and Master
 
**VectorH** consists of a set of *N* Vectorwise processes, called the worker set that run on the datanodes of a Hadoop cluster. 
The VectorH administrator maintains a *list of viable machines* in a configuration file to identify these – this may just be a subset of the whole Hadoop cluster so one can use a set of machines which have the same hardware, as this leads to better parallel query load balancing. Before actually starting these processes, VectorH needs to negotiate with YARN’s resource manager where to run, and it ends up using a subset of these machines as its worker set. 
One of the workers becomes the *session-master*, however this node does not possess any specific data structures, so this role can be easily interchanged. The session master has a coordinating role in transactions, and performs parallel query optimization which includes running a *query scheduler* that performs DBMS workload management, determining the amount of cores and memory it can use. Currently, this is done using a policy where table partition scans are performed at their responsible nodes, and the available amount of cores is divided equally among them.

## Out-of-band YARN 

The YARN resource manager (RM) administers RAM and CPU resources on a Hadoop cluster, for this purpose a NodeManager (NM) daemon runs
on each datanode. Clients communicates with the RM, to start a first process as their ApplicationMaster (AM). Typically, the AM starts further containers (processes) on other nodes by communicating with the NMs, following negotiated resource demands in terms of minimum and maximum (desired) amounts of RAM and cores. YARN can use different scheduling policies, namely the **FairScheduler** and **CapacityScheduler** where the latter assigns resources to multiple queues having different priorities. Newly arriving high priority jobs may cause running jobs to be *pre-empted* by YARN, first by asking their AMs to decrease resource usage and after a timeout by killing their containers.

While YARN is a great step forward for Hadoop and native applications, SQL-on-Hadoop systems still struggle to fit into its concepts because they are usually *long-running processes*. Equating YARN job submission to query submission, is not viable because a DBMS needs to run a query on threads in the already active server processes, rather than spawn a separate new process for each query, and furthermore the latency of the YARN protocols is high and would eclipse interactive query running times. Also, even if a Vectorwise process would run in a YARN container, the problem would be that YARN does not allow yet to modify the resources of a container. Stopping and re-starting a Vectorwise container just to e.g. increase its RAM budget would interrupt the running application for tens of seconds and lose the contents of its buffer pool to much performance detriments.

Therefore, VectorH runs processes *out-of-band*, i.e. separate from its containers. The actual containers are dummies that sleep almost constantly, monitoring once in a while the co-located VectorH processes to ping back their live status to YARN and implicitly to VectorH, i.e. VectorH runs a **dbAgent** process that acts as its YARN client. Instead of running a single container on each datanode with all its RAM and core resources, it typically runs multiple AMs with corresponding containers on the worker set, each allocating a slice of its resources. Hereby, it can gradually increase and decrease its resource usage (start or stop new AMs/slices) over time. YARN pre-emption can even kill containers in which case dbAgent notices this event and then instructs the session master to adjusts its own resource usage accordingly, by changing the configuration of the DBMS *workload management* (e.g. making queries use less cores and memory, possibly leading to spilling operators).
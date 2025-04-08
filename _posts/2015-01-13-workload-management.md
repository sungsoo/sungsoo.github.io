---
layout: post
title: Workload Management for Big Data Analytics
date: 2015-01-13
categories: [computer science]
tags: [big data]

---

## Workload Management for Big Data Analytics


Parallel database systems and MapReduce systems (most notably Hadoop) are essential components of today’s infrastructure for Big Data analytics. These systems process multiple concurrent workloads consisting of complex user requests, where each request is associated with an (explicit or implicit) service level objective. For example, the workload of a particular user or application may have a higher priority than other workloads. Or, a particular workload may have strict deadlines for the completion of its requests.

The research area of *Workload Management* focuses on ensuring that the system meets the service level objectives of various requests while at the same time minimizing the resources required to achieve this goal. At a high level, workload management can be viewed as looking beyond the performance of an individual request to the performance of an entire workload consisting of multiple requests.

Questions addressed by workload management research and technologies include: 

* How to implement different priorities for different workloads? 

* How to isolate the performance of one workload from the effect of other workloads? 

* What is the best way to do request scheduling and admission control? 

* What are good mechanisms and policies to control the allocation of resources to workloads statically and dynamically? 

* How to define a workload and associated requests within that workload? 

* How to monitor request performance, resource consumption, and data access patterns to ensure that workload management is effectively achieving its goals? 

* How to ensure that workload management goals are met even in the presence of failures?

### Introduction
* Definition of workload management
* Problems addressed by workload management
* How are workloads defined?
* Diversity of workloads

### Workload-level decisions in database systems – Physical design
* Progress monitoring
* Managing long-running queries

### Performance prediction
* The role of the query optimizer
* Machine-learning-based and experiment-driven modeling
* Modeling query interactions 

### Inter-workload interactions
* Effects of workload interference
* Multiclass workloads and priorities 
* Mechanisms for workload isolation

### MapReduce workload management
* Resource sharing and notions of fairness 
* Scheduling and resource allocation
* Mechanisms for workload isolation 

### Current trends and research challenges
* Cloud computing
* Resource management frameworks 
* Richer service level agreements
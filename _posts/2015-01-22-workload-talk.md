---
layout: post
title: Database Workloads
date: 2015-01-22
categories: [computer science]
tags: [big data]

---


## Database Workloads

* Different tuning for different workloads
* Different systems support different workloads
* Trend towards *mixed workloads*
* Trend towards *real time* (i.e, more on-line)

## Big Data Anaytics

* Complex analysis (on-line or batch) on
	* Large relational data warehouses +
	Web site access and search logs + Text corpora + Web data + Sensor data + ... etc.
* Supported by 
	* Parallel database systems
	* MapReduce
* Other systems also exist
	* SCOPE, Pregel, Spark, GraphLab, R, ... etc.
	
		
## Workload Management

* Workloads include all queries/jobs and updates
* Workloads can also include administrative utilities
* Multiple users and applications
* Different requirements
	* Development vs. production
	* Priorities
	
![](http://sungsoo.github.com/images/workloads.png)

* Manage the execution of multiple workloads to meet **explicit or implicit service level objectives**
* Look beyond the performance of an individual request to the performance of an entire workload

## ￼Problems Addressed by Workload Management
* Workload isolation
	* Important for multi-tenant systems
* Priorities
	* How to interpret them?
* Admission control and scheduling 
* Execution control
	* Kill, suspend, resume 
* Resource allocation
	* Including sharing and throttling
* Monitoring and prediction
* Query characterization and classification 
* Service level agreements
---
layout: post
title: Apache Hadoop YARN Architecture
date: 2014-12-10
categories: [computer science]
tags: [yarn]

---

Apache Hadoop YARN Architecture 
===

YARN separates all of its functionality into two layers: a *platform* layer responsible for resource management and what is called *first-level scheduling*, and a *framework* layer that coordinates application execution and *second-level scheduling*. Specifically, a per-cluster *ResourceManager* tracks usage of resources, monitors the health of various nodes in the cluster, enforces resource-allocation invariants, and arbitrates conflicts among users. By separating these multiple duties that were previously shouldered by a single daemon, the JobTracker, in Hadoop version 1, the ResourceManager can simply allocate resources centrally based on a specification of an application’s requirements, but ignore how the application makes use of those resources. That responsibility is delegated to an *ApplicationMaster*, which coordinates the logical execution of a single application by requesting resources from the ResourceManager, generating a physical plan of its work, making use of the resources it receives, and coordinating the execution of such a physical plan.

## Overview

The ResourceManager and NodeManagers running on individual nodes come together to form the core of YARN and constitute the **platform**. ApplicationMasters and the corresponding containers come together to form a YARN *application*. This separation of concerns is shown in Figure 7.1. From YARN’s point of view, all users interact with it by submitting applications that then make use of the resources offered by the platform. From end-users’ perspective, they may either (1) directly interact with YARN by running applications directly on the platform or (2) interact with a *framework*, which in turn runs as an application on top of YARN. Frameworks may expose a higher-level functionality to the end-users. As an example, the MapReduce code that comes bundled with Apache Hadoop can be looked at as a framework running on top of YARN. On the one hand, MapReduce gives to the users a map and reduce abstraction that they can code against, with the framework taking care of the gritty details of running smoothly on a distributed system—failure handling, reliability, resource allocation, and so. On the other hand, MapReduce uses the underlying platform’s APIs to implement such functionality.

![](http://sungsoo.github.com/images/hadoop1-and-2.png)

The overall architecture is described in Figure 7.2. The ResourceManager provides scheduling of applications. Each application is managed by an ApplicationMaster (per-task manager) that requests per-task computation resources in the form of containers. Containers are scheduled by the ResourceManager and locally managed by the per-node NodeManager.

![](http://sungsoo.github.com/images/yarn-achitecture.png)



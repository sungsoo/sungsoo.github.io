---
layout: post
title: Apache Hadoop YARN – Concepts and Applications
date: 2014-02-28 
categories: [computer science]
tags: [hadoop, yarn]

---


Apache Hadoop YARN – Concepts & Applications
---

YARN is essentially a system for managing distributed applications. It consists of a central **ResourceManager**, which arbitrates all available cluster resources, and a per-node **NodeManager**, which takes direction from the ResourceManager and is responsible for managing resources available on a single node.


![](http://sungsoo.github.com/images/yarnflow1.png)

### Resource Manager

In YARN, the ResourceManager is, primarily, a pure scheduler. In essence, it’s strictly limited to arbitrating available resources in the system among the competing applications – a market maker if you will.  It optimizes for cluster utilization (keep all resources in use all the time) against various constraints such as capacity guarantees, fairness, and SLAs. To allow for different policy constraints the ResourceManager has a pluggable scheduler that allows for different algorithms such as capacity and fair scheduling to be used as necessary.

### ApplicationMaster

Many will draw parallels between YARN and the existing Hadoop MapReduce system (MR1 in Apache Hadoop 1.x). However, the key difference is the new concept of an **ApplicationMaster**.

The ApplicationMaster is, in effect, an instance of a framework-specific library and is responsible for negotiating resources from the ResourceManager and working with the NodeManager(s) to execute and monitor the containers and their resource consumption. It has the responsibility of negotiating appropriate resource containers from the ResourceManager, tracking their status and monitoring progress.

The ApplicationMaster allows YARN to exhibit the following key characteristics:

* **Scale**: The Application Master provides much of the functionality of the traditional ResourceManager so that the entire system can scale more dramatically. In tests, we’ve already successfully simulated 10,000 node clusters composed of modern hardware without significant issue. This is one of the key reasons that we have chosen to design the ResourceManager as a pure scheduler i.e. it doesn’t attempt to provide fault-tolerance for resources. We shifted that to become a primary responsibility of the ApplicationMaster instance. Furthermore, since there is an instance of an ApplicationMaster per application, the ApplicationMaster itself isn’t a common bottleneck in the cluster.
* **Open**: Moving all application framework specific code into the ApplicationMaster generalizes the system so that we can now support multiple frameworks such as MapReduce, MPI and Graph Processing.
It’s a good point to interject some of the key YARN design decisions:

* Move all complexity (to the extent possible) to the ApplicationMaster while providing sufficient functionality to allow application-framework authors sufficient flexibility and power.
* Since it is essentially user-code, do not trust the ApplicationMaster(s) i.e. any ApplicationMaster is not a privileged service.
* The YARN system (ResourceManager and NodeManager) has to protect itself from faulty or malicious ApplicationMaster(s) and resources granted to them at all costs.


It’s useful to remember that, in reality, every application has its own instance of an ApplicationMaster. However, it’s completely feasible to implement an ApplicationMaster to manage a set of applications (e.g. ApplicationMaster for Pig or Hive to manage a set of MapReduce jobs). Furthermore, this concept has been stretched to manage long-running services which manage their own applications (e.g. launch HBase in YARN via an hypothetical HBaseAppMaster).

### Resource Model

YARN supports a very general resource model for applications. An application (via the ApplicationMaster) can request resources with highly specific requirements such as:

* Resource-name (hostname, rackname – we are in the process of generalizing this further to support more complex network topologies with YARN-18).
* Memory (in MB)
* CPU (cores, for now)
* In future, expect us to add more resource-types such as disk/network I/O, GPUs etc.


### ResourceRequest and Container

YARN is designed to allow individual applications (via the ApplicationMaster) to utilize cluster resources in a shared, secure and multi-tenant manner. Also, it remains aware of cluster topology in order to efficiently schedule and optimize data access i.e. reduce data motion for applications to the extent possible.

In order to meet those goals, the central Scheduler (in the ResourceManager) has extensive information about an application’s resource needs, which allows it to make better scheduling decisions across all applications in the cluster. This leads us to the **ResourceRequest** and the resulting **Container**.

Essentially an application can ask for specific resource requests via the ApplicationMaster to satisfy its resource needs. The Scheduler responds to a resource request by granting a container, which satisfies the requirements laid out by the ApplicationMaster in the initial ResourceRequest.

Let’s look at the ResourceRequest – it has the following form:

`<resource-name, priority, resource-requirement, number-of-containers>`

Let’s walk through each component of the ResourceRequest to understand this better.

* resource-name is either hostname, rackname or * to indicate no preference. In future, we expect to support even more complex topologies for virtual machines on a host, more complex networks etc.
* priority is intra-application priority for this request (to stress, this isn’t across multiple applications).
* resource-requirement is required capabilities such as memory, cpu etc. (at the time of writing YARN only supports memory and cpu).
* number-of-containers is just a multiple of such containers.


Now, on to the Container.

Essentially, the Container is the resource **allocation**, which is the successful result of the ResourceManager granting a specific ResourceRequest. A Container grants rights to an application to use a specific amount of resources (memory, cpu etc.) on a specific host.

The ApplicationMaster has to take the Container and present it to the NodeManager managing the host, on which the container was allocated, to use the resources for launching its tasks. Of course, the Container allocation is verified, in the secure mode, to ensure that ApplicationMaster(s) cannot fake allocations in the cluster.

### Container Specification during Container Launch

While a Container, as described above, is merely a right to use a specified amount of resources on a specific machine (NodeManager) in the cluster, the ApplicationMaster has to provide considerably more information to the NodeManager to actually *launch* the container.

YARN allows applications to launch any process and, unlike existing Hadoop MapReduce in hadoop-1.x (aka MR1), it isn’t limited to Java applications alone.

The YARN Container launch specification API is platform agnostic and contains:

* Command line to launch the process within the container.
* Environment variables.
* Local resources necessary on the machine prior to launch, such as jars, shared-objects, auxiliary data files etc.
* Security-related tokens.


This allows the ApplicationMaster to work with the NodeManager to launch containers ranging from simple shell scripts to C/Java/Python processes on Unix/Windows to full-fledged virtual machines (e.g. KVMs).

YARN – Walkthrough
---

Armed with the knowledge of the above concepts, it will be useful to sketch how applications conceptually work in YARN.

Application execution consists of the following steps:

* Application submission.
* Bootstrapping the ApplicationMaster instance for the application.
* Application execution managed by the ApplicationMaster instance.


Let’s walk through an application execution sequence (steps are illustrated in the diagram):

1. A client program submits the application, including the necessary specifications to l*aunch the application-specific ApplicationMaster* itself.
2. The ResourceManager assumes the responsibility to negotiate a specified container in which to start the ApplicationMaster and then *launches* the ApplicationMaster.
3. The ApplicationMaster, on boot-up, *registers* with the ResourceManager – the registration allows the client program to query the ResourceManager for details, which allow it to  directly communicate with its own ApplicationMaster.
4. During normal operation the ApplicationMaster negotiates appropriate resource containers via the resource-request protocol.
5. On successful container allocations, the ApplicationMaster launches the container by providing the container launch specification to the NodeManager. The launch specification, typically, includes the necessary information to allow the container to communicate with the ApplicationMaster itself.
6. The application code executing within the container then provides necessary information (progress, status etc.) to its ApplicationMaster via an *application-specific* protocol.
7. During the application execution, the client that submitted the program communicates directly with the ApplicationMaster to get status, progress updates etc. via an application-specific protocol.
8. Once the application is complete, and all necessary work has been finished, the ApplicationMaster deregisters with the ResourceManager and shuts down, allowing its own container to be repurposed.

![](http://sungsoo.github.com/images/yarnflow.png)

References
---
[1] Arun Murthy, [*Apache Hadoop YARN – Concepts and Applications*](http://hortonworks.com/blog/apache-hadoop-yarn-concepts-and-applications/), August 2012.
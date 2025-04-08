---
layout: post
title: An Insight into Hadoop Yarn Resource Manager
date: 2014-05-12
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [An Insight into Hadoop Yarn Resource Manager](http://nixustechnologies.com/2014/05/03/an-insight-into-hadoop-yarn-resource-manager/)
* Authors: [Pruthvi](http://nixustechnologies.com/author/pruthvirajspgmail-com/ "Posts by Pruthvi")



[![](http://sungsoo.github.com/images/insight-yarn.png)](http://sungsoo.github.com/images/insight-yarn.png)

# An Insight into Hadoop Yarn Resource Manager

The Resource Manager is the core component in the Hadoop 2.0 framework
(YARN). In analogy, it occupies the place of JobTracker of MRV1. YARN is
designed to provide a generic and flexible framework to administer the
computing resources in the cluster.

In this direction, the *YARN Resource Manager Service* (RM) is the
central controlling authority for resource management and makes
allocation decisions

ResourceManager has two main components: ***Scheduler*** and 
***ApplicationsManager.***

The ***Scheduler***API is specifically designed to negotiate resources
and not schedule tasks. The scheduler does not perform monitoring or
tracking of status for the Applications. The Scheduler performs its
scheduling function based the resource requirements of the applications;
it does so based on the abstract notion of a resource ***Container***
which incorporates elements such as memory, cpu, disk, network etc.
Resource Manager does not guarantee about restarting failed tasks either
due to application failure or hardware failures. Applications can
request resources at different layers of the cluster topology such as
nodes, racks etc. The scheduler determines how much and where to
allocate based on resource availability and the configured sharing
policy.

The Scheduler has a pluggable policy plug-in, which is responsible for
partitioning the cluster resources among the various queues,
applications etc. The current Map-Reduce schedulers such as the
***CapacityScheduler*** and the ***FairScheduler*** would be some
examples of the plug-in

***ApplicationsManager*** is responsible for maintaining a collection of
submitted applications. It accepts job from the client and negotiates
for a container to execute the application specific
*ApplicationMaster*and it provide the service for restarting
the*ApplicationMaster*in the case of failure. It also keeps a cache of
completed applications so as to serve users’ requests via web UI or
command line long after the applications in question finished.

Though the above two are the core component, for its complete
functionality the Resource Manager depend on various other components.
The detailed architecture with these components is shown in below
diagram.

![](http://hortonworks.com/wp-content/uploads/2012/08/resource_manager.png) Source:
[Hortonworks](http://hortonworks.com/)

RM works together with the per-node ***NodeManagers (NMs*****)** and the
per-application ***ApplicationMasters (AMs)***.****

## ResourceManager Components

The ResourceManager has the following components (see the figure above):

1.  **Components interfacing RM to the clients:**
    -   ***ClientService***: The client interface to the Resource
        Manager. This component handles all the RPC interfaces to the RM
        from the clients including operations like application
        submission, application termination, obtaining queue
        information, cluster statistics etc.
    -   ***AdminService***: To make sure that admin requests don’t get
        starved due to the normal users’ requests and to give the
        operators’ commands the higher priority, all the admin
        operations like refreshing node-list, the queues’ configuration
        etc. are served via this separate interface.

2.  **Components connecting RM to the nodes:**
    -   **ResourceTrackerService**:  This is the component that obtains
        heartbeats from nodes in the cluster and forwards them to
        *YarnScheduler.* Responds to RPCs from all the nodes, registrers
        new nodes, rejecting requests from any invalid/decommissioned
        nodes,. It works closely with *NMLivelinessMonitor* and
        *NodesListManager*.
    -   **NMLivelinessMonitor**: To keep track of live nodes and dead
        nodes. This component keeps track of each node’s its last
        heartbeat time. Any node that doesn’t send heartbeat within a
        configured interval of time, by default 10 minutes, is deemed
        dead and is expired by the RM. All the containers currently
        running on an expired node are marked as dead and no new
        containers are scheduling on such node.
    -   **NodesListManager**: Manages valid and excluded nodes.
        Responsible for reading the host configuration files and seeding
        the initial list of nodes based on those files. Keeps track of
        nodes that are decommissioned as time progresses.

3.  **Components interacting with the per-application AMs:**
    -   **ApplicationMasterService**: Services the RPCs from all the AMs
        like registration of new AMs, termination/unregister-requests
        from any finishing AMs, obtaining container-allocation &
        deallocation requests from all running AMs and forward them over
        to the ***YarnScheduler***. *ApplicationMasterService* and
        *AMLivelinessMonitor* works together to maintain the fault
        tolerance of Application Masters.
    -   **AMLivelinessMonitor**: Maintains the list of live AMs and
        dead/non-responding AMs, It responsibility to is to keep track
        of live AMs, it usually track the AMs dead or alive with the
        help of heartbeats, and register and de-register the AMs from
        Resource manager. All the containers currently running/allocated
        to an AM that gets expired are marked as dead.

4.  **The core of the ResourceManager – the scheduler and related
    components:**
    -   **ApplicationsManager**: Responsible for maintaining a
        collection of submitted applications. Also keeps a cache of
        completed applications so as to serve users’ requests via web UI
        or command line long after the applications in question
        finished.
    -   **ApplicationACLsManager**: RM needs to gate the user facing
        APIs like the client and admin requests to be accessible only to
        authorized users. This component maintains the ACLs lists per
        application and enforces them whenever an request like killing
        an application, viewing an application status is received.
    -   **ApplicationMasterLauncher**: Maintains a thread-pool to launch
        AMs of newly submitted applications as well as applications
        whose previous AM attempts exited due to some reason. Also
        responsible for cleaning up the AM when an application has
        finished normally or forcefully terminated.
    -   **YarnScheduler**: Yarn Scheduler is responsible for allocating
        resources to the various running applications subject to
        constraints of capacities, queues etc. It performs its
        scheduling function based on the resource requirements of the
        applications such as memory, CPU, disk, network etc. Currently,
        only memory is supported and support for CPU is close to
        completion.
    -   **ContainerAllocationExpirer**: This component is in charge of
        ensuring that all allocated containers are used by AMs and
        subsequently launched on the correspond NMs. AMs run as
        untrusted user code and can potentially hold on to allocations
        without using them, and as such can cause cluster
        under-utilization. To address this, ContainerAllocationExpirer
        maintains the list of allocated containers that are still not
        used on the corresponding NMs. For any container, if the
        corresponding NM doesn’t report to the RM that the container has
        started running within a configured interval of time, by default
        10 minutes, the container is deemed as dead and is expired by
        the RM.
 
5.  **TokenSecretManagers (for security):**ResourceManager has a
    collection of SecretManagers which are given the
    charge/responsibility of managing tokens, secret-keys that are used
    to authenticate/authorize requests on various RPC interfaces. A
    brief summary follows:
    -   **ApplicationTokenSecretManager**: RM uses the per-application
        tokens called ApplicationTokens to avoid arbitrary processes
        from sending RM scheduling requests. This component saves each
        token locally in memory till application finishes and uses it to
        authenticate any request coming from a valid AM process.
    -   **ContainerTokenSecretManager**: RM issues special tokens called
        Container Tokens to ApplicationMaster(AM) for a container on the
        specific node. These tokens are used by AM to create connection
        with NodeManager having the container in which job runs.
    -   **RMDelegationTokenSecretManager**: A ResourceManager specific
        delegation-token secret-manager. It is responsible for
        generating delegation tokens to clients which can be passed on
        to unauthenticated processes that wish to be able to talk to RM.

6.  **DelegationTokenRenewer:** In secure mode, RM is Kerberos
    authenticated and so provides the service of renewing file-system
    tokens on behalf of the applications. This component renews tokens
    of submitted applications as long as the application runs and till
    the tokens can no longer be renewed.

The responsibility and functionalities of the NameNode and DataNode
remained the same as in MRV1. The below block diagram summarizes the
execution flow of job in YARN framework.

 ![Illustration shows the architecture of a YARN Hadoop
hierarchy](http://www.ibm.com/developerworks/library/bd-hadoopyarn/figure2.png)

Source: [IBM](http://www.ibm.com/)

the subsequent posts will dive into details of the remaining component
of YARN framework.

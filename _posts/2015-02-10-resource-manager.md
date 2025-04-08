---
layout: post
title: Resource Manager
date: 2015-02-10
categories: [computer science]
tags: [big data]

---

# Resource Manager

The ResourceManager is the master that arbitrates all the available cluster resources, thereby helping manage the distributed applications running on the YARN platform. It works together with the following components:

* The per-node NodeManagers, which take instructions from the ResourceManager, manage resources available on a single node, and accept container requests from ApplicationMasters

* The per-application ApplicationMasters, which are responsible for negotiating resources with the ResourceManager and for working with the NodeManagers to start, monitor, and stop the containers

## Overview of the ResourceManager Components

The ResourceManager components are illustrated in Figure 7.3. To better describe the workings of each component, they will be introduced separately by grouping them corresponding to each external entity for which they provide services: clients, the NodeManagers, the ApplicationMasters, or other internal core components.

![](http://sungsoo.github.com/images/rm.png)


## Client Interaction with the ResourceManager

The first interaction point of a user with the platform comes in the form of a client to the ResourceManager. The following components in ResourceManager interact with the client.

### Client Service

This service implements *ApplicationClientProtocol*, the basic client interface to the ResourceManager. This component handles all the remote procedure call (RPC) communications to the ResourceManager from the clients, including operations such as the following:

* Application submission

* Application termination

* Exposing information about applications, queues, cluster statistics, user ACLs, and more


Client Service provides additional protection to the ResourceManager depending on whether the administrator configured YARN to run in secure or nonsecure mode. In secure mode, the Client Service makes sure that all incoming requests from users are authenticated (for example, by Kerberos) and then authorizes each user by looking up application-level Access Control Lists (ACLs) and subsequently queue-level ALCs. For all clients that cannot be authenticated with Kerberos directly, this service also exposes APIs to obtain what are known as the ResourceManager delegation tokens. Delegation tokens are special objects that a Kerberos-authenticated client can first obtain by securely communicating with the ResourceManager and then pass along to its nonauthenticated processes. Any client process that has a handle to these delegation tokens can communicate with ResourceManager securely without separately authenticating with Kerberos first.


### Administration Service


While Client Service is responsible for typical user invocations like application submission and termination, there is a list of activities that administrators of a YARN cluster have to perform from time to time. To make sure that administration requests don’t get starved by the regular users’ requests and to give the operators’ commands a higher priority, all of the administrative operations are served via a separate interface called Administration Service. ResourceManagerAdministrationProtocol is the communication protocol that is implemented by this component. Some of the important administrative operations are highlighted here:


* *Refreshing queues*: for example, adding new queues, stopping existing queues, and reconfiguring queues to change some of their properties like capacities, limits, and more

* *Refreshing the list of nodes handled by the ResourceManager*: for example, adding newly installed nodes or decommissioning existing nodes for various reasons

* Adding new user-to-group mappings, adding/updating administrator ACLs, modifying the list of superusers, and so on


Both Client Service and Administration Service work closely with ApplicationManager for ACL enforcement.


### Application ACLs Manager


The ResourceManager needs to gate the user-facing APIs like the client and administrative requests so that they are accessible only to authorized users. This component maintains the ACLs per application and enforces them. Application ACLs are enabled on the ResourceManager by setting to true the configuration property yarn.acl.enable. There are two types of application accesses: (1) viewing and (2) modifying an application. ACLs against the view access determine who can “view” some or all of the application-related details on the RPC interfaces, web UI, and web services. The modify-application ACLs determine who can “modify” the application (e.g., kill the application).



An ACL is a list of users and groups who can perform a specific operation. Users can specify the ACLs for their submitted application as part of the ApplicationSubmis- sionContext. These ACLs are tracked per application by the ACLsManager and used for access control whenever a request comes in. Note that irrespective of the ACLs, all administrators (determined by the configuration property yarn.admin.acl) can per- form any operation.

The same ACLs are transferred over to the ApplicationMaster so that the ApplicationMaster itself can use them for users accessing various services running inside the ApplicationMaster. The NodeManager also receives the same ACLs as part of ContainerLaunchContext (discussed later in this chapter) when a container is launched which then uses them for access control to serve requests about the applica- tions/containers, mainly about their status, application logs, etc.


### ResourceManager Web Application and Web Services


The ResourceManager has a web application that exposes information about the state of the cluster; metrics; lists of active, healthy, and unhealthy nodes; lists of applications, their state and status; hyper-references to the ApplicationMaster web interfaces; and a scheduler-specific interface.


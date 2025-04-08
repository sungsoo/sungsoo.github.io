---
layout: post
title: Introduction to Distributed Database Management Systems
date: 2014-05-17
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: *Database Systems, A Practical Approach to Design, Implementation, and Management*, Fourth Edition, Chapter 22, Addition-Wesley, 2012.
* Authors: Thomas M. Connoly, Carolyn E. BEGG


[![](http://sungsoo.github.com/images/ddbms-introduction.png)](http://sungsoo.github.com/images/ddbms-introduction.png)

# Introduction to Distributed Database Management Systems (Distributed DBMSs)

Database technology has taken us from a paradigm of data processing in which each application defined and maintained its own data, to one in which data is defined and administered centrally. During recent times, we have seen the rapid developments in network and data communication technology, epitomized by the Internet, mobile and wireless computing, intelligent devices, and grid computing. Now with the combination of these two technologies, distributed database technology may change the mode of working from centralized to decentralized. This combined technology is one of the major developments in the database systems area.

In previous chapters we have concentrated on centralized database systems, that is systems with a single logical database located at one site under the control of a single DBMS. In this chapter we discuss the concepts and issues of the **Distributed Database Management System (DDBMS)**, which allows users to access not only the data at their own site but also data stored at remote sites. There have been claims that centralized DBMSs will eventually be an ‘antique curiosity’ as organizations move towards distributed DBMSs.


## Introduction
A major motivation behind the development of database systems is the desire to integrate the operational data of an organization and to provide controlled access to the data. Although integration and controlled access may imply centralization, this is not the intention. In fact, the development of computer networks promotes a decentralized mode of work. This decentralized approach mirrors the organizational structure of many companies, which are logically distributed into divisions, departments, projects, and so on, and physically distributed into offices, plants, factories, where each unit maintains its own operational data (Date, 2000). The shareability of the data and the efficiency of data access should be improved by the development of a distributed database system that reflects this organizational structure, makes the data in all units accessible, and stores data proximate to the location where it is most frequently used.


Distributed DBMSs should help resolve the *islands of information* problem. Databases are sometimes regarded as *electronic islands* that are distinct and generally inaccessible places, like remote islands. This may be a result of geographical separation, incompatible computer architectures, incompatible communication protocols, and so on. Integrating the databases into a logical whole may prevent this way of thinking.

## Concepts
To start the discussion of distributed DBMSs, we first give some definitions.

### Distributed database
> A logically interrelated collection of shared data (and a description of this data) physically distributed over a computer network.


### Distributed DBMS
> The software system that permits the management of the distributed database and makes the distribution transparent to users.


A **Distributed Database Management System (DDBMS)** consists of a single logical database that is split into a number of **fragments**. Each fragment is stored on one or more computers under the control of a separate DBMS, with the computers connected by a communications network. Each site is capable of independently processing user requests that require access to local data (that is, each site has some degree of local autonomy) and is also capable of processing data stored on other computers in the network.
Users access the distributed database via applications, which are classified as those that do not require data from other sites (**local applications**) and those that do require data from other sites (**global applications**). We require a DDBMS to have at least one global application. A DDBMS therefore has the following characteristics:



* a collection of logically related shared data; 
* the data is split into a number of fragments;   
* fragments may be replicated;
* fragments/replicas are allocated to sites;
* the sites are linked by a communications network;
* the data at each site is under the control of a DBMS;
* the DBMS at each site can handle local applications, autonomously; 
* each DBMS participates in at least one global application.

#### Figure 22.1. Distributed database management system.
![](http://sungsoo.github.com/images/distributed-dbms.png)]

From the definition of the DDBMS, the system is expected to make the distribution **transparent** (invisible) to the user. Thus, the fact that a distributed database is split into fragments that can be stored on different computers and perhaps replicated, should be hidden from the user. The objective of transparency is to make the distributed system appear like a centralized system. This is sometimes referred to as the fundamental principle of distributed DBMSs (Date, 1987b). This requirement provides significant functionality for the end-user but, unfortunately, creates many additional problems that have to be handled by the DDBMS, as we discuss in Section 22.5.

## Distributed processing
It is important to make a distinction between a distributed DBMS and distributed processing.

### Distributed processing
> A centralized database that can be accessed over a computer  network.


#### Figure 22.2. Distributed processing.
![](http://sungsoo.github.com/images/distributed-processing.png)]


The key point with the definition of a distributed DBMS is that the system consists of data that is physically distributed across a number of sites in the network. If the data is centralized, even though other users may be accessing the data over the network, we do not consider this to be a distributed DBMS, simply distributed processing. We illustrate the topology of distributed processing in Figure 22.2. Compare this figure, which has a central database at site 2, with Figure 22.1, which shows several sites each with their own database (DB).



## Parallel DBMSs
We also make a distinction between a distributed DBMS and a parallel DBMS.

### Parallel DBMS
> A DBMS running across multiple processors and disks that is designed  to execute operations in parallel, whenever possible, in order to improve
performance.


Parallel DBMSs are again based on the premise that single processor systems can no longer meet the growing requirements for cost-effective scalability, reliability, and performance. A powerful and financially attractive alternative to a single-processor-driven DBMS is a parallel DBMS driven by multiple processors. Parallel DBMSs link multiple, smaller machines to achieve the same throughput as a single, larger machine, often with greater scalability and reliability than single-processor DBMSs.
To provide multiple processors with common access to a single database, a parallel DBMS must provide for shared resource management. Which resources are shared and how those shared resources are implemented, directly affects the performance and scalability of the system which, in turn, determines its appropriateness for a given application/environment. The three main architectures for parallel DBMSs, as illustrated in Figure 22.3, are:

* shared memory; 
* shared disk;
* shared nothing.

**Shared memory** is a *tightly coupled architecture* in which multiple processors within a single system share system memory. Known as *symmetric multiprocessing* (SMP), this approach has become popular on platforms ranging from personal workstations that support a few microprocessors in parallel, to large **RISC** (Reduced Instruction Set Computer)based machines, all the way up to the largest mainframes. This architecture provides high-speed data access for a limited number of processors, but it is not scalable beyond about 64 processors when the interconnection network becomes a bottleneck.


**Shared disk** is a *loosely-coupled architecture* optimized for applications that are inherently centralized and require high availability and performance. Each processor can access all disks directly, but each has its own private memory. Like the shared nothing architecture, the shared disk architecture eliminates the shared memory performance bottleneck. Unlike the shared nothing architecture, however, the shared disk architecture eliminates this bottleneck without introducing the overhead associated with physically partitioned data. Shared disk systems are sometimes referred to as **clusters**.


**Shared nothing**, often known as *massively parallel processing* (MPP), is a multiple processor architecture in which each processor is part of a complete system, with its own memory and disk storage. The database is partitioned among all the disks on each system associated with the database, and data is transparently available to users on all systems. This architecture is more scalable than shared memory and can easily support a large number of processors. However, performance is optimal only when requested data is stored locally.


While the shared nothing definition sometimes includes distributed DBMSs, the distribution of data in a parallel DBMS is based solely on performance considerations. Further, the nodes of a DDBMS are typically geographically distributed, separately administered, and have a slower interconnection network, whereas the nodes of a parallel DBMS are typically within the same computer or within the same site.


Parallel technology is typically used for very large databases possibly of the order of terabytes (10<sup>12</sup> bytes), or systems that have to process thousands of transactions per second. These systems need access to large volumes of data and must provide timely responses to queries. A parallel DBMS can use the underlying architecture to improve the performance of complex query execution using parallel scan, join, and sort techniques that allow multiple processor nodes automatically to share the processing workload. We discuss this architecture further in Chapter 31 on data warehousing. Suffice it to note here that all the major DBMS vendors produce parallel versions of their database engines.

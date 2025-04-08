---
layout: post
title: Date's Twelve Rules for a DDBMS
date: 2014-05-14
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: *Database Systems, A Practical Approach to Design, Implementation, and Management*, Fourth Edition, Addition-Wesley, 2012.
* Authors: Thomas M. Connoly, Carolyn E. BEGG

[![](http://sungsoo.github.com/images/ddbms.png)](http://sungsoo.github.com/images/ddbms.png)

# Date’s Twelve Rules for a DDBMS 
We list Date’s twelve rules (or objectives) for DDBMSs (Date, 1987b). The basis for these rules is that a distributed DBMS should feel like a non-distributed DBMS to the user. These rules are akin to **Codd’s twelve rules** for *relational systems*.


## Fundamental principle

> To the user, a distributed system should look exactly like a non-distributed system.

## (1) Local autonomy
The sites in a distributed system should be *autonomous*. In this context, autonomy means that:
* local data is locally owned and managed;
* local operations remain purely local;
* all operations at a given site are controlled by that site.


## (2) No reliance on a central site
There should be no one site without which the system cannot operate. This implies that there should be no central servers for services such as transaction management, deadlock detection, query optimization, and management of the global system catalog.


## (3) Continuous operation
Ideally, there should never be a need for a planned system shutdown, for operations such as: n adding or removing a site from the system;
n the dynamic creation and deletion of fragments at one or more sites. 

## (4) Location independence
Location independence is equivalent to location transparency. The user should be able to access the database from any site. Furthermore, the user should be able to access all data as if it were stored at the user’s site, no matter where it is physically stored.
## (5) Fragmentation independence
The user should be able to access the data, no matter how it is fragmented.


## (6) Replication independence
The user should be unaware that data has been replicated. Thus, the user should not be able to access a particular copy of a data item directly, nor should the user have to specifically update all copies of a data item.


## (7) Distributed query processing
The system should be capable of processing queries that reference data at more than one site.


## (8) Distributed transaction processing
The system should support the transaction as the unit of recovery. The system should ensure that both global and local transactions conform to the ACID rules for transactions, namely: atomicity, consistency, isolation, and durability.


## (9) Hardware independence
It should be possible to run the DDBMS on a variety of hardware platforms.


## (10) Operating system independence
As a corollary to the previous rule, it should be possible to run the DDBMS on a variety of operating systems.


## (11) Network independence
Again, it should be possible to run the DDBMS on a variety of disparate communication networks.


## (12) Database independence
It should be possible to have a DDBMS made up of different local DBMSs, perhaps supporting different underlying data models. In other words, the system should support heterogeneity.
The last four rules are ideals. As the rules are so general, and as there is a lack of stand- ards in computer and network architectures, we can expect only partial compliance from vendors in the foreseeable future.


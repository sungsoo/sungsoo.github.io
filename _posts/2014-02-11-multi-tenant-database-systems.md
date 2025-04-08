---
layout: post
title: Multi-tenant Database Systems
date: 2014-02-11
categories: [computer science]
tags: [big data, data management]

---

Introduction
---

In this post, we shift our focus to another class of applications typically observed in a cloud platform, namely applications whose database and usage *footprints* are *small*. Such applications are typically observed in **Software-as-a-Service** (*SaaS*) solutions such as Salesforce.com or Microsoft Dynamics CRM (customer relationship management), and in applications deployed in various **Platform-as-a-Service** (*PaaS*) providers such as Google AppEngine and Microsoft Window Azure. Such SaaS and PaaS cloud infrastructures typically serve hundreds of thousands of small applications (called *tenants*). Dedicating a DBMS server for each tenant is often wasteful since the individual tenants’ resource requirements are often *small*. In order to reduce the total cost of operation, cloud providers typically *share resources* among the **tenants**, a model referred to as *multi-tenancy*. Multi-tenancy is possible in all tiers of the cloud software stack: the web/application tier, the caching tier, and the database tier (refer to Figure 1.1 for a simplified view of the cloud software stack). This post focuses on *multi-tenancy* in the database tier. Sharing the underlying data management infrastructure among a pool of tenants allows efficient use of resources and lowers the overall cost of serving applications.

### Figure 1.1: A simplified view of the software stack of a typical web-based application deployed in a cloud infrastructure.
![](http://sungsoo.github.com/images/cloud-software-stack.png)

Cloud Databases - Addressing The Multi-Tenant Problem
---
<iframe width="600" height="400" src="//www.youtube.com/embed/KfLvQaLkoaE" frameborder="0" allowfullscreen></iframe>

In addition to the sheer scale of the number of applications deployed, these small applications deployed in cloud platforms are often characterized by *high variance* in popularity, unpredictable load characteristics, flash crowds, and varying resource requirements. As a result, Cloud service providers hosting these applications face unprecedented challenges in serving these applications and managing their data. Such challenges include management of large DBMS installations supporting *thousands* of *tenants, tolerating failures, dynamic partitioning of databases, elastic load balancing* for effective resource utilization and cost optimization.

The concept of a multi-tenant database has been predominantly used in the context of **Software as a Service** (*SaaS*). The Salesforce.com model is often cited as a canonical example of this service paradigm. However, it is also interesting to study the various other models of multi-tenancy in the database tier and their interplay with resource sharing in the various cloud paradigms. A thorough understanding of these models of multi-tenancy is crucial for designing effective database management system (DBMS) targeting different application domains.

Many large enterprises, in addition to public cloud providers, often host a vast number of databases to serve a variety of disjoint projects or teams. These enterprises can leverage a multi- tenant cloud platform to consolidate the number of servers dedicated to database hosting. Curino et al. demonstrated, with the consolidation engine Kairos, that the number of database nodes can be consolidated by a factor between 5.5 vs.1 and 17 vs.1. Large multi-tenant databases are therefore an integral part of the infrastructure that serves such large numbers of small applications.

In this post, we provide a summary of multiple efforts in designing *large multi-tenant database systems* targeted to serve a large number of small applications typically encountered in a DBMS for a *PaaS paradigm* or enterprise environment. We concentrate on system-level issues related to enabling a multi-tenant DBMS for a broader class of systems. We specifically focus on *elastic load balancing* which ensures high resource utilization and lowers operational costs, *live migration* of a database as a primitive for elasticity, and some preliminary efforts for *autonomic control* of multi-tenant databases hosted in the cloud. Note that some of the *scale-out* transaction processing systems, such as ElasTraS, Relational Cloud, Megastore, and Cloud SQL Server, were also designed with native support for multi-tenancy.

### Figure 1.2: The different multi-tenancy models and their associated trade-offs.

![](http://sungsoo.github.com/images/multi-tenancy.png)

What is Multi-Tenant Storage?
---
Multi-tenant storage is an ideal way to deliver storage management granularization. It allows IT to meet its organization's performance and scaling demands, without increasing storage management costs. It is ideal for both cloud providers and managed service providers. 

George Crump's latest chalk-talk video takes a detailed look at multi-tenancy and one approach to multi-tenant storage provided by CloudByte, which is a native multi-tenant storage solution.

George Crump is the President and Founder of Storage Switzerland. With 25 years of experience designing storage solutions for data centers across the US, he has seen the birth of such technologies as RAID, NAS and SAN. Prior to founding Storage Switzerland, he was CTO at one of the nation's largest storage integrators where he was in charge of technology testing, integration and product selection.

<iframe width="600" height="400" src="//www.youtube.com/embed/efvsFBzZlj8" frameborder="0" allowfullscreen></iframe>

How to Plan for Multitenancy
---
Discussion of some security and networking considerations when building a multitenant cloud.

<iframe width="600" height="400" src="//www.youtube.com/embed/68vKW4DdL5I" frameborder="0" allowfullscreen></iframe>


Building Multi-Tenant SaaS Solutions on Windows Azure
---
"Software as a Service" (SaaS) is a software distribution model that uses the Internet to deploy, maintain and run software solutions. Applications that are built to be used by thousands of customers have the need to be configurable and customizable to a high degree. This has a strong impact on the applications' architectures. A single code base and a limited number of deployed instances have to serve a large number of customers (=tenants) although the users' view on the system may be very different. In this session Rainer Stropek presents challenges that ISVs are typically faced with when building such configurable multi-tenancy solutions. Based on this discussion Rainer will point out important consequences of multi-tenancy on operational costs and pricing models in SaaS solutions.

<iframe width="600" height="400" src="//www.youtube.com/embed/l3KacGF0nQQ" frameborder="0" allowfullscreen></iframe>

References
---
[1] Divyakant Agrawal, Sudipto Das, and Amr El Abbadi, *Data Management in the Cloud: Challenges and Opportunities*, Morgan & Claypool, 2013.
---
layout: post
title: Foundational data architecture patterns
date: 2013-12-14
categories: [computer science]
tags: [design patterns]

---

You may be asking yourself, “Why study relational patterns? Isn’t this book about NoSQL?” Remember, NoSQL means “Not only SQL.” Relational databases will con- tinue to be an appropriate solution to many business problems for the foreseeable future. But there are situations where relational databases aren’t the best match for a business problem. This article will review how RDBMSs store data (in tabular and row-oriented structures) used by online transactional systems, and the performance challenges this creates in distributed environments.

We’ll begin with a definition of data architecture patterns and look at how the needs of *enterprise resource planning (ERP)* systems drove RDBMS feature sets. We’ll then look at the most common SQL patterns such as row stores (used in most RDBMSs) and star schemas (used in OLAP, data warehouse, and business intelligence systems). We’ll become familiar with key SQL terms and discuss the main features of directory ser- vices, DNS services, and revision control systems.

You’ll understand the strengths and weaknesses of RDBMS systems and know when a NoSQL solution is a better fit. You’ll recognize key RDBMS terms and become familiar with some key features of directory services, DNS services, and document revision control systems. Before we dive into RDBMS’s strengths and weaknesses, we’ll start with a definition of a data architecture pattern and talk about its significance when selecting a database for your business application.


### What is a data architecture pattern?
So what exactly is a data architecture pattern and why is it useful in selecting the right database? Architectural patterns allow you to give precise names to recurring high- level data storage patterns. When you suggest a specific data architecture pattern as a solution to a business problem, you should use a consistent process that allows you to name the pattern, describe how it applies to the current business problem, and articu- late the pros and cons of the proposed solution. It’s important that all team members have the same understanding about how a particular pattern solves your problem so that when implemented, business goals and objectives are met.

The word pattern has many meanings. In general, it implies that given a new prob- lem, you have the ability to recognize structures that you’ve seen in the past. For our purposes, we define a data architecture pattern as a consistent way of representing data in a regular structure that will be stored in memory. Although the memory you store data in is usually long-term persistent memory, such as solid state disk or hard drives, these structures can also be stored in RAM and then transferred to persistent memory by another process.


It’s also important to understand the difference between a broad high-level data architecture pattern that’s used to identify how data is stored in a system versus a nar- row low-level design pattern that identifies how you interact with the data. For exam- ple, figure 3.1 shows the high-level, row-store data architecture pattern used in RDBMSs at the top of the diagram, and the low-level design patterns like joins, transac- tions, and views in the bottom part of the diagram.


As we continue along the NoSQL journey, we’ll talk about traditional RDBMS pat- terns as well as patterns specific to the NoSQL movement. You’ll come to quickly rec- ognize these patterns and how they’re used to build solutions that apply to your organization’s business requirements. We’ll begin our pattern discussion by looking at the RDBMS row-store pattern and the design patterns associated with it.

![http://sungsoo.github.com/images/high-level-data.png](http://sungsoo.github.com/images/high-level-data.png)


### References

[1] DAN MCCREARY ANN KELLY, Making Sense of NoSQL: A GUIDE FOR MANAGERS AND THE REST OF US, MANNING Publications, 2014. 





---
layout: post
title: NoSQL History
date: 2013-06-09 
categories: [computer science]
tags: [big data, data management, nosql]

---

### Relational
![http://sungsoo.github.com/images/relational.png](http://sungsoo.github.com/images/relational.png)

* Data is usually stored in row by row manner (row store)
* Standardized query language (SQL)
* Data model defined before you add data
* Joins merge data from multiple tables
* Results are tables
* **Pros**
	* mature ACID transactions with fine-grain security controls
* **Cons**
	* Requires up front data modeling, does not scale well 
* **Examples**
	* Oracle, MySQL, PostgreSQL, Microsoft SQL Server, IBM DB/2

Relational databases are designed to run on a single machine, so to scale, you need buy a bigger machine. But it’s cheaper and more effective to scale horizontally by buying lots of machines.

![http://sungsoo.github.com/images/sql-scale.png](http://sungsoo.github.com/images/sql-scale.png)

The machines in these large clusters are individually unreliable, but the overall cluster keeps working even as machines die - so the overall cluster is reliable.


The “cloud” is exactly this kind of cluster, which means relational databases don’t play well with the cloud.

The rise of web services provides an effective alternative to shared databases for application integration, making it easier for different applications to choose their own data storage.
	
Google and Amazon were both early adopters of large clusters, and both eschewed relational databases.
![http://sungsoo.github.com/images/bigtable-dynamo.png](http://sungsoo.github.com/images/bigtable-dynamo.png)

Their efforts have been a large inspiration to the NoSQL community.


### Analytical (OLAP)	
![http://sungsoo.github.com/images/analytical.png](http://sungsoo.github.com/images/analytical.png)

* Based on "Star" schema with central fact table for each event
* Optimized for analysis of read-analysis of historical data
* Use of MDX language to count query "measures" for "categories" of data
* **Pros**: fast queries for large data
* **Cons**: not optimized for transactions and updates
* **Examples**
	* Cognos, Hyperion, Microstrategy, Pentaho, Microsoft, Oracle, Business Objects
	
There is no standard definition of what NoSQL means. The term began with a workshop organized in 2009, but there is much argument about what databases can truly be called NoSQL.

But while there is no formal definition, there are some common characteristics of NoSQL databases.

* they don’t use the relational data model, and thus don’t use the SQL language
* they tend to be designed to run on a cluster
* they tend to be Open Source
* they don’t have a fixed schema, allowing you to store any data in any record


We should also remember Google’s Bigtable and Amazon’s SimpleDB. While these are tied to their host’s cloud service, they certainly fit the general operating characteristics.
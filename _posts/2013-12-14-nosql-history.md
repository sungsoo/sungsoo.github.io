---
layout: post
title: NoSQL History
categories: [Computer]
tags: [big data, data management, NoSQL]

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
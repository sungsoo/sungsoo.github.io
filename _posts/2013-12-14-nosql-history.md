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
	
### Analytical (OLAP)	
![http://sungsoo.github.com/images/analytical.png](http://sungsoo.github.com/images/analytical.png)

* Based on "Star" schema with central fact table for each event
* Optimized for analysis of read-analysis of historical data
* Use of MDX language to count query "measures" for "categories" of data
* **Pros**: fast queries for large data
* **Cons**: not optimized for transactions and updates
* **Examples**
	* Cognos, Hyperion, Microstrategy, Pentaho, Microsoft, Oracle, Business Objects
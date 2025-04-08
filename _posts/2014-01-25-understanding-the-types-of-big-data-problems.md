---
layout: post
title: Understanding the Types of Big Data Problems
date: 2014-01-25
categories: [computer science]
tags: [big data]

---

Understanding the Types of Big Data Problems
---
There are many types of *big data problems*, each requiring a different combination of NoSQL systems. After you’ve categorized your data and determined its type, you’ll find there are different solutions. How you build your own big data classification sys- tem might be different from this example, but the process of differentiating data types should be similar.
**Figure 1** is a good example of a high-level big data classification system.

#### Figure 1. A sample of a taxonomy of big data types. This post deals with read-mostly problems.
![](http://sungsoo.github.com/images/taxonomy-big-data.png)
 
Let’s take a look at some ways you classify big data problems and see how NoSQL systems are changing the way organizations use data.

* *Read-mostly* — Read-mostly data is the most common classification. It includes data that’s created once and rarely altered. This type of data is typically found in data warehouse applications but is also identified as a set of non-RDBMS items like images or video, event-logging data, published documents, or graph data. *Event data* includes things like retail sales events, hits on a website, system logging data, or real-time sensor data.

* *Log events* — When operational events occur in your enterprise, you can record it in a log file and include a timestamp so you know when the event occurred. *Log events* may be a web page click or an out-of-memory warning on a disk drive. In the past, the cost and amount of event data produced were so large that many organizations opted not to gather or analyze it. Today, NoSQL systems are changing companies’ thoughts on the value of log data as the cost to store and analyze it is more affordable.  
The ability to *cost-effectively* gather and store log events from all computers in your enterprise has lead to BI *operational intelligence* systems. Operational intelligence goes beyond analyzing trends in your web traffic or retail transactions. It can integrate information from network monitoring systems so you can detect problems before they impact your customers. Cost-effective NoSQL systems can be part of good operations management solutions.
  
* *Full-text documents* — This category of data includes any document that contains *natural-language* text like the English language. An important aspect of document stores is that you can query the entire contents of your office document in the same way you would query rows in your SQL system.  
This means that you can create new reports that combine traditional data in
RDBMSs as well as the data within your office documents. For example, you could create a single query that extracted all the authors of titles of PowerPoint slides that contained the keywords *NoSQL* or *big data*. The result of this list of authors could then be filtered with a list of titles in the HR database to show which people had the title of *Data Architect* or *Solution Architect*.  
This is a good example of how organizations are trying to tap into the hid- den skills that already exist within an organization for training and mentorship. Integrating documents into what can be queried is opening new doors in knowledge management and efficient staff utilization.


References
---
[1] DAN McCREARY and ANN KELLY, *Making Sense of NoSQL: A GUIDE FOR MANAGERS AND THE REST OF US*,  Manning Publications Co., 2014. 
---
layout: post
title: Introduction to Stream Computing
date: 2013-12-11
categories: [computer science]
tags: [big data]

---
### Stream Computing - Examples
#### General Examples
* Monitoring streams of low-level sensor inputs and emitting high-level interpretations of the raw data
* Responding to streams emanating from sensor inputs by emitting actuator commands
* Monitoring streams of data from Intrusion Detection sensor inputs and emitting alerts
* Monitoring streams of video data and interpreting scenes, scene changes, etc.

#### InfoSphere Streams Examples
* Traffic control system which takes in GPS information from public vehicles and caculates deviations from normal to recommend alternative routes
* Real-time correlation of information from multiple neonatal ICU monitors to detect potential life threatening conditions up to 24 hours earlier than an experienced ICU nurse

### The Need for Stream Computing
A need for real-time analytics on **BIG data**

* **Volume**  
Millions/Billions of events per second  
Terabytes/Petabytes per day

* **Variety**  
All kinds of data  
All kinds of analytics

* **Velocity**  
Insights in microseconds

* **Agility**  
Dynamically responsive  
Rapid application development

![http://sungsoo.github.com/images/big-data.png](http://sungsoo.github.com/images/big-data.png)

###Traditional Computing

* Historical fact finding
* Find and analyse information stored on disk
* Batch paradigm, pull model
* Query-driven: submit queries to static data

###Stream Computing

* Current fact finding
* Analyze data in motion - before it is stored
* Low latency paradigm, push model
* Data-driven: bring data to the analytics

### What is Stream Processing?
* Relational databases and warehouses find information stored on disk
* Streams analyses data before you store it
* Databases find the needle in the haystack
* Streams finds the needle as it's blowing by 





### References
[1] Brian Williams, IBM InfoSphere Streams Developer Education Section 1, October 2013.
---
layout: post
title: In-Memory Data Management Course
date: 2015-12-04
categories: [computer science]
tags: [data management]

---

# In-Memory Data Management - Implications on Enterprise Systems

## Course information

*In-Memory Data Management* focuses on the management of enterprise data in column-oriented in-memory databases. Latest hardware and software trends led to the development of a new revolutionary database technology that enables flexible and lightning-fast analysis of massive amounts of enterprise data. The basic concepts and design principles of this technology are explained in detail. Beyond that, the implications of the underlying design principles for future enterprise applications and their development are discussed. The course will explain in detail the differences and advantages of an in-memory column-oriented database in contrast to traditional row-oriented disk-based storages. The following topics are covered (among others):

* Requirements for Modern Enterprise Computing, Enterprise Application Characteristics
* Hardware Trends, Columnar Storage vs. Row Storage
* Dictionary Encoding, Compression
* Scans, Selects, Deletes, Inserts, Updates
* Indices, Joins
* Applications

You'll find additional video lecturing material on [www.tele-task.de](www.tele-task.de).

# Course contents

## Week 1:

The first week will give you an understanding of origins of enterprise computing. It is vital to know the historic development which lead to the emergence of current hardware as we know it now in order to understand the decisions made in the past. Many characteristics of current applications, like materialized aggregates and a reduction of detail in the stored information, have their roots in the past. While these measures were helpful in former systems, they form an obstacle which has to be overcome now in order to allow for new, dynamic applications.

## Week 2:

Within the second week, the differences between a horizontal, row oriented layout and a columnar layout are discussed. Concepts like compression and partitioning are introduced. Based on that, you will get an explanation of the internal steps performed inside the database to carry out the fundamental relational operations insert, update and delete. The week concludes with a fundamental difference of SanssouciDB to most other databases: the insert only approach. Following this concept, we circumvent several pitfalls concerning referential integrity and additionally gain the foundation for a gap-less time travel feature.

## Week 3:

The content of week 3 focuses on more advanced structures and operations within the database. The differential buffer, a means to prevent frequent resorting of the dictionaries and rewriting of the attribute vectors, is explained in further detail. Subsequently, also the merge process, which incorporates the changes from the differential buffer into the main store, is illustrated. The retrieval of information via the select statement, as well as related concepts like tuple reconstruction, early and late materialization, or a closer examination of the achieved scan speed, are also part of this week's schedule. The description of the join operation, which is used to connect information from different tables, concludes this week.

## Week 4:

Week 4 is all about aggregation. Aggregations are the centerpiece of every business analytics application. Given that huge impact of aggregates on all parts of a business, it is of great importance to understand what aggregate functions are, why we remove all materialized aggregates and go for aggregation on the fly. You will further learn how to greatly reduce the costs of this on demand approach by using the aggregate cache and understand its connection to the differential buffer and the merge process. In the units concluding this week, you will see new prototype applications using the aggregate cache to deliver complex simulations in real time.

## Week 5:

Week 5 sheds light on some more inner mechanisms of the database. What happens in emergency situations, when for example the power is turned off? Logging and recovery are vital parts to know in order to understand why an in-memory database is as secure as a traditional disk based one. Further, the benefits of replicas are explained. We conclude the week with an outlook onto the implications that arise with the tremendously increased speed at hands.

## Week 6:

Week 6 is centered on applications. The last conceptual unit is about data separation into active and passive. After that, we showcase several prototypes and sketch out potential fields to apply the technology, thereby also leaving the domain of pure enterprise solutions, by using main memory databases in weather simulations and medicine.

## Exam:

The final exam will cover all content from the previous weeks and test your understanding of the course as a whole.



## Prof. Hasso Plattner

This course is offered by

![](https://open.hpi.de/files/87215147-128a-4539-a441-577ec385760d?size=large)

Prof. Dr. h.c. Hasso Plattner is the chair of the "Enterprise Platform and Integration Concepts" research group at HPI. His research group focuses mainly on in-memory data management for enterprise applications and human-centered software design.

He is co-founder of SAP AG, where he served as the CEO until 2003 and has since been chairman of the supervisory board. SAP AG is the leading provider of enterprise software solutions. In his role as chief software advisor, he concentrates on defining the mid- and long-term technology strategy and direction of SAP.
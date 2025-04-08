---
layout: post
title: Polyglot Persistence
date: 2014-03-20
categories: [computer science]
tags: [big data]

---

# Overview
One of the most important services provided by operational databases (also called *data stores*) is **persistence**. Persistence guarantees that the data stored in a database won’t be changed without permissions and that it will available as long as it is important to the business. What good is a database if it cannot be trusted to protect the data you put in it? Given this most important requirement, you must then think about what kind of data you want to persist, how can you access and update it, and how can you use it to make business decisions. At this most fundamental level, the choice of your database engines is critical to your overall success with your big data implementation.

# Polyglot Persistence

The official definition of *polyglot* is “someone who speaks or writes several languages.” The term is borrowed in this context and redefined as a set of applications that use several core database technologies, and this is the most likely outcome of your big data implementation planning. It is going to be difficult to choose one persistence style no matter how narrow your approach to big data might be. A polyglot persistence database is used when it is necessary to solve a complex problem by breaking that problem into segments and applying different database models. It is then necessary to aggregate the results into a hybrid data storage and analysis solution. A number of factors affect this decision:


* You are already using polyglot persistence in your existing workplace. If your enterprise or organization is large, you are probably using multiple RDBMSs, data warehouses, data marts, flat files, content management servers, and so on. This hybrid environment is common, and you need to understand it so that you can make the right decisions about integration, analytics, timeliness of data, data visibility, and so on. You need to understand all of that because you need to figure out how it is going to fit into your big data implementation.

* The most ideal of environments, where you have only one persistence technology, is probably not suited to big data problem solving. At the very least, you will need to introduce another style of database and other supporting technologies for your new implementation.

* Depending on the *variety* and *velocity* of your big data gathering, you may need to consider different databases to support one implementation. You should also consider your requirements for transactional integrity. Do you need to support *ACID compliance* or will *BASE compliance* be sufficient?


As an example, suppose that you need to identify all the customers for your consumer hard goods product who have purchased in the last 12 months and have commented on social websites about their experience — AND whether they have had any support cases (when, how many, how resolved), where they acquired the product, how it was delivered (and was the delivery routing cost efficient with respect to energy consumption?), what they paid, how they paid, whether they have been to the company website, how many times, what they did on the site, and so on. Then suppose that you want to offer them a promotional discount to their smartphone when they are entering one of your (or one of your partners’) retail stores.


This is a big data challenge at its best. Multiple sources of data with very different structures need to be collected and analyzed so that you can get the answers to these questions. Then you need determine whether the customers qualify for the promotion and, in real time, push them a coupon offering them something new and interesting.


This type of problem cannot be solved easily or cost-effectively with one type of database technology. Even though some of the basic information is transactional and probably in an RDBMS, the other information is nonrelational and will require at least two types of persistence engines (spatial and graph). You now have *polyglot persistence*.

The Rise of NoSQL and Polyglot Persistence
---
In this talk from JaxConf 2012, Abdelmonaim Remani answers many common questions surrounding NoSQL.

The rise of NoSQL is characterized with confusion and ambiguity; very much like any fast-emerging organic movement in the absence of well-defined standards and adequate software solutions. Whether you are a developer or an architect, many questions come to mind when faced with the decision of where your data should be stored and how it should be managed. This talk will address many of these questions, as well as survey the most popular NoSQL technologies.

<iframe width="600" height="400" src="//www.youtube.com/embed/nbWPcmDS6X4" frameborder="0" allowfullscreen></iframe>

# References
[1] Judith Hurwitz, Alan Nugent, Dr. Fern Halper, and Marcia Kaufman, *Big Data For Dummies*, John Wiley & Sons, Inc., 2013.

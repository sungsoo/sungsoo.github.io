---
layout: post
title: Self-Driving Database Management Systems
date: 2017-01-05
categories: [computer science]
tags: [data management]

---

Self-Driving Database Management Systems
===

## Abstract 

In the last two decades, both researchers and vendors have built advisory tools to assist database administrators (DBAs) in various aspects of system tuning and physical design. Most of this previous work, however, is incomplete because they still require humans to make the final decisions about any changes to the database and are reactionary measures that fix problems after they occur.

What is needed for a truly “*self-driving*” database management system (DBMS) is a new architecture that is designed for autonomous operation. This is different than earlier attempts because all aspects of the system are controlled by an integrated planning component that not only optimizes the system for the current workload, but also predicts future workload trends so that the system can prepare itself accordingly. With this, the DBMS can support all of the previous tuning techniques without requiring a human to determine the right way and proper time to deploy them. It also enables new optimizations that are important for *modern high-performance DBMSs*, but which are not possible today because the complexity of managing these systems has surpassed the abilities of human experts.

This paper presents the architecture of Peloton, the first self-driving DBMS. Peloton’s autonomic capabilities are now possible due to algorithmic advancements in *deep learning*, as well as improvements in *hardware* and *adaptive database architectures*.

[![](http://sungsoo.github.com/images/peloton-architecture.png)](http://sungsoo.github.com/images/peloton-architecture.png)

[![](http://sungsoo.github.com/images/self-driving-actions.png)](http://sungsoo.github.com/images/self-driving-actions.png)
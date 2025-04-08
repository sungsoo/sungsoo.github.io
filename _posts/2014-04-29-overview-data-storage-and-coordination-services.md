---
layout: post
title: Overview of Data Storage and Coordination Services
date: 2014-04-29
categories: [computer science]
tags: [design patterns, big data]

---

## Article Source
* Title: *DISTRIBUTED SYSTEMS Concepts and Design* Fifth Edition
* Authors: George Coulouris, Jean Dollimore, Tim Kindberg and Gordon Blair

![](http://sungsoo.github.com/images/overview-storage.png)


# Overview of Data Storage and Coordination Services

We now present the *three* services that together provide *data* and *coordination* services to higher-level applications and services: the *Google File System*, *Chubby* and *Bigtable*. These are complementary services in the Google infrastructure:


* The **Google File System** is a distributed file system offering a similar service to NFS and AFS, as discussed in Chapter 12 [1]. It offers access to *unstructured* data in the form of files, but optimized to the styles of data and data access required by Google (very large files, for example).


* **Chubby** is a *multi-faceted* service supporting, for example, *coarse-grained distributed locking* for coordination in the distributed environment and the storage of very small quantities of data, complementing the large-scale storage offered by the Google File System.


* **Bigtable** offers access to more structured data in the form of tables that can be indexed in various ways including by row or column. Bigtable is therefore a style of *distributed database*, but unlike many databases it does not support full relational operators (these are viewed by Google as unnecessarily complex and unscalable ).


These three services are also *interdependent*. For example, Bigtable uses the Google File System for *storage* and Chubby for *coordination*.

# References
[1] George Coulouris, Jean Dollimore, Tim Kindberg and Gordon Blair, *DISTRIBUTED SYSTEMS Concepts and Design* Fifth Edition, Pearson Education, Inc., 2012.

---
layout: post
title: Features of Cloud and Grid Platforms
date: 2014-06-14
categories: [computer science]
tags: [parallel computing]

---

[![](http://sungsoo.github.com/images/features-of-cloud.png)](http://sungsoo.github.com/images/features-of-cloud.png)


---

# Summary 

This post is devoted to programming real cloud platforms. MapReduce, BigTable, Twister, Dryad, DryadLINQ, Hadoop, Sawzall, and Pig Latin are introduced and assessed. We use concrete examples to explain the implementation and application requirements in the cloud. We review core service models and access technologies. Cloud services provided by Google App Engine (GAE), Amazon Web Service (AWS), and Microsoft Windows Azure are illustrated by example applications. In particular, we illustrate how to programming the GAE, AWS EC2, S3, and EBS. We review the open-source Eucalyptus, Nimbus, and OpenNebula and the startup Manjrasoft Aneka system for cloud computing.

# Features of Cloud and Grid Platforms

In this section, we summarize important features in real cloud and grid platforms. In four tables, we cover the capabilities, traditional features, data features, and features for programmers and runtime systems to use. The entries in these tables are source references for anyone who wants to program the cloud efficiently. To get the most from this chapter, readers should refresh their familiarity with and understanding of the languages and software tools for service-oriented architecture (SOA) and web services introduced in Chapter 5.

## Cloud Capabilities and Platform Features

Commercial clouds need broad capabilities, as summarized in Table 6.1. These capabilities offer cost-effective utility computing with the elasticity to scale up and down in power. However, as well as this key distinguishing feature, commercial clouds offer a growing number of additional capabilities commonly termed “Platform as a Service” (PaaS). For Azure, current platform features include Azure Table, queues, blobs, Database SQL, and web and Worker roles. Amazon is often viewed as offering “just” Infrastructure as a Service (IaaS), but it continues to add platform features including SimpleDB (similar to Azure Table), queues, notification, monitoring, content delivery network, relational database, and MapReduce (Hadoop). Google does not currently offer a broad-based cloud service, but the Google App Engine (GAE) offers a powerful web application development environment.

![](http://sungsoo.github.com/images/table6-1.png)

Table 6.2 lists some low-level infrastructure features. Table 6.3 lists traditional programming environments for parallel and distributed systems that need to be supported in Cloud environments. They can be supplied as part of system (Cloud Platform) or user environment. Table 6.4 presents features emphasized by clouds and by some grids. Note that some of the features in Table 6.4 have only recently been offered in a major way. In particular, these features are not offered on academic cloud infrastructures such as Eucalyptus, Nimbus, OpenNebula, or Sector/Sphere (although Sector is a data parallel file system or DPFS classified in Table 6.4). We will cover these emerging cloud programming environments in Section 6.5.

![](http://sungsoo.github.com/images/table6-2.png)

![](http://sungsoo.github.com/images/table6-3.png)

![](http://sungsoo.github.com/images/table6-4.png)


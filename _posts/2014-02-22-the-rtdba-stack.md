---
layout: post
title: The Real-Time Big Data Architecture (RTDBA) Stack
date: 2014-02-22
categories: [computer science]
tags: [big data]

---
The RTDBA Stack
---

At this moment, it’s clear that an architecture for handling RTBDA is slowly emerging from a disparate set of programs and tools. What isn’t clear, however, is what that architecture will look like. One goal of this paper is sketching out a practical RTBDA roadmap that will serve a variety of stakeholders including users, vendors, investors, and corporate executives such as CIOs, CFOs and COOs who make or influence purchasing decisions around information technology.

Focusing on the stakeholders and their needs is important because it reminds us that the RTBDA technology exists for a specific purpose: creating value from data. It is also important to remember that “value” and “real time” will suggest different meanings to different subsets of stakeholders. There is presently no one-size-fits-all model, which makes sense when you consider that the interrelationships among people, processes and technologies within the RTBDA universe are still evolving.

David Smith writes a popular [blog](http://blog.revolutionanalytics.com) for Revolution Analytics on open source R, a programming language designed specifically for data an‐ alytics. He proposes a [four-layer RTBDA technology stack](http://www.slideshare.net/fullscreen/RevolutionAnalytics/realtime-big-data-analytics-from-deployment-to-production/10). Although his stack is geared for predictive analytics, it serves as a good [general model](http://www.revolutionanalytics.com/webinars/real-time-big-data-analytics-deployment-production):

![](http://sungsoo.github.com/images/real-time-big-data-stack.png)

<iframe width="600" height="400" src="//www.youtube.com/embed/DSQST2EaPnc" frameborder="0" allowfullscreen></iframe>

At the foundation is the *data layer*. At this level you have structured data in an RDBMS, NoSQL, Hbase, or Impala; unstructured data in Hadoop MapReduce; streaming data from the web, social media, sensors and operational systems; and limited capabilities for performing descriptive analytics. Tools such as Hive, HBase, Storm and Spark also sit at this layer. (Matei Zaharia suggests dividing the data layer into two layers, one for storage and the other for query processing)

The *analytics layer* sits above the data layer. The analytics layer includes a production environment for deploying real-time scoring and dynamic analytics; a development environment for building models; and a local data mart that is updated periodically from the data layer, situated near the analytics engine to improve performance.

On top of the analytics layer is the *integration layer*. It is the “glue” that holds the end-user applications and analytics engines together, and it usually includes a rules engine or CEP engine, and an API for dynamic analytics that “brokers” communication between app developers and data scientists.


The topmost layer is the *decision layer*. This is where the rubber meets the road, and it can include end-user applications such as desktop, mobile, and interactive web apps, as well as business intelligence software. This is the layer that most people “see.” It’s the layer at which business analysts, c-suite executives, and customers interact with the real-time big data analytics system.

Again, it’s important to note that each layer is associated with different sets of users, and that different sets of users will define “real time” differently. Moreover, the four layers aren’t passive lumps of technologies — each layer enables a critical phase of real-time analytics deployment.

References
---
[1] Mike Barlow, *Real-Time Big Data Analytics, Emerging Architecture*, pp. 13-15, O’Reilly Media, 2013.
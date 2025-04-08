---
layout: post
title: Five open source Big Data projects to watch
date: 2015-08-22
categories: [computer science]
tags: [big data]
html header: <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

---

## Article Source
* Title: [Five open source Big Data projects to watch](http://www.zdnet.com/article/five-open-source-big-data-projects-to-watch/?__scoop_post=9f3ff5d0-48f3-11e5-e658-00221934899c&__scoop_topic=2632326#__scoop_post=9f3ff5d0-48f3-11e5-e658-00221934899c&__scoop_topic=2632326)
* Authors:  [Andrew Brust](http://www.zdnet.com/meet-the-team/us/andrew-brust/) 

---

Take a look at the Apache Software Foundation's (ASF's) [list of projects](https://projects.apache.org/projects.html) and you may feel overwhelmed. Between top-level and incubating projects, there are far too many to keep track of. Filtering down the list to Big Data projects may not help, because that "smaller" list is still quite long. And don't forget that there are several noteworthy open source projects that aren't even under the ASF umbrella to begin with.

So, in the name of helpful triage, here are five projects to keep an eye on:

## Apache Flink
[Flink](http://flink.apache.org/) operates with a fault-tolerant, "exactly once" streaming data engine at its core, and treats batch operations as a special case of streaming. It offers libraries for machine learning and graph processing and is compatible with [Apache Kafka](http://kafka.apache.org/) and HBase, amongst other Hadoop components.

Flink may sound a lot like [Spark](http://spark.apache.org/), but its fault tolerant, streaming-first paradigm makes it a little different. Meanwhile, the two engines have a great deal of overlap in the scenarios they address, and some competition between the two may ensue. Grab the popcorn and keep an eye on this one.

## Apache Samza
The [Samza](http://samza.apache.org/) project is focused on streaming data processing. That space may seem to be already well-served by [Storm](http://storm.apache.org/), Spark and Flink (now that you know about it), but Samza has a few tricks up its sleeve. It works with Kafka and [YARN](http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html) out of the box but, according to its Web site, offers a pluggable architecture that enables integration with other messaging and execution engines.

Let's be clear about something: streaming data platforms are enjoying a hype cycle of their own at present. As is the nature of hype, this occurrence of it is disproportionate to the amount of streaming data work being done out there. But it's still important and will likely have the effect of making stream processing more, uh, mainstream.

The combination of Kafka and Samza is one with some cachet, as both were developed at LinkedIn. Code used in production before its open source project launches, especially at a big social media company with pressing Big Data concerns, naturally commands authority and attracts attention. But whether that's enough to overcome the popularity of [Spark Streaming](http://spark.apache.org/streaming/) and the broad support (especially form Hortonworks) for Storm remains to be seen.

## Ibis (Cloudera-incubated)
[I've written about Ibis before.](http://www.zdnet.com/article/ibm-amazon-cloudera-announcements-big-news-in-big-data/) It's a Cloudera-incubated project, geared to data scientists, that aims to bring the Python programming language into the world of distributed applications. Much as [Revolution Analytics](http://www.revolutionanalytics.com/) (now owned by Microsoft) has done for the R programming language, the Ibis team is working out a way for Python code to execute across nodes in a cluster instead of on a single workstation or server.

Interestingly, [Ibis](http://blog.cloudera.com/blog/2015/07/ibis-on-impala-python-at-scale-for-data-science/) achieves this distributed capability by piggy-backing on [Impala](http://www.cloudera.com/content/cloudera/en/products-and-services/cdh/impala.html), a massively parallel processing (MPP) SQL-on-Hadoop project, also incubated at Cloudera. The project team does, however, aim to make Ibis' coupling with Impala a loose one, so that it could run on other distributed platforms as well. Given Python's popularity (alongside R) in machine learning and predictive analytics, and given the importance of distributed computing to both of those pursuits, Ibis' uptake is worth monitoring.

## Apache Twill (incubating)
The [Twill](http://twill.incubator.apache.org/) project provides an abstraction layer over YARN, Hadoop's clustering and resource manager. YARN is the component that decouples Hadoop from the [MapReduce](http://hadoop.apache.org/docs/r1.2.1/mapred_tutorial.html) algorithm, permitting it to run while also allowing other processing engines -- including Spark and Flink -- to take its place. In doing so, YARN effectively turns Hadoop into a more general distributed computing platform. That, of course, has a lot of value.

The problem, however, is that YARN is complex, and has a steep learning curve. Twill's abstraction layer aims to make YARN development accessible to mainstream Java developers. Its team of 10 committers is lead by [Arun Murthy](https://www.linkedin.com/in/acmurthy), Hortonworks' Founder and Architect, and the driving force behind YARN and Tez. That indicates dedication to making Twill effectively part of the YARN offering, and that's pretty exciting.

## Apache Mahout-Samsara
[Mahout](http://mahout.apache.org/) is a machine learning engine that is neither new nor obscure in the land of Hadoop ecosystem projects. But I cover it here because it has gone through a major revamp with its 0.10.0 release in April, when a new mathematics environment called Samsara was added. Notably, Samsara runs on Apache Spark, not merely optionally but as a hard dependency.

This changes Mahout from being a MapReduce abstraction layer, and thus inheriting all of Hadoop MapReduce's overhead, to a more modern responsive scalable machine learning library. According to the project's Web site, MapReduce-based versions of Mahout's machine learning algorithms will continue to be supported, but no Hadoop implementations of new algorithms will be accepted for inclusion in the project.

This creates some interesting inter-project competitive scenarios. First off, it puts Mahout itself into competition with Spark's own [MLlib](http://spark.apache.org/mllib/) component. Second, it adds fuel to the competition between Spark and Hadoop itself.

## Where's Hadoop going?
If this small sampling of some of the many Big Data open source projects out there shows anything, it's that Hadoop isn't merely like a city, but rather a major metropolitan area. It has its suburbs, where its mayor has no jurisdiction, and where political beliefs may differ from those in the center of town. But it has its core character and it must be treated as a market in its own right. Practitioners have to approach "greater" Hadoop, not just the core project itself, or they risk missing trends in its adoption and evolution.
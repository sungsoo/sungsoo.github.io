---
layout: post
title: Introducing Apache Hadoop YARN
date: 2014-02-28 
categories: [computer science]
tags: [hadoop, yarn]

---


Introducing Apache Hadoop YARN
---

I’m thrilled to announce that the Apache Hadoop [community has decided to promote](http://mail-archives.apache.org/mod_mbox/hadoop-general/201208.mbox/%3C0C303878-A0CD-4E05-8381-22E3A6CF8619@hortonworks.com%3E) the next-generation Hadoop data-processing framework, i.e. YARN, to be a sub-project of Apache Hadoop in the ASF!

**Apache Hadoop YARN** joins Hadoop Common (core libraries), Hadoop HDFS (storage) and Hadoop MapReduce (the MapReduce implementation) as the sub-projects of the Apache Hadoop which, itself, is a [Top Level Project](http://projects.apache.org/indexes/quick.html) in the Apache Software Foundation. Until this milestone, YARN was a part of the Hadoop MapReduce project and now is poised to stand up on it’s own as a sub-project of Hadoop.

In a nutshell, Hadoop YARN is an attempt to take Apache Hadoop beyond MapReduce for data-processing.

As folks are aware, Hadoop HDFS is the data storage layer for Hadoop and MapReduce was the data-processing layer. However, the MapReduce algorithm, by itself, isn’t sufficient for the very wide variety of use-cases we see Hadoop being employed to solve. With YARN, Hadoop now has a generic resource-management and distributed application framework, where by, one can implement multiple data processing applications customized for the task at hand. Hadoop MapReduce is now one such application for YARN and I see several others given my vantage point – in future you will see MPI, graph-processing, simple services etc.; all co-existing with MapReduce applications in a Hadoop YARN cluster.

Implications for the Apache Hadoop Developer community
---

I’d like to take a brief moment to walk folks through the implications of making Hadoop YARN as a sub-project, particularly for members of the Hadoop developer community.

* We will now see a top-level hadoop-yarn-project source folder in Hadoop trunk.
* We will now use a separate jira project for issue tracking for YARN i.e. [https://issues.apache.org/jira/browse/YARN](https://issues.apache.org/jira/browse/YARN)
* We will also use a new yarn-dev@hadoop.apache.org mailing list for collaboration.
* We will continue to co-release a single Apache Hadoop release that will include the Common, HDFS, YARN and MapReduce sub-projects.


If you would like to play with YARN please download the latest hadoop-2 release from the ASF and start contributing – either to core YARN sub-project or start building your cool application on top!

Please do remember that hadoop-2 is still [deemed alpha quality](http://hortonworks.com/blog/apache-hadoop-2-0-alpha-released/) by the Apache Hadoop community, but YARN itself [shows a lot of promise](http://hortonworks.com/blog/delivering-on-hadoop-next-benchmarking-performance/) and we are excited by the future possibilities!

Conclusion
---

Overall, having Hadoop YARN as a sub-project of Apache Hadoop is a significant milestone for Hadoop several years in the making. Personally, it is very exciting given that this journey started more than 4 years ago with [https://issues.apache.org/jira/browse/MAPREDUCE-279]()https://issues.apache.org/jira/browse/MAPREDUCE-279). It’s a great pleasure, and honor, to get to this point by collaborating with a fantastic community that is driving Apache Hadoop.

References
---
[1]  Arun Murthy, [Introducing Apache Hadoop YARN](http://hortonworks.com/blog/introducing-apache-hadoop-yarn/), August 2012.

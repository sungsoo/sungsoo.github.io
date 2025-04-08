---
layout: post
title: Apache Tez 0.3 Released!
date: 2014-03-11 
categories: [computer science]
tags: [big data, tez]

---

### Summary

* Article Source: [*Apache Tez 0.3 Released!*](http://hortonworks.com/blog/apache-tez-0-3-released/)  
* Author: Bikas Saha

# Apache Tez 0.3 Released!

Security, Scalability, Fault Tolerance and Stability
---

The [Apache Tez](http://hortonworks.com/hadoop/tez/) community has [voted](http://mail-archives.apache.org/mod_mbox/tez-dev/201403.mbox/%3C46150FCE-23EB-4695-9E34-5698CDAD1A7D%40apache.org%3E) to release 0.3 of the software.

Apache™ Tez is a replacement of MapReduce that provides a powerful framework for executing a complex topology of tasks. Tez 0.3.0 is an important release towards making the software ready for wider adoption by focussing on fundamentals and ironing out several key functions. The major action areas in this release were

1. **Security**. Apache Tez now works on secure Hadoop 2.x clusters using the built-in security mechanisms of the Hadoop ecosystem.
2. **Scalability**. We tested the software on large clusters, very large data sets and large applications processing tens of TB each to make sure it scales well with both data-sets and machines.
3. **Fault Tolerance**. Apache Tez executes a complex DAG workflow that can be subject to multiple failure conditions in clusters of commodity hardware and is highly resilient to these and other sorts of failures.
4. **Stability**. A large number of bug fixes went into this release as early adopters and testers put the software through its paces and reported issues.

To prove the stability and performance of Tez, we executed complex jobs comprised of more than 50 different stages and tens of thousands of tasks on a fairly large cluster (> 300 Nodes, > 30TB data). Tez passed all our tests and we are certain that new adopters can integrate confidently with Tez and enjoy the same benefits as Apache Hive & Apache Pig have already.

There are promising signs of wider adoption of Tez, with the Apache Pig community being in the final testing phase of its initial migration to this new framework. The [43rd Bay Area Hadoop User Group](http://www.meetup.com/hadoop/events/116895522/) meetup became a Tez evening with Apache Hive and Apache Pig [showcasing](http://www.slideshare.net/ydn/pig-on-tez-hugfeb19) their current and future plans around Apache Tez. In addition, Concurrent Inc. has [plans]((http://www.infoq.com/news/2013/11/cascading)) to port to Tez as an execution engine for the Cascading, Scalding & Cascalog family of API’s. Last but not the least, Apache Hive with Tez integration is close to its first official [release](http://mail-archives.apache.org/mod_mbox/hive-dev/201402.mbox/%3CCD11B938-B4D9-4D2A-917D-60570A017716@hortonworks.com%3E) in [Hive 0.13](http://svn.apache.org/viewvc/hive/branches/branch-0.13/). That’s a great vote of confidence in the readiness of Tez.

Acknowledgements
---

The rapid progress made by Apache Tez can be attributed to the close cooperation displayed by the Tez, Hive and Pig communities. We would like to call out Vikram Dixit & Gunther Hagleitner from Hive, Rohini Palaniswamy, Daniel Dai & Cheolsoo Park from Pig, Gopal Vijayaraghavan – all-round performance ninja, Rajesh Balamohan – Hive performance guru, Ramya Sunil & Tassapol Athiapinya – Hortonworks QA, for their relentless scrutiny, valuable suggestions and timeless patience.

– Apache Tez team


# References

[1] Bikas Saha, [*Apache Tez 0.3 Released!*](http://hortonworks.com/blog/apache-tez-0-3-released/), BLOG, FROM THE DEV TEAM, March 10, 2014.
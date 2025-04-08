---
layout: post
title: Introducing Apache Tez 0.4
date: 2014-04-12
categories: [computer science]
tags: [big data]

---

# Introducing Apache Tez 0.4


Community Rocks
---


![Tez04](http://hortonworks.com/wp-content/uploads/2014/04/Tez04.png)

We are excited to announce that the [Apache™
Tez](http://hortonworks.com/hadoop/tez) community
[voted](http://mail-archives.apache.org/mod_mbox/tez-dev/201404.mbox/%3CCAOapiptvXSU1w6z36LEYW0zqD0EHLo3xKRS33%3DtXgCSpffECBg%40mail.gmail.com%3E)
to release version 0.4 of the software.

Apache Tez is an alternative to MapReduce that provides a powerful
framework for executing a complex topology of tasks for data access in
Hadoop. Version 0.4 incorporates the feedback from extensive testing of
Tez 0.3, released just last month.

This release is especially meaningful because it coincides with
completion of the [Stinger
Initiative](http://hortonworks.com/labs/stinger) (a collaborative
community effort involving 145 developers across 44 companies) and the
upcoming release of [Apache Hive
0.13](http://hortonworks.com/hadoop/hive).

<iframe width="600" height="400" src="//www.youtube.com/embed/Pn7Sp2-hUXE" frameborder="0" allowfullscreen></iframe>

Major community achievements in this Tez 0.4 release were:

-   **Application Recovery** – This is a major improvement to the Tez
    framework that preserves work when the job controller (YARN Tez
    Application Master) gets restarted due to node loss or cluster
    maintenance. When the Tez Application Master restarts, it will
    recover all the work that was already completed by the previous
    master. This is especially useful for long running jobs where
    restarting from scratch would waste work already completed.

-   **Stability for Hive on Tez** – We did considerable testing with the
    Apache Hive community to make sure the imminent release of Hive 0.13
    is stable on Tez. We appreciate the great partnership.

-   **Data Shuffle Improvements**– Data shuffling re-partitions and
    re-distributes data across the cluster. This is a major operation in
    distributed data processing, so performance and stability are
    important. Tez 0.4 includes improvements in memory consumption,
    connection management, and in the handling of errors and empty
    partitions.

-   **Windows Support** – The community fixed bugs and made changes to
    Tez so that it runs as smoothly on Windows as it does on Linux. We
    hope this will encourage adoption of Tez on Windows-based systems.

We hope that Tez 0.4 provides a stable, reliable and high performance
framework for wider community adoption. We encourage you to try out
Apache Tez for your use cases. We look forward to hearing feedback and
suggestions for improvements. We’re all ears!

Also, we would like to thank the wider Apache community for their
support and cooperation.

- The Apache Tez Team

### Download

-   [Tez 0.4
    Release](http://apache.mirrors.tds.net/incubator/tez/tez-0.4.0-incubating/)

# References
[1] [Bikas
Saha](http://hortonworks.com/blog/author/bikassaha/ "Posts by Bikas Saha"), [*Introducing Apache Tez 0.4*](http://hortonworks.com/blog/introducing-apache-tez-0-4/), Hortonworks Blog, April 9th, 2014.
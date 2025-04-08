---
layout: post
title: Build YARN Apps on Hadoop with Apache Slider
date: 2015-02-09
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Build YARN Apps on Hadoop with Apache Slider: Technical Preview Now Available](http://hortonworks.com/blog/apache-slider-technical-preview-now-available/)
* Authors: [Bob Page](http://hortonworks.com/blog/author/bpage/)



# Build YARN Apps on Hadoop with Apache Slider

A significant reason for the increased adoption of the Hortonworks Data
Platform by customers and partners has been Apache Hadoop
[YARN](http://hortonworks.com/yarn "YARN"). This major advance,
introduced last October in HDP2, allows Hadoop to move from many
single-purpose clusters to a versatile, integrated data platform that
hosts multiple business applications.

YARN has become the architectural center of Hadoop. We intend to make it
easier for applications to work in a YARN environment, and benefit from
the integrated capabilities and technologies that form the [blueprint
for enterprise Hadoop](http://hortonworks.com/hadoop/ "Blueprint"). For
that reason, we’re very excited about [Apache
Slider](http://slider.incubator.apache.org/ "Apache Slider").

### Introducing Apache Slider

In April, Hortonworks submitted Slider to the Apache Software Foundation
as an incubator project. Two months later, we’re happy to make Slider
available as a [Technical
Preview](http://public-repo-1.hortonworks.com/slider/0.30/HortonworksTechnicalPreview-Slider.pdf "Technical Preview").

Slider provides a set of platform services that enables  other
applications to quickly run in the YARN environment. It provides four
key benefits:

1.  **Simplified on-boarding of existing apps to Hadoop YARN**With
    Slider, distributed applications that aren’t YARN-aware can now
    “slide into YARN” to run on Hadoop – usually with no code changes.
2.  **Full capabilities of a YARN application**Slider allows
    applications to be provisioned, started, stopped, restarted on
    failure, monitored, expanded & shrunk, all while the application is
    running. It allows users to create and run multiple instances of
    applications, even with different application versions if needed.
3.  **Integrated participation in enterprise Hadoop**Slider allows
    applications to participate in a Hadoop ecosystem in an integrated
    and cooperative way, leveraging Hadoop’s data and processing
    resources, as well as benefiting from the security, governance, and
    operations capabilities of enterprise Hadoop.
4.  **Automated lifecycle management**Slider automatically makes
    applications manageable through Apache Ambari without any additional
    work.

Slider allows long-running applications, real-time services and online
applications to easily integrate into a Hadoop environment. It
complements [Apache
Tez](http://hortonworks.com/hadoop/tez "Apache Tez"), which is quickly
gaining adoption as the batch and interactive engine of Hadoop. These
engines, depicted in the diagram below, provide targeted mechanisms for
developers to create YARN-based applications.

[![slider](http://hortonworks.com/wp-content/uploads/2014/06/slider.png)](http://hortonworks.com/wp-content/uploads/2014/06/slider.png)

### Running HBase, Accumulo and Storm under YARN

Along with the Slider technical preview, we are including three Apache
projects as samples for Slider:

-   Apache HBase
-   Apache Accumulo
-   Apache Storm

Customers who have been eager to run these projects within their Hadoop
cluster are encouraged to try them out. For developers, we’ve included
the setup and configuration information for each of these projects to
assist in understanding how to “slide” existing distributed applications
onto YARN.

### Managing Slider Applications

As Slider brings new applications to the Hadoop ecosystem, the
applications will need to be managed – not just by YARN, but also by
Hadoop operators and administrators. The answer, of course, is to
leverage the open source [Apache
Ambari](http://ambari.apache.org/ "Apache Ambari") project. Slider
automatically makes the application manageable by Ambari without further
work on the application’s part. Today we’re also releasing a [Slider
View for Ambari Technical
Preview](http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.1.tech/HortonworksTechnicalPreview-SliderView.pdf "Slider View")
that can manage Slider applications.

### Innovating the Core of Enterprise Hadoop

As YARN took Hadoop 2 beyond batch, Slider will further accelerate that
promise by bringing new applications to Hadoop, and lowering the barrier
to run in a YARN environment. It’ll do so in a way that treats the
applications as an integrated part of the Hadoop ecosystem.

Slider continues Hortonworks’ commitment to innovating at the core of
100% open source Enterprise Hadoop, while enabling partners to expand
the range of solutions that make up the modern data architecture. We
think Slider will change the face of Hadoop, and we’re excited for you
to try it today.

### Discover and Learn More

-   [Building YARN Apps for
    Hadoop](http://hortonworks.com/get-started/yarn/ "Build YARN Apps")
-   [Download
    Slider](http://public-repo-1.hortonworks.com/slider/0.30/HortonworksTechnicalPreview-Slider.pdf "Slider Technical Preview")
-   [Download Slider View for
    Ambari](http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.1.tech/HortonworksTechnicalPreview-SliderView.pdf "Ambari Slider View")
-   [Participate in the Slider community
    forum](http://hortonworks.com/community/forums/forum/slider/ "Slider Community Forum")
-   [Visit Apache Slider
    homepage](http://slider.incubator.apache.org "Slider Incubator")

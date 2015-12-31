---
layout: post
title: Analytics in Motion (AIM)
date: 2016-01-08
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [Analytics in Motion (AIM)](https://www.systems.ethz.ch/node/516)

---

# Analytics in Motion (AIM)

## Description:

The goal of Analytics in Motion (AIM) is to bridge the gap between
write-optimized storage systems used for Online Transactional Processing
(OLTP) and read-optimized structures used in Online Analytical
Processing (OLAP) with a single shared data storage. The motivation for
this is to allow data to be processed in REAL-TIME, which cannot
be achieved by the traditional Data Warehousing approach where two
separated storage systems are used and data is regularly shifted from
the (write-optimized) OLTP to the (read-only) OLAP storage.
 

The AIM storage manager is a distributed key-value store and
builds on well-established methods like *Differential Updates*,
*Partitioned Data Processing*, *Shared Scan* and a novel PAX-based data
structure called *ColumMap*. It makes use of modern hardware features
like *SIMD* registers and cut-of-the-edge networking technologies like
*RDMA* and *Infinband*.

The industrial use case that motivated AIM is a Telco billing
system that is currently being designed by Huawei Technologies. The
system should be able to process 10,000 up to 100,000 events per second
and to answer up to 100 real-time analytical queries per second in less
than 100 milliseconds for analytical data between 30GB to 300GB.
Ideally, the system should scale near-linearly from 1 to 10
nodes.

After having implemented a first prototype that meets the
requirements of the industrial use case, we are now looking into how we
could make the system persistent (e.g. by using a log-based file
system), how to extend it to efficiently process joins and what are the
trade-offs between different alternatives for update processing
(copy-on-write / differential updates / in-place with multiple
versions). In addition, we have started comparing our system to
commercial competitors as well as comparable research prototypes like
*druid.io* and *HyPer*.
 

## Publications:

Publication in the **Proceedings of the 2015 ACM SIGMOD
international conference on Management of data. ACM, 2015. This
publication is based on a collaborative research project with the DB
group of Huawei in its European Reaseach Center (DBERC):**
 [Lucas Braun, Thomas Etter, Georgios Gasparis, Martin Kaufmann,
Donald Kossmann, Daniel Widmer, Aharon Avitzur, Anthony Iliopoulos,
Eliezer Levy, Ning Liang:***Analytics in Motion - High
Performance Event-Processing AND Real-Time Analytics in the Same
Database***](http://people.inf.ethz.ch/braunl/AIM-SIGMOD-2015.pdf)

## Project Members:

-   [Lucas Braun](/people/lucas-braun)
-   [Donald
    Kossmann](/people/prof-dr-donald-kossmann)[
    ](/people/martin-kaufmann)

## Opportunities:

Did you get curious or even enthusiastic about this project? We
are always searching for students interested in writing their Master's
Thesis or doing lab projects with us. If you are interested in
main-memory databases, streaming systems, or using new hardware features
(like SIMD) and have reasonable knowledge of C++, just send us an
email!

## Former Project Members:

-   Thomas Etter
-   Georgios Gasparis
-   Martin Kaufmann
-   Daniel Widmer

## Master's Thesis in this project:

-   [Georgios Gasparis - AIM: A System for Handling Enormous
    Workloads under Strict Latency and Scalability
    Regulations](http://systems.ethz.pubzone.org/pages/publications/showPublication.do?publicationId=2272921)
     
-    [Daniel Widmer - Real-Time Analytics in a High Volume Event
    Processing
    System](http://systems.ethz.pubzone.org/pages/publications/showPublication.do?publicationId=2575781)

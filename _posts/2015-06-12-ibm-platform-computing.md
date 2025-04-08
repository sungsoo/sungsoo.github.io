---
layout: post
title: Apache Hadoop vs. IBM Platform Symphony and Infosphere BigInsights
date: 2015-06-12
categories: [computer science]
tags: [big data, parallel computing]

---

## Article Source
* Title: [Apache Hadoop vs. IBM Platform Symphony and Infosphere BigInsights: see our breakthrough Hadoop performance](http://www.ibm.com/platformcomputing/products/symphony/highperfhadoop.html)

---

# Apache Hadoop vs. IBM Platform Symphony and Infosphere BigInsights

IBM has completed several big data benchmarks of significance employing
IBM Platform Symphony and various Hadoop distributions including IBM
Infosphere BigInsights. Platform Symphony is a distributed computing and
big data analytics product widely used in large scale grid computing
environments. IBM InfoSphere BigInsights brings the power of Hadoop to
the enterprise. Organizations using the two products together get the
benefit of a multi-tenant, heterogeneous application cluster with higher
utilization and performance. Using InfoSphere BigInsights you can gain
new insights from a combination of data sources and overcome the high
costs of converting unstructured data sources to a structured format.

Benchmarks that IBM has run include:

-   **The Terasort benchmark**, run on an IBM cloud using IBM InfoSphere
    BigInsights. In an unaudited result on a 1,000 Virtual Machine IBM
    private cloud environment, IBM obtained a breakthrough Terasort
    result, sorting 100 terabytes in 10,369 seconds, slightly less than
    3 hours. This bettered a prior world-record result, but required
    only 10% of the cores used in setting the previous record.
-   **A Contrail bio workload**, an open-source software package used
    for de novo genome assembly. In a controlled test conducted in March
    of 2013, Platform Symphony Advanced Edition was found to reduce the
    time required to sequence a 10K read sample from a reference e-coli
    bacteria genome by a factor of 3.4 on an eight-node Apache Hadoop
    cluster. Read the report here.
-   **The SWIM benchmark** (Statistical Workload Injector for
    MapReduce), a benchmark representing a real-world big data workload
    developed by University of California at Berkley in close
    cooperation with Facebook. This test provides rigorous measurements
    of the performance of MapReduce systems comprised of real industry
    workloads. In an audited result conducted by STAC Research,
    InfoSphere BigInsights, powered by Platform Symphony technology,
    accelerated SWIM/Facebook workload traces run using open-source
    Apache Hadoop by an average of approximately 4 times. A STAC Report
    featuring this result published in October of 2013 is available for
    download here.
-   **The "sleep" benchmark**, which has been used as a test of the
    efficiency of core scheduling of MapReduce workloads and which was
    promoted at Hadoop World 2011. IBM demonstrated that Platform
    Symphony Advanced Edition runs the sleep test almost 11 times faster
    than Apache Hadoop alone, demonstrating that low-latency scheduling
    is critical to maximizing Hadoop workload performance.

[**Audited
Report**](https://www.ibm.com/services/forms/signup.do?source=stg-web&S_PKG=ov12373)
 STAC Report - UCB SWIM & Hadoop

[**Benchmark**](https://www.ibm.com/services/forms/signup.do?source=stg-web&S_PKG=ov15389)
 Faster Genome sequencing with contrail-bio

[**Whitepaper**](https://www.ibm.com/services/forms/signup.do?source=stg-web&S_PKG=ov11757)
 Analyzing data at the speed of business

* * * * *

Get the Platform Symphony Advantage
-----------------------------------

While a major benefit of IBM Platform Symphony is its ability to support
diverse applications in a multi-tenant environment while ensuring
service levels, these performance tests show that IBM Platform Symphony
also helps provide dramatically better performance and efficiency, as
well as superior management and monitoring.

Clients using this technology in conjunction with Infosphere BigInsights
can get a fully supported high performance Hadoop stack with ease of
use, higher productivity with built-in accelerators, and management
tools.

-   Deliver faster and more accurate analysis for big data applications
    by doing greater processing with less infrastructure
-   Lower costs through reduction in infrastructure and administration
    overhead
-   Enable business agility by supporting multiple groups and diverse
    workloads on a single shared cluster

These results are important not only because they demonstrate faster
MapReduce job execution times, but because they show that organizations
running Hadoop workloads can save a significant amount of money on
computing infrastructure by using IBM Platform Symphony.

![UCB SWIM Results. Simulated Facebook workload. Symphony 5.2 SWIM 1,690
secs. Hadoop 1.0.1 SWIM 10,165
secs](http://sungsoo.github.com/images/symphony_performance_swimchart_364x250.jpg)

​

* * * * *

Terasort Benchmark
------------------

Running IBM InfoSphere BigInsights on a private cloud environment
managed by IBM Platform Symphony in August of 2012, IBM demonstrated a
100 TB terasort result on a cluster comprised of 1,000 virtual machines,
200 physical nodes and 2,400 processing cores. Running the industry
standard Terasort benchmark in this private cloud, IBM beat a prior
world-record^[1](#footer-note)^ using 17 times fewer servers and 12
times fewer total processing cores. This result showed not only that it
is straightforward to build a large-scale Hadoop environment using IBM's
cloud-based solutions, but that big data workloads with IBM BigInsights
can be run more economically using IBM Platform Symphony, providing
dramatic savings related to infrastructure, power and facilities.

### Hardware

-   200 IBM dx360M3 computers in iDataPlex racks
-   2 IBM dx360M3 computers in iDataPlex racks as master hosts
-   120 GB memory per host, 12 x 3 TB spindles per host
-   2,400 cores

### Software

-   1000 Virtual machines
-   RHEL 6.2 with KVM
-   IBM InfoSphere BigInsights 1.3.0.1
-   IBM Platform Symphony Advanced Edition 5.2
-   IBM Platform Symphony BigInsights Integration Path for 1.3.0.1

​

* * * * *

Contrail-bio Genome Sequencing Benchmark
----------------------------------------

Contrail is an open-source software effort that leverages Hadoop
MapReduce to accelerate de novo genome assembly. During March of 2013,
IBM conducted a series of tests to understand the performance advantage
that Symphony could offer on a reference Hadoop cluster running a 10K
read sample of an e-coli bacterium included as part of the Contrail
software suite. In an eight-node Hadoop cluster with 108 cores dedicated
to Map and Reduce tasks, Platform Symphony was found to compute results
3.4 times faster than Hadoop alone, reducing the job run-time from 873
seconds to 258 seconds on the same cluster and dataset. [Get the
results](https://www.ibm.com/services/forms/signup.do?source=stg-web&S_PKG=ov15389)

​

* * * * *

SWIM Benchmark
--------------

Equally compelling are results obtained using social media workloads.
The SWIM benchmark developed at University of California, Berkeley with
co-operation from Facebook, measures real-world MapReduce workloads by
simulating traces of application activity captured at Facebook in 2009
and 2010. The benchmark authors view it as a rigorous predictor of
MapReduce performance^[2](#footer-note)^.

Using this benchmark, IBM demonstrated, in results audited by an
independent testing organization, that by augmenting a Hadoop cluster
with BigInsights powered by Platform Symphony technology, the simulated
Facebook workloads were speeded up by a mean of 3.8X compared with
running on Apache Hadoop alone. As a corollary, given the nature of the
SWIM benchmark, this result demonstrated that equivalent performance
with Symphony could have been obtained with dramatically less hardware
and lower infrastructure cost.

### Hardware

-   17 IBM System x3630M3 computers as compute nodes
-   1 IBM System x3630M3 as master host

### Software

-   Apache Hadoop 1.1.2
-   IBM InfoSphere BigInsights Enterprise Edition 2.1.0.1 powered by
    Adaptive MapReduce^[3](#footer-note)^

**Results**

-   Mean speedup of BigInsights versus Apache Hadoop on 302 jobs of SWIM
    benchmark Facebook workload: 3.8X

* * * * *

Sleep Benchmark
---------------

The Hadoop “sleep” benchmark shared at Hadoop World in
2011^[4](#footer-note)^ was run to demonstrate the relative scheduling
efficiency of IBM Platform Symphony to competing Hadoop distributions.
This was an audited result published by a third party. Running this
standard test, which is promoted as a measure of scheduling efficiency,
IBM InfoSphere BigInsights powered by Platform Symphony technology
achieved a speedup of just under 11X for a Hadoop 1.1.2 sleep test
result comprised of 5000 x 1 msec map tasks.

### Hardware

-   17 IBM System x3630M3 computers as compute nodes
-   1 IBM System x3630M3 as master host

### Software

-   Apache Hadoop 1.1.2
-   InfoSphere BigInsights Enterprise Edition 2.1.0.1 powered by
    Adaptive MapReduce

**Results**

-   Mean task throughput 5,000 map tasks on BigInsights – 665.26 tasks /
    second
-   Task throughput 5,000 map tasks with Hadoop – 61.68 tasks / second

* * * * *

IBM Platform Symphony brings many advantages to distributed computing
environments including multi-tenancy, guaranteed service levels,
superior management tools, and support for diverse, heterogeneous
workloads. These benchmark results demonstrate that IBM Platform
Symphony can provide dramatic performance advantages and financial
savings to customers deploying big data environments. For IBM InfoSphere
BigInsights users, or those considering open-source or derivative Hadoop
environments, IBM Platform Symphony can help accelerate Hadoop workloads
while reducing cost and improving workload reliability.

​

* * * * *

The result established by [Yahoo in
2009](http://sortbenchmark.org/Yahoo2009.pdf) is regarded by many as a
de-facto standard 100 TB sorts result. Clearly technology changed in
three years, but what is notable is that this 2012 result was achieved
running in VMs while the Yahoo result was achieved on bare-metal, faster
in theory.
[SWIM benchmark details](https://github.com/SWIMProjectUCB/SWIM)

Adaptive MapReduce is based on a low latency MapReduce implementation
provided by IBM Platform Symphony that is included as a core feature in
IBM BigInsights Enterprise Edition.
[Benchmark presentation on
Slideshare](http://www.slideshare.net/cloudera/hadoop-world-2011-hadoop-and-performance-todd-lipcon-yanpei-chen-cloudera)
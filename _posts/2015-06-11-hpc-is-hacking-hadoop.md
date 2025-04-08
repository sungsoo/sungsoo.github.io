---
layout: post
title: How HPC is Hacking Hadoop
date: 2015-06-11
categories: [computer science]
tags: [big data, parallel computing]

---

## Article Source
* Title: [How HPC is Hacking Hadoop](http://www.hpcwire.com/2014/02/11/hpc-hacking-hadoop/)
* Authors: Nicole Hemsoth



---

# How HPC is Hacking Hadoop

Although the trend may be quiet and distributed across only a relative
few supercomputing sites, Hadoop and HPC are hopping hand-in-hand more
frequently. These two technology areas aren’t necessarily made for
another—there are limitations in what Hadoop can do. But a [stretch of
recent
research](http://www.hpcwire.com/2014/02/14/adapting-hadoop-hpc-environments/)
has been pushing the possibilities, especially when it comes to making
Hadoop fit data-intensive corners of scientific computing applications.

Despite the infrequency of news around Hadoop powering key research
applications, we’ve watched key centers on this path, including the San
Diego Supercomputer Center (which was one of the first to publish a
comprehensive overview of using [Hadoop on HPC
resources](http://www.sdsc.edu/~allans/MyHadoop.pdf)) with great
interest, and listened as nearly all major HPC system vendors (and many
software ones too) targeted Hadoop users with key enhancements, tailored
distributions, or even new product lines.

The research momentum behind Hadoop for HPC systems picked up in the
last couple of years in particular. Among notable items are other
explorations of [Hadoop for data-intensive
science](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=6253490&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D6253490),
adapting [MapReduce to an
HPC](http://ieeexplore.ieee.org/xpls/abs_all.jsp?arnumber=6076502)
environment, exploring it across
[different](http://dl.acm.org/citation.cfm?id=1713074) parallel file
systems, handling
[scheduling](http://link.springer.com/chapter/10.1007/978-3-642-32820-6_19#close)
and more. There are well over 2,000 peer-reviewed articles covering some
aspect of this trend. The general theme, when you map it out and reduce
it to a few words, is that the tooling required for HPC systems can be
tweaked to fit Hadoop, especially when the purpose (offering a potential
for more streamlined data management/processing on certain problems) is
clear.

When it comes to data-intensive computing and Hadoop’s potential role in
HPC, Dr. Glenn K. Lockwood at the San Diego Supercomputer Center (SDSC),
is one of the key sources for information about specific challenges and
opportunities. Most notably, Lockwood’s work on Hadoop for large-scale
systems has drawn attention, particularly in terms of his work with the
open source “big data” platform’s role on the Gordon system at SDSC.

Gordon is SDSC’s flash-based data-intensive computing resource. Although
aimed at “big data” scientific computing, the Appro-built system still
packs some serious compute power with its 16,160 cores, ranking at \#88
on the most recent Top 500 list. The true measure of performance for
Gordon, which was built to tackle data-intensive challenges, is in its
input/output operations per second (IOPs) measurement—back when the
machine was undergoing its acceptance cycle, it achieved 35 million
IOPs. All of these elements made for some prime experimental ground for
Lockwood and his colleagues.

In his role as a User Services Consultant at SDSC, Lockwood has been
tracking a [number of
projects](http://users.sdsc.edu/~glockwood/index.php) across the
data-intensive computing spectrum. His most recent explorations, aside
from running Hadoop clusters on Gordon, include writing Hadoop
applications in Python with Hadoop Streaming, using (and finding
parallel options for) the R language across supercomputers, and
benchmarking several data-intensive computing frameworks, architectures
and usage models.

“Although traditional supercomputers and Hadoop clusters are designed to
solve very different problems and are consequentially
architected differently, domain scientists are becoming increasingly
interested in learning how Hadoop works and how it may be useful in
addressing the data-intensive problems they face,” explained Lockwood. 
“Making Hadoop available on Gordon has really made it easy for
researchers to explore the features and benefits of Hadoop without
having to learn an entirely new cloud API or be a systems
administrator.”

He explained that instead, users can launch a Hadoop cluster by
submitting a single pre-made job script to the batch system on Gordon
with which they are already familiar. A “personal Hadoop cluster” is
then launched on their job’s nodes, and users can then load data into
their cluster’s distributed file system and run map/reduce
tasks.  “Literally one single qsub command starts up a fully featured
Hadoop cluster on Gordon’s 40 Gbps InfiniBand fabric with HDFS that is
either backed by Gordon’s 300 GB SSDs or its Lustre filesystem,” said
Lockwood. “This translates into Hadoop clusters capable of ingesting
data to HDFS at a rate in excess of 750 MB/s and completing a 1.6 TB
TeraSort in under 15 minutes. Because Gordon delivers this high
performance both in traditional and Hadoop-based workloads, researchers
can make meaningful performance comparisons on
production-scale datasets.”

Lockwood highlighted how this has dramatically reduced the entry barrier
for domain scientists who want to see what role Hadoop might play in
their analyses, and it follows that training and exploratory work has
driven a lot of the Hadoop use SDSC is currently seeing on Gordon.
 “Faculty and researchers at universities nationwide have been using
Gordon to teach courses in data analytics, and we’ve also been providing
plenty of hands-on training to the local and national research
communities via XSEDE, SDSC’s Summer Institute, PACE’s Data Mining Boot
Camps, and UCSD’s Extension program.  In addition, we’ve provided cycles
and classroom training for many applications built upon Hadoop including
Mahout, Pig, HBase, and RHadoop.”

In Lockwood’s view, ultimately, Hadoop’s application in the traditional
domain sciences is still in its infancy because the application
ecosystem based on Hadoop is not as mature as the MPI-based ecosystem.
 However, he says there is momentum in several non-traditional domains,
including bioinformatics and anthropology, which are embracing Hadoop
for production research on Gordon due to the natural fit of these
domains’ problems with the map/reduce paradigm. “For example, we are
supporting several projects that have begun exploring software built
upon Hadoop such as Crossbow, CloudBurst, and SeqPig as scalable
alternatives for massive genomic studies.  The evaluation process is
still early on, but being able to run these Hadoop-based applications
alongside the standard toolchain on Gordon is what is making the effort
tractable.”

For anyone interested in the challenges and opportunities of deploying
Hadoop on a complex system like Gordon, Lockwood has provided a rich
[overview here](http://users.sdsc.edu/~glockwood/di/hadoop-hpc.php).

Aside from Lockwood’s work and that of his colleagues at SDSC, we wanted
to point to some other projects that are helping HPC hack Hadoop to make
it fit into a more complex environment. The following short list are a
few of our top picks.

-   A review of the current state of [Hadoop/MapReduce in
    bioinformatics](http://www.biomedcentral.com/1471-2105/11/S12/S1)
-   Enabling HPC applications on [data-intensive file
    systems](http://www.cs.iit.edu/~scs/psfiles/jin_icpp_12.pdf)
-   Large scale [molecular dynamics simulation utilizing
    Hadoop](http://tigerprints.clemson.edu/cgi/viewcontent.cgi?article=1058&context=grads_symposium)
    for important part of workload
-   Benchmarking Hadoop [MapReduce and
    MPI](http://www.cs.utsa.edu/faculty/atc/pub/C47.pdf) on a cloud
    resource.
-   Genome resequencing using [Intel’s
    distribution](http://www.intel.pl/content/dam/www/public/us/en/documents/reports/genome-resequencing-with-crossbow-report.pdf)
    of Hadoop
-   MapReduce across [distributed
    datacenters](http://www.researchgate.net/publication/236268214_G-Hadoop_MapReduce_across_distributed_data_centers_for_data-intensive_computing/file/72e7e5179e6b87b58a.pdf)
    for data-intensive computing
-   How[MPI might
    boost](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=6047312&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D6047312)
    Hadoop and MapReduce applications
-   Thoughts on the data-intensive scalable computing [storage
    substrate](http://repository.cmu.edu/cgi/viewcontent.cgi?article=1731&context=compsci)
-   Hadoop in the [European Space Agency’s
    work](http://arc.aiaa.org/doi/pdf/10.2514/6.2012-1275512) via Gaia
-   Hadoop for [remote sensing
    analysis](http://www.ijetae.com/files/Volume2Issue4/IJETAE_0412_77.pdf)
-   HPC and Hadoop for researchers on a [shoestring
    budget](http://link.springer.com/chapter/10.1007/978-3-319-01863-8_21)
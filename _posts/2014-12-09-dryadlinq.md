---
layout: post
title: DryadLINQ
date: 2014-12-09
categories: [computer science]
tags: [big data]
---

## Article Source
* Title: [Dryad](http://research.microsoft.com/en-us/projects/dryadlinq/)
* Authors: [Roger Barga](http://research.microsoft.com/en-us/people/barga/)



Overview
========

The goal of DryadLINQ is to make distributed computing on large compute
cluster simple enough for every programmer. DryadLINQ combines two
important pieces of Microsoft technology: the
[Dryad](http://research.microsoft.com/en-us/projects/dryad/default.aspx)distributed execution engine
and the .NET Language Integrated Query
([LINQ](http://msdn2.microsoft.com/en-us/netframework/aa904594.aspx)).

Dryad provides reliable, distributed computing on thousands of servers
for large-scale data parallel applications. LINQ enables developers to
write and debug their applications in a SQL-like query language, relying
on the entire .NET library and using Visual Studio.  

<span id="8f1a0e8c-ca36-4c4e-97e9-3fbde58e87ac" class="ImageBlock fn"
style="MARGIN: 0px; WIDTH: 600px">![](http://research.microsoft.com/en-us/projects/dryadlinq/dryadlinq.png)<span
id="ImageCaption8f1a0e8c-ca36-4c4e-97e9-3fbde58e87ac"
class="ImageCaptionCoreCss ImageCaption"></span></span>
DryadLINQ translates LINQ programs into distributed Dryad computations:

-   C# and LINQ data objects become distributed partitioned files.
-   LINQ queries become distributed Dryad jobs.
-   C# methods become code running on the vertices of a Dryad job.

DryadLINQ has the following features:

-   **Declarative programming**: computations are expressed in a
    high-level language containing a superset of the best features of
    SQL, functional programming and .Net.
-   **Automatic parallelization**: from sequential declarative code the
    DryadLINQ compiler generates highly parallel query plans spanning
    large computer clusters. DryadLINQ also exploits multi-core
    parallelism on each machine.
-   **Integration with Visual Studio**: programmers in DryadLINQ take
    advantage of the comprehensive VS set of tools: Intellisense, code
    refactoring, integrated debugging, build, source code management.
-   **Integration with .Net**: all .Net libraries, including Visual
    Basic, and dynamic languages are available.
-   **Type safety**: distributed computations are statically
    type-checked.
-   **Automatic serialization**: data transport mechanisms automatically
    handle all .Net object types.
-   **Job graph optimizations**
    -   static: a rich set of term-rewriting query optimization rules is
        applied to the query plan, optimizing locality and improving
        performance.
    -   dynamic: run-time query plan optimizations automatically adapt
        the plan taking into account the statistics of the data set
        processed.
-   **Conciseness**: the following line of code is a complete
    implementation of the Map-Reduce computation framework in DryadLINQ:

<!-- -->

A commercial implementation of Dryad and DryadLINQ was released in 2011
in beta form under the name Linq to HPC:
<http://msdn.microsoft.com/en-us/library/hh378101.aspx>.


Publications
============

-   [Optimus: A Dynamic Rewriting Framework for Data-Parallel Execution
    Plans](/apps/pubs/default.aspx?id=185714),
    *Qifa Ke, Michael Isard, and Yuan Yu*
    *Eurosys 2013*, ACM, April 2013
-   [Fay: Extensible Distributed Tracing from Kernels to
    Clusters](http://budiu.info/work/fay-sosp11.pdf)
    *Úlfar Erlingsson, Marcus Peinado, Simon Peter, and Mihai Budiu*
    ACM Symposium on Operating Systems Principles (SOSP), Cascais,
    Portugal, October 23-26, 2011
-   [Parallelizing the Training of the Kinect Body Parts Labeling
    Algorithm](http://budiu.info/work/budiu-biglearn11.pdf)
    *Mihai Budiu, Jamie Shotton, Derek G. Murray, and Mark Finocchio*
    Big Learning: Algorithms, Systems and Tools for Learning at Scale,
    Sierra Nevada, Spain, December 16-17, 2011
-   Large-Scale Machine Learning using DryadLINQ, chapter in **Scaling
    Up Machine Learning**, *Frank McSherry, Yuan Yu, Mihai Budiu,
    Michael Isard, and Dennis Fetterly*, Cambridge University Press,
    December 2011
-   [TidyFS: A Simple and Small Distributed File
    System](/apps/pubs/default.aspx?id=148515), *Dennis Fetterly, Maya
    Haridasan, Michael Isard, and Swaminathan Sundararaman*, in
    Proceedings of the USENIX Annual Technical Conference (USENIX'11),
    USENIX, 15 June 2011
-   [Monitoring and Debugging DryadLINQ Applications with
    Daphne](http://budiu.info/work/jagannath-hips11.pdf)
    *Vilas Jagannath, Zuoning Yin, and Mihai Budiu*
    International Workshop on High-Level Parallel Programming Models and
    Supportive Environments (HIPS), Anchorage, AK, May 20, 2011
-   [DryadOpt: Branch-and-Bound on Distributed Data-Parallel Execution
    Engines](http://budiu.info/work/ipdps11.pdf)
    *Mihai Budiu, Daniel Delling, and Renato Werneck*
    IEEE International Parallel and Distributed Processing Symposium
    (IPDPS), Anchorage, AK, May 16-20, 2011
-   [Steno: automatic optimization of declarative
    queries](/apps/pubs/default.aspx?id=150003), *Derek G. Murray,
    Michael Isard and Yuan Yu, in Proceedings of PLDI 2011*, San Jose,
    CA, June 2011
-   [Nectar: Automatic Management of Data and Computation in
    Datacenters](/apps/pubs/default.aspx?id=138691), *Pradeep Kumar
    Gunda, Lenin Ravindranath, Chandramohan A. Thekkath, Yuan Yu, and Li
    Zhuang*, in *Proceedings of the 9th Symposium on Operating Systems
    Design and Implementation (OSDI)*, October 2010
-   [A Data-Parallel Toolkit for Information
    Retrieval](/apps/pubs/default.aspx?id=135446), *Dennis Fetterly and
    Frank McSherry*, in Proceedings of SIGIR, Association for Computing
    Machinery, Inc., 19 July 2010
-   [Quincy: Fair Scheduling for Distributed Computing
    Clusters](/apps/pubs/default.aspx?id=81516), *Michael Isard, Vijayan
    Prabhakaran, Jon Currey, Udi Wieder, Kunal Talwar, and Andrew
    Goldberg*, in *Proceedings of 22nd ACM Symposium on Operating
    Systems Principles*, Association for Computing Machinery, Inc., 11
    October 2009
-   [Privacy Integrated Queries](/apps/pubs/default.aspx?id=80218),
    *Frank McSherry*, in Proceedings of the 2009 ACM SIGMOD
    International Conference on Management of Data (SIGMOD), Association
    for Computing Machinery, Inc., June 2009
-   [Distributed Aggregation for Data-Parallel Computing: Interfaces and
    Implementations](/apps/pubs/?id=102138), *Yuan Yu, Pradeep Kumar
    Gunda, Michael Isard,* ACM Symposium on Operating Systems Principles
    (SOSP), October 2009

-   [Distributed Data-Parallel Computing Using a High-Level Programming
    Language](/apps/pubs/default.aspx?id=102137), *Michael Isard, Yuan
    Yu,* International Conference on Management of Data (SIGMOD), July
    2009

-   [DryadInc: Reusing work in large-scale
    computations](http://budiu.info/work/hotcloud09.pdf)
    *Lucian Popa, Mihai Budiu, Yuan Yu, and Michael Isard*
    Workshop on Hot Topics in Cloud Computing (HotCloud), San Diego, CA,
    June 15, 2009

-   [Hunting for problems with
    Artemis](http://budiu.info/work/wasl08.pdf)
    *Gabriela F. Creţu-Ciocârlie, Mihai Budiu, and Moises Goldszmidt*
    USENIX Workshop on the Analysis of System Logs (WASL), San Diego,
    CA, December 7, 2008
-   [DryadLINQ: A System for General-Purpose Distributed Data-Parallel
    Computing Using a High-Level
    Language](http://research.microsoft.com/en-us/projects/dryadlinq/dryadlinq.pdf)
    *Yuan Yu, Michael Isard, Dennis Fetterly, Mihai Budiu, Ulfar
    Erlingsson, Pradeep Kumar Gunda, and Jon Currey*
    Symposium on Operating System Design and Implementation (OSDI), San
    Diego, CA, December 8-10, 2008.
-   [Some sample programs written in
    DryadLINQ](/research/pubs/view.aspx?msr_tr_id=msr-tr-2008-74)
    *Yuan Yu, Michael Isard, Dennis Fetterly, Mihai Budiu, Ulfar
    Erlingsson, Pradeep Kumar Gunda, Jon Currey, Frank McSherry, and
    Kannan Achan
    *Microsoft Research Technical Report, MSR-TR-2008-74, May 2008, 37
    pages
-   [Dryad: Distributed Data-Parallel Programs from Sequential Building
    Blocks](http://research.microsoft.com/en-us/projects/dryadlinq/eurosys07.pdf)
    *Michael Isard, Mihai Budiu, Yuan Yu, Andrew Birrell, and Dennis
    Fetterly*
    European Conference on Computer Systems (EuroSys), Lisbon, Portugal,
    March 21-23, 2007.

Presentations
=============

-   [Distributed Data-Parallel Computing Using a High-Level Programming
    Language](http://research.microsoft.com/en-us/projects/dryadlinq/dryadlinq-sigmod.pptx)
    Presentation by Yuan Yu at SIGMOD, July, 2009
-   [DryadLINQ: A System for General-Purpose Distributed Data-Parallel
    Computing](http://research.microsoft.com/en-us/projects/dryadlinq/dryadlinq-osdi.pptx)
    Presentation by Yuan Yu at OSDI, December, 2008
-   [Cluster Computing with
    DryadLINQ](http://research.microsoft.com/en-us/projects/dryadlinq/dryad-talk-parc.pptx)
    Presentation by Mihai Budiu at Palo Alto Research Center CSL
    Colloquium, Palo Alto, CA May 8, 2008
-   [A Machine-Learning toolking in
    DryadLINQ](http://research.microsoft.com/en-us/projects/dryadlinq/ml-dryadlinq.pptx)
    Presentation slides in PowerPoint by Mihai Budiu and Kannan Achan.



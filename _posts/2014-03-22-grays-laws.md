---
layout: post
title: Gray’s Laws Database-centric Computing in Science
date: 2014-03-22
categories: [computer science]
tags: [big data]

---

### Summary

* Article Source: Gray’s Laws: Database-centric Computing in Science  
* Author: AlEXANDER S. SZAlAY, JOSE A. BLAKELEY

The explosion in scientific data has created a major challenge for cutting-edge scientific projects. With datasets growing beyond a few tens of terabytes, scientists have no off-the-shelf solutions that they can readily use to manage and analyze the data [1]. Successful projects to date have deployed various combinations of flat files and databases [2]. However, most of these solutions have been tailored to specific projects and would not be easy to generalize or scale to the next generation of experiments.   
Also, today’s computer architectures are increasingly *imbalanced*; the *latency gap* between multi-core CPUs and mechanical hard disks is growing every year, making the challenges of data-intensive computing harder to overcome [3]. What is needed is a systematic and general approach to these problems with an architecture that can scale into the future.

# Gray’s Laws

Jim Gray formulated several informal rules—or laws—that codify how to approach data engineering challenges related to *large-scale scientific datasets*. The laws are as follows.

1. Scientific computing is becoming increasingly *data intensive*.   
2. The solution is in a “**scale-out**” architecture.  
3. Bring **computations** to the **data**, rather than data to the
computations.  
4. Start the design with the “*20 queries.*”   
5. Go from “*working to working*.”

It is important to realize that the analysis of observational datasets is severely limited by the relatively low I/O performance of most of today’s computing platforms. High-performance numerical simulations are also increasingly feeling the “I/O bottleneck.” Once datasets exceed the random access memory (RAM) capacity of the system, locality in a multi-tiered cache no longer helps [4]. Yet very few high-end platforms provide a fast enough I/O subsystem.

*High-performance*, *scalable numerical computation* also presents an *algorithmic challenge*. Traditional numerical analysis packages have been designed to operate on datasets that fit in RAM. To tackle analyses that are orders of magnitude larger, these packages must be redesigned to work in a multi-phase, divide-and-conquer manner while maintaining their numerical accuracy. This suggests an approach in which a large-scale problem is decomposed into smaller pieces that can be solved in RAM, whereas the rest of the dataset resides on disk. This approach is analogous to the way in which database algorithms such as sorts or joins work on datasets larger than RAM. These challenges are reaching a critical stage.


Buying larger network storage systems and attaching them to clusters of compute nodes will not solve the problem because network/interconnect speeds are not growing fast enough to cope with the yearly doubling of the necessary storage. *Scale-out solutions advocate simple building blocks in which the data is partitioned among nodes with locally attached storage* [5]. The smaller and simpler these blocks are, the better the balance between CPUs, disks, and networking can become. Gray envisaged simple “CyberBricks” where each disk drive has its own CPU and networking [6]. While the number of nodes on such a system would be much larger than in a traditional “scale-up” architecture, the simplicity and lower cost of each node and the aggregate performance would more than make up for the added complexity. With the emergence of solid-state disks and low-power motherboards, we are on the verge of being able to build such systems [7].


# Database-centric Computing


Most scientific data analyses are performed in hierarchical steps. During the first pass, a subset of the data is extracted by either filtering on certain attributes (e.g., removing erroneous data) or extracting a vertical subset of the columns. In the next step, data are usually transformed or aggregated in some way. Of course, in more complex datasets, these patterns are often accompanied by complex joins among multiple datasets, such as external calibrations or extracting and analyzing different parts of a gene sequence [8]. As datasets grow ever larger, the most efficient way to perform most of these computations is clearly to move the analysis functions as close to the data as possible. It also turns out that most of these patterns are easily expressed by a set-oriented, declarative language whose execution can benefit enormously from cost-based query optimization, automatic parallelism, and indexes.


Gray and his collaborators have shown on several projects that existing relational database technologies can be successfully applied in this context [9]. There are also seamless ways to integrate complex class libraries written in procedural languages as an extension of the underlying database engine [10, 11].


**MapReduce** has become a popular distributed data analysis and computing paradigm in recent years [12]. The principles behind this paradigm resemble the *distributed grouping* and *aggregation* capabilities that have existed in parallel relational database systems for some time. New-generation parallel database systems such as Teradata, Aster Data, and Vertica have rebranded these capabilities as “*MapReduce in the database*.” New benchmarks comparing the merits of each approach have been developed [13].

# References
[1] A. S. Szalay and J. Gray, “*Science in an Exponential World*,” Nature, vol. 440, pp. 23–24, 2006, doi: 10.1038/440413a.  
[2] J. Becla and D. Wang, “*Lessons Learned from Managing a Petabyte*,” CIDR 2005 Conference, Asilomar, 2005, doi: 10.2172/839755.  
[3] G. Bell, J. Gray, and A. Szalay, “*Petascale Computational Systems: Balanced CyberInfrastructure in a Data-Centric World*,” IEEE Computer, vol. 39, pp. 110–112, 2006, doi: 10.1109/MC.2006.29.  
[4] W. W. Hsu and A. J. Smith, “*Characteristics of I/O traffic in personal computer and server workloads*,” IBM Sys. J., vol. 42, pp. 347–358, 2003, doi: 10.1147/sj.422.0347.  
[5] A. Szalay, G. Bell, et al., “*GrayWulf: Scalable Clustered Architecture for Data Intensive Computing*,” Proc. HICSS-42 Conference, Hawaii, 2009, doi: 10.1109/HICSS.2009.750.  
[6] J.Gray,Cyberbricks Talk at DEC/NT Wizards Conference,2004; T.Barclay, W.Chong, and J. Gray, “*TerraServer Bricks – A High Availability Cluster Alternative*,” Microsoft Technical Report, MSR-TR-2004-107,[http://research.microsoft.com/en-us/um/people/gray/talks/DEC_ Cyberbrick.ppt](http://research.microsoft.com/en-us/um/people/gray/talks/DEC_ Cyberbrick.ppt).  
[7] A. S. Szalay, G. Bell, A. Terzis, A. S. White, and J. Vandenberg, “*Low Power Amdahl Blades for Data-Intensive Computing*,” [http://perspectives.mvdirona.com/content/binary/AmdahlBladesV3.pdf](http://perspectives.mvdirona.com/content/binary/AmdahlBladesV3.pdf).  
[8] U. Roehm and J. A. Blakeley, “*Data Management for High-Throughput Genomics*,” Proc. CIDR, 2009.  
[9] J. Gray, D. T. Liu, M. A. Nieto-Santisteban, A. S. Szalay, G. Heber, and D. DeWitt, “*Scientific Data Management in the Coming Decade*,” ACM SIGMOD Record, vol. 34, no. 4, pp. 35–41, 2005; also MSR-TR-2005-10, doi: 10.1145/1107499.1107503.  
[10] A. Acheson et al., “*Hosting the .NET Runtime in Microsoft SQL Server*,” ACM SIGMOD Conf., 2004, doi: 10.1145/1007568.1007669.  
[11] J. A. Blakeley, M. Henaire, C. Kleinerman, I. Kunen, A. Prout, B. Richards, and V. Rao, “.NET Database Programmability and Extensibility in Microsoft SQL Server,” ACM SIGMOD Conf., 2008, doi: 10.1145/1376616.1376725.  
[12] J. Dean and S. Ghemawat, “*MapReduce: Simplified Data Processing on Large Clusters*,” OSDI, 2004, doi: 10.1145/1327452.1327492.  
[13] A. Pavlo et al., “A Comparison of Approaches to Large-Scale Data Analysis,” ACM SIGMOD Conf., 2009, doi: 10.1145/1559845.1559865.  
[14] C. Anderson. *The Long Tail*. New York: Random House, 2007.  
[15] A. R. Thakar, A. S. Szalay, P. Z. Kunszt, and J. Gray, “*The Sloan Digital Sky Survey Science
Archive: Migrating a Multi-Terabyte Astronomical Archive from Object to Relational DBMS*,” Comp. Sci. and Eng., vol. 5, no. 5, pp. 16–29, Sept. 2003.  
[16] A. Terzis, R. Musaloiu-E., J. Cogan, K. Szlavecz, A. Szalay, J. Gray, S. Ozer, M. Liang, J. Gupchup, and R. Burns, “*Wireless Sensor Networks for Soil Science*,” Int. J. Sensor Networks, to be published 2009.  
[17] Y. Li, E. Perlman, M. Wan, Y. Yang, C. Meneveau, R. Burns, S. Chen, A. Szalay, and
G. Eyink, “*A public turbulence database cluster and applications to study Lagrangian evolution of velocity increments in turbulence*,” J. Turbul., vol. 9, no. 31, pp. 1–29, 2008, doi: 10.1080/14685240802376389.  
[18] *Pan-STARRS: Panoramic Survey Telescope and Rapid Response System*, http://pan-starrs.ifa.hawaii.edu.  
[19] A. M. Parker, “*Understanding the Universe*,” in Towards 2020 Science, Microsoft Corporation, 2006, http://research.microsoft.com/towards2020science/background_overview.htm.  
[20] G. Bell, T. Hey, and A. Szalay, “*Beyond the Data Deluge*,” Science, vol. 323, no. 5919, pp. 1297–1298, 2009, doi: 10.1126/science.1170411.
---
layout: post
title: Connecting to the Scientists
date: 2014-03-22
categories: [computer science]
tags: [big data]

---

### Summary

* Article Source: Gray’s Laws: Database-centric Computing in Science  
* Author: AlEXANDER S. SZAlAY, JOSE A. BLAKELEY



# Connecting to the Scientists

One of the most challenging problems in *designing scientific databases* is to establish effective communication between the builder of the database and the domain scientists interested in the analysis. Most projects make the mistake of trying to be “everything for everyone.” It is clear that that some features are more important than others and that various design trade-offs are necessary, resulting in performance trade-offs.

Jim Gray came up with the *heuristic rule* of “**20 queries**.” On each project he was involved with, he asked for the *20 most important questions* the researchers wanted the data system to answer. He said that five questions are not enough to see a broader pattern, and a hundred questions would result in a shortage of focus. Since most selections involving human choices follow a “*long tail*,” or so-called **1/f distribution**, it is clear that the relative information in the queries ranked by importance is *logarithmic*, so the gain realized by going from approximately 20 (2<sup>4.5</sup>) to 100 (2<sup>6.5</sup>) is quite modest [14].

The *“20 queries” rule* is a moniker for a design step that engages the domain scientist and the database engineer in a conversation that helps bridge the *semantic gap*  between nouns and verbs used in the scientific domain and the entities and relationships stored in the database. Queries define the precise set of questions in terms of entities and relationships that domain scientists expect to pose to the database. At the end of a full iteration of this exercise, the domain scientist and the database speak a common language.

This approach has been very successful in keeping the design process focused on the most important features the system must support, while at the same time helping the domain scientists understand the database system trade-offs, thereby limiting “*feature creep*.”

Another design law is to move from working version to working version. Gray was very much aware of how quickly *data-driven computing architecture* changes, especially if it involves distributed data. *New distributed computing paradigms* come and go every other year, making it extremely difficult to engage in a multi-year top-down design and implementation cycle. By the time such a project is completed, the starting premises have become obsolete. If we build a system that starts working only if every one of its components functions correctly, we will never finish.

The only way to survive and make progress in such a world is to build modular systems in which individual components can be replaced as the underlying technologies evolve. Today’s *service-oriented architectures* are good examples of this. Web services have already gone through several major evolutionary stages, and the end is nowhere in sight.


# From Terascale to Petascale Scientific Databases


By using Microsoft SQL Server, we have successfully tackled several projects on a scale from a few terabytes (TB) to tens of terabytes [15-17]. Implementing databases that will soon exceed 100 TB also looks rather straightforward [18], but it is not entirely clear how science will cross the petascale barrier. As databases become larger and larger, they will inevitably start using an increasingly scaledout architecture. Data will be heavily partitioned, making *distributed*, *non-local queries* and *distributed joins* increasingly difficult.

For most of the petascale problems today, a simple *data-crawling* strategy over *massively scaled-out*, *share-nothing* data partitions has been adequate (MapReduce, Hadoop, etc.). But it is also clear that this layout is very suboptimal when a good index might provide better performance by orders of magnitude. Joins between tables of very different cardinalities have been notoriously difficult to use with these crawlers.

Databases have many things to offer in terms of more efficient plans. We also need to rethink the utility of expecting a monolithic result set. One can imagine crawlers over heavily partitioned databases implementing a construct that can provide results one bucket at a time, resulting in easier checkpointing and recovery in the middle of an extensive query. This approach is also useful for aggregate functions with a clause that would stop when the result is estimated to be within, for example, 99% accuracy. These simple enhancements would go a long way toward sidestepping huge monolithic queries—breaking them up into smaller, more manageable ones.


**Cloud computing** is another recently emerging paradigm. It offers obvious advantages, such as co-locating data with computations and an economy of scale in hosting the services. While these platforms obviously perform very well for their current intended use in search engines or elastic hosting of commercial Web sites, their role in scientific computing is yet to be clarified. In some scientific analysis scenarios, the data needs to be close to the experiment. In other cases, the nodes need to be tightly integrated with a very low latency. In yet other cases, very high I/O bandwidth is required. Each of these analysis strategies would be suboptimal in current virtualization environments. Certainly, more specialized data clouds are bound to emerge soon. In the next few years, we will see if scientific computing moves from universities to commercial service providers or whether it is necessary for the largest scientific data stores to be aggregated into one.


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
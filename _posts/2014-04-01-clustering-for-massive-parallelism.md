---
layout: post
title: Clustering for Massive Parallelism
date: 2014-04-01
categories: [computer science]
tags: [parallel computing]

---

# Clustering for Massive Parallelism

A *computer cluster* is a collection of interconnected stand-alone computers which can work together *collectively* and *cooperatively* as a single integrated computing resource pool. Clustering explores massive parallelism at the job level and achieves *high availability* (HA) through stand-alone operations. The benefits of computer clusters and *massively parallel processors* (MPPs) include scalable performance, HA, fault tolerance, modular growth, and use of commodity components. These features can sustain the generation changes experienced in hardware, software, and network components. Cluster computing became popular in the mid-1990s as traditional mainframes and vector supercomputers were proven to be less cost-effective in many *high-performance computing* (**HPC**) applications.

Of the Top 500 supercomputers reported in 2010, 85 percent were computer clusters or MPPs built with *homogeneous* nodes. Computer clusters have laid the foundation for today’s supercomputers, computational grids, and Internet clouds built over data centers. We have come a long way toward becoming addicted to computers. According to a recent IDC prediction, the HPC market will increase from $8.5 billion in 2010 to $10.5 billion by 2013. A majority of the Top 500 supercomputers are used for HPC applications in science and engineering. Meanwhile, the use of *high-throughput computing* (**HTC**) clusters of servers is growing rapidly in business and web services applications.

Cluster Development Trends
---
Support for clustering of computers has moved from interconnecting high-end mainframe computers to building clusters with massive numbers of x86 engines. Computer clustering started with the linking of large mainframe computers such as the IBM Sysplex and the SGI Origin 3000. Originally, this was motivated by a demand for cooperative group computing and to provide *higher availability* in critical enterprise applications.  
Subsequently, the clustering trend moved toward the networking of many 
“minicomputers, such as DEC’s VMS cluster, in which multiple VAXes were interconnected to share the same set of disk/tape controllers. Tandem’s Himalaya was designed as a business cluster for fault-tolerant *online transaction processing* (**OLTP**) applications.

In the early 1990s, the next move was to build UNIX-based workstation clusters represented by the Berkeley NOW (Network of Workstations) and IBM SP2 AIX-based server cluster. Beyond 2000, we see the trend moving to the clustering of RISC or x86 PC engines. Clustered products now appear as integrated systems, software tools, availability infrastructure, and operating system extensions. This clustering trend matches the downsizing trend in the computer industry. Supporting clusters of smaller nodes will increase sales by allowing modular *incremental* growth in cluster configurations. From IBM, DEC, Sun, and SGI to Compaq and Dell, the computer industry has leveraged clustering of low-cost servers or x86 desktops for their *cost-effectiveness*, *scalability*, and *HA* features.

Milestone Cluster Systems
---
Clustering has been a hot research challenge in computer architecture. *Fast communication*, *job scheduling*, *SSI*, and *HA* are active areas in cluster research. Table 2.1 lists some milestone cluster research projects and commercial cluster products. Details of these old clusters “products. Details of these old clusters can be found in [14]. These milestone projects have pioneered clustering hardware and middleware development over the past two decades. Each cluster project listed has developed some unique features. Modern clusters are headed toward HPC clusters as studied in Section 2.5.

![](http://sungsoo.github.com/images/milestone-research-cluster.png)

The NOW project addresses a whole spectrum of cluster computing issues, including architecture, software support for web servers, single system image, I/O and file system, efficient communication, and enhanced availability. The Rice University TreadMarks is a good example of software-implemented shared-memory cluster of workstations. The memory sharing is implemented with a user-space runtime library. This was a research cluster built over Sun Solaris workstations. Some cluster OS functions were developed, but were never marketed successfully.

A Unix cluster of SMP servers running VMS/OS with extensions, mainly used in high-availability applications. An AIX server cluster built with Power2 nodes and Omega network and supported by IBM Loadleveler and MPI extensions. A scalable and fault-tolerant cluster for OLTP and database processing built with non-stop operating system support. The Google search engine was built at Google using commodity components. MOSIX is a distributed operating systems for use in Linux clusters, multi-clusters, grids, and the clouds, originally developed by Hebrew University in 1999.



References
---

1. Adiga N, et al. In: An overview of the blue gene/L supercomputer. ACM Supercomputing Conference 2002. November 2002; [http://SC-2002.org/paperpdfs/pap.pap207.pdf](http://SC-2002.org/paperpdfs/pap.pap207.pdf).
2. Bader D, Pennington R. Cluster computing applications. Int J High Perform Comput. 2001.
3. Baker M, et al. Cluster computing white paper January 2001; [http://arxiv.org/abs/cs/0004014](http://arxiv.org/abs/cs/0004014).
4. Barak A, Shiloh A. The MOSIX Management Systems for Linux Clusters. Multi-Clusters and Clouds White paper 2010; [http://www.MOSIX.org//txt_pub.html](http://www.MOSIX.org//txt_pub.html).
5. Barak A, La’adan R. The MOSIX multicomputer operating systems for high-performance cluster computing. Future Gener Comput Syst. 1998;13:361–372.
6. Barroso L, Dean J, Holzle U. Web search for a planet: The Google cluster architecture. IEEE Micro. 2003;23(2):22–28.
7. High-Performance Cluster Computing. Vols. 1 and 2. Buyya R, ed. New Jersey: Prentice Hall; 1999.
8. Celebioglu O, Rajagopalan R, Ali R. Exploring InfiniBand as an HPC cluster interconnect 2004.
9. Cray, Inc, CrayXT System Specifications. [http://www.cray.com/Products/XT/Specifications.aspx](http://www.cray.com/Products/XT/Specifications.aspx), January 2010.
10. Dally B. GPU Computing to Exascale and Beyond. In: Keynote Address. ACM Supercomputing Conference. November 2010.
11. J. Dongarra, Visit to the National Supercomputer Center in Tianjin, China, Technical Report, University of “Tennessee and Oak Ridge National Laboratory, 20 February 2011.
12. Dongarra J. Survey of present and future supercomputer architectures and their interconnects. In: International Supercomputer Conference. Heidelberg, Germany. 2004.
13. Hwang K, Jin H, Ho RS. Orthogonal striping and mirroring in distributed RAID for I/O-Centric cluster computing. IEEE Trans Parallel Distrib Syst. 2002;13(2):26–44.
14. Hwang K, Xu Z. Support of clustering and availability. In: Scalable Parallel Computing. McGraw-Hill 1998; Chapter 9.
15. Hwang K, Wang CM, Wang CL, Xu Z. Resource scaling effects on MPP performance: STAP benchmark implications. IEEE Trans Parallel Distrib Syst. 1999;(May):509–527.
16. Hwang K, Jin H, Chow E, Wang CL, Xu Z. Designing SSI clusters with hierarchical checkpointing and single-I/O space. IEEE Concurrency 1999;(January):60–69.
17. Jin H, Hwang K. Adaptive sector grouping to reduce false sharing of distributed RAID clusters. J Clust Comput. 2001;4(2):133–143.
18. J. Kevin, et al., Entering the petaflop era: the architecture of performance of Roadrunner, [http://www.c3.lanl.gov/~kei/mypubbib/papers/SC08:Roadrunner.pdf](http://www.c3.lanl.gov/~kei/mypubbib/papers/SC08:Roadrunner.pdf), November 2008.
19. Kindratenko V, et al. GPU Clusters for High-Performance Computing. National Center for Supercomputing Applications Urbana, IL: University of Illinois at Urban-Champaign; 2009.
20. Kopper K. The Linux Enterprise Cluster: Building a Highly Available Cluster with Commodity Hardware and Free Software San Francisco, CA: No Starch Press; 2005.
21. Lin SW, Lau RW, Hwang K, Lin X, Cheung PY. Adaptive parallel Image rendering on multiprocessors and workstation clusters. IEEE Trans Parallel Distrib Syst. 2001;12(3):241–258.
22. Liu J, Panda DK, et al. Performance comparison of MPI implementations over InfiniBand. Myrinet and Quadrics 2003.
23. Lucke R. Building Clustered Linux Systems New Jersey: Prentice Hall; 2005.
24. E. Marcus, H. Stern, Blueprints for High Availability: Designing Resilient Distributed Systems, Wiley.
25. TOP500.org. Top-500 World’s fastest supercomputers, www.top500.org, November 2010.
26. Pfister GF. Search of Clusters second ed. Prentice-Hall 2001.
27. Sun NH. China’s Nebulae Supercomputer Institute of Computing Technology, Chinese Academy of Sciences July 2010.
28. Wikipedia, IBM Roadrunner. [http://en.wikipedia.org/wiki/IBM_Roadrunner](http://en.wikipedia.org/wiki/IBM_Roadrunner), 2010, (accessed 10.01.10).
29. Wikipedia, Tianhe-1. [http://en.wikipedia.org/wiki/Tianhe-1](http://en.wikipedia.org/wiki/Tianhe-1), 2011, (accessed 5.02.11).
30. Wikipedia, MOSIX. [http://en.wikipedia.org/wiki/MOSIX](http://en.wikipedia.org/wiki/MOSIX), 2011, (accessed 10.02.11).
31. Wikipedia, CUDA. [http://en.wikipedia.org/wiki/CUDA](http://en.wikipedia.org/wiki/CUDA), 2011, (accessed 19.02.11).
32. Wong K, Franklin M. Checkpointing in distributed computing systems. J Parallel Distrib Comput 1996;67–75.
33. Xu Z, Hwang K. Designing superservers with clusters and commodity components. Annual Advances in Scalable Computing Singapore: World Scientific; 1999.
34. Xu Z, Hwang K. MPP versus clusters for scalable computing. In: Proceedings of the 2nd IEEE International Symposium on Parallel Architectures, Algorithms, and Networks. June 1996;117–123.
35. Zhou S. LSF: Load Sharing and Batch Queuing Software Canada: Platform Computing Corp.; 1996.


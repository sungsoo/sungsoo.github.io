---
layout: post
title: Design Objectives of Computer Clusters
date: 2014-04-01
categories: [computer science]
tags: [parallel computing]

---

## Summary

* Article Source: *Distributed and Cloud Computing*; From Parallel Processing to the Internet of Things    
* Authors: Kai Hwang, Geoffery C. Fox, Jack J. Dongarra



# Design Objectives of Computer Clusters

Clusters have been classified in various ways in the literature. We classify clusters using *six* orthogonal attributes: *scalability*, *packaging*, *control*, *homogeneity*, *programmability*, and *security*.


Scalability
---
Clustering of computers is based on the concept of modular growth. To scale a cluster from hundreds of uniprocessor nodes to a supercluster with 10,000 multicore nodes is a nontrivial task. The scalability could be limited by a number of factors, such as the multicore chip technology, cluster topology, packaging method, power consumption, and cooling scheme applied. The purpose is to achieve scalable performance constrained by the aforementioned factors. We have to also consider other limiting factors such as the memory wall, disk I/O bottlenecks, and latency tolerance, among others.

Packaging
---
Cluster nodes can be packaged in a compact or a slack fashion. In a *compact* cluster, the nodes are closely packaged in one or more racks sitting in a room, and the nodes are not attached to peripherals (monitors, keyboards, mice, etc.). In a *slack* cluster, the nodes are attached to their usual peripherals (i.e., they are complete SMPs, workstations, and PCs), and they may be located in different rooms, different buildings, or even remote regions. Packaging directly affects communication wire length, and thus the selection of interconnection technology used. While a compact cluster can utilize a high-bandwidth, low-latency communication network that is often proprietary, nodes of a slack cluster are normally connected through standard LANs or WANs.

Control
---
A cluster can be either controlled or managed in a *centralized* or *decentralized* fashion. A compact cluster normally has centralized control, while a slack cluster can be controlled either way. In a centralized cluster, all the nodes are owned, controlled, managed, and administered by a central operator. In a decentralized cluster, the nodes have individual owners. For instance, consider a cluster comprising an interconnected set of desktop workstations in a department, where each workstation is individually owned by an employee. The owner can reconfigure, upgrade, or even shut down the workstation at any time. This lack of a single point of control makes system administration of such a cluster very difficult. It also calls for special techniques for process scheduling, workload migration, checkpointing, accounting, and other similar tasks.

Homogeneity
---
A *homogeneous* cluster uses nodes from the same platform, that is, the same processor architecture and the same operating system; often, the nodes are from the same vendors. A *heterogeneous* cluster uses nodes of different platforms. Interoperability is an important issue in heterogeneous clusters. For instance, process migration is often needed for load balancing or availability. In a homogeneous cluster, a binary process image can migrate to another node and continue execution. This is not feasible in a heterogeneous cluster, as the binary code will not be executable when the process migrates to a node of a different platform.

Security
---
Intracluster communication can be either exposed or enclosed. In an exposed cluster, the communication paths among the nodes are exposed to the outside world. An outside machine can access the communication paths, and thus individual nodes, using standard protocols (e.g., TCP/IP). Such exposed clusters are easy to implement, but have several disadvantages:

* Being exposed, intracluster communication is not secure, unless the communication subsystem performs additional work to ensure privacy and security.
* Outside communications may disrupt intracluster communications in an unpredictable fashion. For instance, heavy BBS traffic may disrupt production jobs.
* Standard communication protocols tend to have high overhead.


In an enclosed cluster, intracluster communication is shielded from the outside world, which alleviates the aforementioned problems. A disadvantage is that there is currently no standard for efficient, enclosed intracluster communication. Consequently, most commercial or academic clusters realize fast communications through one-of-a-kind protocols.

Dedicated versus Enterprise Clusters
---
A *dedicated cluster* is typically installed in a deskside rack in a central computer room. It is homogeneously configured with the same type of computer nodes and managed by a single administrator group like a frontend host. Dedicated clusters are used as substitutes for traditional mainframes or supercomputers. A dedicated cluster is installed, used, and administered as a single machine. Many users can log in to the cluster to execute both interactive and batch jobs. The cluster offers much enhanced throughput, as well as reduced response time.

An *enterprise cluster* is mainly used to utilize idle resources in the nodes. Each node is usually a full-fledged SMP, workstation, or PC, with all the necessary peripherals attached. The nodes are typically geographically distributed, and are not necessarily in the same room or even in the same building. The nodes are individually owned by multiple owners. The cluster administrator has only limited control over the nodes, as a node can be turned off at any time by its owner. The owner’s “local” jobs have higher priority than enterprise jobs. The cluster is often configured with heterogeneous computer nodes. The nodes are often connected through a low-cost Ethernet network. Most data centers are structured with clusters of low-cost servers. Virtual clusters play a crucial role in upgrading data centers.



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


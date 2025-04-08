---
layout: post
title: Apache Hadoop YARN – History and Rationale
date: 2014-03-03
categories: [computer science]
tags: [big data]

---

Requirements' Origin
---

1. Scalability
2. Multi-tenancy
3. Serviceability
4. Locality Awareness
5. High Cluster Utilization
6. Reliability/Availability
7. Secure and Auditable Operation
8. Support for Programming Model Diversity
9. Flexible Resource Model
10. Backward compatibility


In this section, we provide the historical account of how YARN’s requirements emerged from practical needs. The reader not interested in the requirements’ origin is invited to skim over this section (the requirements are highlighted for convenience), and proceed to Section 3 where we provide a terse description of the YARN’s architecture.

Scalability
---

**Yahoo!** adopted Apache Hadoop in 2006 to replace the infrastructure driving its WebMap application [11], the technology that builds a graph of the known web to power its search engine. At the time, the *web graph* contained more than 100 billion nodes and 1 trillion edges. The previous infrastructure, named “**Dreadnaught**,” [25] had reached the limits of its scalability at 800 machines and a significant shift in its architecture was required to match the pace of the web. Dreadnought already executed distributed applications that resembled MapReduce [12] programs, so by adopting a more *scalable MapReduce framework*, significant parts of the search pipeline could be migrated easily. This highlights the first requirement that will survive throughout early versions of Hadoop, all the way to YARN—**[R1:] Scalability**.

Multi-tenancy
---

In addition to extremely large-scale pipelines for Yahoo! Search, scientists optimizing *advertising analytics*, *spam filtering*, and *content optimization* drove many of its early requirements. As the Apache Hadoop community scaled the platform for ever-larger MapReduce jobs, requirements around **[R2:] Multi-tenancy** started to take shape. The engineering priorities and intermediate stages of the compute platform are best understood in
this context. YARN’s architecture addresses many long-standing requirements, based on experience evolving the MapReduce platform. In the rest of the paper, we will assume general understanding of classic Hadoop architecture, a brief summary of which is provided in Appendix A [33].



The era of ad-hoc clusters
---

Some of Hadoop’s earliest users would bring up a cluster on a handful of nodes, load their data into the *Hadoop Distributed File System* (HDFS)[27], obtain the result they were interested in by writing MapReduce jobs, then tear it down [15]. As Hadoop’s fault tolerance improved, persistent HDFS clusters became the norm. At Yahoo!, operators would load “interesting” datasets into a shared cluster, attracting scientists interested in deriving insights from them. While large-scale computation was still a primary driver of development, HDFS also acquired a permission model, quotas, and other features to improve its *multi-tenant operation*.

Serviceability
---

To address some of its multi-tenancy issues, Yahoo! developed and deployed *Hadoop on Demand* (HoD), which used Torque[7] and Maui[20] to allocate Hadoop clusters on a shared pool of hardware. Users would submit their job with a description of an appropriately sized compute cluster to **Torque**, which would enqueue the job until enough nodes become available. Onces nodes become available, Torque would start HoD’s ’leader’ process on the head node, which would then interact with Torque/Maui to start HoD’s slave processes that subsequently spawn a JobTracker and TaskTrackers for that user which then accept a sequence of jobs. When the user released the cluster, the system would automatically collect the user’s logs and return the nodes to the shared pool. Because HoD sets up a new cluster for every job, users could run (slightly) older versions of Hadoop while developers could test new features easily. Since Hadoop released a major revision every three months, 1. The flexibility of HoD was critical to maintaining that cadence— we refer to this *decoupling of upgrade dependencies* as **[R3:] Serviceability**.


While HoD could also deploy HDFS clusters, most users deployed the compute nodes across a *shared* HDFS instance. As HDFS scaled, more compute clusters could be allocated on top of it, creating a virtuous cycle of increased user density over more datasets, leading to new insights. Since most Hadoop clusters were smaller than the largest HoD jobs at Yahoo!, the JobTracker was rarely a bottleneck.


HoD proved itself as a versatile platform, anticipating some qualities of **Mesos**[17], which would extend the *framework-master model* to support *dynamic resource allocation* among concurrent, diverse programming models. HoD can also be considered a private- cloud precursor of EC2 Elastic MapReduce, and Azure HDInsight offerings—without any of the isolation and security aspects.


Hadoop on Demand shortcomings
---

Locality Awareness
---

Yahoo! ultimately retired HoD in favor of shared MapReduce clusters due to middling resource utilization. During the map phase, the **JobTracker** makes every effort to place tasks close to their input data in HDFS, ideally on a node storing a replica of that data. Because Torque allocates nodes without accounting for locality, the subset of nodes granted to a user’s JobTracker would likely only contain a handful of relevant replicas. Given the large number of small jobs, most reads were from remote hosts. Efforts to combat these artifacts achieved mixed results; while spreading **TaskTrackers** across racks made intra-rack reads of shared datasets more likely, the shuffle of records between *map* and *reduce* tasks would necessarily cross racks, and subsequent jobs in the DAG would have fewer opportunities to account for skew in their ancestors. This aspect of **[R4:] Locality awareness** is a key requirement for YARN.


High-level frameworks like Pig[24] and Hive[30] often compose a *workflow* of MapReduce jobs in a *DAG*, each *filtering*, *aggregating*, and *projecting* data at every stage in the computation. Because clusters were not resized between jobs when using HoD, much of the capacity in a cluster lay fallow while subsequent, slimmer stages completed. In an extreme but a very common scenario, a single reduce task running on one node could prevent a cluster from being reclaimed. Some jobs held hundreds of nodes idle in this state.

High Cluster Utilization
---

Finally, *job latency* was dominated by the time spent *allocating* the cluster. Users could rely on few heuristics when estimating how many nodes their jobs required, and would often ask for whatever multiple of 10 matched their intuition. Cluster allocation latency was so high, users would often share long-awaited clusters with colleagues, holding on to nodes for longer than anticipated, raising latencies still further. While users were fond of many features in HoD, the economics of cluster utilization forced Yahoo! to pack its users into *shared clusters*. **[R5:] High Cluster Utilization** is a top priority for YARN.


References
---
[1] [Apache hadoop](http://hadoop.apache.org). http://hadoop.apache.org.  
[2] [Apache tez](http://incubator.apache.org/projects/tez.html). http://incubator.apache.org/projects/tez.html.   
[3] [Netty project](http://netty.io). http://netty.io.  
[4] [Storm](http://storm-project.net/). http://storm-project.net/.  
[5] H.Ballani, P.Costa, T.Karagiannis, and A.I.Rowstron. Towards predictable datacenter networks. In *SIGCOMM*, volume 11, pages 242–253, 2011.  
[6] F.P.Brooks,Jr. *The mythical man-month (anniversary ed.)*. Addison-Wesley Longman Publishing Co., Inc., Boston, MA, USA, 1995.  
[7] N. Capit, G. Da Costa, Y. Georgiou, G. Huard, C. Martin, G. Mounie, P. Neyron, and O. Richard. A batch scheduler with high level components. In *Cluster Computing and the Grid, 2005. CC-Grid 2005. IEEE International Symposium on*, volume 2, pages 776–783 Vol. 2, 2005.  
[8] R. Chaiken, B. Jenkins, P.-A. Larson, B. Ramsey, D. Shakib, S. Weaver, and J. Zhou. Scope: easy and efficient parallel processing of massive data sets. *Proc. VLDB Endow.*, 1(2):1265–1276, Aug. 2008.  
[9] M. Chowdhury, M. Zaharia, J. Ma, M. I. Jordan, and I. Stoica. Managing data transfers in computer clusters with orchestra. *SIGCOMM- Computer Communication Review*, 41(4):98, 2011.  
[10] B.-G. Chun, T. Condie, C. Curino, R. Ramakrishnan, R. Sears, and M. Weimer. Reef: Retainable evaluator execution framework. In *VLDB 2013*, Demo, 2013.  
[11] B. F. Cooper, E. Baldeschwieler, R. Fonseca, J. J. Kistler, P. Narayan, C. Neerdaels, T. Negrin, R. Ramakrishnan, A. Silberstein, U. Srivastava, et al. Building a cloud for Yahoo! *IEEE Data Eng. Bull.*, 32(1):36–43, 2009.  
[12] J. Dean and S. Ghemawat. MapReduce: simplified data processing on large clusters. *Commun. ACM*, 51(1):107–113, Jan. 2008.  
[13] W. Emeneker, D. Jackson, J. Butikofer, and D. Stanzione. Dynamic virtual clustering with xen and moab. In G. Min, B. Martino, L. Yang, M. Guo, and G. Rnger, editors, *Frontiers of High Performance Computing and Networking, ISPA 2006 Workshops*, volume 4331 of Lecture Notes in Computer Science, pages 440–451. Springer Berlin Heidelberg, 2006.  
[14] Facebook Engineering Team. *Under the Hood: Scheduling MapReduce jobs more efficiently with Corona*. http://on.fb.me/TxUsYN, 2012.  
[15] D. Gottfrid. *Self-service prorated super-computing fun*. http://open. blogs.nytimes.com/2007/11/01/self-service-prorated-super-computing-fun, 2007.  
[16] T. Graves. *GraySort and MinuteSort at Yahoo on Hadoop 0.23*. http://sortbenchmark. org/Yahoo2013Sort.pdf, 2013.  
[17] B. Hindman, A. Konwinski, M. Zaharia, A. Ghodsi, A. D. Joseph, R. Katz, S. Shenker, and I. Stoica. Mesos: a platform for fine-grained resource sharing in the data center. In *Proceedings of the 8th USENIX conference on Networked systems design and implementation, NSDI’11*, pages 22–22, Berkeley, CA, USA, 2011. USENIX Association.  
[18] M. Isard, M. Budiu, Y. Yu, A. Birrell, and D. Fetterly. Dryad: distributed data-parallel programs from sequential building blocks. In *Proceedings of the 2nd ACM SIGOPS/EuroSys European Conference on Computer Systems 2007, EuroSys ’07*, pages 59–72, New York, NY, USA, 2007. ACM.  
[19] M. Islam, A. K. Huang, M. Battisha, M. Chiang, S. Srinivasan, C. Peters, A. Neumann, and A. Abdelnur. Oozie: towards a scalable workflow management system for hadoop. In *Proceedings of the 1st ACM SIGMOD Workshop on Scalable Workflow Execution Engines and Technologies*, page 4. ACM, 2012.  
[20] D. B. Jackson, Q. Snell, and M. J. Clement. Core algorithms of the maui scheduler. In *Revised Papers from the 7th International Workshop on Job Scheduling Strategies for Parallel Processing, JSSPP ’01*, pages 87–102, London, UK, UK, 2001. Springer-Verlag.  
[21] S. Loughran, D. Das, and E. Baldeschwieler. [*Introducing Hoya – HBase on YARN*](http://hortonworks.com/blog/introducing-hoya-hbase-on-yarn/). http://hortonworks.com/blog/introducing-hoya-hbase-on-yarn/, 2013.  
[22] G. Malewicz, M. H. Austern, A. J. Bik, J. C. Dehnert, I. Horn, N. Leiser, and G. Czajkowski. Pregel: a system for large-scale graph processing. In *Proceedings of the 2010 ACM SIGMOD International Conference on Management of data, SIGMOD ’10*, pages 135–146, New York, NY, USA, 2010. ACM.  
[23] R. O. Nambiar and M. Poess. The making of tpcds. In *Proceedings of the 32nd international conference on Very large data bases, VLDB ’06*, pages 1049–1058. VLDB Endowment, 2006.  
[24] C. Olston, B. Reed, U. Srivastava, R. Kumar, and A. Tomkins. Pig Latin: a not-so-foreign language for data processing. In *Proceedings of the 2008 ACM SIGMOD international conference on Management of data, SIGMOD ’08*, pages 1099–1110, New York, NY, USA, 2008. ACM.  
[25] O.O’Malley. *Hadoop: The Definitive Guide*, chapter Hadoop at Yahoo!, pages 11–12. O’Reilly Media, 2012.  
[26] M. Schwarzkopf, A. Konwinski, M. Abd-El-Malek, and J. Wilkes. Omega: flexible, scalable schedulers for large compute clusters. In *Proceedings of the 8th ACM European Conference on Computer Systems, EuroSys ’13*, pages 351–364, New York, NY, USA, 2013. ACM.  
[27] K.Shvachko, H.Kuang, S.Radia, and R.Chansler. The Hadoop Distributed File System. In *Proceedings of the 2010 IEEE 26th Symposium on Mass Storage Systems and Technologies (MSST), MSST ’10*, pages 1–10, Washington, DC, USA, 2010. IEEE Computer Society.    
[28] T.-W. N. Sze. [*The two quadrillionth bit of π is 0!*](http://developer.yahoo.com/blogs/hadoop/two-quadrillionth-bit-0-467.html) http://developer.yahoo.com/blogs/hadoop/two-quadrillionth-bit-0-467.html.  
[29] D. Thain, T. Tannenbaum, and M. Livny. Distributed computing in practice: the Condor experience. *Concurrency and Computation: Practice and Experience*, 17(2-4):323–356, 2005.  
[30] A. Thusoo, J. S. Sarma, N. Jain, Z. Shao, P. Chakka, N. Z. 0002, S. Anthony, H. Liu, and R. Murthy. Hive - a petabyte scale data warehouse using Hadoop. In F. Li, M. M. Moro, S. Ghandeharizadeh, J. R. Haritsa, G. Weikum, M. J. Carey, F. Casati, E. Y. Chang, I. Manolescu, S. Mehrotra, U. Dayal, and V. J. Tsotras, editors, *Proceedings of the 26th International Conference on Data Engineering, ICDE 2010*, March 1-6, 2010, Long Beach, California, USA, pages 996–1005. IEEE, 2010.  
[31] Y. Yu, M. Isard, D. Fetterly, M. Budiu, U. Erlingsson, P. K. Gunda, and J. Currey. DryadLINQ: a system for general-purpose distributed data-parallel computing using a high-level language. In *Proceedings of the 8th USENIX conference on Operating systems design and implementation, OSDI’08*, pages 1–14, Berkeley, CA, USA, 2008. USENIX Association.  
[32] M. Zaharia, M. Chowdhury, M. J. Franklin, S. Shenker, and I. Stoica. Spark: cluster computing with working sets. In *Proceedings of the 2nd USENIX conference on Hot topics in cloud computing, HotCloud’10*, pages 10–10, Berkeley, CA, USA, 2010. USENIX Association.  
[33] Vinod Kumar Vavilapali, et. al, *Apache Hadoop YARN – Yet Another Resource Negotiator*, SoCC'13, 1-3 Oct. 2013, Santa Clara, California, USA.


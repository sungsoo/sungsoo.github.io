---
layout: post
title: Apache Hadoop YARN – History and Rationale, Shared Clusters
date: 2014-03-30
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
6. **Reliability/Availability**
7. **Secure and Auditable Operation**
8. **Support for Programming Model Diversity**
9. **Flexible Resource Model**
10. **Backward compatibility**


# Shared clusters

Ultimately, HoD had too little information to make intelligent decisions about its allocations, its resource granularity was too coarse, and its API forced users to provide misleading constraints to the resource layer.


However, moving to shared clusters was non-trivial. While HDFS had scaled gradually over years, the JobTracker had been insulated from those forces by HoD. When that guard was removed, MapReduce clusters suddenly became significantly larger, job throughput increased dramatically, and many of the features innocently added to the JobTracker became sources of critical bugs. Still worse, instead of losing a single workflow, a JobTracker failure caused an outage that would lose *all* the running jobs in a cluster and require users to manually recover their workflows.


Downtime created a backlog in processing pipelines that, when restarted, would put significant strain on the JobTracker. Restarts often involved manually killing users’ jobs until the cluster recovered. Due to the complex state stored for each job, an implementation preserving jobs across restarts was never completely debugged.

Reliability/Availability
---

Operating a large, multi-tenant Hadoop cluster is hard. While fault tolerance is a core design principle, the surface exposed to user applications is vast. Given various availability issues exposed by the single point of failure, it is critical to continuously monitor workloads in the cluster for dysfunctional jobs. More subtly, because the JobTracker needs to allocate tracking structures for every job it initializes, its admission control logic includes safeguards to protect its own availability; it may delay allocating fallow cluster resources to jobs because the overhead of tracking them could overwhelm the JobTracker process. All these concerns may be grouped under the need for **[R6:] Reliability/Availability.**


Secure and Auditable Operation
---

As Hadoop managed more tenants, diverse use cases, and raw data, its requirements for isolation became more stringent, but the authorization model lacked strong, scalable authentication—a critical feature for multitenant clusters. This was added and backported to multiple versions. **[R7:] Secure and auditable operation** must be preserved in YARN. Developers gradually hardened the system to accommodate diverse needs for resources, which were at odds with the slot-oriented view of resources.

Support for Programming Model Diversity
---

While MapReduce supports a wide range of use cases, it is not the ideal model for all large-scale computation. For example, many machine learning programs require multiple iterations over a dataset to converge to a result. If one composes this flow as a sequence of MapReduce jobs, the scheduling overhead will significantly delay the result [32]. Similarly, many graph al-gorithms are better expressed using a bulk-synchronous parallel model (BSP) using message passing to communicate between vertices, rather than the heavy, allto-all communication barrier in a fault-tolerant, largescale MapReduce job [22]. This mismatch became an impediment to users’ productivity, but the MapReducecentric resource model in Hadoop admitted no competing application model. Hadoop’s wide deployment inside Yahoo! and the gravity of its data pipelines made these tensions irreconcilable. Undeterred, users would write “MapReduce” programs that would spawn alternative frameworks. To the scheduler they appeared as map-only jobs with radically different resource curves, thwarting the assumptions built into to the platform and causing poor utilization, potential deadlocks, and instability. YARN must declare a truce with its users, and provide explicit **[R8:] Support for Programming Model Diversity.**

![](http://sungsoo.github.com/images/yarn-architecture.png)

Flexible Resource Model
---

Beyond their mismatch with emerging framework requirements, typed slots also harm utilization. While the separation between map and reduce capacity prevents deadlocks, it can also bottleneck resources. In Hadoop, the overlap between the two stages is configured by the user for each submitted job; starting reduce tasks later increases cluster throughput, while starting them early in a job’s execution reduces its latency.3 The number of map and reduce slots are fixed by the cluster operator, so fallow map capacity can’t be used to spawn reduce tasks and vice versa.4 Because the two task types complete at different rates, no configuration will be perfectly balanced; when either slot type becomes saturated, the JobTracker may be required to apply backpressure to job initialization, creating a classic pipeline bubble. Fungible resources complicate scheduling, but they also empower the allocator to pack the cluster more tightly. This highlights the need for a **[R9:] Flexible Resource Model.**


Backward compatibility
---

While the move to shared clusters improved utilization and locality compared to HoD, it also brought concerns for serviceability and availability into sharp relief. Deploying a new version of Apache Hadoop in a shared cluster was a carefully choreographed, and a regrettably common event. To fix a bug in the MapReduce implementation, operators would necessarily schedule downtime, shut down the cluster, deploy the new bits, validate the upgrade, then admit new jobs. By conflating the platform responsible for arbitrating resource usage with the framework expressing that program, one is forced to evolve them simultaneously; when operators improve the allocation efficiency of the platform, users must necessarily incorporate framework changes. Thus, upgrading a cluster requires users to halt, validate, and restore their pipelines for orthogonal changes. While updates typically required no more than recompilation, users’ assumptions about internal framework details—or developers’ assumptions about users’ programs—occasionally created blocking incompatibilities on pipelines running on the grid.


Building on lessons learned by evolving Apache Hadoop MapReduce, YARN was designed to address requirements (R1-R9). However, the massive install base of MapReduce applications, the ecosystem of related projects, well-worn deployment practice, and a tight schedule would not tolerate a radical redesign. To avoid the trap of a “second system syndrome” [6], the new architecture reused as much code from the existing framework as possible, behaved in familiar patterns, and left many speculative features on the drawing board. This lead to the final requirement for the YARN redesign: **[R10:] Backward compatibility.**


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
[9] M. Chowdhury, M. Zaharia, J. Ma, M. I. Jordan, and I. Stoica. Managing data transfers in computer clusters with orchestra. *SIGCOMMComputer Communication Review*, 41(4):98, 2011.  
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
[30] A. Thusoo, J. S. Sarma, N. Jain, Z. Shao, P. Chakka, N. Z. 0002, S. Anthony, H. Liu, and R. Murthy. Hive a petabyte scale data warehouse using Hadoop. In F. Li, M. M. Moro, S. Ghandeharizadeh, J. R. Haritsa, G. Weikum, M. J. Carey, F. Casati, E. Y. Chang, I. Manolescu, S. Mehrotra, U. Dayal, and V. J. Tsotras, editors, *Proceedings of the 26th International Conference on Data Engineering, ICDE 2010*, March 1-6, 2010, Long Beach, California, USA, pages 996–1005. IEEE, 2010.  
[31] Y. Yu, M. Isard, D. Fetterly, M. Budiu, U. Erlingsson, P. K. Gunda, and J. Currey. DryadLINQ: a system for general-purpose distributed data-parallel computing using a high-level language. In *Proceedings of the 8th USENIX conference on Operating systems design and implementation, OSDI’08*, pages 1–14, Berkeley, CA, USA, 2008. USENIX Association.  
[32] M. Zaharia, M. Chowdhury, M. J. Franklin, S. Shenker, and I. Stoica. Spark: cluster computing with working sets. In *Proceedings of the 2nd USENIX conference on Hot topics in cloud computing, HotCloud’10*, pages 10–10, Berkeley, CA, USA, 2010. USENIX Association.  
[33] Vinod Kumar Vavilapali, et. al, *Apache Hadoop YARN – Yet Another Resource Negotiator*, SoCC'13, 1-3 Oct. 2013, Santa Clara, California, USA.


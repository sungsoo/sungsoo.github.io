---
layout: post
title: YARN Framework and Fault Tolerance
date: 2014-04-06
categories: [computer science]
tags: [big data, tez, yarn]

---

Requirements' Origin
---

1. **Scalability**
2. **Multi-tenancy**
3. **Serviceability**
4. **Locality Awareness**
5. **High Cluster Utilization**
6. **Reliability/Availability**
7. **Secure and Auditable Operation**
8. **Support for Programming Model Diversity**
9. **Flexible Resource Model**
10. **Backward compatibility**


# YARN Framework and Application Writers

From the preceding description of the core architecture, we extract the *responsibilities* of a **YARN application** author:


1. Submitting the application by passing a *container launch context* (**CLC**) for the ApplicationMaster to the RM.
2. When RM starts the AM, it should register with the RM and periodically advertise its liveness and requirements over the heartbeat protocol
3. Once the RM allocates a container, AM can construct a CLC to launch the container on the corresponding NM. It may also monitor the status of the running container and stop it when the resource should be reclaimed. Monitoring the progress of work done inside the container is strictly the AM’s responsibility.
4. Once the AM is done with its work, it should unregister from the RM and exit cleanly.
5. Optionally, framework authors may add control flow between their own clients to report job status and expose a control plane.

Even a *simple AM can be fairly complex*; a distributed shell example with a handful of features is over 450 lines of Java. Frameworks to ease development of YARN applications exist. Client libraries YarnClient, NMClient, AMRMClient ship with YARN and expose higher level APIs to avoid coding against low level protocols. An AM hardened against faults– including its own– is non-trivial. If the application exposes a service or wires a communication graph, it is also responsible for all aspects of its secure operation; YARN only secures its deployment.


# Applications and Frameworks

A key requirement for YARN was to enable greater flexibility of programming model. This has been validated by the many programming frameworks that YARN has already attracted, despite its freshly-beta status at the time of this writing. We briefly summarize some projects either native to YARN or ported to the platform to illustrate the generality of its architecture.


*Apache Hadoop MapReduce* already works on top of YARN with almost the same feature-set. It is tested at scale, rest of ecosystem projects like **Pig**, **Hive**, **Oozie**, etc. are modified to work on top of MR over YARN, together with standard benchmarks performing at par or better compared to classic Hadoop. The MapReduce community has made sure that applications written against 1.x can run on top of YARN in a fully binary compatible manner (mapred APIs) or just by recompiling (source compatibility for mapreduce APIs).


*Apache Tez* is an Apache project (Incubator at the time of this writing) which aims to provide a *generic directedacyclic-graph (DAG) execution framework*. One of its goals is to provide a collection of building blocks which can be composed into an arbitrary DAG (including a simple 2-stage (Map and Reduce) DAG to maintain compatibility with MapReduce). Tez provides query execution systems like Hive and Pig with a more natural model for their execution plan, as against forcing these plans to be transformed into MapReduce. The current focus is on speeding up complex Hive and Pig queries which typically require multiple MapReduce jobs, allowing to run as a single Tez job. In the future, rich features such as general support for interactive queries and generic DAGs will be considered.


*Spark* is an open-source research project from UC Berkeley [32], that targets *machine learning and interactive querying workloads*. The central idea of resilient distributed datasets (RDD) is leveraged to achieve significant performance improvements over classic MapReduce for this class of applications. Spark has been recently ported to YARN.

*Dryad* [18] provides *DAG as the abstraction of execution flow*, and it has been integrated with LINQ [31]. The version ported to YARN is 100% native C++ and C# for worker nodes, while the ApplicationMaster leverages a thin layer of Java interfacing with the ResourceManager around the native Dryad graph manager. Eventually the Java layer will be substituted by direct interaction with protocol-buffer interfaces. Dryad-on-YARN is fully compatible with its non-YARN version.

*Giraph* is a *highly scalable, vertex-centric graph computation framework*. It was originally designed to run on top of Hadoop 1.0 as a Map-only job, where one map is special and behaves as coordinator. The port to YARN of Giraph is very natural, the execution coordinator role is taken by the ApplicationMaster, and resources are requested dynamically.

*Storm* is an open-source *distributed, real-time processing engine*, designed to scale across a cluster of machines and provide parallel stream processing. A common use case combines Storm for online computation and MapReduce as batch processor. By porting Storm on YARN a great deal of flexibility in resource allocation can be unblocked. Moreover, the shared access to the underlying HDFS storage layer simplifies the design of multi-framework workloads.

*REEF meta-framework*: YARN’s flexibility comes at potentially significant effort for application implementors. Writing an ApplicationMaster and handling all aspects of fault tolerance, execution flow, coordination, etc. is a non-trivial endeavor. The REEF project [10] recognizes this and factors out several hard-to-build components that are common to many applications. This includes storage management, caching, fault-detection, checkpointing, push-based control flow (showcased experimentally later), and container reuse. Framework designers can build on top of REEF and more easily than directly on YARN and reuse many common services/libraries provided by REEF. REEF design makes it suitable for both MapReduce and DAG like executions as well as iterative and interactive computations.

*Hoya* is a Java-tool designed to leverage YARN to spin up *dynamic HBase clusters*[21] on demand. HBase clusters running on YARN can also grow and shrink dynamically (in our test cluster, RegionServers can be added/removed in less than 20 seconds). While the implications of mixing service and batch workloads in YARNare still being explored, early results from this project are encouraging.

# Fault Tolerance and Availability


From its inception, Hadoop was designed to run on commodity hardware. By building fault tolerance into every layer of its stack, it *hides the complexity of detection and recovery* from hardware faults from users. YARN inherits that philosophy, though responsibility is now distributed between the ResourceManager and ApplicationMasters running in the cluster.


At the time of this writing, the RM remains a single point of failure in YARN’s architecture. The RM recovers from its own failures *by restoring its state from a persistent store on initialization*. Once the recovery process is complete, it kills all the containers running in the cluster, including live ApplicationMasters. It then launches new instances of each AM. If the framework supports recovery—and most will, for routine fault tolerance— the platform will *automatically restore users’ pipelines* [**R6**]. Work is in progress to add sufficient protocol support for AMs to survive RM restart. With this, AMs can continue to progress with existing containers while the RM is down, and can resync with the RM when it comes back up. Efforts are also underway to address high availability of a YARN cluster by having passive/active failover of RM to a standby node.


When a **NM fails**, the RM detects it by timing out its heartbeat response, marks all the containers running on that node as killed, and reports the failure to all running AMs. If the fault is transient, the NM will re-synchronize with the RM, clean up its local state, and continue. In both cases, AMs are responsible for reacting to node failures, potentially redoing work done by any containers running on that node during the fault.

Since the AM runs in the cluster, its failure does not affect the *availability* of the cluster [**R6,R8**], but the probability of an *application hiccup* due to AM failure is higher than in Hadoop 1.x. The RM may restart the AM if it fails, though the platform offers no support to restore the AMs state. A restarted AM synchronizing with its own running containers is also not a concern of the platform. For example, the Hadoop MapReduce AM will recover its completed tasks, but as of this writing, running tasks– and tasks that completed during AM recovery– will be killed and re-run.

Finally, the failure handling of the containers themselves is completely left to the frameworks. The RM collects all container exit events from the NMs and propagates those to the corresponding AMs in a heartbeat response. The MapReduce ApplicationMaster already listens to these notifications and retries map or reduce tasks by requesting new containers from the RM.
With that, we conclude our coverage of the architecture and dive into YARN’s real-world installations.




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


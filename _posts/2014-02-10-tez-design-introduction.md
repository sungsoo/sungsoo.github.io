---
layout: post
title: Tez Design - Introduction
date: 2014-02-10 
categories: [computer science]
tags: [big data]

---


Tez Design - Introduction
---
Apache Hadoop 2.0 (aka **YARN**) continues to make its way through the open source community process at the Apache Software Foundation and is getting closer to being declared “ready” from a community development perspective. YARN on its own provides many *benefits* over Hadoop 1.x and its Map-Reduce job execution engine:  

* Concurrent cluster applications via multiple independent AppMasters  
* Reduced job startup overheads  
* Pluggable scheduling policy framework  
* Improved security framework


The support for 3rd party AppMasters is the crucial aspect to flexibility in YARN. It permits new job runtimes in addition to classical map-reduce, whilst still keeping M/R available and allowing both the old and new to co-exist on a single cluster. **Apache Tez** is one such job runtime that provides richer capabilities than traditional map- reduce. The motivation is to provide a better runtime for scenarios such as *relational-querying* that do not have a strong affinity for the map-reduce primitive. This need arises because the Map-Reduce primitive mandates a very particular shape to every job and although this mandatory shape is very general and can be used to implement essentially any batch-oriented data processing job, it conflates too many details and provides too little flexibility.  

### Behavior of a Map-Reduce job under Hadoop 1.x

1. Client-side determination of input pieces
2. Job startup
3. Map phase, with optional in-process combiner
Each mapper reads input from durable storage
4. Hash partition with local per-bucket sort.
5. Data movement via framework initiated by reduce-side pull
mechanism
6. Ordered merge
7. Reduce phase
8. Write to durable storage

![](http://sungsoo.github.com/images/hadoopstack.png)

The map-reduce primitive has proved to be very useful as the basis of a *reliable* cluster computation runtime and it is well suited to data processing tasks that involve a small number of jobs that benefit from the standard behavior. However, algorithms that require many *iterations* suffer from the *high overheads* of job startup and from frequent reads and writes to durable storage. **Relation query languages** such as **Hive** suffer from those issues and from the need to massage multiple datasets into homogeneous inputs as a M/R job can only consume one physical dataset (excluding support for side-data channels such as *distributed cache*).

Tez aims to be a general purpose execution runtime that enhances various scenarios that are not well served by classic Map-Reduce. In the short term the major focus is to support **Hive** and **Pig**, specifically to enable performance improvements to batch and ad-hoc interactive queries. Specific support for additional scenarios may be added in the future.

Systems similar in spirit to Tez have been developed academically and commercially. Some notable examples are Dryad, HTCondor, Clustera, Hyracks, and Nephele-PACTS.

Tez pre-requisites
---

For normal operation, Tez assumes:

* A *cluster* running YARN
* Access to a *durable shared filesystem* accessible through Hadoop Filesystem 
interface

Tez can operate in debugging scenarios that do not require a full cluster. This mode uses instantiations of HDFS and YARN running in a *single process*.


What services will Tez provide
---

Tez provides *runtime components*:  

* An execution environment that can handle traditional map-reduce jobs  
* An execution environment that handles *DAG-based jobs* comprising various built-in and extendable primitives.  
* Cluster-side determination of input pieces.  
* Runtime planning such as *task cardinality determination* and *dynamic modification* to the DAG structure.

Tez provides *APIs* to access these services:  

* Traditional map-reduce functionality is accessed via java classes written to the Job interface: org.apache.hadoop.mapred.Job and/or org.apache.hadoop.mapreduce.v2.app.job.Job; and by specifying in yarn-site that the map-reduce framework should be Tez.  
* DAG-based execution is accessed via the new Tez DAG API: org.apache.tez.dag.api.** , org.apache.tez.engine.api.***.


Tez provides pre-made primitives for use with the **DAG API** (org.apache.tez.engine.common.*)

* Vertex Input  
* Vertex Output  
* Sorting  
* Shuffling  
* Merging  
* Data transfer


References
---
[1] [http://hortonworks.com/blog/introducing-tez-faster-hadoop-processing/](http://hortonworks.com/blog/introducing-tez-faster-hadoop-processing/)  
[2] [http://hortonworks.com/blog/45x-performance-increase-for-hive/](http://hortonworks.com/blog/45x-performance-increase-for-hive/)   
[3] [http://hortonworks.com/blog/moving-hadoop-beyond-batch-with-apache-yarn/](http://hortonworks.com/blog/moving-hadoop-beyond-batch-with-apache-yarn/)  
[4] [*Clustera: An Integrated Computation
And Data Management System*](http://www.vldb.org/pvldb/1/1453865.pdf), PVLDB '08, August 23-28, 2008, Auckland, New Zealand
Copyright 2008 VLDB Endowment.  
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



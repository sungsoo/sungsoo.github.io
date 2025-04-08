---
layout: post
title: Introduction to the Tez
date: 2014-01-14 
categories: [computer science]
tags: [big data]

---



Introducing… Tez: Accelerating processing of data stored in HDFS
--

MapReduce has served us well.  For years it has been the processing engine for Hadoop and has been the backbone upon which a huge amount of value has been created.  While it is here to stay, new paradigms are also needed in order to enable Hadoop to serve an even greater number of usage patterns.  A key and emerging example is the need for *interactive query*, which today is challenged by the *batch-oriented nature* of MapReduce.  A key step to enabling this new world was *Apache YARN* and today the community proposes the next step… *Tez*

What is Tez?
--

**Tez** – Hindi for “*speed*” – (currently under [incubation vote](http://people.apache.org/~brane/incubator/votes.html) within Apache) provides a general-purpose, highly customizable framework that creates simplifies data-processing tasks across both small scale (low-latency) and large-scale (high throughput) workloads in Hadoop. It generalizes the MapReduce paradigm to a more powerful framework by providing the ability to execute a complex **DAG** (*directed acyclic graph*) of tasks for a single job so that projects in the Apache Hadoop ecosystem such as Apache Hive, Apache Pig and Cascading can meet requirements for human-interactive response times and extreme throughput at petabyte scale (clearly MapReduce has been a key driver in achieving this).

What Tez Does
---
Tez is the logical next step for Apache Hadoop after **Apache Hadoop YARN**. With YARN the community generalized Hadoop MapReduce to provide a *general-purpose resource management framework* wherein MapReduce became merely one of the applications that could process data in a Hadoop cluster. Tez provides a more general data-processing application to the benefit of the entire ecosystem.

Tez will speed Pig and Hive workloads by an order of magnitude. By eliminating unnecessary tasks, synchronization barriers, and reads from and write to HDFS, Tez speeds up data processing across both small-scale, low-latency and large-scale, high-throughput workloads.

![](http://sungsoo.github.com/images/hadoopstack.png)

With the emergence of Apache Hadoop YARN as the basis of next generation data-processing architectures, there is a strong need for an application which can execute a complex DAG of tasks which can then be shared by Apache Pig, Apache Hive, Cascading and others.  The constrained DAG expressible in MapReduce (one set of maps followed by one set of reduces) often results in multiple MapReduce jobs which harm latency for short queries (overhead of launching multiple jobs) and throughput for large-scale queries (too much overhead for materializing intermediate job outputs to the filesystem). With Tez, we introduce a more expressive DAG of tasks, within a single application or job, that is better aligned with the required processing task – thus, for e.g., any *given SQL query can be expressed as a single job* using Tez.

The below graphic illustrates the advantages provided by Tez for complex SQL queries in Apache Hive or complex Apache Pig scripts.

#### Pig/Hive - MR vs. Pig/Hive - Tez 
![](http://sungsoo.github.com/images/pighivetez.png)

Tez is critical to the [**Stinger Initiative**](http://hortonworks.com/blog/100x-faster-hive) and goes a long way in helping Hive support both interactive queries and batch queries. Tez provides a single underlying framework to support both latency and throughput sensitive applications, there-by obviating the need for multiple frameworks and systems to be installed, maintained and supported, a *key advantage to enterprises looking to rationalize their data architectures*.

Essentially, Tez is the logical next step for Apache Hadoop after Apache Hadoop YARN. With YARN the community generalized Hadoop MapReduce to provide a [general-purpose resource management framework](http://hortonworks.com/blog/introducing-apache-hadoop-yarn/)(YARN) where-in MapReduce became merely *one of the applications* that could process data in your Hadoop cluster. With Tez, we build on YARN and our experience with the MapReduce to provide a more general data-processing application to the benefit of the entire ecosystem i.e. Apache Hive, Apache Pig etc.

What has been completed? Where can Tez go?
--

An early version of the project has been donated to the ASF as part of the initial code grant to establish the Incubation project.   Through the work done in the Stinger initiative, it is already clear that Tez enables and order of magnitude increase in the performance of Apache Hive.

The community is also designing a re-usable set of libraries of data-processing primitives such as sorting, merging, data-shuffling, intermediate data management etc. which are necessary for Tez and may be used directly by other projects.  This is just the beginning.  It is an extensible architecture that will undoubtedly be contributed to widely.

For the community, by the community
--

At Hortonworks we believe that innovation happens fastest by working with a community of like-minded individuals to address the requirements for Hadoop without being bounded by artificial boundaries such as employment. As such, even though the Hortonworks MapReduce/Hive/Pig team seeded the project, we’ve had the benefit of both positive feedback and constructive criticism from several leading contributors and committers across the Apache Hadoop MapReduce, Apache Hive & Apache Pig projects.  These inventors and peers are employed at Hortonworks, Yahoo, Facebook, Microsoft, Twitter and many others.  The initial committer list has 22 participants with deep domain expertise in these unique challenges and comprises a who’s who in the Hadoop world.  Of course, now that we are nearly in a position where we can co-develop via the Apache Software Foundation where we have proposed Tez as an Incubator project, we expect a very quick acceleration of project development.

When will it be available?
--

We plan to donate the code from our internal repository to the ASF as part of the Incubator proposal.  Also, Hortonworks will ship Tez in the next alpha release of **Hortonworks Data Platform 2** (HDP2), based on Apache Hadoop 2.0, very soon to showcase some of the very exciting advances we have made for Apache Hive via Project Stinger.


Apache Tez
--

**Apache Tez** is a *generic data-processing pipeline engine* envisioned as a low-level engine for higher abstractions
such as Apache Hadoop Map-Reduce, Apache Pig, Apache Hive etc.

At it's heart, tez is very simple and has just two components:

*   The **data-processing pipeline engine** where-in one can plug-in input, processing and output implementations to 
    perform arbitrary data-processing. Every 'task' in tez has the following:
	- Input to consume key/value pairs from.
	- Processor to process them.
	- Output to collect the processed key/value pairs.



*  A master for the **data-processing application**, where-by one can put together arbitrary data-processing 'tasks'described above into a task-DAG to process data as desired. 
   The generic master is implemented as a Apache Hadoop YARN ApplicationMaster.


References
--
[1] [Introducing… Tez: Accelerating processing of data stored in HDFS](http://hortonworks.com/blog/introducing-tez-faster-hadoop-processing/)  
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

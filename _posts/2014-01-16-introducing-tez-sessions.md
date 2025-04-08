---
layout: post
title: Introducing Tez Sessions
date: 2014-01-16 
categories: [computer science]
tags: [big data]

---

Introduction
--

Most relational databases have had a notion of sessions for quite some time. A database session can be considered to represent a connection between a user/application and the database or in more general terms, an instance of usage of a database. A session can encompass multiple queries and/or transactions. It can leverage common services, for example, caching, to provide some level of performance optimizations.

A Tez session, currently, maps to one instance of a Tez Application Master (AM). For folks who are familiar with YARN and MapReduce, you would know that for each MapReduce job, a corresponding MapReduce Application Master is launched. In Tez, using a Session, a user can can start a single Tez Session and then can submit DAGs to this Session AM serially without incurring the overhead of launching new AMs for each DAG.

Motivation for Tez Sessions
--

As mentioned earlier, the main proponents for Tez are Apache projects such as Hive and Pig. Consider a Pig script, the amount of work programmed into a script may not be doable within a single Tez DAG. Or let us take a common data analytics use-case in Hive where a user uses a Hive Shell for data drill-down (for example, multiple queries over a common data-set). There are other more general use-cases such as users of Hive connecting to the Hive Server and submitting queries over the established connection or using the Hive shell to execute a script containing one or more queries.

All of the above can leverage Tez Sessions.


![tez1](http://sungsoo.github.com/images/sessions-tez1.png)

Using Tez Sessions
--

Using a Tez Session is quite simple:

1. Firstly, instantiate a `TezSession` object with the required configuration using `TezSessionConfiguration`.
2. Invoke `TezSession::start()`
3. Wait for the TezSession to reach a ready state to accept DAGs by using the `TezSession::getSessionStatus()` api (this step is optional)
4. Submit a DAG to the Session using `TezSession::submitDAG(DAG dag)`
5. Monitor the DAG’s status using the `DAGClient` instance obtained in step (4).
6. Once the DAG has completed, repeat step (4) and step (5) for subsequent DAGs.
7. Shutdown the Session once all work is done via `TezSession::stop()`.

There are some things to keep in mind when using a Tez Session:

* A **Tez Session** maps to a single **Application Master** and therefore, all resources required by any user-logic (in any subsequent DAG) running within the **ApplicationMaster** should be available when the **AM** is launched.
	- This mostly pertains to code related to the **VertexOutputCommitter** and any user-logic in the **Vertex** *scheduling* and *management* layers.
	- User-logic run in tasks is not governed by the above restriction.
* The resources (memory, CPU) of the **AM** are fixed so please keep this in mind when configuring the AM for use in a session. For example, memory requirements may be higher for a very large DAG.

Performance Benefits of using Tez Sessions
--

**Container Re-Use**. We know that *re-use* of containers was doable within a single DAG. In a Tez Session, containers are re-used even across DAGs as long as the containers are compatible with the task to be run on them. This vastly improves performance by not incurring the overheads of launching containers for subsequent DAGs. Containers, when not in use, are kept around for a *configurable period* before being released back to YARN’s **ResourceManager**.

**Caching with the Session**. When running drill-down queries on common datasets, smarting caching of meta-data and potentially even caching of intermediate data or previous results can help improve performance. *Caching* could be done either within the **AM** or within *launched containers*. Such caching allows for more *fine-grained controls* with respect to caching policies.  A *session-based cache* as compared to a global cache potentially provides more predictable performance improvements.

Example Usage of a Tez Session
--

The Tez source code has a [simple **OrderedWordCount** example](https://git-wip-us.apache.org/repos/asf?p=incubator-tez.git;a=blob_plain;f=tez-mapreduce-examples/src/main/java/org/apache/tez/mapreduce/examples/OrderedWordCount.java;hb=master). This DAG is similar to the **WordCount** example in **MapReduce** except that it also orders the words based on their frequency of occurrence in the dataset. The DAG is an **MRR chain** i.e. a *3-vertex linear chain* of **Map-Reduce-Reduce**.

To run the **OrderedWordCount** example to process different data-sets via a single Tez Session, use:

```
bin/hadoop jar tez-mapreduce-examples-0.2.0-SNAPSHOT.jar orderedwordcount -DUSE_TEZ_SESSION=true -DINTER_JOB_SLEEP_INTERVAL=0 /input1/ /output1/ /input2 /output2/ /input3/ /output3/ /input4/ /output4/
```

Below is a graph depicting the times seen when running *multiple* MRR DAGs on the same dataset (the dataset had 6 files to ensure multiple containers are needed in the map stage ) in the same session. This test was run on my old MacBook running a single node Hadoop cluster having only one **DataNode** and one **NodeManager**.

![tez2](http://sungsoo.github.com/images/sessions-tez2.png)

As you can see, even though this is just a simulation test running on a *very small data* set, leveraging containers across DAGs has a huge performance benefit.

References
--
[1] Hitesh Shah, [*Introducing Tez Sessions*](http://hortonworks.com/blog/introducing-tez-sessions/), Hortonworks, November 6th, 2013.  
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

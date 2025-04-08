---
layout: post
title: Data Processing API in Apache Tez
date: 2014-01-16 
categories: [computer science]
tags: [big data]

---


Overview
--

Apache Tez models data processing as a *dataflow graph*, with the **vertices** in the graph representing *processing of data* and **edges** representing *movement of data* between the processing. Thus *user logic*, that analyses and modifies the data, sits in the **vertices**. Edges determine the consumer of the data, how the data is transferred and the *dependency* between the *producer* and *consumer* vertices. This model concisely captures the *logical definition of the computation*. When the Tez job executes on the cluster, it expands this *logical graph* into a *physical graph* by adding parallelism at the vertices to scale to the data size being processed. Multiple tasks are created per logical vertex to perform the computation in parallel.

DAG Definition API
--

More technically, the data processing is expressed in the form of a *directed acyclic graph* (**DAG**). The processing starts at the root vertices of the DAG and continues down the *directed edges* till it reaches the leaf vertices. When all the vertices in the DAG have completed then the data processing job is done. The graph does not have cycles because the *fault tolerance mechanism* used by Tez is **re-execution** of failed tasks. When the input to a task is lost then the producer task of the input is re-executed and so Tez needs to be able to *walk up* the graph edges to locate a non-failed task from which to re-start the computation. *Cycles* in the graph can make this walk *difficult* to perform. In some cases, cycles may be handled by *unrolling* them to create a DAG.

Tez defines a simple Java API to express a DAG of data processing. The API has three components

* **DAG.** this defines the overall job. The user creates a DAG object for each data processing job.  
* **Vertex.** this defines the user logic and the resources & environment needed to execute the user logic. The user creates a Vertex object for each step in the job and adds it to the DAG.  
* **Edge.** this defines the connection between producer and consumer vertices. The user creates an Edge object and connects the producer and consumer vertices using it.


![tez1](http://sungsoo.github.com/images/tez11.png)

The diagram shows a *dataflow graph* and its definition using the DAG API (simplified). The job consists of 2 vertices performing a “**Map**” operation on 2 datasets. Their output is consumed by 2 vertices that do a “**Reduce**” operation. Their output is brought together in the last vertex that does a “**Join**” operation.

Tez handles expanding this *logical graph* at runtime to perform the operations *in parallel* using multiple tasks. The diagram shows a runtime expansion in which the first M-R pair has a parallelism of 2 while the second has a parallelism of 3. Both branches of computation merge in the **Join operation** that has a parallelism of 2. *Edge properties* are at the heart of this runtime activity.

![tez2](http://sungsoo.github.com/images/tez21.png)

Edge Properties
--

The following edge properties enable Tez to instantiate the tasks, configure their inputs and outputs, schedule them appropriately and help *route* the data between the tasks. The parallelism for each vertex is determined based on *user guidance*, *data size* and *resources*.

* **Data movement.** Defines *routing* of data between tasks  
	- *One-To-One*: Data from the *i*th producer task routes to the *i*th consumer task.  
	- *Broadcast*: Data from a producer task routes to *all* consumer tasks.  
	- *Scatter-Gather*: Producer tasks *scatter* data into *shards* and consumer tasks *gather* the *shards*. The *i*th shard from all producer tasks routes to the *i*th consumer task.    
* **Scheduling.** Defines when a *consumer* task is scheduled  
	- *Sequential*: Consumer task may be scheduled after a *producer task* completes.  
	- *Concurrent*: Consumer task must be *co-scheduled* with a producer task.  
* **Data source.** Defines the *lifetime*/*reliability* of a task output  
	- *Persisted*: Output will be available after the task exits. Output may be lost later on.
	- *Persisted-Reliable*: Output is reliably stored and will always be available  
	- *Ephemeral*: Output is available only while the producer task is running

![tez3](http://sungsoo.github.com/images/tez31.png)

Some real life use cases will help in clarifying the edge properties. **Mapreduce** would be expressed with the *scatter-gather*, *sequential* and *persisted* edge properties. **Map tasks** *scatter* partitions and reduce tasks gather them. **Reduce tasks** are *scheduled* after the map tasks complete and the map task outputs are written to local disk and hence available after the map tasks have completed. When a vertex *checkpoints* its output into HDFS then its *output edge* has a *persisted-reliable* property. If a producer vertex is *streaming data* directly to a consumer vertex then the edge between them has *ephemeral* and *concurrent* properties. A *broadcast* property is used on a *sampler vertex* that produces a **global histogram** of data ranges for *range partitioning*.

We hope that the Tez dataflow definition API will be able to express a broad spectrum of *data processing topologies* and enable higher level languages to elegantly transform their queries into Tez jobs.

References
---
[1] Bikas Saha, [*Data Processing API in Apache Tez*](http://hortonworks.com/blog/expressing-data-processing-in-apache-tez/), Hortonworks, September 17th, 2013.  
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

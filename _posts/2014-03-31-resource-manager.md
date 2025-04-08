---
layout: post
title: Apache Hadoop YARN – Resource Manager (RM)
date: 2014-03-31
categories: [computer science]
tags: [big data, yarn]

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


# Resource Manager (RM)

The ResourceManager exposes two public interfaces towards: 1) *clients submitting applications*, and  2) *ApplicationMaster(s) dynamically negotiating access to resources*, and *one internal interface towards NodeManagers for cluster monitoring and resource access management*. In the following, we focus on the public protocol between RM and AM, as this best represents the important frontier between the YARN platform and the various applications/frameworks running on it.

<iframe width="600" height="400" src="//www.youtube.com/embed/HHv2pkIJjR0" frameborder="0" allowfullscreen></iframe>

The RM matches a global model of the cluster state against the digest of resource requirements reported by running applications. This makes it possible to tightly enforce *global scheduling properties* (different schedulers in YARN focus on different global properties, such as capacity or fairness), but it requires the scheduler to obtain an accurate understanding of applications’ resource requirements. Communication messages and scheduler state must be *compact* and *efficient* for the RM to scale against application demand and the size of the cluster [**R1**]. The way resource requests are captured strikes a balance between accuracy in capturing *resource needs* and *compactness*. Fortunately, the scheduler only handles an overall resource profile for each application, ignoring local optimizations and internal application flow. YARN completely departs from the static partitioning of resources for maps and reduces; it treats the *cluster resources* as a *(discretized) continuum* [**R9**]— as we will see in Section 4.1 [**YARN in the real-word**], this delivered significant improvements in cluster utilization.


**ApplicationMasters** codify their need for resources in terms of one or more **ResourceRequests**, each of which tracks:

1. number of *containers* (e.g., 200 containers),
2. *resources* per container ⟨2GB RAM, 1 CPU⟩ [The resource vector is designed to be extensible.],
3. *locality* preferences, and
4. *priority* of requests within the application 

ResourceRequests are designed to allow users to capture the full detail of their needs and/or a roll-up version of it (e.g., one can specify *node-level*, *rack-level*, and *global locality preferences* [**R4**                                                                                                                                                                                                                                                                                                                     ]). This allows more uniform requests to be represented compactly as aggregates. Furthermore, this design would allow us to impose size limits on ResourceRequests, thus leveraging the *roll-up nature* of ResourceRequests as a lossy compression of the application preferences. This makes communication and storage of such requests efficient for the scheduler, and it allows applications to express their needs clearly [**R1,R5,R9**]. The *roll-up nature* of these requests also guides the scheduler in case perfect locality cannot be achieved, towards good alternatives (e.g., *rack-local allocation*, if the desired node is busy).

This resource model serves current applications well in *homogeneous* environments, but we expect it to evolve over time as the ecosystem matures and new requirements emerge. Recent and developing extensions include: *explicit tracking* of *gang-scheduling* needs, and soft/hard constraints to express arbitrary co-location or *disjoint placement*. While the RM uses locality as a weight for placing containers, network bandwidth is not explicitly modeled and reserved as in Oktopus [5] or Orchestra [9].

The scheduler tracks, updates, and satisfies these requests with available resources, as advertised on NM heartbeats. In response to AM requests, the RM generates containers together with tokens that grant access to resources. The RM forwards the exit status of finished containers, as reported by the NMs, to the responsible AMs. AMs are also notified when a new NM joins the cluster so that they can start requesting resources on the new nodes.


A recent extension of the protocol allows the RM to *symmetrically* request resources back from an application. This typically happens when cluster resources become scarce and the scheduler decides to revoke some of the resources that were given to an application to maintain scheduling invariants. We use structures similar to **ResourceRequests** to capture the *locality preferences* (which could be *strict* or *negotiable*). AMs have some flexibility when fulfilling such ’preemption’ requests, e.g., by yielding containers that are less crucial for its work (for e.g. tasks that made only little progress till now), by checkpointing the state of a task, or by migrating the computation to other running containers. Overall, this allows applications to preserve work, in contrast to platforms that forcefully kill containers to satisfy resource constraints. If the application is noncollaborative, the RM can, after waiting for a certain amount of time, obtain the needed resources by instructing the NMs to forcibly terminate containers.

Given the prenominate requirements from section 2, it is important to point out what the ResourceManager is not responsible for. As discussed, it is *not* responsible for coordinating application execution or task fault-tolerance, but neither is is charged with 1) providing status or metrics for running applications (now part of the ApplicationMaster), nor 2) serving framework specific reports of completed jobs (now delegated to a per-framework daemon).
YARN does provide *generic information* about completed apps, containers etc. via a common daemon called **Application History Server**.
This is consistent with the view that the ResourceManager should only handle live resource scheduling, and helps central components in YARN scale beyond the Hadoop 1.0 JobTracker.

Major Research Topic Keywords
---
### Dynamic Negotiation

### Discretized Continuum

### Explicit Tracking of Gang-Scheduling

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


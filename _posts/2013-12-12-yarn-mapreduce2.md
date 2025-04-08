---
layout: post
title: YARN (MapReduce 2)
date: 2013-12-12
categories: [computer science]
tags: [big data]

---

Introduction
---

For very large clusters in the region of 4000 nodes and higher, the MapReduce system described in the previous section begins to hit scalability bottlenecks, so in 2010 a group at Yahoo! began to design the next generation of MapReduce. The result was *YARN*, short for **Yet Another Resource Negotiator** (or if you prefer recursive ancronyms, YARN Application Resource Negotiator).  
YARN meets the scalability shortcomings of “classic” MapReduce by splitting the responsibilities of the jobtracker into separate entities. The jobtracker takes care of both job scheduling (matching tasks with tasktrackers) and task progress monitoring (keeping track of tasks and restarting failed or slow tasks, and doing task bookkeeping such as maintaining counter totals).    
YARN separates these two roles into **two independent daemons**: a *resource manager* to manage the use of resources across the cluster, and an *application master* to manage the lifecycle of applications running on the cluster. The idea is that an application master negotiates with the resource manager for cluster resources—described in terms of a number of *containers* each with a certain memory limit—then runs application-specific processes in those containers. The containers are overseen by *node managers* running on cluster nodes, which ensure that the application does not use more resources than it has been allocated.  
In contrast to the *jobtracker*, each instance of an application—here a MapReduce job —has a dedicated application master, which runs for the duration of the application. This model is actually closer to the original Google MapReduce paper, which describes how a master process is started to coordinate map and reduce tasks running on a set of workers.

As described, YARN is more general than MapReduce, and in fact MapReduce is just one type of YARN application. There are a few other YARN applications—such as a distributed shell that can run a script on a set of nodes in the cluster—and others are actively being worked on (some are listed at [PoweredByYarn](http://wiki.apache.org/hadoop/PoweredByYarn)). The beauty of YARN’s design is that different YARN applications can co-exist on the same cluster—so a MapReduce application can run at the same time as an MPI application, for example—which brings great benefits for managability and cluster utilization.

Furthermore, it is even possible for users to run different versions of MapReduce on the same YARN cluster, which makes the process of upgrading MapReduce more managable. (Note that some parts of MapReduce, like the job history server and the shuffle handler, as well as YARN itself, still need to be upgraded across the cluster.)

MapReduce on YARN
---

MapReduce on YARN involves more entities than classic MapReduce. They are:  
The client, which submits the *MapReduce job*.  

* The YARN **resource manager**, which coordinates the allocation of compute resources on the cluster.  
* The YARN **node managers**, which launch and monitor the compute containers on machines in the cluster.
* The MapReduce application master, which coordinates the tasks running the MapReduce job. The application master and the MapReduce tasks run in containers that are scheduled by the resource manager, and managed by the node managers.
* The *distributed filesystem* (normally HDFS), which is used for sharing job files between the other entities.

The process of running a job is shown in the below figure, and described in the following sections.

![http://sungsoo.github.com/images/mr-yarn.png](http://sungsoo.github.com/images/mr-yarn.png)


Job Submission
---

Jobs are submitted in MapReduce 2 using the same user API as MapReduce 1 (step 1). MapReduce 2 has an implementation of ClientProtocol that is activated when `mapreduce.framework.name` is set to yarn. The submission process is very similar to the classic implementation. The new job ID is retrieved from the resource manager (rather than the jobtracker), although in the nomenclature of YARN it is an application ID (step 2). The job client checks the output specification of the job; computes input splits (although there is an option to generate them on the cluster, `yarn.app.mapreduce.am.com pute-splits-in-cluster`, which can be beneficial for jobs with many splits); and copies job resources (including the job JAR, configuration, and split information) to HDFS (step 3). Finally, the job is submitted by calling `submitApplication()` on the resource manager (step 4).


Job Initialization
---

When the resource manager receives a call to its `submitApplication()`, it hands off the request to the scheduler. The scheduler allocates a container, and the resource manager then launches the application master’s process there, under the node manager’s management (steps 5a and 5b).


The application master for MapReduce jobs is a Java application whose main class is `MRAppMaster`. It initializes the job by creating a number of bookkeeping objects to keep track of the job’s progress, as it will receive progress and completion reports from the tasks (step 6). Next, it retrieves the input splits computed in the client from the shared filesystem (step 7). It then creates a map task object for each split, and a number of reduce task objects determined by the `mapreduce.job.reduces` property.


The next thing the application master does is decide how to run the tasks that make up the MapReduce job. If the job is small, the application master may choose to run them in the same JVM as itself, since it judges the overhead of allocating new containers and running tasks in them as outweighing the gain to be had in running them in parallel, compared to running them sequentially on one node. (This is different to MapReduce 1, where small jobs are never run on a single tasktracker.) Such a job is said to be *uberized*, or run as an *uber task*.


What qualifies as a small job? By default one that has less than 10 mappers, only one reducer, and the input size is less than the size of one HDFS block. (These values may be changed for a job by setting `mapreduce.job.ubertask.maxmaps`, `mapreduce.job.uber task.maxreduces`, and `mapreduce.job.ubertask.maxbytes`.) It’s also possible to disable uber tasks entirely (by setting `mapreduce.job.ubertask.enable` to *false*).


Before any tasks can be run the job setup method is called (for the job’s `OutputCommitter`), to create the job’s output directory. In contrast to MapReduce 1, where it is called in a special task that is run by the tasktracker, in the YARN implementation the method is called directly by the application master.


Task Assignment
---

If the job does not qualify for running as an uber task, then the application master requests containers for all the map and reduce tasks in the job from the resource manager (step 8). Each request, which are piggybacked on heartbeat calls, includes information about each map task’s data locality, in particular the hosts and corresponding racks that the input split resides on. The scheduler uses this information to make scheduling decisions (just like a jobtracker’s scheduler does): it attempts to place tasks on data-local nodes in the ideal case, but if this is not possible the scheduler prefers rack-local placement to non-local placement.


Requests also specify memory requirements for tasks. By default both map and reduce tasks are allocated 1024 MB of memory, but this is configurable by setting mapre duce.map.memory.mb and `mapreduce.reduce.memory.mb`.


The way memory is allocated is different to MapReduce 1, where tasktrackers have a fixed number of “slots”, set at cluster configuration time, and each task runs in a single slot. Slots have a maximum memory allowance, which again is fixed for a cluster, and which leads both to problems of under utilization when tasks use less memory (since other waiting tasks are not able to take advantage of the unused memory) and problems of job failure when a task can’t complete since it can’t get enough memory to run correctly.


In YARN, resources are more fine-grained, so both these problems can be avoided. In particular, applications may request a memory capability that is anywhere between the minimum allocation and a maximum allocation, and which must be a multiple of the minimum allocation. Default memory allocations are scheduler-specific, and for the capacity scheduler the default minimum is 1024 MB (set by `yarn.scheduler.capacity.minimum-allocation-mb`), and the default maximum is 10240 MB (set by `yarn.scheduler.capacity.maximum-allocation-mb`). Thus, tasks can request any memory allocation between 1 and 10 GB (inclusive), in multiples of 1 GB (the scheduler will round to the nearest multiple if needed), by setting `mapreduce.map.memory.mb and map reduce.reduce.memory.mb` appropriately.


Task Execution
---

Once a task has been assigned a container by the resource manager’s scheduler, the application master starts the container by contacting the node manager (steps 9a and 9b). The task is executed by a Java application whose main class is YarnChild. Before it can run the task it localizes the resources that the task needs, including the job configuration and JAR file, and any files from the distributed cache (step 10). Finally, it runs the map or reduce task (step 11).


The YarnChild runs in a dedicated JVM, for the same reason that tasktrackers spawn new JVMs for tasks in MapReduce 1: to isolate user code from long-running system daemons. Unlike MapReduce 1, however, YARN does not support JVM reuse so each task runs in a new JVM.


Streaming and Pipes programs work in the same way as MapReduce 1. The **Yarn Child** launches the Streaming or Pipes process and communicates with it using standard input/output or a socket (respectively), as shown in Figure 6-2 (except the child and subprocesses run on node managers, not tasktrackers).

![http://sungsoo.github.com/images/stream-pipe.png](http://sungsoo.github.com/images/stream-pipe.png)


Progress and Status Updates
---

When running under YARN, the task reports its progress and status (including counters) back to its application master every three seconds (over the umbilical interface), which has an aggregate view of the job. The process is illustrated in the below figure. Contrast this to MapReduce 1, where progress updates flow from the child through the task-tracker to the jobtracker for aggregation.

![http://sungsoo.github.com/images/updates-mr-yarn.png](http://sungsoo.github.com/images/updates-mr-yarn.png)


The client polls the application master every second (set via `mapreduce.client.pro gressmonitor.pollinterval`) to receive progress updates, which are usually displayed to the user.


Job Completion
---

As well as polling the application master for progress, every five seconds the client checks whether the job has completed when using the `waitForCompletion()` method on **Job**. The polling interval can be set via the `mapreduce.client.completion.polli nterval` configuration property.

Notification of job completion via an HTTP callback is also supported like in MapReduce 1. In MapReduce 2 the application master initiates the callback.

On job completion the application master and the task containers clean up their working state, and the **OutputCommitter**’s job cleanup method is called. Job information is archived by the job history server to enable later interrogation by users if desired.

Studying Hadoop or MapReduce
---
Studying Hadoop or MapReduce can be a daunting task if you get your hand dirty at the start.  
I followed the schedule as follows :

1. Start with very basics of MR with [code.google.com/edu/parallel/dsd-tutorial.html](http://code.google.com/edu/parallel/dsd-tutorial.html) [code.google.com/edu/parallel/mapreduce-tutorial.html](http://code.google.com/edu/parallel/mapreduce-tutorial.html)  
2. Then go for the first two lectures in [www.cs.washington.edu/education/courses/cse490h/08au/lectures.htm](http://www.cs.washington.edu/education/courses/cse490h/08au/lectures.htm) A very good course intro to MapReduce and Hadoop.  

---

<li><b>Thursday September 25:</b>  
<a href="lectures/Intro.pdf">Introduction/Overview</a>
(<a href=lectures/Intro.ppt>ppt</a>)
<br>
Reading:  <a href=http://code.google.com/edu/parallel/dsd-tutorial.html>"Introduction
to Distributed System Design"</a>
<br>
Reading:  <a href="http://www.cs.berkeley.edu/~brewer/papers/GiantScale-IEEE.pdf">"Lessons
from Giant-Scale Services"</a>
<br>
Reading:  <a href="http://research.google.com/archive/googlecluster.html">"Web
Search for a Planet:  The Google Cluster Architecture"</a>

<li><b>Tuesday September 30:</b>  <a href="lectures/mapred.pdf">Functional programming and
MapReduce</a> (<a href="lectures/mapred.ppt">ppt</a>)
<br>
Reading:  <a href=http://code.google.com/edu/parallel/mapreduce-tutorial.html>"Introduction
to Parallel Programming and MapReduce"</a>
<br>
Reading:  <a href=http://labs.google.com/papers/mapreduce.html>"MapReduce:
Simplified Data Processing on Large Clusters"</a>
(updated version at page 107
<a href=readings/communications200801-dl.pdf>here</a>)

<li><b>Thursday October 2:</b>  <a href="lectures/hadoop.pdf">Hadoop
nuts and bolts</a> (<a href="lectures/hadoop.ppt">ppt</a>)
<br>
Reading:  <a href=http://hadoop.apache.org/core/docs/r0.18.0/mapred_tutorial.html>"Hadoop Map/Reduce Tutorial"</a>

<li><b>Tuesday October 7, 3:30-4:20:</b>
<a href="http://research.google.com/people/jeff/index.html">Jeff Dean</a>
(Google)
Distinguished Lecture,
<a href=lectures/Jeff.Dean.colloq.pdf>"Research
Problems Inspired by Large-Scale
Computing at Google"</a>

<li><b>Tuesday October 7:</b>
<a href="http://research.google.com/people/jeff/index.html">Jeff Dean</a>
(Google),
<a href=lectures/Jeff.Dean.class.pdf>"Handling
Large Datasets at Google:  Current Systems and
Future Directions"</a>

<li><b>Thursday October 9:</b>
<a href=lectures/490h-asn.pdf>Architecture, Systems,
and Networking in 80 minutes</a>
(<a href=lectures/490h-asn.ppt>ppt</a>)


<li><b>Tuesday October 14, 3:30-4:20:</b>
<a href="http://www.google.com/corporate/execs.html#vint">Vint Cerf</a>
(Google)
Distinguished Lecture,
<a href=lectures/cerf.dls.pdf>"Internet Evolution and Some
Challenges for the Early 21st Century"</a>

<li><b>Tuesday October 14:</b>  <a href="lectures/algorithms.pdf">MapReduce 
algorithms</a> (<a href="lectures/algorithms.ppt">ppt</a>)
<a href=lectures/2008_10_490h_route_stability.pdf>Internet
route stability example</a>
<br>
Reading:  <a href=http://infolab.stanford.edu/pub/papers/google.pdf>"The
Anatomy of a Large-Scale Hypertextual Web Search Engine"</a>

<li><b>Thursday October 16:</b>
<a href=lectures/490h-gfs.pdf>The Google File System</a>
(<a href=lectures/490h-gfs.ppt>ppt</a>)
<br>
Reading:  <a href=http://labs.google.com/papers/gfs.html>"The
Google File System"</a>

<li><b>Tuesday October 21:</b>  Mike Cafarella (UW),
<a href=lectures/490h_nutch.pdf>Nutch, and Search Engine
History</a>
<br>
Reading:  <a href="http://www.acmqueue.com/modules.php?name=Content&pa=showpage&pid=144">"Building Nutch: Open Source Search"</a>
(cleaner copy
<a href=http://www.cs.washington.edu/education/courses/490h/08au/readings/building_nutch.pdf>here</a>)

<li><b>Thursday October 23:</b>
<a href="http://conferences.oreillynet.com/cs/et2007/view/e_spkr/3432">Barry
Brumitt</a> (Google),
<a href=lectures/MapReduceDesignPatterns-UW2.pdf>"MapReduce
Design Patterns"</a>
<br>
Reading:  <a href="http://www.cs.stanford.edu/people/ang/papers/nips06-mapreducemulticore.pdf">"Map-Reduce for Machine Learning on Multicore"</a>
<br>
Reading:  <a href="http://www2.informatik.hu-berlin.de/alkox/lehre/lvws0809/verkehr/esaHwyHierarchies.pdf">"Highway Hierarchies Hasten
Exact Shortest Path Queries"</a>
<br>
Reading:  <a href="http://avglab.com/andrew/pub/alenex06.pdf">"Reach
for A*: Efficient Point-to-Point Shortest Path Algorithms"</a>

<li><b>Tuesday October 28:</b>
<a href="http://research.microsoft.com/~philbe/">Phil Bernstein</a>
(Microsoft),
<a href=lectures/PhilBeCSE490H-F08.pdf>"Transactions and Replication"</a>
<br>
Reading:  <a href=readings/ReplicationByBernstein&Newcomer.pdf>"Replication"</a>
(from <i>Principles of Transaction Processing</i>, Bernstein & Newcomer,
Elsevier, Inc.)
<br>
Reading:  <a href=http://www.chandrakin.com/paper2.pdf>"Paxos
Made Live - An Engineering Perspective"</a>

<li><b>Thursday October 30:</b>  <a href="lectures/chubby.pdf">Additional 
topics in reliability / availability / consistency</a> 
(<a href="lectures/chubby.ppt">ppt</a>)
<br>
Reading:  <a href="http://www.allthingsdistributed.com/2008/12/eventually_consistent.html">"Eventually Consistent - Revisited"</a>
<br>
Reading:  <a href=http://labs.google.com/papers/chubby.html>"The
Chubby Lock Service for Loosely-Coupled Distributed Systems"</a>

<li><b>Tuesday November 4:</b> <i>[Aaron away]</i>
<a href="http://www.cs.washington.edu/homes/gribble/">Steve
Gribble</a> (UW and Google),
<a href=lectures/cse490_virtualization.pdf>"Virtual
Machine Monitors:  Implementation and Applications"</a>
<br>
Reading: <a href=http://www.cl.cam.ac.uk/research/srg/netos/papers/2003-xensosp.pdf>"Xen and the Art of Virtualization"</a>
<br>
Reading:  <a href=http://cs.ubc.ca/~brendan/papers/remus-nsdi08.pdf>"Remus:
High Availability via Asynchronous Virtual Machine Replication"</a>

<li><b>Thursday November 6:</b> <i>[Aaron away]</i>
<a href=lectures/490h-bt.pdf>BigTable</a>
(<a href=lectures/490h-bt.ppt>ppt</a>)
<br>
Reading:  <a href=http://labs.google.com/papers/bigtable.html>"Bigtable:
A Distributed Storage System for Structured Data"</a>
<br>
(See
<a href="http://norfolk.cs.washington.edu/htbin-post/unrestricted/colloq/details.cgi?id=437">Jeff
Dean's October 2005 colloquium</a>.)

<li><b>Tuesday November 11:</b>  <i>Veteran's Day -- UW holiday</i>

<li><b>Thursday November 13:</b>  <a href="lectures/aws.pdf">EC2</a>
(<a href="lectures/aws.ppt">ppt</a>)
<br>
Reading:
<a href="http://docs.amazonwebservices.com/AWSEC2/2008-05-05/GettingStartedGuide/">"Amazon
Elastic Compute Cloud Getting Started Guide"</a>
<br>
Reading:
<a href="http://developer.amazonwebservices.com/connect/entry.jspa?externalID=931&categoryID=100">"Using
Amazon S3 from Amazon EC2 with Ruby"</a>
<br>
Reading:
<a href="http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1632&categoryID=100">"Building
GrepTheWeb in the Cloud, Part 1: Cloud Architectures"</a>
<br>
Reading:
<a href="http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1633&categoryID=100">"Building
GrepTheWeb in the Cloud, Part 2: Best Practices"</a>

<li><b>Tuesday November 18, 3:30-4:20:</b>
<a href="http://www.allthingsdistributed.com/">Werner
Vogels</a> (Amazon.com) Distinguished Lecture,
<a href="http://wernervogels.s3.amazonaws.com/public/uw-dl-2008.pdf">"Ahead
in the Cloud:  Amazon Web Services"</a>

<li><b>Tuesday November 18:</b>
<a href=lectures/490h-power.pdf>Hardware issues:  power, reliability,
etc.</a>
(<a href=lectures/490h-power.ppt>ppt</a>)
<br>
Reading:
<a href=http://www.cs.cmu.edu/~bianca/fast07.pdf>"Disk
failures in the real world: What does an MTTF
of 1,000,000 hours mean to you?"</a>
<br>
Reading:
<a href=http://labs.google.com/papers/disk_failures.html>"Failure
Trends in a Large Disk Drive Population"</a>
<br>
Reading:
<a href="http://www.barroso.org/publications/ieee_computer07.pdf">"The
Case for Energy-Proportional Computing"</a>

<li><b>Thursday November 20:</b> <i>[Ed away]</i>
<a href="http://www.cs.washington.edu/homes/yoshi/">Yoshi
Kohno</a> (UW),
<a href=lectures/security-overview.pdf>Security,
Privacy, and Cryptography</a>
<br>
Reading:
<a href=http://www.cl.cam.ac.uk/~rja14/wcf.html>"Why
Cryptosystems Fail"</a>
<br>
Reading:
<a href=http://cubist.cs.washington.edu/Security/2007/11/22/why-a-computer-security-course-blog/>"How to <i>think</i> like
a security professional"</a>

<li><b>Tuesday November 25:</b>
<a href="http://www.allthingsdistributed.com/">Werner Vogels</a> (Amazon.com),
<a href="http://wernervogels.s3.amazonaws.com/public/uw-dl-2008.pdf">Software
and hardware architecture of large-scale web services</a>
<br>
Reading:
<a href="http://s3.amazonaws.com/AllThingsDistributed/sosp/amazon-dynamo-sosp2007.pdf">"Dynamo: Amazon's Highly Available
Key-value Store"</a>

<li><b>Thursday November 27:</b>  <i>Thanksgiving -- UW holiday</i>

<li><b>Tuesday December 2:</b> <i>[Aaron away]</i>
<a href="http://perspectives.mvdirona.com/2008/12/03/TwoPresentationsAtUniversityOfWashington.aspx">James
Hamilton</a> (Microsoft),
<a href="http://mvdirona.com/jrh/TalksAndPapers/JamesHamilton_OpsFriendlyApps.pdf">"Designing and Deploying Internet-Scale Services"</a> and
<a href="http://mvdirona.com/jrh/TalksAndPapers/JamesHamilton_WhereDoesThePowerGo.pdf">"Where Does the Power Go and What to do About it?"</a>
<br>
Reading:
<a href=http://www-db.cs.wisc.edu/cidr/cidr2007/papers/cidr07p35.pdf>"An
Architecture for Modular Datacenters"</a>
<br>
Reading:
<a href=http://research.google.com/archive/power_provisioning.pdf>"Power
Provisioning for a Warehouse-sized Computer"</a>
<br>
Reading:
<a href=http://mvdirona.com/jrh/talksAndPapers/JamesRH_Lisa.pdf>"On
Designing and Deploying Internet-Scale Services"</a>

3. Read the seminal paper [labs.google.com/papers/mapreduce.html](http://labs.google.com/papers/mapreduce.html) and its improvements in the updated version [http://www.cs.washington.edu/education/courses/cse490h/08au/readings/communications200801-dl.pdf](http://www.cs.washington.edu/education/courses/cse490h/08au/readings/communications200801-dl.pdf)  
4. Then go for all the other videos in the U.Washington link given above.  
5. Try youtubing the terms Map reduce and hadoop to find videos by ORielly and Google RoundTable for good overview of the future of Hadoop and MapReduce  
6. Then off to the most important videos - Cloudera Videos
[www.cloudera.com/resources/?media=Video](http://www.cloudera.com/resources/?media=Video)
and 
Google MiniLecture Series
[code.google.com/edu/submissions/mapreduce-minilecture/listing.html](http://code.google.com/edu/submissions/mapreduce-minilecture/listing.html)


Along with all the Multimedia above we need good written material

Documents:

1. Architecture diagrams at hadooper.blogspot.com are good to have on your wall  
2. Hadoop: The definitive guide goes more into the nuts and bolts of the whole system where as Hadoop in Action is a good read with lots of teaching examples to learn the concepts of hadoop. Pro Hadoop is not for beginners  
3. pdfs of the documentation from Apache Foundation
[hadoop.apache.org/common/docs/current/](http://hadoop.apache.org/common/docs/current/)
and [hadoop.apache.org/common/docs/stable/](http://hadoop.apache.org/common/docs/stable/) 
will help you learn as to how model your problem into a MR solution in order to gain the advantages of Hadoop in total.  
4. HDFS paper by Yahoo! Research is also a good read in order to gain in depth knowledge of hadoop  
5. Subscribe to the User Mailing List of Commons, MapReduce and HDFS in order to know problems, solutions and future solutions.  
6. Try the [http://developer.yahoo.com/hadoop/tutorial/module1.html](http://developer.yahoo.com/hadoop/tutorial/module1.html) link for beginners to expert path to Hadoop

For Any Queries ... 
Contact Apache, Google, Bing, Yahoo!

References
---

[1] Tome White, *Hadoop; The Definitive Guide*, pp.194-200, Third Edition, 2012.  
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



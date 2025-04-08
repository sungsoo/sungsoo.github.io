---
layout: post
title: Data-intensive Computing
date: 2014-03-27
categories: [computer science]
tags: [big data, parallel computing]

---

Abstract
---

**Data-intensive computing** is a class of [parallel
computing](http://en.wikipedia.org/wiki/Parallel_computing "Parallel computing") applications
which use a [data parallel](http://en.wikipedia.org/wiki/Data_parallel "Data parallel")
approach to processing large volumes of data typically
[terabytes](http://en.wikipedia.org/wiki/Terabytes "Terabytes") or
[petabytes](http://en.wikipedia.org/wiki/Petabytes "Petabytes") in size and typically referred
to as [big data](http://en.wikipedia.org/wiki/Big_data "Big data"). Computing applications
which devote most of their execution time to computational requirements
are deemed compute-intensive, whereas computing applications which
require large volumes of data and devote most of their processing time
to I/O and manipulation of data are deemed
data-intensive.^[[1]](#cite_note-1)^

Contents
--------

-   [1 Introduction](#Introduction)
-   [2 Data-parallelism](#Data-parallelism)
-   [3 Approach](#Approach)
-   [4 Characteristics](#Characteristics)
-   [5 System architectures](#System_architectures)
    -   [5.1 MapReduce](#MapReduce)
    -   [5.2 Hadoop](#Hadoop)
    -   [5.3 HPCC](#HPCC)
-   [6 See also](#See_also)
-   [7 References](#References)

<a name="Introduction"></a>

Introduction
---------------

The rapid growth of the [Internet](http://en.wikipedia.org/wiki/Internet "Internet") and [World
Wide Web](http://en.wikipedia.org/wiki/World_Wide_Web "World Wide Web") led to vast amounts of
information available online. In addition, business and government
organizations create large amounts of both structured and [unstructured
information](http://en.wikipedia.org/wiki/Unstructured_information "Unstructured information")
which needs to be processed, analyzed, and linked. [Vinton
Cerf](http://en.wikipedia.org/wiki/Vinton_Cerf "Vinton Cerf") described this as an “information
avalanche” and stated “we must harness the Internet’s energy before the
information it has unleashed buries us”.^[[2]](#cite_note-2)^ An
[IDC](http://en.wikipedia.org/wiki/International_Data_Corporation "International Data Corporation")
white paper sponsored by [EMC
Corporation](http://en.wikipedia.org/wiki/EMC_Corporation "EMC Corporation") estimated the
amount of information currently stored in a digital form in 2007 at 281
exabytes and the overall compound growth rate at 57% with information in
organizations growing at even a faster rate.^[[3]](#cite_note-3)^ In a
2003 study of the so-called information explosion it was estimated that
95% of all current information exists in unstructured form with
increased data processing requirements compared to structured
information.^[[4]](#cite_note-4)^ The storing, managing, accessing, and
processing of this vast amount of data represents a fundamental need and
an immense challenge in order to satisfy needs to search, analyze, mine,
and visualize this data as information.^[[5]](#cite_note-5)^
Data-intensive computing intended to address this need.

[Parallel processing](http://en.wikipedia.org/wiki/Parallel_processing "Parallel processing")
approaches can be generally classified as either *compute-intensive*, or
*data-intensive*.^[[6]](#cite_note-6)^^[[7]](#cite_note-7)^^[[8]](#cite_note-8)^
Compute-intensive is used to describe application programs that are
compute bound. Such applications devote most of their execution time to
computational requirements as opposed to I/O, and typically require
small volumes of data. Parallel processing of compute-intensive
applications typically involves parallelizing individual algorithms
within an application process, and decomposing the overall application
process into separate tasks, which can then be executed in parallel on
an appropriate computing platform to achieve overall higher performance
than serial processing. In compute-intensive applications, multiple
operations are performed simultaneously, with each operation addressing
a particular part of the problem. This is often referred to as task
[parallelism](http://en.wikipedia.org/wiki/Parallel_computing "Parallel computing").

Data-intensive is used to describe applications that are I/O bound or
with a need to process large volumes of data.^[[9]](#cite_note-9)^ Such
applications devote most of their processing time to I/O and movement
and manipulation of data. [Parallel
processing](http://en.wikipedia.org/wiki/Parallel_processing "Parallel processing") of
data-intensive applications typically involves partitioning or
subdividing the data into multiple segments which can be processed
independently using the same executable application program in parallel
on an appropriate computing platform, then reassembling the results to
produce the completed output data.^[[10]](#cite_note-10)^ The greater
the aggregate distribution of the data, the more benefit there is in
parallel processing of the data. Data-intensive processing requirements
normally scale linearly according to the size of the data and are very
amenable to straightforward parallelization. The fundamental challenges
for data-intensive computing are managing and processing exponentially
growing data volumes, significantly reducing associated data analysis
cycles to support practical, timely applications, and developing new
algorithms which can scale to search and process massive amounts of
data. Researchers coined the term BORPS for "billions of records per
second" to measure record processing speed in a way analogous to how the
term
[MIPS](http://en.wikipedia.org/wiki/Million_instructions_per_second "Million instructions per second")
applies to describe computers' processing speed.^[[11]](#cite_note-11)^

<a name="Data-parallelism"></a>

Data-parallelism
----------------

Computer system architectures which can support [data
parallel](http://en.wikipedia.org/wiki/Data_parallel "Data parallel") applications were
promoted in the early 2000s for large-scale data processing requirements
of data-intensive computing.^[[12]](#cite_note-12)^ Data-parallelism
applied computation independently to each data item of a set of data,
which allows the degree of parallelism to be scaled with the volume of
data. The most important reason for developing data-parallel
applications is the potential for scalable performance, and may result
in several orders of magnitude performance improvement. The key issues
with developing applications using data-parallelism are the choice of
the algorithm, the strategy for data decomposition, [load
balancing](http://en.wikipedia.org/wiki/Load_balancing_(computing) "Load balancing (computing)")
on processing nodes, [message
passing](http://en.wikipedia.org/wiki/Message_passing "Message passing") communications between
nodes, and the overall accuracy of the results.^[[13]](#cite_note-13)^
The development of a data parallel application can involve substantial
programming complexity to define the problem in the context of available
programming tools, and to address limitations of the target
architecture. [Information
extraction](http://en.wikipedia.org/wiki/Information_extraction "Information extraction") from
and indexing of Web documents is typical of data-intensive computing
which can derive significant performance benefits from data parallel
implementations since Web and other types of document collections can
typically then be processed in parallel.^[[14]](#cite_note-14)^

The US [National Science
Foundation](http://en.wikipedia.org/wiki/National_Science_Foundation "National Science Foundation")
(NSF) funded a research program from 2009 through
2010.^[[15]](#cite_note-15)^ Areas of focus were:

-   Approaches to [parallel
    programming](http://en.wikipedia.org/wiki/Parallel_programming "Parallel programming") to
    address the [parallel
    processing](http://en.wikipedia.org/wiki/Parallel_processing "Parallel processing") of data
    on data-intensive systems
-   Programming abstractions including models, languages, and
    [algorithms](http://en.wikipedia.org/wiki/Algorithms "Algorithms") which allow a natural
    expression of parallel processing of data
-   Design of data-intensive computing platforms to provide high levels
    of reliability, efficiency, availability, and scalability.
-   Identifying applications that can exploit this computing paradigm
    and determining how it should evolve to support emerging
    data-intensive applications

[Pacific Northwest National
Labs](http://en.wikipedia.org/wiki/Pacific_Northwest_National_Labs "Pacific Northwest National Labs")
defined data-intensive computing as “capturing, managing, analyzing, and
understanding data at volumes and rates that push the frontiers of
current technologies”.^[[16]](#cite_note-16)^^[[17]](#cite_note-17)^

<a name="Approach"></a>

Approach
--------

Data-intensive computing platforms typically use a [parallel
computing](http://en.wikipedia.org/wiki/Parallel_computing "Parallel computing") approach
combining multiple processors and disks in large commodity [computing
clusters](http://en.wikipedia.org/wiki/Cluster_(computing) "Cluster (computing)") connected
using high-speed communications switches and networks which allows the
data to be partitioned among the available computing resources and
processed independently to achieve performance and scalability based on
the amount of data. A cluster can be defined as a type of parallel and
[distributed system](http://en.wikipedia.org/wiki/Distributed_system "Distributed system"),
which consists of a collection of inter-connected stand-alone computers
working together as a single integrated computing
resource.^[[18]](#cite_note-18)^ This approach to parallel processing is
often referred to as a “shared nothing” approach since each node
consisting of processor, local memory, and disk resources shares nothing
with other nodes in the cluster. In [parallel
computing](http://en.wikipedia.org/wiki/Parallel_computing "Parallel computing") this approach
is considered suitable for data-intensive computing and problems which
are “embarrassingly parallel”, i.e. where it is relatively easy to
separate the problem into a number of parallel tasks and there is no
dependency or communication required between the tasks other than
overall management of the tasks. These types of data processing problems
are inherently adaptable to various forms of [distributed
computing](http://en.wikipedia.org/wiki/Distributed_computing "Distributed computing")
including clusters, data grids, and [cloud
computing](http://en.wikipedia.org/wiki/Cloud_computing "Cloud computing").

<a name="Characteristics"></a>

Characteristics
---------------

Several common characteristics of data-intensive computing systems
distinguish them from other forms of computing:

​(1) The principle of collection of the data and programs or algorithms
is used to perform the computation. To achieve high performance in
data-intensive computing, it is important to minimize the movement of
data.^[[19]](#cite_note-19)^ This characteristic allows processing
algorithms to execute on the nodes where the data resides reducing
system overhead and increasing performance.^[[20]](#cite_note-20)^ Newer
technologies such as [InfiniBand](http://en.wikipedia.org/wiki/InfiniBand "InfiniBand") allow
data to be stored in a separate repository and provide performance
comparable to collocated data.

​(2) The programming model utilized. Data-intensive computing systems
utilize a machine-independent approach in which applications are
expressed in terms of high-level operations on data, and the runtime
system transparently controls the scheduling, execution, load balancing,
communications, and movement of programs and data across the distributed
computing cluster.^[[21]](#cite_note-21)^ The programming abstraction
and language tools allow the processing to be expressed in terms of data
flows and transformations incorporating new dataflow [programming
languages](http://en.wikipedia.org/wiki/Programming_languages "Programming languages") and
shared libraries of common data manipulation algorithms such as sorting.

​(3) A focus on reliability and availability. Large-scale systems with
hundreds or thousands of processing nodes are inherently more
susceptible to hardware failures, communications errors, and software
bugs. Data-intensive computing systems are designed to be fault
resilient. This typically includes redundant copies of all data files on
disk, storage of intermediate processing results on disk, automatic
detection of node or processing failures, and selective re-computation
of results.

​(4) The inherent scalability of the underlying hardware and [software
architecture](http://en.wikipedia.org/wiki/Software_architecture "Software architecture").
Data-intensive computing systems can typically be scaled in a linear
fashion to accommodate virtually any amount of data, or to meet
time-critical performance requirements by simply adding additional
processing nodes. The number of nodes and processing tasks assigned for
a specific application can be variable or fixed depending on the
hardware, software, communications, and [distributed file
system](http://en.wikipedia.org/wiki/Distributed_file_system "Distributed file system")
architecture.

<a name = "System architectures"></a>

System architectures
--------------------

A variety of [system](http://en.wikipedia.org/wiki/System "System") architectures have been
implemented for data-intensive computing and large-scale data analysis
applications including parallel and distributed [relational database
management
systems](http://en.wikipedia.org/wiki/Relational_database_management_systems "Relational database management systems")
which have been available to run on shared nothing clusters of
processing nodes for more than two decades.^[[22]](#cite_note-22)^
However most data growth is with data in unstructured form and new
processing paradigms with more flexible data models were needed. Several
solutions have emerged including the
[MapReduce](http://en.wikipedia.org/wiki/MapReduce "MapReduce") architecture pioneered by
Google and now available in an open-source implementation called
[Hadoop](http://en.wikipedia.org/wiki/Hadoop "Hadoop") used by [Yahoo](http://en.wikipedia.org/wiki/Yahoo "Yahoo"),
[Facebook](http://en.wikipedia.org/wiki/Facebook "Facebook"), and others. [LexisNexis Risk
Solutions](http://en.wikipedia.org/wiki/LexisNexis "LexisNexis") also developed and implemented
a scalable platform for data-intensive computing which is used by
[LexisNexis](http://en.wikipedia.org/wiki/LexisNexis "LexisNexis").

<a name = "MapReduce"></a>

## MapReduce

The [MapReduce](http://en.wikipedia.org/wiki/MapReduce "MapReduce") architecture and
programming model pioneered by [Google](http://en.wikipedia.org/wiki/Google "Google") is an
example of a modern systems architecture designed for data-intensive
computing.^[[23]](#cite_note-23)^ The MapReduce architecture allows
programmers to use a functional programming style to create a map
function that processes a [key-value
pair](http://en.wikipedia.org/wiki/Key-value_pair "Key-value pair") associated with the input
data to generate a set of intermediate [key-value
pairs](http://en.wikipedia.org/wiki/Key-value_pair "Key-value pair"), and a reduce function
that merges all intermediate values associated with the same
intermediate key. Since the system automatically takes care of details
like partitioning the input data, scheduling and executing tasks across
a processing cluster, and managing the communications between nodes,
programmers with no experience in parallel programming can easily use a
large distributed processing environment.

The programming model for [MapReduce](http://en.wikipedia.org/wiki/MapReduce "MapReduce")
architecture is a simple abstraction where the computation takes a set
of input key-value pairs associated with the input data and produces a
set of output key-value pairs. In the Map phase, the input data is
partitioned into input splits and assigned to Map tasks associated with
processing nodes in the cluster. The Map task typically executes on the
same node containing its assigned partition of data in the cluster.
These Map tasks perform user-specified computations on each input
key-value pair from the partition of input data assigned to the task,
and generates a set of intermediate results for each key. The shuffle
and sort phase then takes the intermediate data generated by each Map
task, sorts this data with intermediate data from other nodes, divides
this data into regions to be processed by the reduce tasks, and
distributes this data as needed to nodes where the Reduce tasks will
execute. The Reduce tasks perform additional user-specified operations
on the intermediate data possibly merging values associated with a key
to a smaller set of values to produce the output data. For more complex
data processing procedures, multiple MapReduce calls may be linked
together in sequence.

<a name = "Hadoop"></a>

## Hadoop

[Apache Hadoop](http://en.wikipedia.org/wiki/Apache_Hadoop "Apache Hadoop") is an open source
software project sponsored by The [Apache Software
Foundation](http://en.wikipedia.org/wiki/Apache_Software_Foundation "Apache Software Foundation")
which implements the MapReduce architecture. Hadoop now encompasses
multiple subprojects in addition to the base core, MapReduce, and HDFS
distributed filesystem. These additional subprojects provide enhanced
application processing capabilities to the base Hadoop implementation
and currently include Avro,
[Pig](http://en.wikipedia.org/wiki/Pig_(programming_language) "Pig (programming language)"),
[HBase](http://en.wikipedia.org/wiki/HBase "HBase"), ZooKeeper,
[Hive](http://en.wikipedia.org/wiki/Apache_Hive "Apache Hive"), and Chukwa. The Hadoop
MapReduce architecture is functionally similar to the Google
implementation except that the base programming language for Hadoop is
[Java](http://en.wikipedia.org/wiki/Java_(programming_language) "Java (programming language)")
instead of [C++](http://en.wikipedia.org/wiki/C%2B%2B "C++"). The implementation is intended to
execute on clusters of commodity processors.

Hadoop implements a distributed data processing scheduling and execution
environment and framework for MapReduce jobs. Hadoop includes a
distributed file system called HDFS which is analogous to
[GFS](http://en.wikipedia.org/wiki/Google_File_System "Google File System") in the Google
MapReduce implementation. The Hadoop execution environment supports
additional distributed data processing capabilities which are designed
to run using the Hadoop MapReduce architecture. These include
[HBase](http://en.wikipedia.org/wiki/HBase "HBase"), a distributed column-oriented database
which provides random access read/write capabilities; Hive which is a
data warehouse system built on top of Hadoop that provides
[SQL](http://en.wikipedia.org/wiki/SQL "SQL")-like query capabilities for data summarization,
ad hoc queries, and analysis of large datasets; and Pig – a high-level
data-flow programming language and execution framework for
data-intensive computing.

[Pig](http://en.wikipedia.org/wiki/Pig_(programming_language) "Pig (programming language)") was
developed at Yahoo! to provide a specific language notation for data
analysis applications and to improve programmer productivity and reduce
development cycles when using the Hadoop MapReduce environment. Pig
programs are automatically translated into sequences of MapReduce
programs if needed in the execution environment. Pig provides
capabilities in the language for loading, storing, filtering, grouping,
de-duplication, ordering, sorting, aggregation, and joining operations
on the data.^[[24]](#cite_note-24)^


<a name = "HPCC"></a>

## HPCC

[HPCC](http://en.wikipedia.org/wiki/HPCC "HPCC") (High-Performance Computing Cluster) was
developed and implemented by [LexisNexis](http://en.wikipedia.org/wiki/LexisNexis "LexisNexis")
Risk Solutions. The development of this computing platform began in 1999
and applications were in production by late 2000. The HPCC approach also
utilizes commodity clusters of hardware running the
[Linux](http://en.wikipedia.org/wiki/Linux "Linux") operating system. Custom system software
and middleware components were developed and layered on the base Linux
operating system to provide the execution environment and distributed
filesystem support required for data-intensive computing. LexisNexis
also implemented a new high-level language for data-intensive computing.

The [ECL programming
language](http://en.wikipedia.org/wiki/ECL_(data-centric_programming_language) "ECL (data-centric programming language)")
is a high-level, declarative, data-centric, [implicitly
parallel](http://en.wikipedia.org/wiki/Implicit_parallelism "Implicit parallelism") language
that allows the programmer to define what the data processing result
should be and the dataflows and transformations that are necessary to
achieve the result. The ECL language includes extensive capabilities for
data definition, filtering, data management, and data transformation,
and provides an extensive set of built-in functions to operate on
records in datasets which can include user-defined transformation
functions. ECL programs are compiled into optimized
[C++](http://en.wikipedia.org/wiki/C%2B%2B "C++") source code, which is subsequently compiled
into executable code and distributed to the nodes of a processing
cluster.

To address both batch and online aspects data-intensive computing
applications, HPCC includes two distinct cluster environments, each of
which can be optimized independently for its parallel data processing
purpose. The Thor platform is a cluster whose purpose is to be a data
refinery for processing of massive volumes of raw data for applications
such as data cleansing and hygiene, [extract, transform,
load](http://en.wikipedia.org/wiki/Extract,_transform,_load "Extract, transform, load") (ETL),
record linking and entity resolution, large-scale ad hoc analysis of
data, and creation of keyed data and indexes to support high-performance
structured queries and data warehouse applications. A Thor system is
similar in its hardware configuration, function, execution environment,
filesystem, and capabilities to the Hadoop MapReduce platform, but
provides higher performance in equivalent configurations. The Roxie
platform provides an online high-performance structured query and
analysis system or data warehouse delivering the parallel data access
processing requirements of online applications through Web services
interfaces supporting thousands of simultaneous queries and users with
sub-second response times. A Roxie system is similar in its function and
capabilities to [Hadoop](http://en.wikipedia.org/wiki/Hadoop "Hadoop") with
[HBase](http://en.wikipedia.org/wiki/HBase "HBase") and [Hive](http://en.wikipedia.org/wiki/Apache_Hive "Apache Hive")
capabilities added, but provides an optimized execution environment and
filesystem for high-performance online processing. Both Thor and Roxie
systems utilize the same ECL programming language for implementing
applications, increasing programmer productivity.

<a name = "See also"></a>

See also
--------

-   [List of important publications in concurrent, parallel, and
    distributed
    computing](http://en.wikipedia.org/wiki/List_of_important_publications_in_concurrent,_parallel,_and_distributed_computing "List of important publications in concurrent, parallel, and distributed computing")
-   [Implicit
    parallelism](http://en.wikipedia.org/wiki/Implicit_parallelism "Implicit parallelism")
-   [Massively parallel](http://en.wikipedia.org/wiki/Massively_parallel "Massively parallel")
-   [Supercomputer](http://en.wikipedia.org/wiki/Supercomputer "Supercomputer")
-   [Graph500](http://en.wikipedia.org/wiki/Graph500 "Graph500")

<a name = "References"></a>

References
----------

1.  **<a name="#cite_ref-1"></a>** [Handbook of Cloud
    Computing](http://www.cse.fau.edu/~borko/HandbookofCloudComputing.html),
    "Data-Intensive Technologies for Cloud Computing," by A.M.
    Middleton. Handbook of Cloud Computing. Springer, 2010.
2.  **<a name="#cite_ref-2"></a>** [An Information
    Avalanche](http://research.google.com/pubs/author32412.html), by
    Vinton Cerf, IEEE Computer, Vol. 40, No. 1, 2007, pp. 104-105.
3.  **<a name="#cite_ref-3"></a>** [The Expanding Digital
    Universe](http://www.emc.com/collateral/analyst-reports/expanding-digital-idc-white-paper.pdf),
    by J.F. Gantz, D. Reinsel, C. Chute, W. Schlichting, J. McArthur, S.
    Minton, J. Xheneti, A. Toncheva, and A. Manfrediz,
    [IDC](http://en.wikipedia.org/wiki/International_Data_Corporation "International Data Corporation"),
    White Paper, 2007.
4.  **<a name="#cite_ref-4"></a>** [How Much Information?
    2003](http://www2.sims.berkeley.edu/research/projects/how-much-info-2003/),
    by P. Lyman, and H.R. Varian, University of California at Berkeley,
    Research Report, 2003.
5.  **<a name="#cite_ref-5"></a>** [Got Data? A Guide to Data Preservation in the
    Information
    Age](http://www.sdsc.edu/about/director/pubs/communications200812-DataDeluge.pdf),
    by F. Berman, Communications of the ACM, Vol. 51, No. 12, 2008, pp.
    50-56.
6.  **<a name="#cite_ref-6"></a>** [Models and languages for parallel
    computation](http://portal.acm.org/citation.cfm?id=280278), by D.B.
    Skillicorn, and D. Talia, ACM Computing Surveys, Vol. 30, No. 2,
    1998, pp. 123-169.
7.  **<a name="#cite_ref-7"></a>** [Computing in the 21st
    Century](http://www.pnl.gov/science/images/highlights/computing/dic_special.pdfData-Intensive),
    by I. Gorton, P. Greenfield, A. Szalay, and R. Williams, IEEE
    Computer, Vol. 41, No. 4, 2008, pp. 30-32.
8.  **<a name="#cite_ref-8"></a>** [High-Speed, Wide Area, Data Intensive
    Computing: A Ten Year
    Retrospective](http://www.computer.org/portal/web/csdl/doi/10.1109/MC.2008.122),
    by W.E. Johnston, IEEE Computer Society, 1998.
9.  **<a name="#cite_ref-9"></a>** [IEEE: Hardware Technologies for
    High-Performance Data-Intensive
    Computing](https://computation.llnl.gov/casc/dcca-pub/dcca/Papers_files/data-intensive-ieee-computer-0408.pdf),
    by M. Gokhale, J. Cohen, A. Yoo, and W.M. Miller, IEEE Computer,
    Vol. 41, No. 4, 2008, pp. 60-68.
10. **<a name="#cite_ref-10"></a>** [IEEE: A Design Methodology for Data-Parallel
    Applications](http://www.agoldberg.org/Publications/DesignMethForDP.pdf),
    by L.S. Nyland, J.F. Prins, A. Goldberg, and P.H. Mills, IEEE
    Transactions on Software Engineering, Vol. 26, No. 4, 2000, pp.
    293-314.
11. **<a name="#cite_ref-11"></a>** [Handbook of Cloud
    Computing](http://www.cse.fau.edu/~borko/HandbookofCloudComputing.html/),
    "Data-Intensive Technologies for Cloud Computing," by A.M.
    Middleton. Handbook of Cloud Computing. Springer, 2010, pp. 83-86.
12. **<a name="#cite_ref-12"></a>** [The terascale
    challenge](http://www.patrickpantel.com/download/papers/2004/kdd-msw04-1.pdf)
    by D. Ravichandran, P. Pantel, and E. Hovy. "The terascale
    challenge," Proceedings of the KDD Workshop on Mining for and from
    the Semantic Web, 2004
13. **<a name="#cite_ref-13"></a>** [Dynamic adaptation to available resources
    for parallel computing in an autonomous network of
    workstations](http://www.cs.rochester.edu/u/umit/papers/ppopp01.ps)
    by U. Rencuzogullari, and S. Dwarkadas. "Dynamic adaptation to
    available resources for parallel computing in an autonomous network
    of workstations," Proceedings of the Eighth ACM SIGPLAN Symposium on
    Principles and Practices of Parallel Programming, 2001
14. **<a name="#cite_ref-14"></a>** [Information Extraction to Large Document
    Collections](http://www.mathcs.emory.edu/~eugene/publications.html)
    by E. Agichtein, "Scaling Information Extraction to Large Document
    Collections," Microsoft Research, 2004
15. **<a name="#cite_ref-15"></a>** ["Data-intensive
    Computing"](http://www.nsf.gov/funding/pgm_summ.jsp?pims_id=503324&org=IIS).
    *Program description*. NSF. 2009. Retrieved November 2013. 
16. **<a name="#cite_ref-16"></a>** [Data Intensive
    Computing](http://www.cs.cmu.edu/~bryant/presentations/DISC-concept.ppt)
    by PNNL. "Data Intensive Computing," 2008
17. **<a name="#cite_ref-17"></a>** [The Changing Paradigm of Data-Intensive
    Computing](http://www.computer.org/portal/web/csdl/doi/10.1109/MC.2009.26)
    by R.T. Kouzes, G.A. Anderson, S.T. Elbert, I. Gorton, and D.K.
    Gracio, "The Changing Paradigm of Data-Intensive Computing,"
    Computer, Vol. 42, No. 1, 2009, pp. 26-3
18. **<a name="#cite_ref-18"></a>** [Cloud computing and emerging IT
    platforms](http://www.sciencedirect.com/science?_ob=ArticleURL&_udi=B6V06-4V47C7R-1&_user=10&_coverDate=06%2F30%2F2009&_rdoc=1&_fmt=high&_orig=gateway&_origin=gateway&_sort=d&_docanchor=&view=c&_rerunOrigin=google&_acct=C000050221&_version=1&_urlVersion=0&_userid=10&md5=824e4c2635a53c6fe068f3f2d11df096&searchtype=a)
    by R. Buyya, C.S. Yeo, S. Venugopal, J. Broberg, and I. Brandic,
    "Cloud computing and emerging IT platforms: Vision, hype, and
    reality for delivering computing as the 5th utility," Future
    Generation Computer Systems, Vol. 25, No. 6, 2009, pp. 599-616
19. **<a name="#cite_ref-19"></a>** [Distributed Computing
    Economics](http://queue.acm.org/detail.cfm?id=1394131) by J. Gray,
    "Distributed Computing Economics," ACM Queue, Vol. 6, No. 3, 2008,
    pp. 63-68.
20. **<a name="#cite_ref-20"></a>** [Computing in the 21st
    Century](http://www.pnl.gov/science/images/highlights/computing/dic_special.pdfData-Intensive),
    by I. Gorton, P. Greenfield, A. Szalay, and R. Williams, IEEE
    Computer, Vol. 41, No. 4, 2008, pp. 30-32.
21. **<a name="#cite_ref-21"></a>** [Data Intensive Scalable
    Computing](http://www.cs.cmu.edu/~bryant/presentations/DISC-concept.ppt)
    by R.E. Bryant. "Data Intensive Scalable Computing," 2008
22. **<a name="#cite_ref-22"></a>** [A Comparison of Approaches to Large-Scale
    Data
    Analysis](http://www.cse.nd.edu/~dthain/courses/cse40771/spring2010/benchmarks-sigmod09.pdf)
    by A. Pavlo, E. Paulson, A. Rasin, D.J. Abadi, D.J. Dewitt, S.
    Madden, and M. Stonebraker. Proceedings of the 35th SIGMOD
    International conference on Management of Data, 2009.
23. **<a name="#cite_ref-23"></a>** [MapReduce: Simplified Data Processing on
    Large Clusters](http://labs.google.com/papers/mapreduce-osdi04.pdf)
    by J. Dean, and S. Ghemawat. Proceedings of the Sixth Symposium on
    Operating System Design and Implementation (OSDI), 2004.
24. **<a name="#cite_ref-24"></a>** [as a First-Class Citizen Pig Latin: A
    Not-So-Foreign Language for Data
    Processing](http://i.stanford.edu/~usriv/talks/sigmod08-pig-latin.ppt#283,18,User-Code)
    by C. Olston, B. Reed, U. Srivastava, R. Kumar, and A. Tomkins.
    (Presentation at SIGMOD 2008)," 2008



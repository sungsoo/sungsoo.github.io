---
layout: post
title: Comparing Apache Tez and Microsoft Dryad
date: 2014-04-27
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Comparing Apache Tez and Microsoft Dryad](http://yhemanth.wordpress.com/2013/11/07/comparing-apache-tez-and-microsoft-dryad/)
* Authors: [yhemanth](http://yhemanth.wordpress.com/author/yhemanth/ "View all posts by yhemanth")

![](http://sungsoo.github.com/images/tez-vs-dryad.png)

Comparing Apache Tez and Microsoft Dryad 
===

[Hortonworks](http://hortonworks.com) has been
[blogging](http://hortonworks.com/blog/apache-tez-a-new-chapter-in-hadoop-data-processing/) about
a framework called [Tez](http://tez.incubator.apache.org/), a general
purpose data processing framework. Reading through the posts, I was
reminded of a similar framework that had come from Microsoft Research a
while back called
[Dryad](http://research.microsoft.com/en-us/projects/dryad/eurosys07.pdf).
This blog post is an attempt at comparing them.

In order to structure the comparison, I am trying to express the points
under the following topics: historical perspective, features, concepts,
and architecture.

Historical Perspective 
----------------------

Both Tez and Dryad define distributed, data parallel computing
frameworks that lay an emphasis on modelling data flow. A data
processing ‘job’ in either is defined as a graph. The vertices of the
graph represent computational processes, with the edges connecting them
describing input they receive and output they send out from / to other
computational vertices or data sources / sinks. Both systems attempt to
provide an efficient execution environment for running these jobs,
abstracting users away from needing to handle common distributed
computing requirements such as communication, fault tolerance, etc.

At the time of its introduction, Dryad was possibly Microsoft’s view on
how to build such a framework from ground up. In contrast to Hadoop,
Dryad attempted even then to provide a framework that wasn’t restricted
to just one model (MapReduce) of computation. Dryad was inspired by a
variety of data processing systems including MPP databases, data
parallel programs on GPUs, and MapReduce as well. It attempted to build
a system that could express all these kinds of computation.

Tez
was [introduced](http://hortonworks.com/blog/introducing-tez-faster-hadoop-processing/) as
a generalisation of the MapReduce paradigm that had dominated Hadoop
computation for several years. However, it seems to be inspired more by
data flow frameworks like Dryad. It was enabled immensely by the
separation of concerns brought to the Hadoop MapReduce layer in the form
of [Apache
YARN](http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html),
that separated cluster resource management from distributed job
management, enabling more models than just MapReduce. A direct
motivation for Tez was the [Stinger
initiative](http://hortonworks.com/blog/100x-faster-hive), launched to
build a faster version of Apache Hive. Specifically, the idea was to
enable expressing a HQL query as a single Tez job, rather than multiple
MapReduce jobs, thereby avoiding the overhead of launching multiple jobs
and also incurring the I/O overhead of having to store data between jobs
on HDFS.

Features 
--------

Tez and Dryad share several features, such as:

-   The DAG model being the specification choice for a job
-   A flexible / pluggable system where the framework tries to give the
    user control of the computation, nature of input and output, etc.
-   Supporting multiple inputs and outputs for a vertex (that enable SQL
    like joins to be expressed, and various forms of data partitioning
    like the shuffle sort phase of Hadoop MapReduce)
-   An ability to modify the DAG at runtime based on feedback from
    executing part of the graph. The runtime modification is primarily
    used for improving the efficiency of execution in both systems. For
    e.g. in Dryad, this was used to introduce intermediate aggregator
    nodes (akin to the combiner concept in Hadoop MapReduce), while in
    Tez, this is being used as a way to [optimise the number of
    reducers](http://hortonworks.com/blog/apache-tez-dynamic-graph-reconfiguration/)
    or when they would get launched.

Dryad was built from ground up without a supporting resource management
or scheduling framework, and some of its ‘features’ are present in or
shared by other layers of the Hadoop stack like YARN. In addition to
those, Dryad allowed one specific optimisation through which processing
nodes can execute concurrently, co-located and connected via  shared
memory or pipes.

Tez on its hand, expands on learnings from the Hadoop MapReduce
framework. For example, it expands on a feature available with MapReduce
called JVM reuse, whereby ‘containers’ launched to run the vertex
programs of Tez can be reused for multiple Tez tasks. It even allows
sharing data between these tasks via an ‘[Object
Registry](http://hortonworks.com/blog/re-using-containers-in-apache-tez/)‘ without
needing to have them run concurrently.

Concepts 
--------

Naturally, the core concepts of a Graph are common between the systems.

In Tez:

-   A vertex is defined by the input, output and processor associated
    with it.
-   The logical and physical manifestations of a graph are explicitly
    separated. Specifically, the inputs and outputs are of two types – a
    physical type and a logical type. The logical type describes the
    connection between a vertex pair as per the DAG definition, while
    the physical type will represent the connection between a vertex
    pair at runtime. The Tez framework automatically determines the
    number of physical instances of a vertex in a logical graph.
-   Edges are augmented with properties that relate to data movement
    (for e.g. multicast output between connected vertices), scheduling
    (co-schedule, or in sequence) and data source (persistence
    guarantees on the vertex’s output). Tez expects that by using a
    combination of these properties, one can replicate existing patterns
    of computation like MapReduce.
-   In addition to the graph concepts, there is also the concept of an
    ‘event’. Events are a means for the vertices and the framework to
    communicate amongst themselves. Events can be used to handle
    failures, learn about the runtime characteristics of the data or
    processing, or indicate the availability of data.

In Dryad:

-   Inputs and outputs are considered vertices just like processing
    vertices.
-   Dryad represents the logical representation of the DAG as a set of
    ‘stages’. However, this does not seem to be a first class concept to
    specify the DAG at definition time. Specifically, Dryad expects the
    specific number of instances of  a vertex at runtime to be defined
    at definition time.
-   A lot of operators are defined which help to build a graph. For
    instance:
    -   Cloning: is an operation by which a given Vertex is replicated.
        Such a cloning operation is used to define a physical
        manifestation of a graph.
    -   Composition: is used to define types of data movement patterns
        (akin to the edge property in Tez)  like round robin data
        transfer, scatter-gather etc.
    -   Merge: is used for defining operations like fork/join etc.
    -   Encapsulation: is a way of collapsing a graph into a single
        vertex, which makes it execute on a single node – used to
        express concurrent, co-located execution.
-   It appears the idea behind the operators is again to try and define
    patterns of computation like MapReduce.
-   A ‘channel’ is an abstraction of how data is transferred along an
    edge. There is support for different types of channels like File,
    Shared Memory, Pipes etc. This is similar to the physical
    Input/Output types in Tez.

Architecture 
------------

Tez is a YARN application. A Tez job is coordinated by the Tez
Application Master (AM). It is comprised of Tez tasks. Each task
encapsulates a processor (vertex) of the DAG and all inputs and outputs
connected to it. A Tez task is launched within a YARN container.
However, in the interest of providing good performance, a single YARN
container could be reused for multiple Tez tasks. This is managed by a
‘TezTask’ host. The host also manages a store of objects that can be
shared between Tez tasks that run within the host.

The Tez Application Master has a Vertex Manager plugin (that can be
customised by the developer) for every type of Vertex. In addition, the
AM also maintains a Vertex State Machine. As the state of the DAG
changes, the Vertex Manager is invoked by the Application Master, who
can then act on the State machine to customise the graph execution.

Another point to note is that Tez relies on YARN’s resource manager and
scheduler for initial assignment of containers, etc. However, it has the
ability to make the scheduling a two level activity. For example, Tez
does come with scheduling capabilities, which it uses for features like
container reuse.

Dryad’s architecture includes components that do resource management as
well as the job management. A Dryad job is coordinated by a component
called the Job Manager. Tasks of a job are executed on cluster machines
by a Daemon process. Communication with the tasks from the job manager
happens through the Daemon, which acts like a proxy. In Dryad, the
scheduling decisions are local to an instance of the Dryad Job Manager –
i.e. it is decentralised.

The logical plan for a Dryad DAG results in each vertex being placed in
a ‘Stage’. The stages are managed by a ‘Stage manager’ component that is
part of the job manager, similar to the Vertex Manager in Tez. The Stage
manager is used to detect state transitions and implement optimisations
like Hadoop’s speculative execution.

Conclusion 
----------

Dryad was
[discontinued](http://www.zdnet.com/blog/microsoft/microsoft-drops-dryad-puts-its-big-data-bets-on-hadoop/11226)
by Microsoft in late 2011. Microsoft has since been contributing to
Hadoop. Given the similarities between the two systems, a question is
about how Tez’s prospects are going to be different from Dryad. A few
points that seem to favour Tez, IMO:

-   Tez rides on years of learning from Hadoop MapReduce and other
    systems including Dryad. Microsoft recently
    [posted](http://blogs.technet.com/b/microsoft_blog/archive/2013/10/28/announcing-windows-azure-hdinsight-where-big-data-meets-the-cloud.aspx) that
    it contributes to Tez. The expectation then would be that the
    insights and learnings from systems (including what did not work)
    will help build a better system.
-   The separation of concerns brought about by YARN potentially helps
    Tez to focus on problems specific to the graph processing model,
    while delegating resource management and scheduling decisions to
    another layer – at least partially.
-   The API for Graph construction in Tez appears a lot simpler and
    intuitive to understand than the corresponding one in Dryad. Hence,
    it seems easier to adopt the model from a programmer perspective.
-   Given Tez was launched with a specific initiative of making Hive
    faster, there is a goal it is working towards, and there seems to
    already be evidence that Tez is enabling improvements in Hive as
    shown
    [here](http://hortonworks.com/blog/delivering-on-stinger-a-phase-3-progress-update/).

Personally, I feel it would be good to have Tez succeed and several
people who have invested in Hive will be able to see huge improvements
in performance from their existing applications.

Acknowledgements 
----------------

Most of the information for this post has come from the publicly
available knowledge in blog posts and published paper. If there is any
omission or mis-representation, please do let me know !

An initial draft of this post was reviewed by a few committers at
Hortonworks: Siddharth Seth, Bikas Saha, Hitesh Shah and Vinod Kumar
Vavilapalli. I am thankful to them for their feedback. While I have
incorporated some of it, I felt some others are best explained from
their end, possibly as comments. I will notify them once the blog is
published.

Specifically calling out two points:

-   Both Sid and Hitesh have called out that there are going to be
    additional changes to the architecture and features in Tez that will
    soon be published. As this blog was being written, a new post came
    out from Hortonworks mentioning a new concept called [Tez
    Sessions](http://hortonworks.com/blog/introducing-tez-sessions/).
    So, be sure to watch out for Hortonworks blogs on Tez for more
    information.
-   Bikas provided feedback about Tez’s motivation being closer not just
    to systems like Dryad, but also other data flow systems like
    [Hyracks](https://code.google.com/p/hyracks/) and
    [Nephele](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.252.4470).
    It may be a good academic exercise to see these other systems as
    well from a perspective of learning.

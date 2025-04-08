---
layout: post
title: FAQ for the REEF 
date: 2015-04-29
categories: [computer science]
tags: [big data]

---


## What are the things that YARN doesn’t provide but REEF would have?

REEF is used to build on resource managers like
[YARN](http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html).
REEF is not, in fact, an alternative to YARN. Resource managers manage
the resources of a cluster in containers, which for the sake of
simplicity can be thought of as slices of a machine: Some amount of CPU,
memory, network and other resources on a physical computer. Different
resource managers differ on the exact set of resources managed and how
to acquire them, though. For example: Apache YARN uses a request based
model, while [Apache Mesos](http://mesos.apache.org/) uses resource
offers.

Given a resource manager of the above kind, REEF provides a control flow
framework: It manages the containers as Evaluators and provides a
centralized, event driven, control flow abstraction. To do so, REEF
provides its own runtime for the coordination container (application
master in YARN) and the slave containers. Together these two, called Job
Driver and Evaluator, provide the following functionality beyond the
resource manager:

-   **Portability:** REEF is designed to be portable between resource
    managers. Hence, applications built on REEF are portable. The
    current code base does, in fact, offer two such ports: One running
    on YARN and one running on a single machine that uses processes for
    containers.
-   **Container reuse:**REEF Evaluators outlive Tasks executed on them.
    When a Task finishes, a REEF application has the choice to re-use
    the Evaluator for another Task or to return it. The Evaluator
    process also offers facilities to hold on to state to be presented
    to subsequent Tasks, which forms the basis for recursive processing
    and cross-application handover.
-   **Event coordination:** REEF collects all events happening in the
    cluster and presents them to (application supplied) event handlers
    running in the Job Driver. Hence, the very hard problem of building
    a control flow for a distributed application is reduced to the
    (still hard, but) easier problem of building a centralized control
    flow for a distributed application when using REEF. Example events
    are: Evaluator allocation, Task start and stop and messages from a
    Task. Additionally, REEF also centralizes error handling in the form
    of events fired at the Job Driver. Where possible, those events even
    include the exceptions thrown by user code executing in the
    Evaluator.
-   **Pre-built libraries:**Because REEF standardizes the control flow,
    it can provide a common platform for additional libraries to be used
    by applications. One such library is the name service: It keeps
    track of which Evaluator executes which Task at all times.
    Crucially, this service is *not* hard-coded in REEF but instead is
    built as a plug-in library using the REEF API. We expect to build
    additional such libraries over time.
-   **Communication:**REEF provides mechanisms for the Job Driver to
    communicate with Tasks and vice versa.
-   **Configuration:**In conjunction with REEF, we developed Tang: A
    configuration framework for distributed systems based on dependency
    injection. Tang is built out of the experience with Hadoop’s
    configuration mechanism and provides a strong emphasis on early
    checking and configuration consistency.

## What are similar products to REEF? How are they different?

The closest that comes to mind is [Apache
Twill](http://twill.incubator.apache.org/). Like REEF, it provides a
higher level API on top of Apache YARN. Unlike REEF, Twill exposes a
thread-based API and is accessible to Java only. Essentially, it
presents a YARN cluster as a system that can execute Java threads in a
distributed fashion. As such, it can logically be viewed as on a higher
layer than REEF: In addition to mechanisms, Twill contains policies.
Namely the ones for a thread-based programming abstraction. In fact, we
have a Twill-like abstraction built on REEF in a development branch.
REEF provides considerably more flexibility than Twill: REEF is designed
from the ground up to support mixed language environments and is also
not limited to a thread abstraction.

REEF is also somewhat related to the various big data systems out there:
[Dryad](http://research.microsoft.com/en-us/projects/Dryad/), [Apache
Tez](http://tez.incubator.apache.org/ "Tez"), [Apache
Spark](http://spark.incubator.apache.org/),[Apache
Giraph](http://giraph.apache.org/), [Hyracks](http://hyracks.org/)etc.
All of these have to provide similar functionality to REEF (failure
detection, checkpointing ,…). Crucially, none of them expose these basic
mechanisms as a layer in its own right. Instead, user code enters these
systems at the level of the programming abstraction: Dataflows or
graphs, usually. REEF aims to factor out common functionality of those
systems into a layer of its own to avoid the pitfalls associated with
repetitive functionality.

## Does it run on any platform?

REEF is regularly tested on Windows Server 2012R2 as well as Ubuntu
Linux 12.04, both running Java 7. REEF is developed on Workstations and
Laptops running Mac OS X 10.8 and 10.9, various versions of Linux and
Windows Pro in version 7 and 8.1. We’d expect it to run on any platform
supported by Apache Hadoop with the potential exception of the .NET
integration: That is currently tested only on [Windows Server
2012R2](http://www.microsoft.com/en-us/server-cloud/products/windows-server-2012-r2/default.aspx "Windows Server")
and Windows 8.1.

## How do I try things in my laptop?

The easiest way is to run REEF applications using the REEF local
runtime. That is a REEF implementation that uses local processes in lieu
of a resource manager installation. The next level of complexity would
be to setup a single-node YARN installation. Instructions on how to do
so can be found in the documentation of your favorite Hadoop
distribution.

## Where is the best place to get a Hadoop distribution?

REEF is coded against the public API of [Apache
Hadoop](http://hadoop.apache.org/ "Apache Hadoop") version 2.2 or newer.
Hence, we expect REEF applications to run on any distribution that ships
with this version of Hadoop.

That said, we regularly test REEF using the Hortonworks Data Platform
(HDP) as well as our own builds of development versions of Apache
Hadoop. We do not test on any other distributions, but would welcome
your success (or failure) stories.

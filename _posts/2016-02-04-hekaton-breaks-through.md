---
layout: post
title: Hekaton Breaks Through 
date: 2016-02-04
categories: [computer science]
tags: [big data]

---
# Hekaton Breaks Through


In an online, on-demand world, the ability to respond quickly to
requests for data has become a significant challenge.
Take[bwin](http://blogs.technet.com/b/dataplatforminsider/archive/2012/12/11/how-fast-is-project-codenamed-hekaton-it-s-wicked-fast.aspx),
for example. In order to attract and retain customers, bwin, the world’s
largest regulated online gaming company, must deliver consistently
positive user experiences. But the company’s online gaming systems were
bottlenecking at about 15,000 requests per second, and adding more
hardware was not solving the problem.

When Microsoft’s [SQL
Server](http://www.microsoft.com/sqlserver/en/us/default.aspx) team
offered bwin an opportunity to test a new, in-memory technology, bwin
expected to see its transaction throughput double, perhaps triple.
Instead, the first test increased throughput tenfold; by the end of the
trial period, tests had scaled to 250,000 transactions per second. Bwin
is now running this new, enhanced version of SQL Server in production.

Hekaton Accelerates Transaction Throughput
==========================================

Microsoft first shared information about the technology behind these
results in November during the [Professional Association for SQL Server
Summit](http://www.sqlpass.org/summit/2012/) (PASS Summit 2012), during
which**the company announced the forthcoming release of Hekaton, its new
in-memory technology, developed through a collaborative effort between
Microsoft Research and the SQL Server product team. Hekaton is scheduled
to ship with the next major release of SQL Server. The announcement’s
highlight was a demonstration that showed how SQL Server with Hekaton
delivered a 30x performance increase without code changes to existing
applications or hardware.

“There are several in-memory database systems on the market,” says
[David Lomet](http://research.microsoft.com/en-us/people/lomet/),
principal researcher and manager of the [Database
Group](http://research.microsoft.com/en-us/groups/db/default.aspx) at
[Microsoft Research
Redmond](http://research.microsoft.com/en-us/labs/redmond/default.aspx),
“but what really sets Hekaton apart is that it will be integrated into
SQL Server as part of Microsoft’s suite of xVelocity in-memory
technologies currently available in SQL Server 2012. Customers won’t
need to buy and manage a separate product.”

Lomet is referring to a strategic decision made during the Hekaton
project. Although technically challenging and more expensive to develop,
it was by far more preferable from a customer-usability point of view to
integrate Hekaton into SQL Server. This approach enables existing
applications to run without changes to code or hardware. But integration
with SQL Server was feasible only after the project team had achieved
its primary goal: to design a fast, main-memory database engine that
could run efficiently on machines with hundreds of cores.

Taking the Optimistic Approach
==============================

Since early 2009, [Paul
Larson](http://research.microsoft.com/en-us/people/palarson/), principal
researcher with the Database Group, has been part of the Hekaton
main-memory database project, which owes its genesis to Cristian
Diaconu, Erik Ismert, Craig Freedman, and Mike Zwilling of the SQL
Server team, along with Larson.

“In traditional models, the assumption is that data lives on disk and is
stored on disk pages,” Larson explains. “This creates a lot of overhead
when you try to access records. When data lives totally in memory, we
can use much, much simpler data structures. Hekaton’s index data
structures and storage structures are optimized on the basis that when a
table is declared memory-optimized, all of its records live in memory.”

![Members of the Hekaton
team](http://research.microsoft.com/en-us/news/features/images/Hekaton_Story.png)

Members of the Hekaton team: (*front row, from
left*) Justin Levandoski, Sudipta Sengupta, Paul Larson, and David
Lomet, and (*back row, from left*) Mike Zwilling, Adrian Birka, and
Cristian Diaconu

By late fall 2009, Larson and his colleagues had come up with a design
and a simple prototype for an in-memory database engine that showed huge
performance improvements. They had moved away from a partitioned
approach, which essentially treated a multicore processor as a
distributed system, to a latch-free, also called lock-free, design that
focused on removing the barriers to scalability present in current
systems.

Latches are synchronization mechanisms designed to avoid data corruption
when multiple users try to modify a data structure concurrently.
Unfortunately, latching frequently creates bottlenecks for
high-performance software systems running on multicore processors. By
preventing high processor utilization, latching defeats the performance
benefits offered by multicore hardware.

“Latch-free techniques, while more subtle and difficult to program, can
achieve both data integrity and high performance goals,” Lomet comments.
“Latch-free techniques update in an “optimistic” way, never locking
records or data structures. The challenge, of course, is to do this in a
way that doesn’t mess things up. Latch-free techniques have been around
for a while, but using them pervasively in a major system has not been
done before.”

The Hekaton team also found that multiversion concurrency control (MVCC)
proved robust in scenarios with higher workloads and higher contention.
Databases designed with single-version concurrency control handle
updates by overwriting data with each change. MVCC techniques handle
updates by marking old data as obsolete, then adding a newer version. At
any time, there could be multiple versions of the data, but only one is
the latest. The big benefit is that update transactions can add new
versions without interfering with concurrent read activity.

Hekaton implements an entirely new, optimistic MVCC approach that
enables a transaction to be processed without blocking. The paper
describing this work, *[High-Performance Concurrency Control Mechanisms
for Main-Memory
Databases](http://vldb.org/pvldb/vol5/p298_per-akelarson_vldb2012.pdf)—*by
Larson; Spyros Blanas and Jignesh M. Patel of the University of
Wisconsin-Madison; Diacon;, Freedman; and Zwilling—was presented in
August during the [38th International Conference on Very Large
Databases](http://www.vldb2012.org/).

A Better B-Tree
===============

Beyond concurrency control mechanisms, there were even more improvements
to come for Hekaton that further accelerated performance.

Researchers from the Database Group and the Communication and Storage
Systems Group had been developing an indexing system for high-speed
access to data, which they called the Bw-tree. Adhering to the
“latch-free” philosophy, the Bw-tree delivered far better
processor-cache performance than previous efforts.

“We had an ‘aha’ moment,” Lomet recalls, “when we realized that a single
table that maps page identifiers to page locations would enable both
latch-free page updating and log-structured page storage on flash
memory. The other highlight, of course, was when we got back performance
results that were stunningly good.”

The Bw-tree team first demonstrated its work in March 2011 during
[TechFest
2011](http://research.microsoft.com/en-us/events/techfest2011/default.aspx),
Microsoft Research’s annual showcase of cutting-edge projects. The
Bw-tree performance results were dazzling enough to catch the interest
of the SQL Server product group.

“When they learned about our performance numbers, that was when the
Hekaton folks started paying serious attention to us,” researcher
[Justin
Levandoski](http://research.microsoft.com/en-us/um/people/justinle/)
says. “We ran side-by-side tests of the Bw-tree against another
latch-free technology they were using, which was based on ‘skiplists.’
The Bw-tree was faster by several factors. Shortly after that, we began
engaging with the Hekaton team, mainly Diaconu and Zwilling.”

“A skiplist is often the first choice for implementing an ordered index,
either latch-free or latch-based, because it is perceived to be more
lightweight than a full B-tree implementation”, says [Sudipta
Sengupta](http://research.microsoft.com/en-us/um/people/sudipta/),
senior researcher in the Communication and Storage Systems Group. “An
important contribution of our work is in dispelling this myth and
establishing that latch-free B-trees can perform way better than
latch-free skiplists. The Bw-tree also performs significantly better
than a well-known latch-based B-tree implementation—BerkeleyDB—that is
widely regarded in the community for its good performance.”

Zwilling supplied the Bw-tree team with a workload scenario exhibiting
the “last-page latch” problem, in which all threads continually attempt
to update a single page of a B-tree index—the “last page.” This high
contention scenario causes severe performance degradation when using
latch-based approaches. On this workload, the Bw-tree performed better
by a factor of 24 over another, well-engineered latch-based
implementation. The Hekaton team decided to go with the Bw-tree.

*[The Bw-Tree: A B-tree for New Hardware
Platforms](http://research.microsoft.com/pubs/178758/bw-tree-icde2013-cr.pdf)*
by Levandoski, Lomet, and Sengupta will be one of the papers presented
in April during the [29th IEEE International Conference on Data
Engineering](http://www.icde2013.org/index.html).

A Close Partnership
===================

After four years working closely with the SQL Server product group,
Larson values highly the collaboration experience, as well as its
outcome.

“The Hekaton team within the SQL Server product group is the most
talented and ambitious product team I’ve ever worked with,” Larson says.
“The key developers have deep technical knowledge and strong technical
views, which sometimes lead to rather heated but always valuable
discussions.”

The collaboration continues. Hekaton entered its next phase during PASS
Summit 2012: private previews with a small set of customers. This group
will help build, test, and validate the capabilities of the solution—as
well as validate the decision to incorporate Hekaton technology into the
core of SQL Server, so that it accelerates performance with complete
transparency.

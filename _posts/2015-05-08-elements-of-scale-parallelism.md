---
layout: post
title: Parallelism 
date: 2015-05-08
categories: [computer science]
tags: [big data]

---

[![](http://sungsoo.github.com/images/scaling_data.png)](http://sungsoo.github.com/images/scaling_data.png)

---
## Article Source

* Title: [Elements of Scale: Composing and Scaling Data Platforms](http://www.benstopford.com/2015/04/28/elements-of-scale-composing-and-scaling-data-platforms/)
* Authors: [Ben Stopford](http://www.benstopford.com)

---

# Parallelism

Scaling a data platform is more than just storage engines though. We
need to consider parallelism.

![](http://sungsoo.github.com/images/Slide27.png)

When distributing data over many machines we have two core primitives to
play with: partitioning and replication. Partitioning, sometimes called
sharding, works well both for random access and brute force workloads.

If a hash-based partitioning model is used the data will be spread
across a number of machines using a well-known hash function. This is
similar to the way a hash table works, with each bucket being held on a
different machine.

The result is that any value can be read by going directly to the
machine that contains the data, via the hash function. This pattern
is wonderfully scalable and is the only pattern that
shows linear scalability as the number of client requests increases.
Requests are isolated to a single machine. Each one will be served
by just a single machine in the cluster.

![](http://sungsoo.github.com/images/Slide28.png)

We can also use partitioning to provide parallelism over batch
computations, for example aggregate functions or more complex algorithms
such as those we might use for clustering or machine learning. The key
difference is that we exercise all machines at the same time, in a
broadcast manner. This allows us to solve a large computational problem
in a much shorter time, using a divide and conquer approach.

Batch systems work well for large problems, but provide little
concurrency as they tend to exhaust the resources on the cluster when
they execute.

![](http://sungsoo.github.com/images/Slide29.png)

So the two extremes are pretty simple: directed access at one end,
broadcast, divide and conquer at the other. Where we need to be careful
is in the middle ground that lies between the two. A good example of
this is the use of secondary indexes in NoSQL stores that span many
machines.

A secondary index is an index that isn’t on the primary key. This means
the data will not be partitioned by the values in the index. Directed
routing via a hash function is no longer an option. We have to broadcast
requests to all machines. This limits concurrency. Every node must
be involved in every query.

For this reason many key value stores have resisted the temptation to
add secondary indexes, despite their obvious use. HBase and Voldemort
are examples of this. But many others do expose them, MongoDB,
Cassandra, Riak etc. This is good as secondary indexes are useful. But
it’s important to understand the effect they will have on the overall
concurrency of the system.

![](http://sungsoo.github.com/images/Slide30.png)

The route out of this concurrency bottleneck is replication. You’ll
probably be familiar with replication either from using async slave
databases or from replicated NoSQL stores like Mongo or Cassandra.

In practice replicas can be invisible (used only for recovery), read
only (adding read concurrency) or read write (adding partition
tolerance). Which of these you choose will trade off against the
consistency of the system. This is simply the application of CAP theorem
(although cap theorem also [may not
be](http://blog.thislongrun.com/2015/04/cap-availability-high-availability-and_16.html)
as simple as you think).

![](http://sungsoo.github.com/images/Slide31.png)

This tradeoff with consistency\* brings us to an important question.
When does consistency matter?

Consistency is expensive. In the database world ACID is guaranteed by
serialisability. This is essentially ensuring that all operations appear
to occur in sequential order.  It turns out to be a pretty expensive
thing. In fact it’s prohibitive enough that many databases don’t offer
it as an isolation level at all. Those that do never set it as the
default.

Suffice to say that if you apply strong consistency to a system that
does distributed writes you’ll likely end up in tortoise territory.

(\* note the term consistency has two common usages. The C in ACID and
the C in CAP. They are unfortunately not the same. I’m using the CAP
definition: all nodes see the same data at the same time)

![](http://sungsoo.github.com/images/Slide33.png)

The solution to this consistency problem is simple. Avoid it. If you
can’t avoid it isolate it to as few writers and as few machines as
possible.

Avoiding consistency issues is often quite easy, particularly if your
data is an immutable stream of facts. A set of web logs is a good
example. They have no consistency concerns as they are just facts that
never change.

There are other use cases which do necessitate consistency though.
Transferring money between accounts is an oft used example.
Non-commutative actions such as applying discount codes is another.

But often things that appear to need consistency, in a traditional
sense, may not. For example if an action can be changed from a mutation
to a new set of associated facts we can avoid
mutable state. Consider marking a transaction as being potentially
fraudulent. We could update it directly with the new field.
Alternatively we could simply use a separate stream of facts that links
back to the original transaction.

![](http://sungsoo.github.com/images/Slide34.png)

So in a data platform it’s useful to either remove the consistency
requirement altogether, or at least isolate it. One way to isolate is to
use the single writer principal, this gets you some of the way.
[Datomic](http://www.datomic.com/) is a good example of this. Another is
to physically isolate the consistency requirement by splitting mutable
and immutable worlds.

Approaches like [Bloom/CALM](http://www.bloom-lang.net/calm/) extend
this idea further by embracing the concept of disorder by default,
imposing order only when necessary.

So those were some of the fundamental tradeoffs we need to consider. Now
how to we pull these things together to build a data platform?

![](http://sungsoo.github.com/images/Slide35.png)

A typical application architecture might look something like the below.
We have a set of processes which write data to a database and read it
back again. This is fine for many simple workloads. Many
successful applications have been built with this pattern. But we know
it works less well as throughput grows. In the application space this is
a problem we might tackle with message-passing, actors, load balancing
etc.

The other problem is this approach treats the database as a black box.
Databases are clever software. They provide a huge wealth of features.
But they provide little mechanism for scaling out of an ACID world. This
is a good thing in many ways. We default to safety. But it can become an
annoyance when scaling is inhibited by general guarantees which may be
overkill for the requirements we have.

![](http://sungsoo.github.com/images/Slide36.png)

The simplest route out of this
is [CQRS](http://martinfowler.com/bliki/CQRS.html) (Command Query
Responsibility Segregation).

Another very simple idea. We separate read and write workloads. Writes
go into something write-optimised. Something closer to a simple journal
file. Reads come from something read-optimised. There are many ways to
do this, be it tools like Goldengate for relational technologies
or products that integrate replication internally such as Replica Sets
in MongoDB.

![](http://sungsoo.github.com/images/Slide37.png)

Many databases do something like this under the hood. Druid is a
nice example. Druid is an open source, distributed, time-series,
columnar analytics engine. Columnar storage works best if we input data
in large blocks, as the data must be spread across many files. To get
good write performance Druid stores recent data in a write optimised
store. This is gradually ported over to the read optimised store over
time.

When Druid is queried the query routes to both the write optimised and
read optimised components. The results are combined (‘reduced’) and
returned to the user. Druid uses time, marked on each record, to
determine ordering.

Composite approaches like this provide the benefits of CQRS behind a
single abstraction.

![](http://sungsoo.github.com/images/Slide38.png)

Another similar approach is to use an [Operational/Analytic
Bridge](http://www.benstopford.com/2015/04/07/upside-down-databases-bridging-the-operational-and-analytic-worlds-with-streams/).
Read- and write-optimised views are separated using an event stream. The
stream of state is retained indefinitely, so that the async views can be
recomposed and augmented at a later date by replaying.

So the front section provides for synchronous reads and writes. This
can be as simple as immediately reading data that was written or as
complex as supporting ACID transactions.

The back end leverages asynchronicity, and the [advantages of immutable
state](http://www.cidrdb.org/cidr2015/Papers/CIDR15_Paper16.pdf), to
scale offline processing through replication, denormalisation or
even completely different storage engines. The messaging-bridge, along
with joining the two, allows applications to listen to the data flowing
through the platform.

As a pattern this is well suited to mid-sized deployments where there is
at least a partial, unavoidable requirement for a mutable view.

![](http://sungsoo.github.com/images/Slide39.png)
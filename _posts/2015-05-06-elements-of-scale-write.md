---
layout: post
title: Composing and Scaling Data Platforms 
date: 2015-05-06
categories: [computer science]
tags: [big data]

---

[![](http://sungsoo.github.com/images/scaling_data.png)](http://sungsoo.github.com/images/scaling_data.png)

---

# Elements of Scale: Composing and Scaling Data Platforms

So what about data that changes, updates etc?

We have two options. We could update the value in place. We’d need to
use fixed width fields for this, but that’s ok for our little thought
experiment. But update in place would mean random IO. We know that’s not
good for performance.

Alternatively we could just append updates to the end of the file and
deal with the superseded values when we read it back.

So we have our first tradeoff. Append to a ‘journal’ or ‘log’, and reap
the benefits of sequential access. Alternatively if we use update in
place we’ll be back to 300 or so writes per second, assuming we actually
flush through to the underlying media.

![](http://sungsoo.github.com/images/Slide11.png)

Now in practice of course reading the file, in its entirety, can be
pretty slow. We’ll only need to get into GB’s of data and the fastest
disks will take seconds. This is what a database does when it ends up
table scanning.

Also we often want something more specific, say customers named “bob”,
so scanning the whole file would be overkill. We need an index.

![](http://sungsoo.github.com/images/Slide13.png)

Now there are lots of different types of indexes we could use. The
simplest would be an ordered array of fixed-width values, in this case
customer names, held with the corresponding offsets in the heap file.
The ordered array could be searched with binary search. We could also of
course use some form of tree, bitmap index, hash index, term index etc.
Here we’re picturing a tree.

The thing with indexes like this is that they impose an overarching
structure. The values are deliberately ordered so we can access them
quickly when we want to do a read. The problem with the overarching
structure is that it necessitates random writes as data flows in. So our
wonderful, write optimised, append only file must be augmented by writes
that scatter-gun the filesystem. This is going to slow us down.

![](http://sungsoo.github.com/images/Slide14.png)

Anyone who has put lots of indexes on a database table will be familiar
with this problem. If we are using a regular rotating hard drive, we
might run 1,000s of times slower if we maintain disk integrity of
an index in this way.

Luckily there are a few ways around this problem. Here we are going to
discuss three. These represent three extremes, and they are in truth
simplifications of the real world, but the concepts are useful when we
consider larger compositions.

![](http://sungsoo.github.com/images/Slide15.png)

Our first option is simply to place the index in main memory. This will
compartmentalise the problem of random writes to RAM. The heap file
stays on disk.

This is a simple and effective solution to our random writes problem. It
is also one used by many real databases. MongoDB, Cassandra, Riak and
many others use this type of optimisation. Often memory mapped files are
used.

However, this strategy breaks down if we have far more data than we have
main memory. This is particularly noticeable where there are lots of
small objects. Our index would get very large. Thus our storage becomes
bounded by the amount of main memory we have available. For many tasks
this is fine, but if we have very large quantities of data this can be a
burden.

A popular solution is to move away from having a single ‘overarching’
index. Instead we use a collection of smaller ones.

![](http://sungsoo.github.com/images/Slide16.png)

This is a simple idea. We batch up writes in main memory, as they come
in. Once we have sufficient – say a few MB’s – we sort them and write
them to disk as an individual mini-index. What we end up with is a
chronology of small, immutable index files.

So what was the point of doing that? Our set of immutable files can be
streamed sequentially. This brings us back to a world of fast writes,
without us needing to keep the whole index in memory. Nice!

Of course there is a downside to this approach too. When we read, we
have to consult the many small indexes individually. *So all we
have really done is shift the problem of RandomIO from writes onto
reads*. However this turns out to be a pretty good tradeoff in many
cases. It’s easier to optimise random reads than it is to optimise
random writes.

Keeping a small meta-index in memory or using a Bloom Filter provides a
low-memory way of evaluating whether individual index files need to be
consulted during a read operation. This gives us almost the same read
performance as we’d get with a single overarching index whilst retaining
fast, sequential writes.

In reality we will need to purge orphaned updates occasionally too, but
that can be done with nice sequentially reads and writes.

![](http://sungsoo.github.com/images/Slide17.png)

What we have created is termed a [Log Structured Merge
Tree](http://www.benstopford.com/2015/02/14/log-structured-merge-trees/).
A storage approach used in a lot of big data tools such as HBase,
Cassandra, Google’s BigTable and many others. It balances write and read
performance with comparatively small memory overhead.

![](http://sungsoo.github.com/images/Slide18.png)

So we can get around the ‘random-write penalty’ by storing our indexes
in memory or, alternatively, using a write-optimised index structure
like LSM. There is a third approach though. Pure brute force.

Think back to our original example of the file. We could read it in its
entirety. This gave us many options in terms of how we go about
processing the data within it. The brute force approach is simply to
hold data by column rather than by row and stream only the columns
required for a query, in their entirety, through the CPU. This approach
is termed Columnar or Column Oriented.

(It should be noted that there is an unfortunate nomenclature clash
between true column stores and those that follow the Big Table pattern.
Whilst they share some similarities, in practice they are quite
different. It is wise to consider them as different things.)

![](http://sungsoo.github.com/images/Slide19.png)

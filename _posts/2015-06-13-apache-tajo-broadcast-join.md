---
layout: post
title: Broadcast Join in Tajo
date: 2015-06-13
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Broadcast Join in Tajo](https://jihoonson.wordpress.com/2015/05/31/broadcast-join-in-tajo/)
* Authors: [Jihoon
Son](https://jihoonson.wordpress.com/author/jihoonson/ "View all posts by Jihoon Son")

---

Broadcast Join in Tajo 
======================

Join is one of the most expensive operations in relational world. As a
result, many researchers have been studied for efficient join
processing.

In distributed systems, there are two well-known join execution
algorithms, i.e., *repartition join*and *broadcast join *(There are many
other join algorithms including recently introduced [Track
join](http://dl.acm.org/citation.cfm?id=2610521&dl=ACM&coll=DL&CFID=679218544&CFTOKEN=86341896),
but I won’t handle them here). I’d like to simply present these
algorithms before describing broadcast join in Tajo.

## Repartition join

Repartition join is executed in two stages. In the first stage, input
relations are read and then grouped into multiple partitions according
to the value of join key. The result partitions are exchanged between
cluster nodes to process the partition of the same value of join key
together. This data exchange is called *shuffle*. In the second stage,
every node performs join simultaneously.

[![Example of Repartition Join
](https://jihoonson.files.wordpress.com/2015/05/repartition-join1.png?w=605&h=399)](https://jihoonson.files.wordpress.com/2015/05/repartition-join1.png)

Example of Repartition Join (join key = DeptName)

Repartition join works well even for large inputs, and thus is used as
the default join algorithm in many distributed systems.

## Broadcast Join

The shuffle operation of repartition join might accompany a large
overhead especially for small inputs. It includes creating and
exchanging partitions as well as scanning data. This overhead is
increased in some distributed systems that spill intermediate results
between stages onto disks like Hadoop MapReduce or Tajo.

Broadcast join is used to mitigate such overhead when joining small
relations. Unlike repartition join, broadcast join is executed in a
single stage. At the beginning of the stage, one of input relations
(usually smaller one) is simply broadcasted into every node who stores
any part of another input. After that, the join is performed in
parallel.

[![Example of Broadcast
Join](https://jihoonson.files.wordpress.com/2015/05/broadcast-join1.png?w=605&h=388)](https://jihoonson.files.wordpress.com/2015/05/broadcast-join1.png)

Example of Broadcast Join (join key = DeptName)

Please note that the whole relation is replicated to multiple nodes in
broadcast join. If a large relation is broadcasted, broadcast join might
accompany larger overhead than repartition join. Thus, given a query
plan, it is important to decide which part will be executed with
broadcast join. This is what I’d like to describe in this post.

## Broadcast Join in Tajo

At
[https://issues.apache.org/jira/browse/TAJO-1553](https://issues.apache.org/jira/browse/TAJO-1553),
Tajo’s broadcast join planning have been improved. In this section, I’ll
present a brief description of the improvement.

During broadcast join planning, Tajo’s global query optimizer identifies
*broadcastable part*in the query plan according to several simple rules.
The following definition will help describing those rules.

*Definition: Broadcastable relation*. An input relation or an output of
a stage is *braodastable* if its size is smaller than pre-defined
threshold.

The default threahold is 5 MB in Tajo. With this definition, we used a
simple assumption as follows.

*Assumption: If the total size of every input of a stage is smaller than
pre-defied threshold, the output of the stage is also sufficiently small
and thus broadcastable. *

Finally, here are basic rules to decide which part will be executed with
broadcast join in Tajo.

-   Given a user-defined threshold, the total size of broadcast
    relations of a stage cannot exceed it.
-   A stage containing a join and its child stages can be merged into a
    single stage if at least one child stage’s output is broadcastable.
    -   After merging stages according to the second rule, the result
        stage may not satisfy the first rule. In this case, enforce
        repartition join for large relations to satisfy the first rule.
-   If every input relation is broadcastable, one of them should not be
    broadcasted. In this case, the largest one is not broadcasted to
    minimize the amount of broadcasted data.

The following rules are additionally used when the stage contains outer
join. 

-   Preserved-row relations must not be broadcasted to avoid duplicated
    inputs.

During outer join execution, tuples of the preserved-row relation are
kept in join result regardless of whether they satisfy join condition or
not. If the outer join is executed by multiple tasks with broadcasted
preserved-row relations, same rows are processed multiple times by
different tasks, thereby making the result invalid.

The only case that broadcasting of preserved-row relations is allowed is
when the outer join is executed by a single task. This condition cannot
be guaranteed by just that every input is sufficiently small (and thus
broadcastable) because one of relations can consist of multiple files
even though the total size is very small. (Note that tasks are generated
for each file when they are smaller than HDFS block in Tajo. If a
relation consists of *n* small files, *n* tasks will be launched to
process each file.)

This complicated condition is difficult to be identified in the current
implementation of Tajo’s global query optimizer because the underlying
storage layout is concealed from it.

[![Example of Broadcast Join
Planning](https://jihoonson.files.wordpress.com/2015/05/broadcast-join-example1.png?w=605&h=289)](https://jihoonson.files.wordpress.com/2015/05/broadcast-join-example1.png)

Example of Broadcast Join Planning

The above figure shows an example of broadcast join plan of the query
used in the next section. Since there is only a single non-broadcastable
relation, the entire query plan will be executed using the broadcast
join algorithm.

## Simple Performance Evaluation 

Here is the simple performance evaluation result.

### Query

```sql
    SELECT 
        r_name, 
        case 
            when l_shipmode is null 
            then 'N/O' else l_shipmode 
        end as s1 
    FROM 
        region inner join 
        ( 
            SELECT * 
            FROM 
                lineitem left outer join nation 
                on l_suppkey = n_nationkey 
        ) t 
        on n_regionkey = r_regionkey
```        

### Data

-   Input: TPC-H scale factor of 100
-   Result: 14484 rows (185.7 KB)

### Cluster

-   Consisting of one master and 4 workers
    -   Each worker equips 24 cores, 16 GB memory, and 10 disks

### Performance

-   Before: 226.915 sec
-   After: 49.647 sec

## Future Work

As presented above, broadcast join might be limited for outer joins.
Especially for full outer joins, broadcast join is prohibited because
both inputs are preserved-row relations. This issue will be addressed at
[https://issues.apache.org/jira/browse/TAJO-1632](https://issues.apache.org/jira/browse/TAJO-1632).


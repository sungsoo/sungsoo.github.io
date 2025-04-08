---
layout: post
title: Min-cost Flow Network Algorithms
date: 2016-04-21
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: VectorH: Taking SQL-on-Hadoop to the next level
* Authors: Andrei Costea et al

---

# Min-cost Flow Network Algorithms

When VectorH initially starts, or when it recovers from *node failures* its **dbAgent** must select those *N* machines with most data locality (stored blocks), out of all nodes which are on the viable machine list and which have enough free memory and core resources. 
Typical VectorH deployments are maximally a few colocated racks, so node failures are rare and recovery is kept simple: the system silently restarts, though users will notice at most a minute of non-responsiveness plus transaction aborts.
To get cluster resource information, **dbAgent** asks YARN for the *cluster node reports*, and for finding VectorH table partition locality it queries the HDFS Namenode to retrieve *block locations* for the corresponding chunk files. It may happen that there are no such nodes available, in which case the worker set shrinks, which is also the case in the below part of Figure 2.

After establishing the worker set, **dbAgent** checks which partitions are already local to them. Not all partitions may be represented *R* times already, so the question is which partitions should go where – the resulting *partition affinity map* steers the behavior of the instrumented HDFS BlockPlacementPolicy class (and hence re-replication). Figure 2 shows an outcome where partitions 10-12 that were on node4 are re-replicated to node3, 7-9 to node2 and 4-6 to node1.

![](http://sungsoo.github.com/images/part-affinity.png)

This mapping can be computed by solving a min-cost matching problem on a network flow where the left side represents the table partitions and the right side the workers, as illustrated in Figure 3 (a related approach was proposed in [15]). From the source (s) to each partition, we create edges with cost 0 and capacity equal to the HDFS replication degree (RMax=R), and we create edges from each partition to each worker with capacity 1 and cost C=0 for local partitions, otherwise C=1. We then create edges from the workers to the destination node (t), assigning a cost 0 and a capacity equal to the amount of partitions each node should store (PCap = #partitions/N).
A final step for **dbAgent** is to compute the responsibility assignment: which worker is responsible for each partition (i.e. which partitions should be in bold in Figure 2). To assign responsibilities to worker nodes, it runs the same mincost flow algorithm, with the only difference that the edges from source (s) to each partition have cost 0 and capacity 1. The lower part of Figure 2 shows an example result of this, were node1 becomes responsible for partitions 3,10-12; node2 for 1-2,4-5 and node3 for 6-9 (in bold).
More details about the min-cost algorithms used for (i) worker set selection, (ii) creating the data affinity mapping, (iii) responsibility assignment, and even (iv) run-time query resource scheduling can be found in [5].


## Dynamic Resource Management

While VectorH runs, the amount of cores and memory it uses in the query scheduler may change over time – though the worker set currently must stay the same. At startup, VectorH will negotiate with YARN to get to its configured target of resources, if this is not possible, it will start nevertheless as long as it gets above a configured minimum. If there are higher-priority jobs, YARN will pre-empt VectorH and reduce its resources, but VectorH will periodically negotiate with YARN to go back to its target resource footprint. Using the automatic footprint option, VectorH can also self-regulate its desired core/memory footprint depending on the query workload. In a future release, we intend to also allow to grow and shrink the worker set (not only cores/RAM) dynamically.
In Figure 2 one can see that after the failure of node4, and assuming these nodes have 24 cores, a maximal resource query plan can run on 3x24 cores processing a join query between R and S5. If in a future release VectorH would support dynamic shrinking of the worker set, in an idle workload VectorH could shrink to a minimum resource footprint of ⌈#nworkers/R⌉ and still have all table partitions local at the active workers. In the scenario of Figure 2 we could imagine that the partition responsibility assignment is changed such that node1 becomes responsible for all its partitions (all in bold), and node2 and 3 for none of theirs (all a/b versions), as they become inactive workers. A minimalresource query plan could just use one thread at node1 – 72 times fewer resources than the maximal plan.


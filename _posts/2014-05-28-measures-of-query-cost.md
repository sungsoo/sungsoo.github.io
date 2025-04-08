---
layout: post
title: Measures of Query Cost
date: 2014-05-28
categories: [computer science]
tags: [data management]

---


[![](http://sungsoo.github.com/images/query-processing.png)](http://sungsoo.github.com/images/query-processing.png)

---

# Measures of Query Cost

There are multiple possible evaluation plans for a query, and it is important to be able to compare the alternatives in terms of their (estimated) cost, and choose the best plan. To do so, we must estimate the cost of individual operations, and combine them to get the cost of a query evaluation plan. Thus, as we study evaluation algorithms for each operation later in this chapter, we also outline how to estimate the cost of the operation.

The cost of query evaluation can be measured in terms of a number of different resources, including disk accesses, CPU time to execute a query, and, in a distributed or parallel database system, the cost of communication.

In large database systems, the cost to access data from disk is usually the most important cost, since disk accesses are slow compared to in-memory operations. Moreover, CPU speeds have been improving much faster than have disk speeds. Thus, it is likely that the time spent in disk activity will continue to dominate the total time to execute a query. The CPU time taken for a task is harder to estimate since it depends on low-level details of the execution code. Although real-life query optimizers do take CPU costs into account, for simplicity in this book we ignore CPU costs and use only disk-access costs to measure the cost of a query-evaluation plan.

We use the *number of block transfers* from disk and *the number of disk seeks* to estimate the cost of a query-evaluation plan. If the disk subsystem takes an average of *t<sub>T</sub>* seconds to transfer a block of data, and has an average block-access time (disk seek time plus rotational latency) of *t<sub>S</sub>* seconds, then an operation that transfers *b* blocks and performs *S* seeks would take *b* ∗ *t<sub>T</sub>* + *S* ∗ *t<sub>S</sub>* seconds. The values of *t<sub>T</sub>* and *t<sub>S</sub>* must be calibrated for the disk system used, but typical values for high-end disks today would be *t<sub>S</sub>* = 4 milliseconds and *t<sub>T</sub>* = 0.1 milliseconds, assuming a 4-kilobyte block size and a transfer rate of 40 megabytes per second.

---


* *t<sub>T</sub>* – time to transfer one block
* *t<sub>S</sub>* – time for one seek
* Cost for *b* block transfers plus *S* seeks  
	* *b * t<sub>T</sub> + S * t<sub>S</sub>* 

* We ignore CPU costs for simplicity
	* Real systems do take CPU cost into account
* We do not include cost to writing output to disk in our cost formulae

---


We can refine our cost estimates further by distinguishing block reads from block writes, since block writes are typically about twice as expensive as reads (this is because disk systems read sectors back after they are written to verify that the write was successful). For simplicity, we ignore this detail, and leave it to you to work out more precise cost estimates for various operations.

The cost estimates we give do not include the cost of writing the final result of an operation back to disk. These are taken into account separately where required. The costs of all the algorithms that we consider depend on the size of the buffer in main memory. In the best case, all data can be read into the buffers, and the disk does not need to be accessed again. In the worst case, we assume that the buffer can hold only a few blocks of data — approximately one block per relation. When presenting cost estimates, we generally assume the worst case.

In addition, although we assume that data must be read from disk initially, it is possible that a block that is accessed is already present in the in-memory buffer. Again, for simplicity, we ignore this effect; as a result, the actual disk-access cost during the execution of a plan may be less than the estimated cost.

The **response time** for a query-evaluation plan (that is, the wall-clock time required to execute the plan), assuming no other activity is going on in the computer, would account for all these costs, and could be used as a measure of the cost of the plan. Unfortunately, the response time of a plan is very hard to estimate without actually executing the plan, for the following reasons:

1. The response time depends on the contents of the buffer when the query begins execution; this information is not available when the query is optimized, and is hard to account for even if it were available.
2. In a system with multiple disks, the response time depends on how accesses are distributed among disks, which is hard to estimate without detailed knowledge of data layout on disk.

Interestingly, a plan may get a better response time at the cost of extra resource consumption. For example, if a system has multiple disks, a plan A that requires extra disk reads, but performs the reads in parallel across multiple disks may finish faster than another plan B that has fewer disk reads, but from only one disk. However, if many instances of a query using plan A run concurrently, the overall response time may actually be more than if the same instances are executed using plan B, since plan A generates more load on the disks.

As a result, instead of trying to minimize the response time, optimizers generally try to minimize the total **resource consumption** of a query plan. Our model of estimating the total disk access time (including seek and data transfer) is an example of such a resource consumption–based model of query cost.


# References

[1] Abraham Silberschatz, Henry F. Korth, S. Sudarshan, *DATABASE SYSTEM CONCEPTS*, Sixth Edition, McGraw Hill, 2011.


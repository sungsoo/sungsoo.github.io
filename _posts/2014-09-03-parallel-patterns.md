---
layout: post
title: Some Common Parallel Patterns
date: 2014-09-03
categories: [computer science]
tags: [machine learning]

---



SOME COMMON PARALLEL PATTERNS
===

A number of parallel problems can be thought of as patterns. We see patterns in many software programs, although not everyone is aware of them. Thinking in terms of patterns allows us to broadly deconstruct or abstract a problem, and therefore more easily think about how to solve it.

## Loop-based patterns


Almost anyone who has done any programming is familiar with loops. They vary primarily in terms of entry and exit conditions (for, do.while, while), and whether they create dependencies between loop iterations or not.


A *loop-based iteration dependency* is where one iteration of the loop depends on one or more previous iterations. We want to remove these if at all possible as they make implementing parallel algorithms more difficult. If in fact this can’t be done, the loop is typically broken into a number of blocks that are executed in parallel. The result from block 0 is then retrospectively applied to block 1, then to block 2, and so on. There is an example later in this text where we adopt just such an approach when handling the prefix-sum algorithm.

*Loop-based iteration* is one of the easiest patterns to parallelize. With *inter-loop dependencies* removed, it’s then simply a matter of deciding how to split, or partition, the work between the available processors. This should be done with a view to minimizing communication between processors and maximizing the use of on-chip resources (registers and shared memory on a GPU; L1/L2/L3 cache on a CPU). Communication overhead typically scales badly and is often the bottleneck in poorly designed systems.

The *macro-level decomposition* should be based on the number of logical processing units available. For the CPU, this is simply the number of logical hardware threads available. For the GPU, this is the number of SMs multiplied by the maximum load we can give to each SM, 1 to 16 blocks depending on resource usage and GPU model. Notice we use the term logical and not physical hardware thread. Some Intel CPUs in particular support more than one logical thread per physical CPU core, so-called hyperthreading. GPUs run multiple blocks on a single SM, so we have to at least multiply the number of SMs by the maximum number of blocks each SM can support.

Using more than one thread per physical device maximizes the throughput of such devices, in terms of giving them something to do while they may be waiting on either a memory fetch or I/O-type operation. Selecting some multiple of this minimum number can also be useful in terms of load balancing on the GPU and allows for improvements when new GPUs are released. This is particularly the case when the partition of the data would generate an uneven workload, where some blocks take much longer than others. In this case, using many times the number of SMs as the basis of the partitioning of the data allows slack SMs to take work from a pool of available blocks.

However, on the CPU side, over subscribing the number of threads tends to lead to poor performance. This is largely due to *context switching* being performed in software by the OS. Increased contention for the cache and memory bandwidth also contributes significantly should you try to run too many threads. Thus, an existing multicore CPU solution, taken as is, typically has far too large a granularity for a GPU. You will almost always have to repartition the data into many smaller blocks to solve the same problem on the GPU.

When considering *loop parallelism* and porting an existing serial implementation, be critically aware of hidden *dependencies*. Look carefully at the loop to ensure one iteration does not calculate a value used later. Be wary of loops that count down as opposed to the standard zero to max value construct, which is the most common type of loop found. Why did the original programmer count backwards? It is likely this may be because there is some dependency in the loop and parallelizing it without understanding the dependencies will likely break it.

We also have to consider loops where we have an inner loop and one or more outer loops. How should these be parallelized? On a CPU the approach would be to parallelize only the *outer loop* as you have only a *limited* number of threads. This works well, but as before it depends on there being no loop iteration dependencies.

On the GPU the inner loop, provided it is small, is typically implemented by threads within a single block. As the loop iterations are grouped, adjacent threads usually access adjacent memory locations. This often allows us to exploit *locality*, something very important in CUDA programming. Any outer loop(s) are then implemented as blocks of the threads. 

Consider also that most loops can be flattened, thus reducing an inner and outer loop to a single loop. Think about an image processing algorithm that iterates along the *X* pixel axis in the inner loop and the *Y* pixel axis in the outer loop. It’s possible to flatten this loop by considering all pixels as a *single-dimensional array* and iterating over pixels as opposed to image coordinates. This requires a little more thought on the programming side, but it may be useful if one or more loops contain a very small number of iterations. Such small loops present considerable loop overhead compared to the work done per iteration. They are, thus, typically not efficient.


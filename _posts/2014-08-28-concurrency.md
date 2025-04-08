---
layout: post
title: Concurrency
date: 2014-08-28
categories: [computer science]
tags: [parallel computing]

---

CONCURRENCY
===

The first aspect of concurrency is to think about the particular problem, without regard for any implementation, and consider what aspects of it could run in parallel.

If possible, try to think of a formula that represents each output point as some function of the input data. This may be too cumbersome for some algorithms, for example, those that iterate over a large number of steps. For these, consider each step or iteration individually. Can the data points for the step be represented as a transformation of the input dataset? If so, then you simply have a set of kernels (steps) that run in sequence. These can simply be pushed into a queue (or stream) that the hardware will schedule sequentially.

A significant number of problems are known as “embarrassingly parallel,” a term that rather underplays what is being achieved. If you can construct a formula where the output data points can be represented without relation to each otherdfor example, a matrix multiplicationdbe very happy. These types of problems can be implemented extremely well on GPUs and are easy to code.

If one or more steps of the algorithm can be represented in this way, but maybe one stage cannot, also be very happy. This single stage may turn out to be a bottleneck and may require a little thought, but the rest of the problem will usually be quite easy to code on a GPU.

If the problem requires every data point to know about the value of its surrounding neighbors then the speedup will ultimately be limited. In such cases, throwing more processors at the problem works up to a point. At this point the computation slows down due to the processors (or threads) spending more time sharing data than doing any useful work. The point at which you hit this will depend largely on the amount and cost of the communication overhead.

CUDA is ideal for an embarrassingly parallel problem, where little or no interthread or interblock communication is required. It supports interthread communication with explicit primitives using on- chip resources. Interblock communication is, however, only supported by invoking multiple kernels in series, communicating between kernel runs using off-chip global memory. It can also be performed in a somewhat restricted way through atomic operations to or from global memory.

CUDA splits problems into grids of blocks, each containing multiple threads. The blocks may run in any order. Only a subset of the blocks will ever execute at any one point in time. A block must execute from start to completion and may be run on one of N SMs (symmetrical multiprocessors). Blocks are allocated from the grid of blocks to any SM that has free slots. Initially this is done on a round-robin basis so each SM gets an equal distribution of blocks. For most kernels, the number of blocks needs to be in the order of eight or more times the number of physical SMs on the GPU.

To use a military analogy, we have an army (a grid) of soldiers (threads). The army is split into a number of units (blocks), each commanded by a lieutenant. The unit is split into squads of 32 soldiers (a warp), each commanded by a sergeant (See Figure 2.1).

[![](http://sungsoo.github.com/images/gpu-based-threads.png)](http://sungsoo.github.com/images/gpu-based-threads.png)

To perform some action, central command (the kernel/host program) must provide some action plus some data. Each soldier (thread) works on his or her individual part of the problem. Threads may from time to time swap data with one another under the coordination of either the sergeant (the warp) or the lieutenant (the block). However, any coordination with other units (blocks) has to be performed by central command (the kernel/host program).

Thus, it’s necessary to think of orchestrating thousands of threads in this very hierarchical manner when you think about how a CUDA program will implement concurrency. This may sound quite complex at first. However, for most embarrassingly parallel programs it’s just a case of thinking of one thread generating a single output data point. A typical GPU has on the order of 24 K active threads. On Fermi GPUs you can define 65,535 65,535 1536 threads in total, 24 K of which are active at any time. This is usually enough to cover most problems within a single node.

Locality
---

Computing has, over the last decade or so, moved from one limited by computational throughput of the processor, to one where moving the data is the primary limiting factor. When designing a processor in terms of processor real estate, compute units (or ALUsdalgorithmic logic units) are cheap. They can run at high speed, and consume little power and physical die space. However, ALUs are of little use without operands. Considerable amounts of power and time are consumed in moving the operands to and from these functional units.

In modern computer designs this is addressed by the use of multilevel caches. Caches work on the principle of either spatial (close in the address space) or temporal (close in time) locality. Thus, data that has been accessed before, will likely be accessed again (temporal locality), and data that is close to the last accessed data will likely be accessed in the future (spatial locality).

Caches work well where the task is repeated many times. Consider for the moment a tradesperson, a plumber with a toolbox (a cache) that can hold four tools. A number of the jobs he will attend are similar, so the same four tools are repeatedly used (a cache hit).

However, a significant number of jobs require additional tools. If the tradesperson does not know in advance what the job will entail, he arrives and starts work. Partway through the job he needs an additional tool. As it’s not in his toolbox (L1 cache), he retrieves the item from the van (L2 cache).

Occasionally he needs a special tool or part and must leave the job, drive down to the local hardware store (global memory), fetch the needed item, and return. Neither the tradesperson nor the client knows how long (the latency) this operation will actually take. There may be congestion on the freeway and/or queues at the hardware store (other processes competing for main memory access).

Clearly, this is not a very efficient use of the tradesperson’s time. Each time a different tool or part is needed, it needs to be fetched by the tradesperson from either the van or the hardware store. While fetching new tools the tradesperson is not working on the problem at hand.

While this might seem bad, fetching data from a hard drive or SSD (solid-state drive) is akin to ordering an item at the hardware store. In comparative form, data from a hard drive arrives by regular courier several days later. Data from the SSD may arrive by overnight courier, but it’s still very slow compared to accessing data in global memory.

In some more modern processor designs we have hardware threads. Some Intel processors feature hyperthreading, with two hardware threads per CPU core. To keep with the same analogy, this is equivalent to the tradesperson having an assistant and starting two jobs. Every time a new tool/part is required, the assistant is sent to fetch the new tool/part and the tradesperson switches to the alternate job. Providing the assistant is able to return with the necessary tool/part before the alternate job also needs an additional tool/part, the tradesperson continues to work.

Although an improvement, this has not solved the latency issuedhow long it takes to fetch new tools/parts from the hardware store (global memory). Typical latencies to global memory are in the order of hundreds of clocks. Increasingly, the answer to this problem from traditional processor design has been to increase the size of the cache. In effect, arrive with a bigger van so fewer trips to the hardware store are necessary.

There is, however, an increasing cost to this approach, both in terms of capital outlay for a larger van and the time it takes to search a bigger van for the tool/part. Thus, the approach taken by most designs today is to arrive with a van (L2 cache) and a truck (L3 cache). In the extreme case of the server processors, a huge 18-wheeler is brought in to try to ensure the tradesperson is kept busy for just that little bit longer.

All of this work is necessary because of one fundamental reason. The CPUs are designed to run software where the programmer does not have to care about locality. Locality is an issue, regardless of whether the processor tries to hide it from the programmer or not. The denial that this is an issue is what leads to the huge amount of hardware necessary to deal with memory latency.

The design of GPUs takes a different approach. It places the GPU programmer in charge of dealing with locality and instead of an 18-wheeler truck gives him or her a number of small vans and a very large number of tradespeople.

Thus, in the first instance the programmer must deal with locality. He or she needs to think in advance about what tools/parts (memory locations/data structures) will be needed for a given job. These then need to be collected in a single trip to the hardware store (global memory) and placed in the correct van (on chip memory) for a given job at the outset. Given that this data has been collected, as much work as possible needs to be performed with the data to avoid having to fetch and return it only to fetch it again later for another purpose.

Thus, the continual cycle of work-stall-fetch from global memory, work-stall-fetch from global memory, etc. is broken. We can see the same analogy on a production line. Workers are supplied with baskets of parts to process, rather than each worker individually fetching widgets one at a time from the store manager’s desk. To do otherwise is simply a hugely inefficient use of the available workers’ time.

This simple process of planning ahead allows the programmer to schedule memory loads into the on-chip memory before they are needed. This works well with both an explicit local memory model such as the GPU’s shared memory as well as a CPU-based cache. In the shared memory case you tell the memory management unit to request this data and then go off and perform useful work on another piece of data. In the cache case you can use special cache instructions that allow prefilling of the cache with data you expect the program to use later.

The downside of the cache approach over the shared memory approach is eviction and dirty data. Data in a cache is said to be dirty if it has been written by the program. To free up the space in the cache for new useful data, the dirty data has to be written back to global memory before the cache space can be used again. This means instead of one trip to global memory of an unknown latency, we now have twodone to write the old data and one to get the new data.

The big advantage of the programmer-controlled on-chip memory is that the programmer is in control of when the writes happen. If you are performing some local transformation of the data, there may be no need to write the intermediate transformation back to global memory. With a cache, the cache controller does not know what needs to be written and what can be discarded. Thus, it writes everything, potentially creating lots of useless memory traffic that may in turn cause unnecessary congestion on the memory interface.
Although many do, not every algorithm lends itself to this type of “known in advance” memory pattern that the programmer can optimize for. At the same time, not every programmer wants to deal with locality issues, either initially or sometimes at all. It’s a perfectly valid approach to develop a program, prove the concept, and then deal with locality issues.

To facilitate such an approach and to deal with the issues of algorithms that did not have a well-defined data/execution pattern, later generations of GPUs (compute 2.x onward) have both L1 and L2 caches. These can be configured with a preference toward cache or shared memory, allowing the programmer flexibility to configure the hardware for a given problem.


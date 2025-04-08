---
layout: post
title: Data-based parallelism
date: 2014-08-30 
categories: [computer science]
tags: [parallel computing]

---

Data-based parallelism
---

Computation power has been greatly increasing over the past couple of decades. We now have teraflop- capable GPUs. However, what has not kept pace with this evolution of compute power is the access time for data. The idea of data-based parallelism is that instead of concentrating on what tasks have to be performed, we look first to the data and how it needs to be transformed.

Task-based parallelism tends to fit more with coarse-grained parallelism approaches. Let’s use an example of performing four different transformations on four separate, unrelated, and similarly sized arrays. We have four CPU cores, and a GPU with four SMs. In a task-based decomposition of the problem, we would assign one array to each of the CPU cores or SMs in the GPU. The parallel decomposition of the problem is driven by thinking about the tasks or transformations, not the data.

On the CPU side we could create four threads or processes to achieve this. On the GPU side we would need to use four blocks and pass the address of every array to every block. On the newer Fermi and Kepler devices, we could also create four separate kernels, one to process each array and run it concurrently.

A data-based decomposition would instead split the first array into four blocks and assign one CPU core or one GPU SM to each section of the array. Once completed, the remaining three arrays would be processed in a similar way. In terms of the GPU implementation, this would be four kernels, each of which contained four or more blocks. The parallel decomposition here is driven by thinking about the data first and the transformations second.

As our CPU has only four cores, it makes a lot of sense to decompose the data into four blocks. We could have thread 0 process element 0, thread 1 process element 1, thread 2 process element 2, thread 3 process element 3, and so on. Alternatively, the array could be split into four parts and each thread could start processing its section of the array.

In the first case, thread 0 fetches element 0. As CPUs contain multiple levels of cache, this brings the data into the device. Typically the L3 cache is shared by all cores. Thus, the memory access from the first fetch is distributed to all cores in the CPU. By contrast in the second case, four separate memory fetches are needed and four separate L3 cache lines are utilized. The latter approach is often better where the CPU cores need to write data back to memory. Interleaving the data elements by core means the cache has to coordinate and combine the writes from different cores, which is usually a bad idea.

If the algorithm permits, we can exploit a certain type of data parallelism, the SIMD (single instruction, multiple data) model. This would make use of special SIMD instructions such as MMX, SSE, AVX, etc. present in many x86-based CPUs. Thus, thread 0 could actually fetch multiple adjacent elements and process them with a single SIMD instruction.

If we consider the same problem on the GPU, each array needs to have a separate transformation performed on it. This naturally maps such that one transformation equates to a single GPU kernel (or program). Each SM, unlike a CPU core, is designed to run multiple blocks of data with each block split into multiple threads. Thus, we need a further level of decomposition to use the GPU efficiently. We’d typically allocate, at least initially, a combination of blocks and threads such that a single thread processed a single element of data. As with the CPU, there are benefits from processing multiple elements per thread. This is somewhat limited on GPUs as only load/store/move explicit SIMD primitives are supported, but this in turn allows for enhanced levels of instruction-level parallelism (ILP), which we’ll see later is actually quite beneficial.

With a Fermi and Kepler GPUs, we have a shared L2 cache that replicates the L3 cache function on the CPU. Thus, as with the CPU, a memory fetch from one thread can be distributed to other threads directly from the cache. On older hardware, there is no cache. However, on GPUs adjacent memory locations are coalesced (combined) together by the hardware, resulting in a single and more efficient memory fetch. We look at this in detail in Chapter 6 on memory.

One important distinction between the caches found in GPUs and CPUs is cache coherency. In a cache-coherent system a write to a memory location needs to be communicated to all levels of cache in all cores. Thus, all processor cores see the same view of memory at any point in time. This is one of the key factors that limits the number of cores in a processor. Communication becomes increasingly more expensive in terms of time as the processor core count increases. The worst case in a cache- coherent system is where each core writes adjacent memory locations as each write forces a global update to every core’s cache.

A non cache-coherent system by comparison does not automatically update the other core’s caches. It relies on the programmer to write the output of each processor core to separate areas/addresses. This supports the view of a program where a single core is responsible for a single or small set of outputs. CPUs follow the cache-coherent approach whereas the GPU does not and thus is able to scale to a far larger number of cores (SMs) per device.

Let’s assume for simplicity that we implement a kernel as four blocks. Thus, we have four kernels on the GPU and four processes or threads on the CPU. The CPU may support mechanisms such as hyperthreading to enable processing of additional threads/processes due to a stall event, a cache miss, for example. Thus, we could increase this number to eight and we might see an increase in perfor- mance. However, at some point, sometimes even at less than the number of cores, the CPU hits a point where there are just too many threads.

At this point the memory bandwidth becomes flooded and cache utilization drops off, resulting in less performance, not more.

On the GPU side, four blocks is nowhere near enough to satisfy four SMs. Each SM can actually schedule up to eight blocks (16 on Kepler). Thus, we’d need 8 4 1⁄4 32 blocks to load the four SMs correctly. As we have four independent operations, we can launch four simultaneous kernels on Fermi hardware via the streams feature (see Chapter 8 on using multiple GPUs). Consequently, we can launch 16 blocks in total and work on the four arrays in parallel. As with the CPU, however, it would be more efficient to work on one array at a time as this would likely result in better cache utilization. Thus, on the GPU we need to ensure we always have enough blocks (typically a minimum of 8 to 16 times the number of SMs on the GPU device).
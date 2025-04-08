---
layout: post
title: Serial/Parallel Problems
date: 2014-08-27
categories: [computer science]
tags: [parallel computing]

---

SERIAL/PARALLEL PROBLEMS
===

Threads brought with them many of the issues of parallel programming, such as sharing resources. Typically, this is done with a semaphore, which is simply a lock or token. Whoever has the token can use the resource and everyone else has to wait for the user of the token to release it. As long as there is only a single token, everything works fine.

Problems occur when there are two or more tokens that must be shared by the same threads. In such situations, thread 0 grabs token 0, while thread 1 grabs token 1. Thread 0 now tries to grab token 1, while thread 1 tries to grab token 0. As the tokens are unavailable, both thread 0 and thread 1 sleep until the token becomes available. As neither thread ever releases the one token they already own, all threads wait forever. This is known as a deadlock, and it is something that can and will happen without proper design.

The opposite also happensdsharing of resources by chance. With any sort of locking system, all parties to a resource must behave correctly. That is, they must request the token, wait if necessary, and, only when they have the token, perform the operation. This relies on the programmer to identify shared resources and specifically put in place mechanisms to coordinate updates by multiple threads. However, there are usually several programmers in any given team. If just one of them doesn’t follow this convention, or simply does not know this is a shared resource, you may appear to have a working program, but only by chance.

One of the projects I worked on for a large company had exactly this problem. All threads requested a lock, waited, and updated the shared resource. Everything worked fine and the particular code passed quality assurance and all tests. However, in the field occasionally users would report the value of a certain field being reset to 0, seemingly randomly. Random bugs are always terrible to track down, because being able to consistently reproduce a problem is often the starting point of tracking down the error.

An intern who happened to be working for the company actually found the issue. In a completely unrelated section of the code a pointer was not initialized under certain conditions. Due to the way the program ran, some of the time, depending on the thread execution order, the pointer would point to our protected data. The other code would then initialize “its variable” by writing 0 to the pointer, thus eliminating the contents of our “protected” and thread-shared parameter.

This is one of the unfortunate areas of thread-based operations; they operate with a shared memory space. This can be both an advantage in terms of not having to formally exchange data via messages, and a disadvantage in the lack of protection of shared data.

The alternative to threads is processes. These are somewhat heavier in terms of OS load in that both code and data contexts must be maintained by the OS. A thread by contrast needs to only maintain a code context (the program/instruction counter plus a set of registers) and shares the same data space. Both threads and processes may be executing entirely different sections of a program at any point in time.

Processes by default operate in an independent memory area. This usually is enough to ensure one process is unable to affect the data of other processes. Thus, the stray pointer issue should result in an exception for out-of-bounds memory access, or at the very least localize the bug to the particular process. Data consequently has to be transferred by formally passing messages to or from processes. 

In many respects the threading model sits well with OpenMP, while the process model sits well with MPI. In terms of GPUs, they map to a hybrid of both approaches. CUDA uses a grid of blocks. This can be thought of as a queue (or a grid) of processes (blocks) with no interprocess communi- cation. Within each block there are many threads which operate cooperatively in batches called warps.

---
layout: post
title: Off-heap Memory in Apache Flink and the curious JIT compiler
date: 2015-09-24
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Off-heap Memory in Apache Flink and the curious JIT compiler](http://flink.apache.org/news/2015/09/16/off-heap-memory.html)
* Authors: [Stephan Ewen](https://twitter.com/stephanewen)

---


Off-heap Memory in Apache Flink and the curious JIT compiler
============================================================

Running data-intensive code in the JVM and making it well-behaved is
tricky. Systems that put billions of data objects naively onto the JVM
heap face unpredictable OutOfMemoryErrors and Garbage Collection stalls.
Of course, you still want to to keep your data in memory as much as
possible, for speed and responsiveness of the processing applications.
In that context, “off-heap” has become almost something like a magic
word to solve these problems.

In this blog post, we will look at how Flink exploits off-heap memory.
The feature is part of the upcoming release, but you can try it out with
the latest nightly builds. We will also give a few interesting insights
into the behavior for Java’s JIT compiler for highly optimized methods
and loops.

Recap: Memory Management in Flink
---------------------------------

To understand Flink’s approach to off-heap memory, we need to recap
Flink’s approach to custom managed memory. We have written an [earlier
blog post about how Flink manages JVM memory
itself](/news/2015/05/11/Juggling-with-Bits-and-Bytes.html)

As a summary, the core part is that Flink implements its algorithms not
against Java objects, arrays, or lists, but actually against a data
structure similar to `java.nio.ByteBuffer`. Flink uses its own
specialized version, called
[`MemorySegment`](https://github.com/apache/flink/blob/release-0.9.1-rc1/flink-core/src/main/java/org/apache/flink/core/memory/MemorySegment.java)
on which algorithms put and get at specific positions ints, longs, byte
arrays, etc, and compare and copy memory. The memory segments are held
and distributed by a central component (called `MemoryManager`) from
which algorithms request segments according to their calculated memory
budgets.

Don’t believe that this can be fast? Have a look at the [benchmarks in
the earlier
blogpost](/news/2015/05/11/Juggling-with-Bits-and-Bytes.html), which
show that it is actually often much faster than working on objects, due
to better control over data layout (cache efficiency, data size), and
reducing the pressure on Java’s Garbage Collector.

This form of memory management has been in Flink for a long time.
Anecdotally, the first public demo of Flink’s predecessor project
*Stratosphere*, at the VLDB conference in 2010, was running its programs
with custom managed memory (although I believe few attendees were aware
of that).

Why actually bother with off-heap memory?
-----------------------------------------

Given that Flink has a sophisticated level of managing on-heap memory,
why do we even bother with off-heap memory? It is true that *“out of
memory”* has been much less of a problem for Flink because of its heap
memory management techniques. Nonetheless, there are a few good reasons
to offer the possibility to move Flink’s managed memory out of the JVM
heap:

-   Very large JVMs (100s of GBytes heap memory) tend to be tricky. It
    takes long to start them (allocate and initialize heap) and garbage
    collection stalls can be huge (minutes). While newer incremental
    garbage collectors (like G1) mitigate this problem to some extend,
    an even better solution is to just make the heap much smaller and
    allocate Flink’s managed memory chunks outside the heap.

-   I/O and network efficiency: In many cases, we write MemorySegments
    to disk (spilling) or to the network (data transfer). Off-heap
    memory can be written/transferred with zero copies, while heap
    memory always incurs an additional memory copy.

-   Off-heap memory can actually be owned by other processes. That way,
    cached data survives process crashes (due to user code exceptions)
    and can be used for recovery. Flink does not exploit that, yet, but
    it is interesting future work.

The opposite question is also valid. Why should Flink ever not use
off-heap memory?

-   On-heap is easier and interplays better with tools. Some container
    environments and monitoring tools get confused when the monitored
    heap size does not remotely reflect the amount of memory used by the
    process.

-   Short lived memory segments are cheaper on the heap. Flink sometimes
    needs to allocate some short lived buffers, which works cheaper on
    the heap than off-heap.

-   Some operations are actually a bit faster on heap memory (or the JIT
    compiler understands them better).

The off-heap Memory Implementation
----------------------------------

Given that all memory intensive internal algorithms are already
implemented against the `MemorySegment`, our implementation to switch to
off-heap memory is actually trivial. You can compare it to replacing all
`ByteBuffer.allocate(numBytes)` calls with
`ByteBuffer.allocateDirect(numBytes)`. In Flink’s case it meant that we
made the `MemorySegment` abstract and added the `HeapMemorySegment` and
`OffHeapMemorySegment` subclasses. The `OffHeapMemorySegment` takes the
off-heap memory pointer from a `java.nio.DirectByteBuffer` and
implements its specialized access methods using `sun.misc.Unsafe`. We
also made a few adjustments to the startup scripts and the deployment
code to make sure that the JVM is permitted enough off-heap memory
(direct memory, *-XX:MaxDirectMemorySize*).

In practice we had to go one step further, to make the implementation
perform well. While the `ByteBuffer` is used in I/O code paths to
compose headers and move bulk memory into place, the MemorySegment is
part of the innermost loops of many algorithms (sorting, hash tables,
…). That means that the access methods have to be as fast as possible.

Understanding the JIT and tuning the implementation
---------------------------------------------------

The `MemorySegment` was (before our change) a standalone class, it was
*final* (had no subclasses). Via *Class Hierarchy Analysis (CHA)*, the
JIT compiler was able to determine that all of the accessor method calls
go to one specific implementation. That way, all method calls can be
perfectly de-virtualized and inlined, which is essential to performance,
and the basis for all further optimizations (like vectorization of the
calling loop).

With two different memory segments loaded at the same time, the JIT
compiler cannot perform the same level of optimization any more, which
results in a noticeable difference in performance: A slowdown of about
2.7 x in the following example:

    Writing 100000 x 32768 bytes to 32768 bytes segment:

    HeapMemorySegment    (standalone) : 1,441 msecs
    OffHeapMemorySegment (standalone) : 1,628 msecs
    HeapMemorySegment    (subclass)   : 3,841 msecs
    OffHeapMemorySegment (subclass)   : 3,847 msecs

To get back to the original performance, we explored two approaches:

### Approach 1: Make sure that only one memory segment implementation is ever loaded. {#approach-1-make-sure-that-only-one-memory-segment-implementation-is-ever-loaded}

We re-structured the code a bit to make sure that all places that
produce long-lived and short-lived memory segments instantiate the same
MemorySegment subclass (Heap- or Off-Heap segment). Using factories
rather than directly instantiating the memory segment classes, this was
straightforward.

Experiments (see appendix) showed that the JIT compiler properly detects
this (via hierarchy analysis) and that it can perform the same level of
aggressive optimization as before, when there was only one
`MemorySegment` class.

### Approach 2: Write one segment that handles both heap and off-heap memory

We created a class `HybridMemorySegment` which handles transparently
both heap- and off-heap memory. It can be initialized either with a byte
array (heap memory), or with a pointer to a memory region outside the
heap (off-heap memory).

Fortunately, there is a nice trick to do this without introducing code
branches and specialized handling of the two different memory types. The
trick is based on the way that the `sun.misc.Unsafe` methods interpret
object references. To illustrate this, we take the method that gets a
long integer from a memory position:

    sun.misc.Unsafe.getLong(Object reference, long offset)

The method accepts an object reference, takes its memory address, and
add the offset to obtain a pointer. It then fetches the eight bytes at
the address pointed to and interprets them as a long integer. Since the
method accepts *null* as the reference (and interprets it a *zero*) one
can write a method that fetches a long integer seamlessly from heap and
off-heap memory as follows:

    public class HybridMemorySegment {

      private final byte[] heapMemory;  // non-null in heap case, null in off-heap case
      private final long address;       // may be absolute, or relative to byte[]


      // method of interest
      public long getLong(int pos) {
        return UNSAFE.getLong(heapMemory, address + pos);
      }


      // initialize for heap memory
      public HybridMemorySegment(byte[] heapMemory) {
        this.heapMemory = heapMemory;
        this.address = UNSAFE.arrayBaseOffset(byte[].class)
      }
      
      // initialize for off-heap memory
      public HybridMemorySegment(long offheapPointer) {
        this.heapMemory = null;
        this.address = offheapPointer
      }
    }

To check whether both cases (heap and off-heap) really result in the
same code paths (no hidden branches inside the
`Unsafe.getLong(Object, long)` method) one can check out the C++ source
code of `sun.misc.Unsafe`, available here:
[http://hg.openjdk.java.net/jdk8/jdk8/hotspot/file/tip/src/share/vm/prims/unsafe.cpp](http://hg.openjdk.java.net/jdk8/jdk8/hotspot/file/tip/src/share/vm/prims/unsafe.cpp)

Of particular interest is the macro in line 155, which is the base of
all GET methods. Tracing the function calls (many are no-ops), one can
see that both variants of Unsafe’s `getLong()` result in the same code:
Either `0 + absolutePointer` or `objectRefAddress + offset`.

Summary
-------

We ended up choosing a combination of both techniques:

-   For off-heap memory, we use the `HybridMemorySegment` from approach
    (2) which can represent both heap and off-heap memory. That way, the
    same class represents the long-lived off-heap memory as the
    short-lived temporary buffers allocated (or wrapped) on the heap.

-   We follow approach (1) to use factories to make sure that one
    segment is ever only loaded, which gives peak performance. We can
    exploit the performance benefits of the `HeapMemorySegment` on
    individual byte operations, and we have a mechanism in place to add
    further implementations of `MemorySegments` for the case that Oracle
    really removes `sun.misc.Unsafe` in future Java versions.

The final code can be found in the Flink repository, under
[https://github.com/apache/flink/tree/master/flink-core/src/main/java/org/apache/flink/core/memory](https://github.com/apache/flink/tree/master/flink-core/src/main/java/org/apache/flink/core/memory)

Detailed micro benchmarks are in the appendix. A summary of the findings
is as follows:

-   The `HybridMemorySegment` performs equally well in heap and off-heap
    memory, as is to be expected (the code paths are the same)

-   The `HeapMemorySegment` is quite a bit faster in reading individual
    bytes, not so much at writing them. Access to a *byte[]* is after
    all a bit cheaper than an invocation of a `sun.misc.Unsafe` method,
    even when JIT-ed.

-   The abstract class `MemorySegment` (with its subclasses
    `HeapMemorySegment` and `HybridMemorySegment`) performs as well as
    any specialized non-abstract class, as long as only one subclass is
    loaded. When both are loaded, performance may suffer by a factor of
    2.7 x on certain operations.

-   How badly the performance degrades in cases where both MemorySegment
    subclasses are loaded seems to depend a lot on which subclass is
    loaded and operated on before and after which. Sometimes,
    performance is affected more than other times. It seems to be an
    artifact of the JIT’s code profiling and how heavily it performs
    optimistic specialization towards certain subclasses.

There is still a bit of mystery left, specifically why sometimes code is
faster when it performs more checks (has more instructions and an
additional branch). Even though the branch is perfectly predictable,
this seems counter-intuitive. The only explanation that we could come up
with is that the branch optimizations (such as optimistic elimination
etc) result in code that does better register allocation (for whatever
reason, maybe the intermediate instructions just fit the allocation
algorithm better).


-   Off-heap memory in Flink complements the already very fast on-heap
    memory management. It improves the scalability to very large heap
    sizes and reduces memory copies for network and disk I/O.

-   Flink’s already present memory management infrastructure made the
    addition of off-heap memory simple. Off-heap memory is not only used
    for caching data, Flink can actually sort data off-heap and build
    hash tables off-heap.

-   We play a few nice tricks in the implementation to make sure the
    code is as friendly as possible to the JIT compiler and processor,
    to make the managed memory accesses are as fast as possible.

-   Understanding the JVM’s JIT compiler is tough - one needs a lot of
    (randomized) micro benchmarking to examine its behavior.


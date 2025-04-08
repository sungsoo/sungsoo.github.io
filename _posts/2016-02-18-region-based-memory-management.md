---
layout: post
title: Region-based Memory Management
date: 2016-02-18
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Region-based Memory Management](https://en.wikipedia.org/wiki/Region-based_memory_management)
* From Wikipedia, the free encyclopedia

---

Region-based Memory Management
======================================

In computer science, *region-based memory management* is a type of memory management in which each allocated object is assigned to a *region*. A region, also called a *zone*, *arena*, *area*, or *memory context*, is a collection of allocated objects that can be efficiently deallocated all at once. Like stack allocation, regions facilitate allocation and deallocation of memory with *low overhead*; but they are more *flexible*, allowing objects to live longer than the stack frame in which they were allocated. In typical implementations, all objects in a region are allocated in *a single contiguous range* of memory addresses, similarly to how stack frames are typically allocated.

## Example

As a simple example, consider the following C code which allocates and then deallocates a linked list data structure:

```c
Region *r = createRegion();
ListNode *head = NULL;
for (int i = 1; i <= 1000; i++) {
    ListNode* newNode = allocateFromRegion(r, sizeof(ListNode));
    newNode->next = head;
    head = newNode;
}
// ...
// (use list here)
// ...
destroyRegion(r);
```

Although it required many operations to construct the linked list, it can be destroyed quickly in a single operation by destroying the region in which the nodes were allocated. There is no need to traverse the list.

## Implementation

Simple explicit regions are straightforward to implement; the following description is based on Hanson. Each region is implemented as a *linked list* of large blocks of memory; each block should be large enough to serve many allocations. The current block maintains a pointer to the next free position in the block, and if the block is filled, a new one is allocated and added to the list. When the region is deallocated, the next-free-position pointer is reset to the beginning of the first block, and the list of blocks can be reused for the next region to be created. Alternatively, when a region is deallocated, its list of blocks can be appended to a global freelist from which other regions may later allocate new blocks. With this simple scheme, it is not possible to deallocate individual objects in regions.

The overall cost per allocated byte of this scheme is *very low*; almost all allocations involve only a comparison and an update to the next-free-position pointer. *Deallocating* a region is a *constant-time operation*, and is done rarely. Unlike in typical garbage collection systems, there is no need to tag data with its type.

## History and concepts

The basic concept of regions is very old, first appearing as early as 1967 in Douglas T. Ross's AED Free Storage Package, in which memory was partitioned into a hierarchy of zones; each zone had its own allocator, and a zone could be freed all-at-once, making zones usable as regions. In 1976 the PL/I standard included the AREA data type. In 1990, Hanson demonstrated that *explicit regions* in C (which he called *arenas*) could achieve time performance per allocated byte superior to even the fastest-known heap allocation mechanism. *Explicit regions* were instrumental in the design of a number of early C-based software projects, including the Apache HTTP Server, which calls them pools, and the PostgreSQL database management system, which calls them *memory contexts*. Like traditional heap allocation, these schemes do not provide memory safety; it is possible for a programmer to access a region after it is deallocated through a dangling pointer, or to forget to deallocate a region, causing a memory leak.

### Region inference

In 1988, researchers began investigating how to use regions for safe memory allocation by introducing the concept of *region inference*, where the creation and deallocation of regions, as well as the assignment of individual static allocation expressions to particular regions, is inserted by the compiler at compile-time. The compiler is able to do this in such a way that it can guarantee dangling pointers and leaks do not occur.

In an early work by Ruggieri and Murtagh, a region is created at the beginning of each function and deallocated at the end. They then use *data flow analysis* to determine a lifetime for each static allocation expression, and assign it to the youngest region that contains its entire lifetime.

In 1994 this work was generalized in a seminal work by Tofte and Talpin to support *type polymorphism* and *higher-order functions* in Standard ML, a *functional programming* language, using a different algorithm based on *type inference* and the theoretical concepts of *polymorphic region types* and the *region calculus*. Their work introduced an extension of the *lambda calculus* including regions, adding two constructs:

* *e1* at ρ: Compute the result of the expression e1 and store it in region ρ;
* let region ρ in e2 end: Create a region and bind it to ρ; evaluate e2; then deallocate the region.

Due to this syntactic structure, regions are nested, meaning that if r2 is created after r1, it must also be deallocated before r1; the result is a stack of regions. Moreover, regions must be deallocated in the same function in which they are created. These restrictions were relaxed by Aiken et al.

This extended lambda calculus was intended to serve as a provably memory-safe *intermediate representation* for compiling Standard ML programs into machine code, but building a translator that would produce good results on large programs faced a number of practical limitations which had to be resolved with new analyses, including dealing with recursive calls, tail recursive calls, and eliminating regions which contained only a single value. This work was completed in 1995 and integrated into the ML Kit, a version of ML based on region allocation in place of garbage collection. This permitted a direct comparison between the two on medium-sized test programs, yielding widely varying results ("between 10 times faster and four times slower") depending on how "*region-friendly*" the program was; compile times, however, were on the order of minutes. The ML Kit was eventually scaled to large applications with two additions: a scheme for separate compilation of modules, and a hybrid technique combining region inference with tracing garbage collection.



### Generalization to new language environments

Following the development of ML Kit, regions began to be generalized to other language environments:

* Various extensions to the C programming language:
	* The safe C dialect *Cyclone*, which among many other features adds support for explicit regions, and evaluates the impact of migrating existing C applications to use them.
	* An extension to C called *RC* was implemented that uses explicitly-managed regions, but also uses *reference counting* on regions to guarantee memory safety by ensuring that no region is freed prematurely. Regions decrease the overhead of reference counting, since references internal to regions don't require counts to be updated when they're modified. RC includes an explicit static type system for regions that allows some reference count updates to be eliminated.
	* A restriction of C called *Control-C* limits programs to use regions (and *only a single region at a time*), as part of its design to statically ensure memory safety.
* Regions were implemented for a subset of Java, and became a critical component of memory management in *Real time Java*, which combines them with ownership types to demonstrate object encapsulation and eliminate runtime checks on region deallocation. More recently, a semi-automatic system was proposed for inferring regions in embedded real-time Java applications, combining a compile-time static analysis, a runtime region allocation policy, and programmer hints. Regions are a good fit for real-time computing because their time overhead is statically predictable, without the complexity of incremental garbage collection.
* They were implemented for the *logic programming* languages Prolog and Mercury by extending Tofte and Talpin's region inference model to support backtracking and cuts.
* *Region-based storage management* is used throughout the parallel programming language *ParaSail*. Due to the lack of explicit pointers in ParaSail, there is no need for *reference counting*.

## Disadvantages

Systems using regions may experience issues where regions become very large before they are deallocated and contain a large proportion of dead data; these are commonly called "*leaks*" (even though they are eventually freed). Eliminating leaks may involve restructuring the program, typically by introducing new, shorter-lifetime regions. Debugging this type of problem is especially difficult in systems using region inference, where the programmer must understand the underlying inference algorithm, or examine the verbose intermediate representation, to diagnose the issue. Tracing garbage collectors are more effective at deallocating this type of data in a timely manner without program changes; this was one justification for hybrid region/GC systems. On the other hand, tracing garbage collectors can also exhibit subtle leaks, if references are retained to data which will never be used again.

Region-based memory management works best when the number of regions is relatively small and each contains many objects; programs that contain many sparse regions will exhibit *internal fragmentation*, leading to wasted memory and a time overhead for region management. Again, in the presence of region inference this problem can be more difficult to diagnose.

## Hybrid methods

As mentioned above, RC uses a hybrid of regions and *reference counting*, limiting the overhead of reference counting since references internal to regions don't require counts to be updated when they're modified. Similarly, some *mark-region* hybrid methods combine *Tracing garbage collection* with regions; these function by dividing the heap into regions, performing a mark-sweep pass in which any regions containing live objects are marked, and then freeing any unmarked regions. These require continual defragmentation to remain effective.


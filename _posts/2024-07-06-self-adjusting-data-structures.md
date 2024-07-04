---
layout: post
title: Make self-adjusting data structures concurrent
date: 2024-07-06
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Is it possible to make self-adjusting data structures concurrent?](https://www.youtube.com/watch?v=A7DaSVMm0To)

---


# Is it possible to make self-adjusting data structures concurrent?


* A Google TechTalk, presented by Vitaly Aksenov, 2024-06-25
* Google Algorithms Seminar.  


## ABSTRACT
In this talk, we cover several aspects of self-adjusting data structures. These data structures answer more frequent queries faster. The most famous example is the SplayTree, which rotates the accessed node to the root, leading to a lower depth for frequently accessed nodes. Obviously, such an approach is averse to concurrency, as there is a very high contention on the root. The first concurrent self-adjusting data structure is a binary tree CBTree, which was presented in 2012, but like the concurrent AVL tree it is based on, it does not have much scalability due to the hand-over-hand validation traversals.

We decided to look at the problem from a different direction. As was clear a long time ago, a SkipList is much easier to make concurrent than any balanced binary tree. Thus, we designed a self-adjusting concurrent SkipList named Splay-List and proved its complexity. Then, we found work on a concurrent Interpolation Search Tree (IST) that is built on efficient lazy rebuilding. Thus, we discuss how to make self-adjusting multi-way data structures quite easily using lazy rebuilding, with examples of B-tree and IST, providing a possibility for efficient concurrent implementations.

This talk almost does not require any prior knowledge and relies on the interest in data structures by the listeners.

## ABOUT THE SPEAKER 
Vitaly Aksenov is currently an Assistant Professor at City, University of London. His research focuses on self-adjusting systems and practice and theory of parallel and concurrent data structures.
Before joining City, University of London, Vitaly was an Assistant Professor at ITMO University for a while and prior to that, he was a post-doc in IST Austria under the guidance of professor Dan Alistarh. He received his PhD from Paris 7 Diderot and ITMO University under the guidance of professor Petr Kuznetsov.


<iframe width="600" height="400" src="https://www.youtube.com/embed/A7DaSVMm0To?si=c0JGefvtwOD00sUN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


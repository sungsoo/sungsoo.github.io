---
layout: post
title: Confluent and Functional Persistence
date: 2014-01-20
categories: [computer science]
tags: [design patterns]

---

Version Diagrams 
---
Gray means version is *read only* and blue means version is *read-write*.

![](http://sungsoo.github.com/images/confluent.png)

Confluent Persistence
---

Confluent persistence presents new challenges. Firstly, we again need to
find a new representation of versions. Our tree traversal technique is
does not extend to DAGs. Also, it is possible to have ![](http://sungsoo.github.com/images/eqn-cp01.png) paths in
version history after after *u* confluent updates. For example by
concatenating a string with itself repeatedly we get a version diagram
like that in figure [exponential-paths].

Deques (double ended queues allowing stack and queue operations) with
concatenation can be done in constant time per operation (Kaplan,
Okasaki, and Tarjan @kot). Like with a string, we can create implicitly
exponential deques in polynomial time by recursively concatenating a
deque with itself.

The general transformation due to Fiat and Kaplan @fiat is as follows:

-   ![](http://sungsoo.github.com/images/eqn-cp02.png). This measure
    is called the ‘effective depth’ of the version DAG: if we unravel
    the tree via a DFS (by making a copy of each path as if they didn’t
    overlap) and rebalanced that tree this is the best we could hope to
    achieve.

-   *d(v)* = depth of node *v* in version DAG

-   overhead: ![](http://sungsoo.github.com/images/eqn-cp03.png)

This results reflects poor performance when ![](http://sungsoo.github.com/images/eqn-cp04.png) where *u* is
the number of updates. This is still exponentially better than the
complete copy.

#### An example of *e(v)* being linear on the number of updates.

![](http://sungsoo.github.com/images/exponential-paths.png)

A lower bound also by Fiat and Kaplan is ![](http://sungsoo.github.com/images/eqn-cp05.png) for update if
queries are free. Their construction makes *e(v)* queries per update.

**OPEN:** *O(1)* or even *O(*log* n)* space overhead
per operation.

Collette, Iacono and Langerman consider the special case of ‘disjoint
operations’: confluent operations performed only between versions with
no shared data nodes. From there they show *O(*log* n)* overhead is
possible for that case.

If we only allow disjoint operations, then each data node’s version
history is a tree. When evaluating read(node, field,
version) there are tree cases: when node modified at
version, we simply read the new version. Where node along
path between modifications, we first need to find the last modification.
This problem can be solved with use of ‘link-cut trees’ (see [lecture
19](http://courses.csail.mit.edu/6.851/spring12/lectures/L19.html)).
Finally, when version is below a leaf the problem is more
complicated. The proof makes use of techniques such as fractional
cascading which will be covered in [lecture
3](http://courses.csail.mit.edu/6.851/spring12/lectures/L03.html). The
full construction is explained in @collette.

Functional Persistence
---

Functional persistence and data structures are explored in @okasaki.
Simple examples of existing techniques include the following.

-   *Functional balanced BSTs* – to persist BST’s
    functionally, the main idea (a.k.a. ‘Path copying’) is to duplicate
    the modified node and propagate pointer changes by duplicating all
    ancestors. If there are no parent pointers, work top down. This
    technique has an overhead of *O(*log* n)* per operation, assuming
    the tree is balanced. Demaine, Langerman, Price show this for
    link-cut trees as well @dlp.

-   *Deques* – (double ended queues allowing stack and
    queue operations) with concatenation can be done in constant time
    per operation (Kaplan, Okasaki, and Tarjan @kot). Furthermore,
    Brodal, Makris and Tsichlas show in @bmt it can be done with
    concatenation in constant time and update and search in
    *O(*log* n)*

-   *Tries* – with local navigation and subtree copy and
    delete. Demaine, Langerman, Price show how to persist this structure
    optimally in @dlp.

Pippenger shows at most *log()* cost separation of the functional
version from the regular data structure in @pippenger.

**OPEN:** (for both functional and confluent) bigger
separation? more general structure transformations?

**OPEN:** Lists with split and concatenate? General pointer
machine?

**OPEN:** Array with cut and paste? Special DAGs?


References
---

[1] Gerth Stolting Brodal: *Partially Persistent Data Structures of Bounded
Degree with Constant Update Time*. Nord. J. Comput. 3(3): 238-255 (1996)  
[2] Erik D. Demaine, John Iacono, Stefan Langerman: *Retroactive data
structures*. SODA 2004: 281-290  
[3] Erik D. Demaine, Stefan Langerman, and Eric Price: *Confluently
Persistent Tries for Efficient Version Control*. Algorithmica (2008).  
[4] Paul F. Dietz, Daniel Dominic Sleator: *Two Algorithms for Maintaining
Order in a List* STOC 1987: 365-372  
[5] Paul F. Dietz: *Fully Persistent Arrays (Extended Array)*. WADS 1989:
67-74  
[6] James R. Driscoll, Neil Sarnak, Daniel Dominic Sleator, Robert Endre
Tarjan: *Making Data Structures Persistent*. J. Comput. Syst. Sci.
38(1): 86-124 (1989)  
[7] Yoav Giora, Haim Kaplan: *Optimal dynamic vertical ray shooting in
rectilinear planar subdivisions* ACM Transactions on Algorithms 5(3)
(2009)  
[8] Haim Kaplan, Chris Okasaki, Robert Endre Tarjan: *Simple Confluently
Persistent Catenable Lists*. SIAM J. Comput. 30(3): 965-977 (2000)  
[9] Amos Fiat, Haim Kaplan: *Making data structures confluently persistent*.
J. Algorithms 48(1): 16-58 (2003)  
[10] Chris Okasaki: *Purely Functional Data Structures*. New York: Cambridge
University Press, 2003.  
[11] Sebastien Collette, John Iacono, and Stefan Langerman. *Confluent
Persistence Revisited.* In Symposium on Discrete Algorithms (SODA),
pages 593-601, 2012.  
[12] T. H. Cormen and C. E. Leiserson and R. L. Rivest and C. Stein,
*Introduction to Algorithms*. 3rd. Edition. The MIT Press, 2009.  
[13] Nicholas Pippenger. *Pure Versus Impure Lisp*. ACM Transactions on
Programming Languages and Systems, Vol. 19, No. 2. (March 1997), pp.
223-238.  
[14] Gerth Stolting Brodal, Christos Makris, Kostas Tsichlas: *Purely
Functional Worst Case Constant Time Catenable Sorted Lists.* ESA 2006:
172-183

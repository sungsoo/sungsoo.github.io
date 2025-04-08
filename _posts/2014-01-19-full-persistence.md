---
layout: post
title: Full Persistence
date: 2014-01-19
categories: [computer science]
tags: [algorithms]

---

Version Diagrams 
---
Gray means version is *read only* and blue means version is *read-write*.

#### Figure 1. Full Persistence 
![](http://sungsoo.github.com/images/fullpersistence.png)

Full persistence
---
In fully persistent model, both *updates and queries are allowed on any version* of the data structure.The construction for partial persistence can be expanded to implement full persistence. This result is also due to [5]. We again assume a pointer machine with ***p <  O(1)*** incoming pointers per node.

We need to take care of a two new problems:  
  
1. Now we need to represent versions in a way that lets us efficiently
check which precedes which. Versions form a tree, but traversing it is
***O(# of versions)***.    
2. Now we have to support writes to any version. This affects how we
handle writes: we no longer have the concept of ‘current’ vs. ‘old’
nodes: *every node needs to support writes*.

Version representation
----------------------

The version representation problem is solved by keeping a tree
representing the version structure, as well as an efficient
representation of this tree in a *linearized* way.  
The *linearized representation* of the tree in the following figure
is *ba, bb, bc, ec, eb, bd, ed, ea*. You can read *ba* as ‘begin node
*a*’ and *ea* as ‘end node *a*’. This representation losslessly encodes
the tree, and we can directly answer queries about the tree using that
encoded representation. For example we know *c* is nested within *b*,
since *bb < bc* and *ec < eb*.

#### Figure 2. in-order tree traversal 
![version-split](http://sungsoo.github.com/images/TreeTraversal.png)

This linearized representation can be implemented using an ‘*order
maintenance*’ data structure. For now, it suffices to say an order
maintenance data structure supports the following two operations, both
in ***O(1)*** time.

-   *insert* an item before or after a specified element.

-   *check* if item *s* precedes item *t*.

For example, a linked list supports insertions in ***O(1)***, but tests for
precedence take ***O(n)***. Similarly, a balanced BST supports both
operations but in *O(log* n*)* time. Deitz and Sleator show an *O(1)*
implementation for both operations in @dietz, which will be covered in
[lecture 8](http://courses.csail.mit.edu/6.851/spring12/lectures/L08.html).  
To implement version tree queries such as ‘is version *v* an ancestor of
version *w*’ we can use two comparison queries *bv < bw* and *ew < ev*
in *O(1)*. To implement updates like ‘add version *v* as a child of
version *w*’ we can insert the two elements *bv* and *ev* after *bw* and
before *ew* respectively, also in *O(1)*.

Construction and algorithm:
---------------------------

The nodes in our data structure will keep the same kinds of additional
data per node as they did in the partially persistent case.  
For each node we store *d* data entries and *p* back pointers, but now
allow up to *2(d+p+1)* modifications. The amount of data *d* is also a
bound on *out-pointers* per node. Additionally we now also
version back-pointers.

1.  **read(n.field, version)**: By using the
    order-maintenance data structure we can pick the most recent
    ancestor of **version** from among the entries in the mod log and
    return that value.

2.  **write(n.field, value, version)**: If there
    is space in node, just add mod entry. else:
	- **m = new Node()**. Split the contents of node *n*’s mod
        log into *two* parts following the diagram
        figure 3. Partitioning into subtrees rather than
        arbitrarily is required.
	- Now node *m* has some of the mods of the internal tree in
        Figure 3, and node *n* retains the ‘older’ half of
        the updates.
	- from the ‘old’ mod entries in node *n*, compute the latest
        values of each field and write them into the data and back
        pointer section of node *m*.
	- recursively update all (up to) *d + p + (d + p + 1)* forward and
        backward pointers of neighbors.
	- insert new version to our version tree representation.

#### Figure 3. Splitting a tree-shaped version genealogy into two subtrees
 
![](http://sungsoo.github.com/images/VersionSplitting.png)


Analysis:
---------

-   **Space** – 1 if we do not split or
    *d + p + 2(d  + p + 1) = 3d + 3p + 2* when we split a node, both *O(1)*

-   **Time** – **read(var, version)** is implemented in a similar way to the
    partial case. We use our auxiliary version tree data structure to
    find the largest ancestor of **version** from among a list of *O(1)*
    elements in *O(1)*.  
    Like with the partial case, writes are cheap when a node has space
    in its mods log and more expensive when nodes are full.  
    Consider *ϕ =-c*(# empty slots), then when we split *Δϕ=-2c(d+p+1)* and when we do not *Δϕ=c*. Hence,
    ![](http://sungsoo.github.com/images/eqn-fp04.png)
    for the worst possible choice of *x* from the neighbors. When we
    unfold the recursion once, we find the constants cancel out:
    *c - 2c(d+p+1) + (2p + 2p + 1)c = 0*.

**OPEN:** De-amortization of full persistence.  
**OPEN:** Is there a matching lower bound for both full and
partial persistence?


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

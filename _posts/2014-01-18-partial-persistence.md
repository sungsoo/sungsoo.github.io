---
layout: post
title: Partial Persistence
date: 2014-01-18
categories: [computer science]
tags: [algorithms, data structures]

---

Version Diagrams 
---
Gray means version is *read only* and blue means version is *read-write*.

![](http://sungsoo.github.com/images/partial.png)


Problem
---

#### Question:

*Is it possible to implement partial persistence efficiently?*

#### Answer:

Yes, assuming the pointer machine memory model and the restricting
*in-degrees* of data nodes to be *O(1)*. This result is due
to Driscoll, Sarnak, Sleator, and Tarjan @dsst.

#### Proof idea:

We will expand our data nodes to keep a modifications a.k.a. mods ‘*log*’.
When we have modified a node enough, we create a new node to take all
further updates until it also fills.

For every node in our old data structure, the new data structure will
have a collection of nodes: one current with the *latest versions* and
potentially many old ones used *only for reading* the old versions. Every
time we ‘*archive*’ a node we will also update all (versioned) pointers to
to instead refer to the latest node.

Proof:
------

We extend our data nodes to contain the following information:

1.  a read only area for data and pointers (corresponding to those in
    the original structure)

2.  (**new**) a writeable area for back pointers. Node *x* has one
    backpointer to a node *y* if *y* has a pointer to *x*. This area has
    limited size, since we know ahead of time there are at most *p*
    pointers to our node.

3.  (**new**) a writable modifications (‘*mods*’) area for entries of the form
    `(field, version, value)`. The size of this area also needs to be
    fixed, and it also has important consequences for write performance.

For an illustration of the construction check figures [fig:ephemeral]
and [fig:persistent1]

We implement read and write operations as follows:

1.  read(var, v) search the mod log for the
    largest version *w* such that * w \leq v *. What if the value is in
    an ‘old’ node? then we would have gotten to it via an old version of
    a pointer (c.f. Figure [fig:persistent2] and Figure [binary-tree]).

2.  write(var, val)

    if *n* is not full, simply add to mod log. if *n* has no space for
    more mod logs,

    -   *n' = \mbox{new Node()}*

    -   copy *latest* version of each field (data and
        forward pointers) to the static field section.

    -   also copy back pointers to *n'*

    -   for every node *x* such that *n* points to *x*, redirect its
        back pointers to *n'* (using our pointers to get to them) (at
        most d of them).

    -   for every node *x* such that *x* points to *n*, call
        write(x.p, n’) recursively (at most p recursive
        calls).

### Constructing a partially persistent structure from an ephemeral one

(a) Ephemeral linked structure. It has one data field and one pointer field  
![](http://sungsoo.github.com/images/3NodesDiagram1.png)

(b) The structure in 2a partially persistent. Showing one update: write(root.ptr.val = 20)  
![](http://sungsoo.github.com/images/3NodesDiagram2.png)

(c) The structure in 2b after a second update: write(root.ptr.val = 200). Gray indicates the data node is read only  
![](http://sungsoo.github.com/images/3NodesDiagram3.png)

For some data structures such as lists or trees we often know what *p*
is ahead of time, so we can implement the algorithm for these specific
structures like in figure [binary-tree].

[binary-tree]

Analysis:
---------

-   Space:

    If we choose the mod log to be bounded at size *2p* then node has
    size *d + p + 2p* which is also *O(1)* because we assumed there were
    only ![](http://sungsoo.github.com/images/eqnf1.png) pointers into any node. The reasons for choosing
    such a mod log size are clarified in the following cost analysis.

-   Time: A read is cheap, it requires constant time to check through a
    single node’s mod log and pick the required version. A write is also
    cheap if we have space in the mod log. If not, a write can be
    expensive. Let ![](http://sungsoo.github.com/images/eqn00.png) denote the cost of writing to node
    *n*. In the worst case the algorithm makes recursive calls so we
    get  
![](http://sungsoo.github.com/images/eqn01.png)  

    Where *c* represents the *O(1)* cost of determining latest versions
    to copy into the new node, copying backpointers, etc. ![](http://sungsoo.github.com/images/eqn02.png) stands for *x* points to *n*.

    Clearly the cost can be large because we could split many data nodes
    in the recursive steps. However, we know when a node becomes full
    then next operation will likely find a more empty mod log. For that
    reason amortized analysis more appropriate for this operation than
    worst case analysis.

    Recall the potential method technique explained in @clrs: if we know
    a potential function ![](http://sungsoo.github.com/images/eqn_phi.png), then
 ![](http://sungsoo.github.com/images/eqn11.png).

    Consider the following potential function:  
 ![](http://sungsoo.github.com/images/eqn03.png)

    Since the node was full and now it is empty, the change in potential
    associated with our new node is *-2cp*. So now we can write a
    recursive expression for our amortized cost:  
![](http://sungsoo.github.com/images/eqn04.png)

    For some worst case node *x*. The second *c* covers the case where
    we find space in our mod log, and simply add an entry to it thus
    increasing potential by *c*.

    By unfolding the recursion once we can see at each unfolding the
    *-2cp* cancels out the extra cost from the recursion leaving only
    the *2c* cost. Hence cost is *O(1)* amortized. The recursion process
    is guaranteed to finish despite potential cycles in the graph,
    because splits decrease ![](http://sungsoo.github.com/images/eqn_phi.png) and ![](http://sungsoo.github.com/images/eqn_phi.png) is non-negative.

    Further study by Brodal @brodal has shown actual cost to also be
    *O(1)* in the worst case.


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

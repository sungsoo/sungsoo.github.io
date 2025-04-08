---
layout: post
title: Partial Persistence
date: 2014-01-18
categories: [computer science]
tags: [design patterns]

---

Version Diagrams 
---
Gray means version is *read only* and blue means version is *read-write*.

![](http://sungsoo.github.com/images/partial.png)

Definition
---
In the partial persistence model, we may query any previous version of the data structure, but we may *only update the latest version*. This implies a *linear ordering* among the versions.

Any pointer-machine **DS** with *< p=O(1)* pointers to any node in any version can be made *partially* persistent with **O(1)** amortized multiplicative overhead and **O(1)** space per change.

Three methods on *balanced binary search tree*.

Fat Node
---
Fat node method is to record all changes made to node fields in the nodes themselves, without erasing old values of the fields. This requires that we allow nodes to become arbitrarily “*fat*”. In other words, each fat node contains the same information and pointer fields as an ephemeral node, along with space for an arbitrary number of extra field values. Each extra field value has an associated field name and a version stamp which indicates the version in which the named field was changed to have the specified value. Besides, each fat node has its own version stamp, indicating the version in which the node was created. The only purpose of nodes having version stamps is to make sure that each node only contains one value per field name per version. In order to navigate through the structure, each original field value in a node has a version stamp of zero.

#### Complexity of Fat Node 
With using fat node method, it requires **O(1)** space for every modification: just store the new data. Each modification takes **O(1)** additional time to store the modification at the end of the modification history. This is an amortized time bound, assuming we store the modification history in a growable array. For access time, we must find the right version at each node as we traverse the structure. If we made m modifications, then each access operation has **O(log m)** slowdown resulting from the cost of finding the nearest modification in the array.

Path Coying
---
Path copy is to make a copy of all nodes on the path which contains the node we are about to insert or delete. Then we must cascade the change back through the data structure: all nodes that pointed to the old node must be modified to point to the new node instead. These modifications cause more cascading changes, and so on, until we reach to the root. We maintain an array of roots indexed by timestamp. The data structure pointed to by time t’s root is exactly time t’s date structure.

#### Complexity of Path Coying
With m modifications, this costs **O(log m)** additive lookup time. Modification time and space are bounded by the size of the structure, since a single modification may cause the entire structure to be copied. That is O(m) for one update, and thus **O(n²)** preprocessing time.


 
A Combination
---
Sleator, Tarjan et al. came up with a way to combine the advantages of fat nodes and path copying, getting **O(1)** access slowdown and **O(1)** modification space and time.

In each node, we store one modification box. This box can hold one modification to the node—either a modification to one of the pointers, or to the node’s key, or to some other piece of node-specific data—and a timestamp for when that modification was applied. Initially, every node’s modification box is empty.

Whenever we access a node, we check the modification box, and compare its timestamp against the access time. (The access time specifies the version of the data structure that we care about.) If the modification box is empty, or the access time is before the modification time, then we ignore the modification box and just deal with the normal part of the node. On the other hand, if the access time is after the modification time, then we use the value in the modification box, overriding that value in the node. (Say the modification box has a new left pointer. Then we’ll use it instead of the normal left pointer, but we’ll still use the normal right pointer.)

Modifying a node works like this. (We assume that each modification touches one pointer or similar field.) If the node’s modification box is empty, then we fill it with the modification. Otherwise, the modification box is full. We make a copy of the node, but using only the latest values.(That is, we overwrite one of the node’s fields with the value that was stored in the modification box.) Then we perform the modification directly on the new node, without using the modification box. (We overwrite one of the new node’s fields, and its modification box stays empty.) Finally, we cascade this change to the node’s parent, just like path copying. (This may involve filling the parent’s modification box, or making a copy of the parent recursively. If the node has no parent—it’s the root—we add the new root to a sorted array of roots.)

With this algorithm, given any time t, at most one modification box exists in the data structure with time t. Thus, a modification at time t splits the tree into three parts: one part contains the data from before time t, one part contains the data from after time t, and one part was unaffected by the modification.

#### Complexity of the combination
Time and space for modifications require amortized analysis. A modification takes O(1) amortized space, and O(1) amortized time. To see why, use a potential function ϕ,where ϕ(T)is the number of full live nodes in T . The live nodes of T are just the nodes that are reachable from the current root at the current time (that is, after the last modification). The full live nodes are the live nodes whose modification boxes are full.

Each modification involves some number of copies, say k, followed by 1 change to a modification box. (Well, not quite—you could add a new root—but that doesn’t change the argument.) Consider each of the k copies. Each costs O(1) space and time, but decreases the potential function by one. (First, the node we copy must be full and live, so it contributes to the potential function. The potential function will only drop, however, if the old node isn’t reachable in the new tree. But we know it isn’t reachable in the new tree—the next step in the algorithm will be to modify the node’s parent to point at the copy. Finally, we know the copy’s modification box is empty. Thus, we’ve replaced a full live node with an empty live node, and ϕ goes down by one.) The final step fills a modification box, which costs O(1) time and increases ϕ by one.

Putting it all together, the change in ϕ is Δϕ =1− k.Thus, we’ve paid O(k +Δϕ)= O(1) space and O(k +Δϕ +1) = O(1) time.

Problem
---

#### Question:

*Is it possible to implement partial persistence efficiently?*

#### Answer:

Yes, assuming the pointer machine memory model and the restricting
*in-degrees* of data nodes to be *O(1)*. This result is due
to Driscoll, Sarnak, Sleator, and Tarjan[6].

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

1.  **read(var, v)** search the mod log for the largest version *w* such that * w \leq v *. What if the value is in an ‘old’ node? then we would have gotten to it via an old version of a pointer (c.f. Figure [fig:persistent2] and Figure [binary-tree]).

2.  **write(var, val)**   
if *n* is not full, simply add to mod log. if *n* has no space for
    more mod logs,  
    -   *n' = new Node()*
    -   copy *latest* version of each field (data and
        forward pointers) to the static field section.
    -   also copy back pointers to *n'*
    -   for every node *x* such that *n* points to *x*, redirect its
        back pointers to *n'* (using our pointers to get to them) (at
        most d of them).
    -   for every node *x* such that *x* points to *n*, call
        **write(x.p, n’)** recursively (at most p recursive
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
structures like in the following figure.

![](http://sungsoo.github.com/images/image.G80L9V)


Analysis:
---------

-   **Space**:

    If we choose the mod log to be bounded at size *2p* then node has
    size *d + p + 2p* which is also *O(1)* because we assumed there were
    only ![](http://sungsoo.github.com/images/eqnf1.png) pointers into any node. The reasons for choosing
    such a mod log size are clarified in the following cost analysis.

-   **Time**: A read is cheap, it requires constant time to check through a
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

    Recall the potential method technique explained in [12]: if we know
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
    because splits decrease ϕ and ϕ is non-negative.

    Further study by Brodal [1] has shown actual cost to also be
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

---
layout: post
title: Persistent Data Structures
date: 2014-01-17
categories: [computer science]
tags: [algorithms]

---

Overview
========

In this article, we cover results on *persistent data structures*,
which are data structures where we keep all information about past
states. Persistent data structures are part of the larger class of
*temporal* data structures. The other kind of *temporal data structures*,
*retroactive data structures*, are the topic of [MIT lecture
8](http://courses.csail.mit.edu/6.851/spring12/lectures/L08.html).

Usually we deal with data structure updates by mutating something in the
existing data structure: either its data or the pointers that organize
it. In the process we lose information previous data structures states.
*Persistent data structures do not lose any information*.

For several cases of data structures and definitions of persistence it
is possible to transform a plain data structure into a persistent one
with asymptotically minimal *extra work* or *space overhead*.

A recurring theme in this area is that the model is crucial to the
results.

Partial and full persistence correspond to time travel with a branching
universe model such as the one in
[Terminator](http://www.imdb.com/title/tt0103064/), and Deja Vu parts
[1](http://www.imdb.com/title/tt0453467) and
[2](http://www.youtube.com/watch?v=oHg5SJYRHA0)

Model and definitions
=====================

The pointer machine model of data structures
--------------------------------------------

In this model we think of data structures as collections of nodes of a
bounded size with entries for data. Each piece of data in the node can
be either actual data, or a pointer to a node.

The primitive operations allowed in this model are:

1.  <span>x = new Node()</span>

2.  <span>x = y.field</span>

3.  <span>x.field = y</span>

4.  <span>x = y + z</span>, etc (i.e. data operations)

5.  <span>destroy(x)</span> (if no other pointers to <span>x</span>)

Where <span>x</span>, <span>y</span>, <span>z</span> are names of nodes
or fields in them.

Data structures implementable with these shape constraints and these
operations includes linked lists and binary search trees, and in general
corresponds to <span>struct</span>’s in C or objects in Java. An example
of a data structure not in this group would be a structure of variable
size such as an array.

Definitions of persistence
--------------------------

We have vaguely referred to persistence as the ability to answer queries
about the past states of the structure. Here we give several definitions
of what we might mean by persistence.

1.  <span>*Partial Persistence*</span> – In this persistence model we
    may query any previous version of the data structure, but we may
    only update the latest version. We have operations <span>read(var,
    version)</span> and <span>newversion = write(var, val)</span>. This
    definition implies a linear ordering on the versions like
    patial persistence in version diagrams.

2.  <span>*Full Persistence*</span> – In this model, both updates and
    queries are allowed on any version of the data structure. We have
    operations <span>read(var, version)</span> and <span>newversion =
    write(var, version, val)</span>. The versions form a branching tree
    as in full persistence in version diagrams.

3.  <span>*Confluent Persistence*</span> – In this model, in addition to
    the previous operation, we allow combination operations to combine
    input of more than one previous versions to output a new single
    version. We have operations <span>read(var, version)</span>,
    <span>newversion = write(var, version, val)</span> and
    <span>newversion = combine(var, val, version1, version2)</span>.
    Rather than a branching tree, combinations of versions induce a DAG
    (direct acyclic graph) structure on the version graph, shown
    in confluent persistence in version diagrams.

4.  <span>*Functional Persistence*</span> – This model takes its name
    from functional programming where objects are immutable. The nodes
    in this model are likewise immutable: revisions do not alter the
    existing nodes in the data structure but create new ones instead.
    Okasaki discusses these as well as other functional data structures
    in his book @okasaki.

The difference between functional persistence and the rest is we have to
keep all the structures related to previous versions intact: the only
allowed internal operation is to add new nodes. In the previous three
cases we were allowed anything as long as we were able to implement the
interface.

Each of the succeeding levels of persistence is stronger than the
preceding ones. Functional implies confluent, confluent implies full,
and full implies partial.

Functional implies confluent because we are simply restricting ways on
how we implement persistence. Confluent persistence becomes full
persistence if we restrict ourselves to not use combinators. And full
persistence becomes partial when we restrict ourselves to only write to
the latest version.

The diagrams in the following figures show what the version
‘*genealogies*’ can look like for each definition.

Version Diagrams
---
Gray means version is read only and blue means version is read-write.

**Patial Persistence** 

![](http://sungsoo.github.com/images/partial.png)


**Full Persistence** 

![](http://sungsoo.github.com/images/fullpersistence.png)

**Confluent/Functional Persistence** 

![](http://sungsoo.github.com/images/confluent.png)

 

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

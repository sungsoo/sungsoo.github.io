---
layout: post
title: Graph Databases
date: 2013-06-21
categories: [computer science]
tags: [nosql]

---
Graph databases are clearly post-relational data stores, because they evolve several database concepts much further while keeping other attributes. They provide the means of stor- ing semistructured but highly connected data efficiently and allow us to query and traverse the *linked data* at a very *high speed*.

Graph data consists of *nodes* connected with directed and labeled *relationships*. In property graphs, both nodes and relationships can hold arbitrary **key/value pairs**. 
Graphs form an intricate network of those elements and encourage us to model domain and real-world data close to the original structure. Unlike relational databases, which rely on fixed schemas to model data, graph databases are **schema-free** and put **no constraints onto the data structure**. Relationships can be added and changed easily, because they are not part of a schema but rather part of the actual data.


We can attribute the **high performance** of graph databases to the fact that moving the cost of relating entities (joins) to the *insertion time*—by materializing the relationships as first-level citizens of the data structure—allows for constant time traversal from one entity (node) to another. So, regardless of the dataset size, the time for a given traversal across the graph is always determined by the number of hops in that traversal, not the number of nodes and relationships in the graph as a whole. In other database models, the cost of finding connections between two (or more) entities occurs on each query instead.


Thanks to this, a single graph can store many different domains, creating interesting connections between entities from all of them. *Secondary access or index structures can be integrated into the graph to allow special grouping or access paths to a number of nodes or subgraphs.*


Due to the nature of graph databases, they *don’t rely on aggregate bounds* to manage atomic operations but instead build on the well-established transactional guarantees of an **ACID** (*atomicity, consistency, isolation, durability*) data store.


![http://sungsoo.github.com/images/graph-databases.png](http://sungsoo.github.com/images/graph-databases.png)


### References

[1] Mark Pollack, Oliver Gierke, Thomas Risberg, Jon Brisbin, and Michael Hunger, *Spring Data: Modern Data Access for Enterprise Java*, pp. 101-102, O'REILLY, 2013.
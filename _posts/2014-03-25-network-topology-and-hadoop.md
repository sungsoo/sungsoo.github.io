---
layout: post
title: Network Topology and Hadoop
date: 2014-03-25
categories: [computer science]
tags: [big data]

---

# Network Topology and Hadoop

What does it mean for two nodes in a local network to be “close” to each other? In the context of high-volume data processing, the limiting factor is the rate at which we can transfer data *between nodes—bandwidth* is a scarce commodity. The idea is to use the bandwidth between two nodes as a measure of distance.


Rather than measuring bandwidth between nodes, which can be difficult to do in practice (it requires a quiet cluster, and the number of pairs of nodes in a cluster grows as the square of the number of nodes), Hadoop takes a simple approach in which the network is represented as a *tree* and the distance between two nodes is the *sum* of their distances to their *closest* common ancestor. Levels in the tree are not predefined, but it is common to have levels that correspond to the data center, the rack, and the node that a process is running on. The idea is that the bandwidth available for each of the following scenarios becomes progressively less:


* Processes on the same node
* Different nodes on the same rack
* Nodes on different racks in the same data center
* Nodes in different data centers


For example, imagine a node n1 on rack r1 in data center d1. This can be represented as /d1/r1/n1. Using this notation, here are the distances for the four scenarios:

* *distance*(/d1/r1/n1, /d1/r1/n1) = 0 (processes on the same node)
* *distance*(/d1/r1/n1, /d1/r1/n2) = 2 (different nodes on the same rack)
* *distance*(/d1/r1/n1, /d1/r2/n3) = 4 (nodes on different racks in the same data center)
* *distance*(/d1/r1/n1, /d2/r3/n4) = 6 (nodes in different data centers)


This is illustrated schematically in the below **Figure**. (Mathematically inclined readers will notice that this is an example of a *distance metric*.)

### Figure: Network distance in Hadoop
![network-distance.png](http://sungsoo.github.com/images/network-distance.png)


Finally, it is important to realize that Hadoop cannot divine your network topology for you. It needs some help, we’ll cover how to configure topology in “Network Topology” on page 299 [1]. By default, though, it assumes that the network is flat—a singlelevel hierarchy—or in other words, that all nodes are on a single rack in a single data center. For small clusters, this may actually be the case, and no further configuration is required.



# References
[1] Tom White, *Hadoop: The Definitive Guide, Third Edition*, pp. 69-70, O’Reilly Media, Inc., 2012. 
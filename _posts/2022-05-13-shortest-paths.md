---
layout: post
title: Shortest Paths and Centrality in Uncertain Networks
date: 2022-05-13
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Shortest Paths and Centrality in Uncertain Networks](https://www.youtube.com/watch?v=1HFEEVJ67Oo)


---

# Shortest Paths and Centrality in Uncertain Networks

* Paper: [http://www.vldb.org/pvldb/vol14/p1188-khan.pdf](http://www.vldb.org/pvldb/vol14/p1188-khan.pdf)

## Abstract

Computing the shortest path between a pair of nodes is a fundamental graph primitive, which has critical applications in vehicle routing, finding functional pathways in biological networks, survivable network design, among many others. In this work, we study shortest-path queries over uncertain networks, i.e., graphs where every edge is associated with a probability of existence. We show that, for a given path, it is #P-hard to compute the probability of it being the shortest path, and we also derive other interesting properties highlighting the complexity of computing the Most Probable Shortest Paths (MPSPs). We thus devise sampling-based efficient algorithms, with end-to-end accuracy guarantees, to compute the MPSP. As a concrete application, we show how to compute a novel concept of betweenness centrality in an uncertain graph using MPSPs. Our thorough experimental results and rich real-world case studies on sensor networks and brain networks validate the effectiveness, efficiency, scalability, and usefulness of our solution.



<iframe width="600" height="400" src="https://www.youtube.com/embed/1HFEEVJ67Oo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

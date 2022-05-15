---
layout: post
title: Hierarchical Core Maintenance on Large Dynamic Graphs
date: 2022-05-14
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Hierarchical Core Maintenance on Large Dynamic Graphs](https://www.youtube.com/watch?v=MdjKBN8_jCk)


---

# Hierarchical Core Maintenance on Large Dynamic Graphs


* Paper: [http://vldb.org/pvldb/vol14/p757-zhang.pdf](http://vldb.org/pvldb/vol14/p757-zhang.pdf)

## Abstract

The model of k-core and its decomposition have been applied in various areas, such as social networks, the world wide web, and biology. A graph can be decomposed into an elegant k-core hierarchy to facilitate cohesive subgraph discovery and network analysis. As many real-life graphs are fast evolving, existing works proposed efficient algorithms to maintain the coreness value of every vertex against structure changes. However, the maintenance of the k-core hierarchy in existing studies is not complete because the connections among different k-cores in the hierarchy are not considered. In this paper, we study hierarchical core maintenance which is to compute the k-core hierarchy incrementally against graph dynamics. The problem is challenging because the change of hierarchy may be large and complex even for a slight graph update. In order to precisely locate the area affected by graph dynamics, we conduct in-depth analyses on the structural properties of the hierarchy, and propose well-designed local update techniques. Our algorithms significantly outperform the baselines on runtime by up to 3 orders of magnitude, as demonstrated on 10 real-world large graphs.


<iframe width="600" height="400" src="https://www.youtube.com/embed/MdjKBN8_jCk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


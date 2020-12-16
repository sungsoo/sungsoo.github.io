---
layout: post
title: The Forward-Backward Embedding of Directed Graphs
date: 2020-12-17
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [The Forward-Backward Embedding of Directed Graphs](https://www.youtube.com/watch?v=3LyjiI0ope4)

----

# The Dynamics of Active Sensing in Social Networks

* For further info, visit our website at https://www.lincs.fr 
* By Nathan de Lara (Telecom ParisTech / Thalès) - 2018, Nov. 14th

<iframe width="600" height="400" src="https://www.youtube.com/embed/3LyjiI0ope4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 
## Abstract
We introduce a novel embedding of *directed graphs* derived from the **singular value decomposition (SVD)** of the *normalized adjacency matrix*. Specifically, we show that, after proper *normalization* of the singular vectors, the distances between vectors in the embedding space are proportional to the *mean commute times* between the corresponding nodes by a *forward-backward random walk* in the graph, which follows the edges alternately in forward and backward directions. 
In particular, two nodes having many *common successors* in the graph tend to be represented by close vectors in the embedding space. More formally, we prove that our representation of the
graph is equivalent to the *spectral embedding* of some co-citation graph, where nodes are linked with respect to their common set of successors in the original graph. The interest of our approach is that it does **not require** to build this *co-citation graph*, which is typically *much denser* than the original graph. Experiments on real datasets show the efficiency of the approach.
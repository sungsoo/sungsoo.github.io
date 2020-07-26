---
layout: post
title: Learning Equivariant and Hybrid Message Passing on Graphs
date: 2020-07-26
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Learning Equivariant and Hybrid Message Passing on Graphs](https://www.youtube.com/watch?v=fzusr-VdPxw)

----


## Learning Equivariant and Hybrid Message Passing on Graphs

* Speaker: Max Welling - University of Amsterdam and Qualcomm

### Abstract
In this talk I will extend *graph neural nets* in two directions. First, we will ask if we can formulate a GNN on meshes of two dimensional manifolds. Previous approaches mostly used standard GNNs which are invariant to permutations of the input nodes. However, we show this is unnecessarily restrictive. Instead, we define *mesh-CNNs* which are equivariant and allow more general kernels. Second we will study how to incorporate information about the data generating process into GNNs. *Belief propagation* is a form of GNN with no learnable parameters that performs inference in a generative graphical model. We subsequently augment BP by a trainable GNN to correct the mistakes of BP, in order to improve predictive performance. Experiments show the increased power of both methods. 
 
<iframe width="600" height="400" src="https://www.youtube.com/embed/hUrbS1BhBWc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
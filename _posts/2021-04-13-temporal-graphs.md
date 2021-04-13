---
layout: post
title: Inductive Representation Learning on Temporal Graphs 
date: 2021-04-13
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source

* [Inductive Representation Learning on Temporal Graphs](https://www.youtube.com/watch?v=SD5_gqwVtXc)

---

# Inductive Representation Learning on Temporal Graphs

* For slides and more information on the paper, visit [https://ai.science/e/tgat-inductive-r...​](https://ai.science/e/tgat-inductive-representation-learning-on-temporal-graphs--2020-11-05-da-xu@/streams/graph-neural-nets)
* Speaker: Da Xu; Host: Nabila Abraham

## Motivation
 
Inductive representation learning on temporal graphs is an important step toward salable machine learning on real-world dynamic networks. The evolving nature of temporal dynamic graphs requires handling new nodes as well as capturing temporal patterns. The node embeddings, which are now functions of time, should represent both the static node features and the evolving topological structures. Moreover, node and topological features can be temporal as well, whose patterns the node embeddings should also capture. The authors propose the temporal graph attention (TGAT) layer to efficiently aggregate temporal-topological neighborhood features as well as to learn the time-feature interactions. For TGAT, they use the self-attention mechanism as building block and develop a novel functional time encoding technique based on the classical Bochner's theorem from harmonic analysis. By stacking TGAT layers, the network recognizes the node embeddings as functions of time and is able to inductively infer embeddings for both new and observed nodes as the graph evolves. The proposed approach handles both node classification and link prediction task, and can be naturally extended to include the temporal edge features. They evaluate their method with transductive and inductive tasks under temporal settings with two benchmark and one industrial dataset. The TGAT model compares favorably to state-of-the-art baselines as well as the previous temporal graph embedding approaches.

<iframe width="600" height="400" src="https://www.youtube.com/embed/SD5_gqwVtXc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

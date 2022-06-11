---
layout: post
title: Using Graph Neural Networks for Multi-Node Representation Learning 
date: 2022-06-11
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Using Graph Neural Networks for Multi-Node Representation Learning](https://www.youtube.com/watch?v=ysgxI6wFjy8)


---

# Using Graph Neural Networks for Multi-Node Representation Learning  



* Paper "Labeling Trick: A Theory of Using Graph Neural Networks for Multi-Node Representation Learning": [https://arxiv.org/abs/2010.16103](https://arxiv.org/abs/2010.16103)
* Authors: Muhan Zhang, Pan Li, Yinglong Xia, Kai Wang, Long Jin


## Abstract 
In this paper, we provide a theory of using graph neural networks (GNNs) for multi-node representation learning (where we are interested in learning a representation for a set of more than one node). We know that GNN is designed to learn single-node representations. When we want to learn a node set representation involving multiple nodes, a common practice in previous works is to directly aggregate the multiple node representations learned by a GNN into a joint representation of the node set. In this paper, we show a fundamental constraint of such an approach, namely the inability to capture the dependence between nodes in the node set, and argue that directly aggregating individual node representations does not lead to an effective joint representation for multiple nodes. Then, we notice that a few previous successful works for multi-node representation learning, including SEAL, Distance Encoding, and ID-GNN, all used node labeling. These methods first label nodes in the graph according to their relationships with the target node set before applying a GNN. Then, the node representations obtained in the labeled graph are aggregated into a node set representation. By investigating their inner mechanisms, we unify these node labeling techniques into a single and most basic form, namely labeling trick. We prove that with labeling trick a sufficiently expressive GNN learns the most expressive node set representations, thus in principle can solve any joint learning tasks over node sets. Experiments on one important two-node representation learning task, link prediction, verified our theory. Our work establishes a theoretical foundation of using GNNs for joint prediction tasks over node sets.

<iframe width="600" height="400" src="https://www.youtube.com/embed/ysgxI6wFjy8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
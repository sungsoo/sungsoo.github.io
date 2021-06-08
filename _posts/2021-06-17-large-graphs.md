---
layout: post
title: Scaling Up Graph Neural Networks to Large Graphs
date: 2021-06-17
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Scaling Up Graph Neural Networks to Large Graphs](https://www.youtube.com/watch?v=2nPCw3yHlnI)


---


# Scaling Up Graph Neural Networks to Large Graphs 

* Jure Leskovec
* Computer Science, PhD
* To follow along with the course schedule and syllabus, visit: 
[http://web.stanford.edu/class/cs224w/]()

In real-world applications, such as recommendation systems and social networks, graphs can be very large with millions if not billions of nodes and edges. This makes the native full batch GNN training and testing extremely hard as the GPU memory is limited. In this lecture, we will introduce three methods that scale up GNNs: 1) **Neighbor Sampling**, 2) Cluster-GCN, and 3) Simplified GCN.


<iframe width="600" height="400" src="https://www.youtube.com/embed/2nPCw3yHlnI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Cluster-GCN: Scaling up GNNs

Neighbor Sampling, presented in the previous lecture (17.2) constructs a computational graph separately for each node in a mini-batch. This creates a lot of redundancy in computing node embeddings within the mini-batch. A different approach is to sample a subgraph from a large graph that is small enough to be loaded into GPU. Then, the efficient and non-redundant full-batch GNN can be applied over the sampled subgraph. An example of this method is Cluster-GCN. **Cluster-GCN** first pre-processes a large graph by partitioning it into clusters of nodes. Then, during training, it samples clusters of nodes in each mini-batch and applies the full-batch GNN over the induced subgraph.

<iframe width="600" height="400" src="https://www.youtube.com/embed/RJkR8Ig6dXI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
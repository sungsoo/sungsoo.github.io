---
layout: post
title: Graph Ordering Attention Networks
date: 2022-06-29
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Graph Ordering Attention Networks](https://www.youtube.com/watch?v=_VaTVYrnwC4)


---

# Graph Ordering Attention Networks


* Join the Learning on Graphs and Geometry Reading Group: [https://hannes-stark.com/logag-reading-group](https://hannes-stark.com/logag-reading-group)
* Paper: ["Graph Ordering Attention Networks"](https://arxiv.org/abs/2204.05351)
* Authors: Michail Chatzianastasis, Johannes F. Lutzeyer, George Dasoulas, Michalis Vazirgiannis


## Abstract 
Graph Neural Networks (GNNs) have been successfully used in many problems involving graph-structured data, achieving state-of-the-art performance. GNNs typically employ a *message-passing* scheme, in which every node aggregates information from its neighbors using a *permutation-invariant aggregation* function. Standard well-examined choices such as the mean or sum aggregation functions have limited capabilities, as they are *not able to capture interactions among neighbors*. In this work, we formalize these interactions using an *information-theoretic framework* that notably includes *synergistic* information. Driven by this definition, we introduce the **Graph Ordering Attention (GOAT)** layer, a novel GNN component that captures interactions between nodes in a neighborhood. This is achieved by learning local node orderings via an attention mechanism and processing the ordered representations using a recurrent neural network aggregator. This design allows us to make use of a *permutation-sensitive aggregator* while maintaining the *permutation-equivariance* of the proposed GOAT layer. The GOAT model demonstrates its increased performance in modeling graph metrics that capture complex information, such as the betweenness centrality and the effective size of a node. In practical use-cases, its superior modeling capability is confirmed through its success in several real-world node classification benchmarks.


<iframe width="600" height="400" src="https://www.youtube.com/embed/9CJs5TL-CSs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

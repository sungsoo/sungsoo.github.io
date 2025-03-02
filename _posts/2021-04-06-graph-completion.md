---
layout: post
title: Graph Neural Networks and Knowledge Graph Completion
date: 2021-04-06
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source

* [Graph Neural Networks and Knowledge Graph Completion](https://www.youtube.com/watch?v=i7WOrkwSL24)

---

# Graph Neural Networks and Knowledge Graph Completion

## Abstract

After observing a snapshot of a social network, a *link prediction* (LP) algorithm identifies node pairs between which new edges will likely materialize in future. Most LP algorithms estimate a score for currently non-neighboring node pairs, and rank them by this score. Recent LP systems compute this score by comparing dense, low dimensional vector representations of nodes. *Graph neural networks* (GNNs), in particular *graph convolutional networks* (GCNs), are popular examples. For two nodes to be meaningfully compared, their embeddings should be indifferent to reordering of their neighbors. GNNs typically use simple, symmetric set aggregators to ensure this property, but this design decision has been shown to produce representations with limited expressive power. Sequence encoders are more expressive, but are *permutation sensitive* by design. Recent efforts to overcome this dilemma turn out to be unsatisfactory for LP tasks. In response, we propose PermGNN, which aggregates neighbor features using a recurrent, order-sensitive aggregator and directly minimizes an LP loss while it is 'attacked' by adversarial generator of neighbor permutations. By design, PermGNN has more expressive power compared to earlier symmetric aggregators. Next, we devise an optimization framework to map PermGNN's node embeddings to a suitable *locality-sensitive hash*, which speeds up reporting the top-K most likely edges for the LP task. Our experiments on diverse datasets show that our outperforms several state-of-the-art link predictors by a significant margin, and can predict the most likely edges fast. 

<iframe width="600" height="400" src="https://www.youtube.com/embed/i7WOrkwSL24" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Inductive Matrix Completion Based on Graph Neural Networks

<iframe width="600" height="400" src="https://www.youtube.com/embed/bY0rJRU65j4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---
layout: post
title: Graph Representation Learning
date: 2020-07-13
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Graph Representation Learning](https://www.youtube.com/watch?v=YrhBZUtgG4E)

----


# Graph Representation Learning


### Abstract

Researchers in network science have traditionally relied on user-defined heuristics to extract features from complex networks (e.g., degree statistics or kernel functions). However, recent years have seen a surge in approaches that automatically learn to encode network structure into low-dimensional embeddings, using techniques based on deep learning and nonlinear dimensionality reduction. These **network representation learning** (NRL) approaches remove the need for painstaking feature engineering and have led to state-of-the-art results in network-based tasks, such as *node classification*, *node clustering*, and *link prediction*.

In this tutorial, we will cover key advancements in NRL over the last decade, with an emphasis on fundamental advancements made in the last two years. We will discuss classic matrix factorization-based methods, random-walk based algorithms (e.g., DeepWalk and node2vec), as well as very recent advancements in graph neural networks. We will cover methods to embed individual nodes as well as approaches to embed entire (sub)graphs, and in doing so, we will present a unified framework for NRL.

<iframe width="600" height="400" src="https://www.youtube.com/embed/YrhBZUtgG4E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

* Slide PDF: [Presentation Slides](http://snap.stanford.edu/proj/embeddings-www/index.html#materials)

## An Introduction to Graph Neural Networks: Models and Applications

### Abstract 

"Graph Neural Networks (GNN) are a general class of networks that work over graphs. By representing a problem as a graph — encoding the information of individual elements as nodes and their relationships as edges — GNNs learn to capture patterns within the graph. These networks have been successfully used in applications such as chemistry and program analysis. In this introductory talk, I will do a deep dive in the neural message-passing GNNs, and show how to create a simple GNN implementation. Finally, I will illustrate how GNNs have been used in applications.

<iframe width="600" height="400" src="https://www.youtube.com/embed/zCEYiCxrL_0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

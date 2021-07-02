---
layout: post
title: Learning over sets, subgraphs, and streams
date: 2021-07-13
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Learning over sets, subgraphs, and streams](https://www.youtube.com/watch?v=DnIo0mu0zLU)


---

# Learning over sets, subgraphs, and streams

## How to accurately incorporate graph context

* MSR AI Distinguished Talk Series
* Learning over sets, subgraphs, and streams: How to accurately incorporate graph context in network models

## Abstract

Although deep learning methods have been successfully applied in structured domains comprised of images and natural language, it is still difficult to  apply the methods directly to graph and network domains due to issues of heterogeneity and long range dependence. In this talk, I will discuss some of our recent work developing neural network methods for complex network domains, including node classification, motif prediction, and knowledge graph inference. The key insights include incorporating dependencies from graph context into both the input features and the model architectures, employing randomization to learn permutation invariant functions over sets, and using graph-aware attention mechanisms to offset noise when incorporating higher-order patterns. Experiments on real work social network data shows that our methods produce significant gains compared to other state-of-the-art methods, but only when we think carefully about how to integrate relational inductive biases into the process.

<iframe width="600" height="400" src="https://www.youtube.com/embed/DnIo0mu0zLU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
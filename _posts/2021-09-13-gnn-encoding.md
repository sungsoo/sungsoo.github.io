---
layout: post
title: Graph Neural Networks with Learnable Structural and Positional Representation
date: 2021-09-13
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Graph Neural Networks with Learnable Structural and Positional Representation](https://www.youtube.com/watch?v=P958uaPKtJ0)


---

# Graph Neural Networks with Learnable Structural and Positional Representation

* Workshop : Deep Learning on Graphs at KDD2021 (DGL-KDD’21)
* [Slides](https://www.dropbox.com/s/46amtfnt3f1grmx/talk_KDD_GNN_Aug21.pdf)
* Xavier Bresson, NUS, Singapore
* [https://twitter.com/xbresson](https://twitter.com/xbresson)
* August 16, 2021

## Abstract

*Graph neural networks* have become the standard toolkit for analyzing and learning from data on graphs. GNNs have been applied to several domains ranging from quantum chemistry, recommender systems to knowledge graphs and natural language processing. A major issue with arbitrary graphs is *the absence of canonical positional information of nodes*, which decreases the representation power of GNNs to distinguish e.g. isomorphic nodes and other graph symmetries. An approach to tackle this issue is to introduce *positional encoding* (PE) of nodes, and inject it into the input layer, like in **Transformer**. Possible graph PE are *graph Laplacian eigenvectors*, but their sign is not uniquely defined. In this work, we propose to *decouple structural and positional representation* to make easy for the network to learn these two properties. We show that any GNN can actually be augmented by learnable PE, and improve the performance. We investigate sparse and fully-connected/transformer-like GNNs, and observe the usefulness to learn PE for both classes.

<iframe width="600" height="400" src="https://www.youtube.com/embed/hADjUl4ymoQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
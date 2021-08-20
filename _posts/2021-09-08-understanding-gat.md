---
layout: post
title: Understanding Graph Attention Networks
date: 2021-09-08
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Understanding Graph Attention Networks](https://www.youtube.com/watch?v=A-yKQamf2Fc)


---

# Understanding Graph Attention Networks

### Graph Attention Paper:
* [https://arxiv.org/pdf/1710.10903.pdf](https://arxiv.org/pdf/1710.10903.pdf)

### Attention in NLP YouTube Series: 
* [https://www.youtube.com/watch?v=yGTUuEx3GkA&t=0s](https://www.youtube.com/watch?v=yGTUuEx3GkA&t=0s) (Rasa)

## Abstract

* [Graph Attention Networks](https://arxiv.org/abs/1710.10903)

We present graph attention networks (GATs), novel neural network architectures that operate on graph-structured data, leveraging masked self-attentional layers to address the shortcomings of prior methods based on graph convolutions or their approximations. By stacking layers in which nodes are able to attend over their neighborhoods' features, we enable (implicitly) specifying different weights to different nodes in a neighborhood, without requiring any kind of costly matrix operation (such as inversion) or depending on knowing the graph structure upfront. In this way, we address several key challenges of spectral-based graph neural networks simultaneously, and make our model readily applicable to inductive as well as transductive problems. Our GAT models have achieved or matched state-of-the-art results across four established transductive and inductive graph benchmarks: the Cora, Citeseer and Pubmed citation network datasets, as well as a protein-protein interaction dataset (wherein test graphs remain unseen during training).

<iframe width="600" height="400" src="https://www.youtube.com/embed/A-yKQamf2Fc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
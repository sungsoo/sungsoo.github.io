---
layout: post
title: Graph Attention Networks
date: 2020-07-27
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Graph Attention Networks](https://www.youtube.com/watch?v=hUrbS1BhBWc)

----


# Graph Attention Networks

## Abstract

We present *graph attention networks* (GATs), novel neural network architectures that operate on graph-structured data, leveraging masked self-attentional layers to address the shortcomings of prior methods based on graph convolutions or their approximations. By stacking layers in which nodes are able to attend over their neighborhoods' features, we enable (implicitly) specifying different weights to different nodes in a neighborhood, without requiring any kind of costly matrix operation (such as inversion) or depending on knowing the graph structure upfront. In this way, we address several key challenges of spectral-based graph neural networks simultaneously, and make our model readily applicable to inductive as well as transductive problems. Our GAT models have achieved or matched state-of-the-art results across four established transductive and inductive graph benchmarks: the Cora, Citeseer and Pubmed citation network datasets, as well as a protein-protein interaction dataset (wherein test graphs remain unseen during training). 
 
<iframe width="600" height="400" src="https://www.youtube.com/embed/zMIs20GUK_w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
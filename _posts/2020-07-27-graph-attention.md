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

## Main Takeaways

* Graph Attention Network: 가장 핵심적인 아이디어는 각 노드에 대해 *multi-head attention*을 적용했다는 점
* **Multi-head Attention**: 대표적인 attention 모델인 Transformer에서 사용한 기법으로 전체 차원을 나누어서 linear projection을 여러번 수행하여 더 풍부한 representation을 얻는 기법
* CCN이 갖고 있던 고정된 filter의 한계를 Graph Convolution을 통해 극복함과 동시에, Attention mechanism의 장점까지 활용할 수 있기에 많은 활용 가능성을 갖고 있다.
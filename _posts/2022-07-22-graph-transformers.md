---
layout: post
title: Rethinking Graph Transformers with Spectral Attention
date: 2022-07-22
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Rethinking Graph Transformers with Spectral Attention](https://www.youtube.com/watch?v=51_K8RDVlXY)


---

# Rethinking Graph Transformers with Spectral Attention

* Paper: [https://arxiv.org/abs/2106.03893](https://arxiv.org/abs/2106.03893)
* Authors: Devin Kreuzer, Dominique Beaini, William L. Hamilton, Vincent Létourneau, Prudencio Tossou




## Abstract

In recent years, the Transformer architecture has proven to be very successful in sequence processing, but its application to other data structures, such as graphs, has remained limited due to the difficulty of properly defining positions. Here, we present the Spectral Attention Network (SAN), which uses a learned positional encoding (LPE) that can take advantage of the full Laplacian spectrum to learn the position of each node in a given graph. This LPE is then added to the node features of the graph and passed to a fully-connected Transformer. By leveraging the full spectrum of the Laplacian, our model is theoretically powerful in distinguishing graphs, and can better detect similar sub-structures from their resonance. Further, by fully connecting the graph, the Transformer does not suffer from over-squashing, an information bottleneck of most GNNs, and enables better modeling of physical phenomenons such as heat transfer and electric interaction. When tested empirically on a set of 4 standard datasets, our model performs on par or better than state-of-the-art GNNs, and outperforms any attention-based model by a wide margin, becoming the first fully-connected architecture to perform well on graph benchmarks.

<iframe width="600" height="400" src="https://www.youtube.com/embed/51_K8RDVlXY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
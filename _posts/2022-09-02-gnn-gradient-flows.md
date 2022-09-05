---
layout: post
title: Graph Neural Networks as Gradient Flows 
date: 2022-09-02
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Graph Neural Networks as Gradient Flows](https://www.youtube.com/watch?v=sgTTtmwOMgE)


---

# Graph Neural Networks as Gradient Flows

* Paper: "Graph Neural Networks as Gradient Flows": [https://arxiv.org/abs/2206.10991](https://arxiv.org/abs/2206.10991)
* Authors: Francesco Di Giovanni, James Rowbottom, Benjamin P. Chamberlain, Thomas Markovich, Michael M. Bronstein


## Abstract

Dynamical systems minimizing an energy are ubiquitous in geometry and physics. We propose a novel framework for GNNs where we parametrize (and {\em learn}) an energy functional and then take the GNN equations to be the gradient flow of such energy. This approach allows to analyse the GNN evolution from a multi-particle perspective as learning attractive and repulsive forces in feature space via the positive and negative eigenvalues of a symmetric `channel-mixing' matrix. We conduct spectral analysis of the solutions and provide a better understanding of the role of the channel-mixing in (residual) graph convolutional models and of its ability to steer the diffusion away from over-smoothing. We perform thorough ablation studies corroborating our theory and show competitive performance of simple models on homophilic and heterophilic datasets.

<iframe width="600" height="400" src="https://www.youtube.com/embed/sgTTtmwOMgE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
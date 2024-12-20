---
layout: post
title: Neural Bellman-Ford Networks  
date: 2023-11-29
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Neural Bellman-Ford Networks](https://www.youtube.com/watch?v=x8S0e56o70I)

---

# Neural Bellman-Ford Networks  

* Paper "Neural Bellman-Ford Networks: A General Graph Neural Network Framework for Link Prediction": [https://arxiv.org/abs/2106.06935](https://arxiv.org/abs/2106.06935) 


## Abstract

Link prediction is a very fundamental task on graphs. Inspired by traditional path-based methods, in this paper we propose a general and flexible representation learning framework based on paths for link prediction. Specifically, we define the representation of a pair of nodes as the generalized sum of all path representations, with each path representation as the generalized product of the edge representations in the path. Motivated by the Bellman-Ford algorithm for solving the shortest path problem, we show that the proposed path formulation can be efficiently solved by the generalized Bellman-Ford algorithm. To further improve the capacity of the path formulation, we propose the Neural Bellman-Ford Network (NBFNet), a general graph neural network framework that solves the path formulation with learned operators in the generalized Bellman-Ford algorithm. The NBFNet parameterizes the generalized Bellman-Ford algorithm with 3 neural components, namely INDICATOR, MESSAGE and AGGREGATE functions, which corresponds to the boundary condition, multiplication operator, and summation operator respectively. The NBFNet is very general, covers many traditional path-based methods, and can be applied to both homogeneous graphs and multi-relational graphs (e.g., knowledge graphs) in both transductive and inductive settings. Experiments on both homogeneous graphs and knowledge graphs show that the proposed NBFNet outperforms existing methods by a large margin in both transductive and inductive settings, achieving new state-of-the-art results.

<iframe width="600" height="400" src="https://www.youtube.com/embed/x8S0e56o70I?si=LK60wuCJxINa6mSc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


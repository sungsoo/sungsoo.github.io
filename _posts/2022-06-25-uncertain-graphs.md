---
layout: post
title: Efficient Probabilistic Truss Indexing on Uncertain Graphs
date: 2022-06-25
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Efficient Probabilistic Truss Indexing on Uncertain Graphs](https://www.youtube.com/watch?v=LikckG5utyk)


---

# Efficient Probabilistic Truss Indexing on Uncertain Graphs

* Authors: Zitan Sun,  Xin Huang,  Jianliang Xu,  Francesco Bonchi

## Abstract

Networks in many real-world applications come with an inherent uncertainty in their structure, due to e.g., noisy measurements, inference and prediction models, or for privacy purposes. Modeling and analyzing uncertain graphs has attracted a great deal of attention. Among the various graph analytic tasks studied, the extraction of dense substructures, such as cores or trusses, has a central role.

In this paper, we study the problem of (k, γ)-truss indexing and querying over an uncertain graph . A (k, γ)-truss is the largest subgraph of , such that the probability of each edge being contained in at least k − 2 triangles is no less than γ. Our first proposal, CPT-index, keeps all the (k, γ)-trusses: retrieval for any given k and γ can be executed in an optimal linear time w.r.t. the graph size of the queried (k, γ)-truss. We develop a bottom-up CPT-indexconstruction scheme and an improved algorithm for fast CPT-indexconstruction using top-down graph partitions. For trading off between (k, γ)-truss offline indexing and online querying, we further develop an approximate indexing approach (ϵ, Δr)-APXequipped with two parameters, ϵ and Δr, that govern tolerated errors.

Extensive experiments using large-scale uncertain graphs with 261 million edges validate the efficiency of our proposed indexing and querying algorithms against state-of-the-art methods.

<iframe width="600" height="400" src="https://www.youtube.com/embed/LikckG5utyk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
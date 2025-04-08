---
layout: post
title: Is Distance Matrix Enough for Geometric Deep Learning?   
date: 2023-07-18
categories: [computer science]
tags: [big data]

---

### Article Source

* [Is Distance Matrix Enough for Geometric Deep Learning?](https://www.youtube.com/watch?v=Qom83crI4NE)


---

# Is Distance Matrix Enough for Geometric Deep Learning?

* Speaker: Zian Li 
* Never miss another LoGG Talk, add the schedule to your calendar: [https://m2d2.io/talks/m2d2/about/](https://m2d2.io/talks/m2d2/about/)

## Abstract

Graph Neural Networks (GNNs) are often used for tasks involving the 3D geometry of a given graph, such as molecular dynamics simulation. Although the distance matrix of a geometric graph contains complete geometric information, it has been demonstrated that Message Passing Neural Networks (MPNNs) are insufficient for learning this geometry. In this work, we expand on the families of counterexamples that MPNNs are unable to distinguish from their distance matrices, by constructing families of novel and symmetric geometric graphs, to better understand the inherent limitations of MPNNs. We then propose k-DisGNNs, which can effectively exploit the rich geometry contained in the distance matrix. We demonstrate the high expressive power of k-DisGNNs from three perspectives: 1. They can learn high-order geometric information that cannot be captured by MPNNs. 2. They can unify some existing well-designed geometric models. 3. They are universal function approximators from geometric graphs to scalars (when k≥2) and vectors (when k≥3). Most importantly, we establish a connection between geometric deep learning (GDL) and traditional graph representation learning (GRL), showing that those highly expressive GNN models originally designed for GRL can also be applied to GDL with impressive performance, and that existing complex, equivariant models are not the only solution.

<iframe width="600" height="400" src="https://www.youtube.com/embed/Qom83crI4NE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
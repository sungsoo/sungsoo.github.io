---
layout: post
title: Multi-Level Graph Representation Learning
date: 2025-09-04
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [Multi-Level Graph Representation Learning](https://www.youtube.com/watch?v=Av2BWdd0JWI)

* [Paper](https://dl.acm.org/doi/10.1145/3711115)

## Abstract

Graph representation learning (GRL) aims to map a graph into a low-dimensional vector space while preserving graph topology and node properties. This study proposes a novel GRL model, Multi-Level GRL (simply, ML-GRL), that recursively partitions input graphs by selecting the most appropriate community detection algorithm at each graph or partitioned subgraph. To preserve the relationship between subgraphs, ML-GRL incorporates global graphs that effectively maintain the overall topology. ML-GRL employs a prediction model, which is pre-trained using graph-based features and covers a wide range of graph distributions, to estimate GRL accuracy of each community detection algorithm without partitioning graphs or subgraphs and evaluating them. ML-GRL improves learning accuracy by selecting the most effective community detection algorithm while enhancing learning efficiency from parallel processing of partitioned subgraphs. Through extensive experiments with two different tasks, we demonstrate ML-GRL's superiority over the six representative GRL models in terms of both learning accuracy and efficiency. Specifically, ML-GRL not only improves the accuracy of existing GRL models by 3.68 ~ 47.59% for link prediction and 1.75 ~ 40.90% for node classification but also significantly reduces their running time by 9.63 ~ 62.71% and 7.14 ~ 82.14%, respectively. Our source code is available at https://github.com/pnpy6elp/Multi_Level_GRL.


<iframe width="600" height="400" src="https://www.youtube.com/embed/Av2BWdd0JWI?si=TnPnqv4oHUlUlQG8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
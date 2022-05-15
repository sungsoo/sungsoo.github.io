---
layout: post
title: Query by Sketch Scaling Shortest Path Graph Queries on Very Large Networks
date: 2022-05-15
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Query by Sketch Scaling Shortest Path Graph Queries on Very Large Networks](https://www.youtube.com/watch?v=WqzAWu0ohbs)


---

# Query by Sketch Scaling Shortest Path Graph Queries on Very Large Networks


* Paper: [https://arxiv.org/abs/2104.09733](https://arxiv.org/abs/2104.09733)

## Abstract

Computing shortest paths is a fundamental operation in processing graph data. In many real-world applications, discovering shortest paths between two vertices empowers us to make full use of the underlying structure to understand how vertices are related in a graph, e.g. the strength of social ties between individuals in a social network. In this paper, we study the shortest-path-graph problem that aims to efficiently compute a shortest path graph containing exactly all shortest paths between any arbitrary pair of vertices on complex networks. Our goal is to design an exact solution that can scale to graphs with millions or billions of vertices and edges. To achieve high scalability, we propose a novel method, Query-by-Sketch (QbS), which efficiently leverages offline labelling (i.e., precomputed labels) to guide online searching through a fast sketching process that summarizes the important structural aspects of shortest paths in answering shortest-path-graph queries. We theoretically prove the correctness of this method and analyze its computational complexity. To empirically verify the efficiency of QbS, we conduct experiments on 12 real-world datasets, among which the largest dataset has 1.7 billion vertices and 7.8 billion edges. The experimental results show that QbS can answer shortest-path graph queries in microseconds for million-scale graphs and less than half a second for billion-scale graphs.

<iframe width="600" height="400" src="https://www.youtube.com/embed/WqzAWu0ohbs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


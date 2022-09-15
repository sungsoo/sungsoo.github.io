---
layout: post
title: Katana Graph; A Graph Intelligence Platform 
date: 2022-09-14
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Katana Graph; A Graph Intelligence Platform for High-Performance and Unified Graph Computing](https://www.youtube.com/watch?v=a2EPxRrAvmE)


---

# Katana Graph; A Graph Intelligence Platform for High-Performance and Unified Graph Computing

## Abstract

According to Gartner, Inc., graph processing is one of the top 10 data analytics trends for 2021. It is an emerging application area, as well as a necessary tool for data scientists working with linked datasets (e.g., social, telecommunication, and financial networks; web traffic; and biochemical pathways). Graphs in practical applications tend to be large, and they're getting larger. For example, social networks today can have billions of nodes and edges, so high-performance parallel computing is essential.

To this end, Katana Graph, in collaboration with Intel, has designed a high-performance, easy-to-use graph analytics Python library with (a) highly optimized, parallel implementations of important graph analytics algorithms; (b) a high-level Python interface to write custom parallel algorithms on top of the underlying C++ graph engine; (c) interoperability with pandas, scikit-learn, and Apache Arrow, and tools and libraries in the Intel AI software stack; (d) comprehensive support for extraction, transformation, and loading (ETL) from various formats; and (e) a Metagraph plugin.


<iframe width="600" height="400" src="https://www.youtube.com/embed/a2EPxRrAvmE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Graph Analytics Algorithms in the Library

The key algorithms that are commonly used in graph-processing pipelines come prepackaged in the Katana library. The algorithms that are currently available are listed below:

* **Breadth-first search**: Returns an oriented tree constructed from a breadth-first search starting at a source node
* **Single-source shortest path**: Computes the shortest paths to all the nodes starting from a source node
* **Connected components**: Finds the components (i.e., groups of nodes) of the graph that are connected internally, but not connected to other components
* **PageRank**: Computes the ranking of nodes in the graph based on the structure of incoming links
* **Betweenness centrality**: Computes the centrality of nodes in the graph based on the number of shortest paths that pass through each node
* **Triangle counting**: Counts the number of triangles in a graph
* **Louvain community detection**: Computes the communities of the graph that maximizes the modularity using the Louvain heuristics
* **Subgraph extraction**: Extracts the induced subgraph of the graph
* **Jaccard similarity**: Computes the Jaccard coefficient of a given node to every other node in the graph
* **Community detection using label propagation**: Computes the communities in the graph using a label propagation algorithm
* **Local clustering coefficient functions**: Measures the degree to which nodes in a graph tend to cluster together
* **K-Truss**: Finds the maximal induced subgraph of the graph that contains at least three vertices where every edge is incident to at least K - 2 triangles
* **K-Core**: Finds the maximal subgraph that contains nodes of degree K or more

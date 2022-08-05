---
layout: post
title: Recipe for a General, Powerful, Scalable Graph Transformer
date: 2022-07-30
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Recipe for a General, Powerful, Scalable Graph Transformer](https://www.youtube.com/watch?v=DiLSCReBaTg)


---

# Recipe for a General, Powerful, Scalable Graph Transformer

* Paper "Recipe for a General, Powerful, Scalable Graph Transformer" 
* [https://arxiv.org/abs/2205.12454](https://arxiv.org/abs/2205.12454)
* Authors: Ladislav Rampášek, Mikhail Galkin, Vijay Prakash Dwivedi, Anh Tuan Luu, Guy Wolf, Dominique Beaini


## Abstract

We propose a recipe on how to build a general, powerful, scalable (GPS) graph Transformer with linear complexity and state-of-the-art results on a diverse set of benchmarks. Graph Transformers (GTs) have gained popularity in the field of graph representation learning with a variety of recent publications but they lack a common foundation about what constitutes a good positional or structural encoding, and what differentiates them. In this paper, we summarize the different types of encodings with a clearer definition and categorize them as being local, global or relative. Further, GTs remain constrained to small graphs with few hundred nodes, and we propose the first architecture with a complexity linear to the number of nodes and edges O(N+E) by decoupling the local real-edge aggregation from the fully-connected Transformer. We argue that this decoupling does not negatively affect the expressivity, with our architecture being a universal function approximator for graphs. Our GPS recipe consists of choosing 3 main ingredients: (i) positional/structural encoding, (ii) local message-passing mechanism, and (iii) global attention mechanism. We build and open-source a modular framework GraphGPS that supports multiple types of encodings and that provides efficiency and scalability both in small and large graphs. We test our architecture on 11 benchmarks and show very competitive results on all of them, show-casing the empirical benefits gained by the modularity and the combination of different strategies.


<iframe width="600" height="400" src="https://www.youtube.com/embed/DiLSCReBaTg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
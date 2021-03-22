---
layout: post
title: Temporal Graph Networks for Dynamic Graphs 
date: 2021-03-23
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source

* [TGN: Temporal Graph Networks for Dynamic Graphs](https://www.youtube.com/watch?v=CdNAempch1E)
* [Blog post](https://towardsdatascience.com/temporal-graph-networks-ab8f327f2efe)

---

# TGN: Temporal Graph Networks for Dynamic Graphs


Video for MLSS 2020 Tübingen presenting TGN: Temporal Graph Networks for Dynamic Graphs.

<iframe width="600" height="400" src="https://www.youtube.com/embed/CdNAempch1E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## TGN: Key Insights

* **Memory**: to store the dynamic state of each node. It's updated each time a node is involved in an interaction.
* **Graph Embedding**: when computing the temporal embedding for a node, aggregate the memories of the neighbors.


## TGN: Modules and Training

![](http://sungsoo.github.io/images/tcn_modules1.png)
**Computations performed by TGN on a batch of time-stamped interactions.**

![](http://sungsoo.github.io/images/tcn_modules1.png)
**Flow of operations of TGN used to train the memory-related modules.**


## Conclusion

- **Dynamic graphs** are very common, but have *received little attention so far.*
- We propose **TGN**, which *generalizes existing models* and achieves **SOTA results** on a variety of benchmarks.
- The ablation study shows the **importance of the different modules**.



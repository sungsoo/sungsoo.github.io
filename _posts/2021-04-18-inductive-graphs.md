---
layout: post
title: Inductive Representation Learning on Large Graphs
date: 2021-04-18
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source

* [Inductive Representation Learning on Large Graphs](https://www.youtube.com/watch?v=vinQCnizqDA)

---

# Inductive Representation Learning on Large Graphs

* In this video, I do a deep dive into the Graph SAGE paper!
* The first paper that started pushing the usage of GNNs for super large graphs.

* You'll learn about:
	* All the nitty-gritty details behind Graph SAGE

* [ Graph SAGE paper](https://arxiv.org/abs/1706.02216)
* [Chris Olah on LSTMs](https://colah.github.io/posts/2015-08-Understanding-LSTMs/)

## Abstract
 
*Low-dimensional embeddings* of nodes in large graphs have proved extremely useful in a variety of prediction tasks, from content recommendation to identifying protein functions. However, most existing approaches require that all nodes in the graph are present during training of the embeddings; these previous approaches are inherently transductive and do not naturally generalize to unseen nodes. Here we present GraphSAGE, a general, inductive framework that leverages node feature information (e.g., text attributes) to efficiently generate node embeddings for previously unseen data. Instead of training individual embeddings for each node, we learn a function that generates embeddings by sampling and aggregating features from a node's local neighborhood. Our algorithm outperforms strong baselines on *three inductive node-classification* benchmarks: we classify the category of unseen nodes in evolving information graphs based on citation and Reddit post data, and we show that our algorithm generalizes to completely unseen graphs using a multi-graph dataset of protein-protein interactions. 


<iframe width="600" height="400" src="https://www.youtube.com/embed/vinQCnizqDA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

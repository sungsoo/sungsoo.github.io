---
layout: post
title: Spatio-Temporal Graph Transformer Networks for Pedestrian Trajectory Prediction
date: 2021-06-13
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Spatio-Temporal Graph Transformer Networks for Pedestrian Trajectory Prediction](https://www.youtube.com/watch?v=mj2iBT3lis8)


---


# Spatio-Temporal Graph Transformer Networks for Pedestrian Trajectory Prediction

* [Paper](https://arxiv.org/pdf/2005.08514)

## Abstract

Understanding crowd motion dynamics is critical to real-world applications, e.g., surveillance systems and autonomous driving. This is challenging because it requires effectively modeling the socially aware crowd spatial interaction and complex temporal dependencies. We believe attention is the most important factor for trajectory prediction. In this paper, we present STAR, a Spatio-Temporal grAph tRansformer framework, which tackles trajectory prediction by only attention mechanisms. STAR models intra-graph crowd interaction by TGConv, a novel Transformer-based graph convolution mechanism. The inter-graph temporal dependencies are modeled by separate temporal Transformers. STAR captures complex spatio-temporal interactions by interleaving between spatial and temporal Transformers. To calibrate the temporal prediction for the long-lasting effect of disappeared pedestrians, we introduce a read-writable external memory module, consistently being updated by the temporal Transformer. We show that with only attention mechanism, STAR achieves state-of-the-art performance on 5 commonly used real-world pedestrian prediction datasets. 



<iframe width="600" height="400" src="https://www.youtube.com/embed/mj2iBT3lis8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
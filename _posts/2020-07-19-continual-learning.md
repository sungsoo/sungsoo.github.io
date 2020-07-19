---
layout: post
title: Conditional Channel Gated Networks for Task-Aware Continual Learning
date: 2020-07-19
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [CVPR2020: Transfer/Low-Shot/Semi/Unsupervised Learning](https://www.youtube.com/watch?v=RvFKk3I3nwk&list=PL_bDvITUYucCJu11oY2ufdbaCcZmYZJAL)

----


## Conditional Channel Gated Networks for Task-Aware Continual Learning

### Abstract
 Convolutional Neural Networks experience catastrophic forgetting when optimized on a sequence of learning problems: as they meet the objective of the current training examples, their performance on previous tasks drops drastically. In this work, we introduce a novel framework to tackle this problem with conditional computation. We equip each convolutional layer with task-specific gating modules, selecting which filters to apply on the given input. This way, we achieve two appealing properties. Firstly, the execution patterns of the gates allow to identify and protect important filters, ensuring no loss in the performance of the model for previously learned tasks. Secondly, by using a sparsity objective, we can promote the selection of a limited set of kernels, allowing to retain sufficient model capacity to digest new tasks. Existing solutions require, at test time, awareness of the task to which each example belongs to. This knowledge, however, may not be available in many practical scenarios. Therefore, we additionally introduce a task classifier that predicts the task label of each example, to deal with settings in which a task oracle is not available. We validate our proposal on four continual learning datasets. Results show that our model consistently outperforms existing methods both in the presence and the absence of a task oracle. Notably, on Split SVHN and Imagenet-50 datasets, our model yields up to 23.98% and 17.42% improvement in accuracy w.r.t. competing methods.
 
<iframe width="600" height="400" src="https://www.youtube.com/embed/Qp2g-CzlxjQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


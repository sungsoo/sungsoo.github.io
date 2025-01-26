---
layout: post
title: Deep Symbolic Regression
date: 2025-02-16
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Deep Symbolic Regression](https://www.youtube.com/watch?v=o43X6Hni6tU)

---


# Deep Symbolic Regression

## Abstract


Discovering the underlying mathematical expressions describing a dataset is a core challenge for artificial intelligence. This is the problem of symbolic regression. Despite recent advances in training neural networks to solve complex tasks, deep learning approaches to symbolic regression are underexplored. We propose a framework that leverages deep learning for symbolic regression via a simple idea: use a large model to search the space of small models. Specifically, we use a recurrent neural network to emit a distribution over tractable mathematical expressions and employ a novel risk-seeking policy gradient to train the network to generate better-fitting expressions. Our algorithm outperforms several baseline methods (including Eureqa, the gold standard for symbolic regression) in its ability to exactly recover symbolic expressions on a series of benchmark problems, both with and without added noise. More broadly, our contributions include a framework that can be applied to optimize hierarchical, variable-length objects under a black-box performance metric, with the ability to incorporate constraints in situ, and a risk-seeking policy gradient formulation that optimizes for best-case performance instead of expected performance.
A team of LLNL scientists collaborated on this effort. Brenden Petersen, Mikel Landajuela Larma, Nathan Mundhenk, Claudio Santiago, Soo Kim, and Joanne Kim.

* [Deep symbolic regression: Recovering mathematical expressions from data via risk-seeking policy gradients ](https://openreview.net/forum?id=m5Qsh0kBQG)

Brenden Petersen is the group leader of the Operations Research and Systems Analysis group at Lawrence Livermore National Laboratory. He received his PhD in 2016 at a joint appointment at the University of California, Berkeley and University of California, San Francisco. His PhD background is in biological modeling and simulation. Since joining the Lab almost 5 years ago, his research explores the intersection of simulation and machine learning. His current research interests include deep reinforcement learning for simulation control and discrete optimization.

<iframe width="600" height="400" src="https://www.youtube.com/embed/o43X6Hni6tU?si=spF04Dtpzdt2sqzc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


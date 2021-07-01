---
layout: post
title: Categorical Reparameterization with Gumbel-Softmax
date: 2021-07-12
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Categorical Reparameterization with Gumbel-Softmax](https://www.youtube.com/watch?v=JFgXEbgcT7g)


---

# Categorical Reparameterization with Gumbel-Softmax

* Eric Jang, Shixiang Gu and Ben Poole
* Chris J. Maddison, Andriy Mnih and Yee Whye Teh

---
### Bayesian Deep Learning Workshop
* NIPS 2016
* December 10, 2016 — Centre Convencions Internacional Barcelona, Barcelona, Spain


## Abstract

Categorical variables are a natural choice for representing discrete structure in the
world. However, stochastic neural networks rarely use categorical latent variables
due to the inability to backpropagate through samples. In this work, we present an
efficient gradient estimator that replaces the non-differentiable sample from a categorical distribution with a differentiable sample from a novel Gumbel-Softmax
distribution. This distribution has the essential property that it can be smoothly
annealed into a categorical distribution. We show that our Gumbel-Softmax estimator outperforms state-of-the-art gradient estimators on structured output prediction and unsupervised generative modeling tasks with categorical latent variables,
and enables large speedups on semi-supervised classification.

<iframe width="600" height="400" src="https://www.youtube.com/embed/JFgXEbgcT7g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



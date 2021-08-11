---
layout: post
title: Sum-Product Networks; Powerful Models with Tractable Inference
date: 2021-08-22
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Sum-Product Networks; Powerful Models with Tractable Inference](https://www.youtube.com/watch?v=eqclcdmkEQo)


---


# Sum-Product Networks - Powerful Models with Tractable Inference

## Abstract

Big data makes it possible in principle to learn very rich *probabilistic models*, but inference in them is prohibitively expensive. Since inference is typically a subroutine of learning, in practice learning such models is very hard. **Sum-product networks (SPNs)** are a new model class that squares this circle by providing maximum flexibility while guaranteeing *tractability*. In contrast to Bayesian networks and Markov random fields, SPNs can remain tractable even in the absence of conditional independence. SPNs are defined recursively: an SPN is either a univariate distribution, a product of SPNs over disjoint variables, or a weighted sum of SPNs over the same variables. It's easy to show that the partition function, all marginals and all conditional MAP states of an SPN can be computed in time linear in its size. SPNs have most tractable distributions as special cases, including hierarchical mixture models, thin junction trees, and nonrecursive probabilistic context-free grammars. I will present generative and discriminative algorithms for learning SPN weights, and an algorithm for learning SPN structure. SPNs have achieved impressive results in a wide variety of domains, including object recognition, image completion, collaborative filtering, and click prediction. Our algorithms can easily learn SPNs with many layers of latent variables, making them arguably the most powerful type of deep learning to date. (Joint work with Rob Gens and Hoifung Poon.)

<iframe width="600" height="400" src="https://www.youtube.com/embed/eqclcdmkEQo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

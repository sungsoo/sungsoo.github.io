---
layout: post
title: A Probabilistic Model for Joint Inference from Differential Equations
date: 2021-11-17
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [A Probabilistic Model for Joint Inference from Differential Equations and Data](https://www.youtube.com/watch?v=yeIMr9pusP8)


---


# A Probabilistic Model for Joint Inference from Differential Equations and Data

## Abstract

- A Probabilistic State Space Model for Joint Inference from Differential Equations and Data
- Jonathan Schmidt, Nicholas Krämer, and Philipp Hennig
- Advances in Neural Information Processing Systems (NeurIPS) 2021

* Paper: [https://arxiv.org/abs/2103.10153](https://arxiv.org/abs/2103.10153)
* Code: [https://github.com/schmidtjonathan/probabilistic-ssm](https://github.com/schmidtjonathan/probabilistic-ssm)


Mechanistic models with differential equations are a key component of scientific applications of machine learning. Inference in such models is usually computationally demanding, because it involves repeatedly solving the differential equation. The main problem here is that the numerical solver is hard to combine with standard inference techniques. Recent work in probabilistic numerics has developed a new class of solvers for ordinary differential equations (ODEs) that phrase the solution process directly in terms of Bayesian filtering. We here show that this allows such methods to be combined very directly, with conceptual and numerical ease, with latent force models in the ODE itself. It then becomes possible to perform approximate Bayesian inference on the latent force as well as the ODE solution in a single, linear complexity pass of an extended Kalman filter / smoother - that is, at the cost of computing a single ODE solution. We demonstrate the expressiveness and performance of the algorithm by training, among others, a non-parametric SIRD model on data from the COVID-19 outbreak.



---
layout: post
title: A Connection between Probability, Physics and Neural Network
date: 2025-01-30
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [A Connection between Probability, Physics and Neural Network](https://www.youtube.com/watch?v=8eiBsLfrEw8&list=PLuD_SqLtxSdW5aasHsFTNw_MrZrtu5tZ3)

---


# A Connection between Probability, Physics and Neural Network

## Abstract

I illustrate an approach that can be exploited for constructing neural networks which a priori obey physical laws. We start with a simple single-layer neural network (NN) but refrain from choosing the activation functions yet. Under certain conditions and in the infinite-width limit, we may apply the central limit theorem, upon which the NN output becomes Gaussian. We may then investigate and manipulate the limit network by falling back on Gaussian process (GP) theory. It is observed that linear operators acting upon a GP again yield a GP. This also holds true for differential operators defining differential equations and describing physical laws. If we demand the GP, or equivalently the limit network, to obey the physical law, then this yields an equation for the covariance function or kernel of the GP, whose solution equivalently constrains the model to obey the physical law. This we may term the physics-consistency condition for the GP. The central limit theorem then suggests also a condition for physics-consistency of (infinite) NNs. Then, NNs can be constructed to obey a physical law e.g. by choosing the activation functions such that they match a particular kernel in the infinite-width limit. The activation functions constructed in this way guarantee the NN to a priori obey the physics, up to the approximation error of non-infinite network width. Simple examples of the homogeneous 1D-Helmholtz equation are discussed and compared to naive kernels and activations.

<iframe width="600" height="400" src="https://www.youtube.com/embed/8eiBsLfrEw8?si=cOnrwnwCMrrIQ91X" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
---
layout: post
title: Neural Ordinary Differential Equations
date: 2020-08-05
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Neural Ordinary Differential Equations](https://www.youtube.com/watch?v=V6nGT0Gakyg)

----


# Neural Ordinary Differential Equations

## Abstract

We introduce a new family of deep neural network models. Instead of specifying a discrete sequence of hidden layers, we *parameterize the derivative of the hidden state* using a neural network. The output of the network is computed using a black-box differential equation solver. These continuous-depth models have constant memory cost, adapt their evaluation strategy to each input, and can explicitly trade numerical precision for speed. We demonstrate these properties in continuous-depth residual networks and *continuous-time latent variable models*. We also construct *continuous normalizing flows*, a generative model that can train by maximum likelihood, without partitioning or ordering the data dimensions. For training, we show how to scalably backpropagate through any ODE solver, without access to its internal operations. This allows end-to-end training of ODEs within larger models.

<iframe width="600" height="400" src="https://www.youtube.com/embed/V6nGT0Gakyg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

* [Source code](https://github.com/rtqichen/torchdiffeq)

## Neural Ordinary Differential Equations - Algorithm Review

<iframe width="600" height="400" src="https://www.youtube.com/embed/BzTyEJvnyd8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="600" height="400" src="https://www.youtube.com/embed/2pP0Puj15Nc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
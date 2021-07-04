---
layout: post
title: Neural Differential Equations
date: 2021-07-17
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Neural Differential Equations](https://www.youtube.com/watch?v=AD3K8j12EIE)


---

# Neural Differential Equations

This won the best paper award at NeurIPS (the biggest AI conference of the year) out of over 4800 other research papers! Neural Ordinary Differential Equations is the official name of the paper and in it the authors introduce a new type of neural network. This new network doesn't have any layers! Its framed as a differential equation, which allows us to use differential equation solvers on it to approximate the underlying function of time series data. Its very cool and will ultimately allow us to learn from irregular time series datasets more efficiently, which applies to many different industries. I'll cover all the prerequisites in this video and point to helpful resources down below. Enjoy!  

* Paper: [NerIPS 2018 paper](https://papers.nips.cc/paper/2018/file/69386f6bb1dfed68692a24c8686939b9-Paper.pdf)


## Abstract

We introduce a new family of deep neural network models. Instead of specifying a discrete sequence of hidden layers, we parameterize the derivative of the hidden state using a neural network. The output of the network is computed using a *black-box differential equation solver.* These continuous-depth models have constant memory cost, adapt their evaluation strategy to each input, and can explicitly trade numerical precision for speed. We demonstrate these properties in continuous-depth residual networks and continuous-time latent variable models. We also construct *continuous normalizing flows*, a generative model that can train by maximum likelihood, without partitioning or ordering the data dimensions. For training, we show how to scalably backpropagate through any ODE solver, without access to its internal operations. This allows end-to-end training of ODEs within larger models.


<iframe width="600" height="400" src="https://www.youtube.com/embed/AD3K8j12EIE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Code for this video
[https://github.com/llSourcell/Neural_Differential_Equations/](https://github.com/llSourcell/Neural_Differential_Equations/)
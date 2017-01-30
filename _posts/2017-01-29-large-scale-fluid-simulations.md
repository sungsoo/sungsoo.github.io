---
layout: post
title: Large-Scale Fluid Simulations On Your Graphics Card
date: 2017-01-27
categories: [computer science]
tags: [computer graphics]

---

Large-Scale Fluid Simulations On Your Graphics Card
===

## A scalable Schur-complement fluids solver for heterogeneous compute platforms


## Abstract

We present a scalable parallel solver for the pressure Poisson equation in fluids simulation which can accommodate complex irregular domains in the order of a billion degrees of freedom, using a single server or workstation fitted with GPU or Many-Core accelerators. The design of our numerical technique is attuned to the subtleties of heterogeneous computing, and allows us to benefit from the high memory and compute bandwidth of GPU accelerators even for problems that are too large to fit entirely on GPU memory. This is achieved via algebraic formulations that adequately increase the density of the GPU-hosted computation as to hide the overhead of offloading from the CPU, in exchange for accelerated convergence. Our solver follows the principles of Domain Decomposition techniques, and is based on the Schur complement method for elliptic partial differential equations. A large uniform grid is partitioned in non-overlapping subdomains, and bandwidth-optimized (GPU or Many-Core) accelerator cards are used to efficiently and concurrently solve independent Poisson problems on each resulting subdomain. Our novel contributions are centered on the careful steps necessary to assemble an accurate global solver from these constituent blocks, while avoiding excessive communication or dense linear algebra. We ultimately produce a highly effective Conjugate Gradients preconditioner, and demonstrate scalable and accurate performance on high-resolution simulations of water and smoke flow.

<iframe width="600" height="400" src="https://www.youtube.com/embed/Yd4blFeRTEw" frameborder="0" allowfullscreen></iframe>

The paper "A scalable Schur-complement fluids solver for heterogeneous compute platforms" is available here:

* [http://graphics.cs.wisc.edu/Papers/20...](http://graphics.cs.wisc.edu/Papers/2016/LMAS16/)
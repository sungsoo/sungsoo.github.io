---
layout: post
title: Water Wave Simulation with Dispersion Kernels
date: 2016-12-29
categories: [computer science]
tags: [computer graphics]

---

The paper "Dispersion Kernels for Water Wave Simulation" is available here:

[http://www.gmrv.es/Publications/2016/...](http://www.gmrv.es/Publications/2016/CMTKPO16/)

# Water Wave Simulation with Dispersion Kernels

[ACM Trans. on Graphics (Proc. of ACM SIGGRAPH Asia), Volume 35, Number 6 - 2016](http://www.gmrv.es/Publications/2016/CMTKPO16/main.pdf)

## Abstract

We propose a method to simulate the rich, scale-dependent dynamics of water waves. Our method preserves the dispersion properties of real waves, yet it supports interactions with obstacles and is computationally efficient. Fundamentally, it computes *wave accelerations* by way of applying a dispersion kernel as a spatially variant filter, which we are able to compute efficiently using two core technical contributions. First, we design novel, accurate, and compact pyramid kernels which compensate for low-frequency truncation errors. Second, we design a *shadowed convolution operation* that efficiently accounts for obstacle interactions by modulating the application of the dispersion kernel. We demonstrate a wide range of behaviors, which include capillary waves, gravity waves, and interactions with static and dynamic obstacles, all from within a single simulation.


<iframe width="600" height="400" src="https://www.youtube.com/embed/FeMSEaHR8aw" frameborder="0" allowfullscreen></iframe>


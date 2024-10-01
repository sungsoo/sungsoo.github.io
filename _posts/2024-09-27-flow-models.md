---
layout: post
title: Improving and Generalizing Flow-Based Generative Models 
date: 2024-09-27
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Improving and Generalizing Flow-Based Generative Models with Minibatch Optimal Transport](https://www.youtube.com/watch?v=UhDtH7Ia9Ag)

---


# Improving and Generalizing Flow-Based Generative Models with Minibatch Optimal Transport


## Abstract

Continuous normalizing flows (CNFs) are an attractive generative modeling technique, but they have been held back by limitations in their simulation-based maximum likelihood training. We introduce the generalized conditional flow matching (CFM) technique, a family of simulation-free training objectives for CNFs. CFM features a stable regression objective like that used to train the stochastic flow in diffusion models but enjoys the efficient inference of deterministic flow models. In contrast to both diffusion models and prior CNF training algorithms, CFM does not require the source distribution to be Gaussian or require evaluation of its density. A variant of our objective is optimal transport CFM (OT-CFM), which creates simpler flows that are more stable to train and lead to faster inference, as evaluated in our experiments. Furthermore, OT-CFM is the first method to compute dynamic OT in a simulation-free way. Training CNFs with CFM improves results on a variety of conditional and unconditional generation tasks, such as inferring single cell dynamics, unsupervised image translation, and Schrödinger bridge inference.

Speaker: Alexander Tong - [https://www.alextong.net/](https://www.alextong.net/)

<iframe width="600" height="400" src="https://www.youtube.com/embed/UhDtH7Ia9Ag?si=YFoAV6ziDvl5jS1M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
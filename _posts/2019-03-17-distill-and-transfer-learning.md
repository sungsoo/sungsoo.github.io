---
layout: post
title: Distill and transfer learning for robust multitask RL
date: 2019-03-17
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Distill and transfer learning for robust multitask RL](https://www.youtube.com/watch?v=scf7Przmh7c)

---


Distill and transfer learning for robust multitask RL
===

* Date: March 15, 2018
* Speaker: Yee Whye Teh
* Affiliation: University of Oxford

## Abstract

Most deep reinforcement learning algorithms are data inefficient in complex and rich environments, limiting their applicability to many scenarios. One direction for improving data efficiency is *multitask learning* with shared neural network parameters, where efficiency may be improved through transfer across related tasks. In practice, however, this is not usually observed, because *gradients* from different tasks can interfere negatively, making learning unstable and sometimes even less data efficient. Another issue is the different reward schemes between tasks, which can easily lead to one task dominating the learning of a shared model. We propose a new approach for joint training of multiple tasks, which we refer to as **Distral** (DIStill & TRAnsfer Learning). Instead of sharing parameters between the different workers, we propose to share a distilled policy that captures common behavior across tasks. Each worker is trained to solve its own task while constrained to stay close to the shared policy, while the shared policy is trained by distillation to be the centroid of all task policies. Both aspects of the learning process are derived by optimizing a joint objective function. We show that our approach supports efficient transfer on complex 3D environments, outperforming several related methods. Moreover, the proposed learning process is more robust and more stable---attributes that are critical in deep reinforcement learning.


<iframe width="600" height="400" src="https://www.youtube.com/embed/scf7Przmh7c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
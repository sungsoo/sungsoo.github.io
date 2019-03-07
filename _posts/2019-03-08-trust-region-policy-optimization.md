---
layout: post
title: Trust Region Policy Optimization
date: 2019-03-08
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [TRPO (Trust Region Policy Optimization) : In depth Research Paper Review](https://www.youtube.com/watch?v=CKaN5PgkSBc&feature=youtu.be)

---

Trust Region Policy Optimization
===

Trust Region Policy Optimization is a fundamental paper for people working in Deep Reinforcement Learning (along with PPO or Proximal Policy Optimization). From training Mujoco to games, TRPO has been the goto choice. It is implemented by both Unity-ML as well as OpenAI Baselines.

## Abstract

We describe an iterative procedure for optimizing policies, with guaranteed monotonic improvement. By making several approximations to the theoretically-justified procedure, we develop a practical algorithm, called **Trust Region Policy Optimization (TRPO)**. This algorithm is similar to natural policy gradient methods and is effective for optimizing large nonlinear policies such as neural networks. Our experiments demonstrate its *robust performance* on a wide variety of tasks: learning simulated robotic swimming, hopping, and walking gaits; and playing Atari games using images of the screen as input. Despite its approximations that deviate from the theory, TRPO tends to give *monotonic improvement*, with little tuning of hyperparameters.

* [Paper](https://arxiv.org/pdf/1502.05477)

<iframe width="600" height="400" src="https://www.youtube.com/embed/CKaN5PgkSBc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

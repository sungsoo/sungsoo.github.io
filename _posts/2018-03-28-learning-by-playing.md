---
layout: post
title: Learning by Playing
date: 2018-03-28
categories: [computer science]
tags: [machine learning]

---

Learning by Playing - Solving Sparse Reward Tasks from Scratch
========

* Authors: Martin Riedmiller, Roland Hafner, Thomas Lampe, Michael Neunert, Jonas Degrave, Tom Van de Wiele, Volodymyr Mnih, Nicolas Heess, Jost Tobias Springenberg

## Abstract

We propose *Scheduled Auxiliary Control* (SAC-X), a new learning paradigm in the context of *Reinforcement Learning* (RL). SAC-X enables learning of complex behaviors - from scratch - in the presence of multiple sparse reward signals. To this end, the agent is equipped with a set of general auxiliary tasks, that it attempts to learn simultaneously via *off-policy RL*. The key idea behind our method is that *active* (*learned*) scheduling and execution of auxiliary policies allows the agent to efficiently explore its environment - enabling it to excel at sparse reward RL. Our experiments in several challenging robotic manipulation settings demonstrate the power of our approach.

<iframe width="600" height="400" src="https://www.youtube.com/embed/veWkBsK0nwU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


* Paper : [PDF](https://arxiv.org/pdf/1802.10567)

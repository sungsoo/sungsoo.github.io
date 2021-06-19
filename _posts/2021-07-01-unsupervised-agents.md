---
layout: post
title: Unsupervised Intelligent Agents
date: 2021-07-01
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Unsupervised Intelligent Agents](https://www.youtube.com/watch?v=Amow6WIacKY)


---

# Unsupervised Intelligent Agents

## Abstract

How to build general machines that learn intelligent behaviors inside of complex environments *without human supervision*?

From first principles, we consider all possible agents and then show which of them follow *general* rather than *narrow* objectives. We show that these agents use powerful world models to learn representations, explore using the expected information gain, and choose actions that maximally influence the world. The second half of the talk provides an overview of existing implementations of this recipe and key open challenges.

## MOTIVATION

Humans have a remarkable ability to continually learn and adapt to new scenarios over the duration of their lifetime (Smith & Gasser, 2005). This ability is referred to as *never ending learning*, also known as *continual learning* or *lifelong learning*. Never-ending learning is the constant development of increasingly complex behaviors and the process of building complicated skills on top of those already developed (Ring, 1997), while being able to reapply, adapt and generalise its abilities to new situations.

A never-ending learner has the following desiderata:

* It learns behaviors and skills while solving its tasks.
* It invents new subtasks that may later serve as stepping stones.
* It learns hierarchically, i.e. skills learned now can be built upon later.
* It learns without *ergodic* or *resetting* assumptions on the underlying **(PO)MDP**.
* It learns *without episode boundaries*.
* It learns in a *single life* without leveraging multiple episodes of experience.

There are several facets to building AI agents with never-ending learning abilities. In this workshop, we identify key themes including open-ended learning, cognitive sciences, developmental robotics, perceptual and temporal abstractions and world modelling. We are proposing a unique format for our workshop where we invite speakers to prepare a short talk presenting their views on the topic. Each talk will be followed by a discussion session chaired by an invited panelist. We hope that our format can enable a dialogue between a diverse set of views on never-ending learning and inspire future research directions.

<iframe width="600" height="400" src="https://www.youtube.com/embed/Amow6WIacKY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

This is an invited talk at the ICLR 2021 workshops on Never-Ending Reinforcement Learning ([https://sites.google.com/view/neveren...](https://sites.google.com/view/neverendingrl)) and Self-Supervision for Reinforcement Learning ([https://sslrlworkshop.github.io/](https://sslrlworkshop.github.io/)).



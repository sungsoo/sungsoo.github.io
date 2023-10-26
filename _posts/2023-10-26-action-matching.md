---
layout: post
title: Action Matching; Learning Stochastic Dynamics from Samples 
date: 2023-10-26
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Action Matching; Learning Stochastic Dynamics from Samples](https://www.youtube.com/watch?v=AdesAB80oRM)

---

# Action Matching; Learning Stochastic Dynamics from Samples

* Speaker: Kirill Neklyudov
* Valence Portal is the home of the AI for drug discovery community. Join for more details on this talk and to connect with the speakers: [https://portal.valencelabs.com/logg](https://portal.valencelabs.com/logg)


## Abstract 

Learning the continuous dynamics of a system from snapshots of its temporal marginals is a problem which appears throughout natural sciences and machine learning, including in quantum systems, single-cell biological data, and generative modeling. In these settings, we assume access to cross-sectional samples that are uncorrelated over time, rather than full trajectories of samples. In order to better understand the systems under observation, we would like to learn a model of the underlying process that allows us to propagate samples in time and thereby simulate entire individual trajectories. In this work, we propose Action Matching, a method for learning a rich family of dynamics using only independent samples from its time evolution. We derive a tractable training objective, which does not rely on explicit assumptions about the underlying dynamics and does not require back-propagation through differential equations or optimal transport solvers. Inspired by connections with optimal transport, we derive extensions of Action Matching to learn stochastic differential equations and dynamics involving creation and destruction of probability mass. Finally, we showcase applications of Action Matching by achieving competitive performance in a diverse set of experiments from biology, physics, and generative modeling.


<iframe width="600" height="400" src="https://www.youtube.com/embed/AdesAB80oRM?si=gPHYAN66pya9kn5t" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
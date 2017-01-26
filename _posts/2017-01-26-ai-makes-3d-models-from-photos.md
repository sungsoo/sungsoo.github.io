---
layout: post
title: AI Makes 3D Models From Photos
date: 2017-01-26
categories: [computer science]
tags: [computer graphics, machine learning]

---

AI Makes 3D Models From Photos
==

## Abstract

We study the problem of *3D object generation*. We propose a novel framework, namely *3D Generative Adversarial Network* (3D-GAN), which generates 3D objects from a probabilistic space by leveraging recent advances in volumetric convolutional networks and generative adversarial nets. The benefits of our model are three-fold: first, the use of an adversarial criterion, instead of traditional heuristic criteria, enables the generator to capture object structure implicitly and to synthesize high-quality 3D objects; second, the generator establishes a mapping from a low-dimensional probabilistic space to the space of 3D objects, so that we can sample objects without a reference image or CAD models, and explore the 3D object manifold; third, the adversarial discriminator provides a powerful 3D shape descriptor which, learned without supervision, has wide applications in 3D object recognition. Experiments demonstrate that our method generates high-quality 3D objects, and our unsupervisedly learned features achieve impressive performance on 3D object recognition, comparable with those of supervised learning methods.

<iframe width="600" height="400" src="https://www.youtube.com/embed/HO1LYJb818Q" frameborder="0" allowfullscreen></iframe>

The paper "Learning a Probabilistic Latent Space of Object Shapes 
via 3D Generative-Adversarial Modeling" and its source code is available here:

* [http://3dgan.csail.mit.edu/](http://3dgan.csail.mit.edu/)

<iframe width="600" height="400" src="https://www.youtube.com/embed/mfx7uAkUtCI" frameborder="0" allowfullscreen></iframe>
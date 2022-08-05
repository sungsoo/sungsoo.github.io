---
layout: post
title: Ab-Initio Potential Energy Surfaces 
date: 2022-08-04
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Ab-Initio Potential Energy Surfaces by Pairing GNNs with Neural Wave Functions](https://www.youtube.com/watch?v=dNnFFhWhSJQ)


---

# Ab-Initio Potential Energy Surfaces by Pairing GNNs with Neural Wave Functions

* Paper "Ab-Initio Potential Energy Surfaces by Pairing GNNs with Neural Wave Functions": [https://arxiv.org/abs/2110.05064](https://arxiv.org/abs/2110.05064)
* Authors: Nicholas Gao, Stephan Günnemann


## Abstract

Solving the Schrödinger equation is key to many quantum mechanical properties. However, an analytical solution is only tractable for single-electron systems. Recently, neural networks succeeded at modeling wave functions of many-electron systems. Together with the variational Monte-Carlo (VMC) framework, this led to solutions on par with the best known classical methods. Still, these neural methods require tremendous amounts of computational resources as one has to train a separate model for each molecular geometry. In this work, we combine a Graph Neural Network (GNN) with a neural wave function to simultaneously solve the Schrödinger equation for multiple geometries via VMC. This enables us to model continuous subsets of the potential energy surface with a single training pass. Compared to existing state-of-the-art networks, our Potential Energy Surface Network PESNet speeds up training for multiple geometries by up to 40 times while matching or surpassing their accuracy. This may open the path to accurate and orders of magnitude cheaper quantum mechanical calculations.


<iframe width="600" height="400" src="https://www.youtube.com/embed/dNnFFhWhSJQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
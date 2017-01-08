---
layout: post
title: Neural Network Learns The Physics of Fluids and Smoke
date: 2017-01-09
categories: [computer science]
tags: [computer graphics, machine learning]

---

Neural Network Learns The Physics of Fluids and Smoke
===

## Abstract

Real-time simulation of fluid and smoke is a long standing problem in computer graphics, where state-of-the-art approaches require large compute resources, making real-time applications often impractical. In this work, we propose a data-driven approach that leverages the approximation power of deep-learning methods with the precision of standard fluid solvers to obtain both fast and highly realistic simulations. The proposed method solves the incompressible Euler equations following the standard operator splitting method in which a large, often ill-condition linear system must be solved. We propose replacing this system by learning a Convolutional Network (ConvNet) from a training set of simulations using a semi-supervised learning method to minimize long-term velocity divergence.

ConvNets are amenable to efficient GPU implementations and, unlike exact iterative solvers, have fixed computational complexity and latency. The proposed hybrid approach restricts the learning task to a linear projection without modeling the well understood advection and body forces. We present real-time 2D and 3D simulations of fluids and smoke; the obtained results are realistic and show good generalization properties to unseen geometry.

<iframe width="600" height="400" src="https://www.youtube.com/embed/iOWamCtnwTc" frameborder="0" allowfullscreen></iframe>

The paper "Accelerating Eulerian Fluid Simulation With Convolutional 
Networks" and its source code is available here:

* [http://cims.nyu.edu/~schlacht/CNNFlui...](http://cims.nyu.edu/~schlacht/CNNFluids.htm)
* [http://cims.nyu.edu/~schlacht/CNNFluids.htm](http://cims.nyu.edu/~schlacht/CNNFluids.htm)
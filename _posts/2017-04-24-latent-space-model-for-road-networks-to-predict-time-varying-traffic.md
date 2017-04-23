---
layout: post
title:  Latent Space Model for Road Networks to Predict Time-Varying Traffic
date: 2017-04-24
categories: [computer science]
tags: [big data, machine learning]

---


Latent Space Model for Road Networks to Predict Time-Varying Traffic
===

* Authors: Dingxiong Deng, Cyrus Shahabi, Ugur Demiryurek, Linhong Zhu, Rose Yu, Yan Liu
* [KDD, 2016.](https://arxiv.org/pdf/1602.04301) 

## Abstract 

*Real-time traffic prediction* from high-fidelity spatiotemporal traffic sensor datasets is an important problem for intelligent transportation systems and sustainability. However, it is challenging due to the complex topological dependencies and high dynamics associated with changing road conditions. In this paper, we propose a *Latent Space Model for Road Networks* (**LSM-RN**) to address these challenges. In particular, given a series of road network snapshots, we learn the attributes of vertices in latent spaces which capture both *topological* and *temporal* properties. As these latent attributes are time-dependent, they can estimate how traffic patterns form and evolve. In addition, we present an incremental online algorithm which sequentially and adaptively learn the latent attributes from the temporal graph changes. 

Our framework enables real-time traffic prediction by 
1) exploiting *real-time sensor readings* to adjust/update the existing latent spaces, and 
2) training as data arrives and making *predictions on-the-fly* with given data. 
By conducting extensive experiments with a large volume of real-world traffic sensor data, we demonstrate the utility superiority of our framework for real-time traffic prediction on large road networks over competitors as well as a baseline graph-based LSM.

<iframe width="600" height="400" src="https://www.youtube.com/embed/b5oQqDC39HU" frameborder="0" allowfullscreen></iframe>
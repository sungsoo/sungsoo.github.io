---
layout: post
title: Deep Learning Program Hallucinates Videos 
date: 2017-01-18
categories: [computer science]
tags: [machine learning]

---


Deep Learning Program Hallucinates Videos 
======

## Abstract
We capitalize on large amounts of unlabeled video in order to learn a model of scene dynamics for both video recognition tasks (e.g. action classification) and video generation tasks (e.g. future prediction). We propose a generative adversarial network for video with a spatio-temporal convolutional architecture that untangles the scene's foreground from the background. Experiments suggest this model can generate tiny videos up to a second at full frame rate better than simple baselines, and we show its utility at predicting plausible futures of static images. Moreover, experiments and visualizations show the model internally learns useful features for recognizing actions with minimal supervision, suggesting scene dynamics are a promising signal for representation learning. We believe generative video models can impact many applications in video understanding and simulation.

<iframe width="600" height="400" src="https://www.youtube.com/embed/oitGRdHFNWw" frameborder="0" allowfullscreen></iframe>

The paper "Generating Videos with Scene Dynamics" and its source code, and a pre-trained network is available here:

* [Paper](http://web.mit.edu/vondrick/tinyvideo/)
---
layout: post
title: TensorTraffic
date: 2018-01-27
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [TensorTraffic - traffic prediction using machine learning ](https://www.youtube.com/watch?v=XqxwnbKHEEs)

---

## TensorTraffic - traffic prediction using machine learning 

### Abstract

Together with an international group of scientists, I am developing TensorFlow-based tool, **TensorTraffic**, for *predicting traffic simulation outcomes*, such as delays / total waiting times on a red signal, as a function of traffic control settings. We achieved great results, which may find applications in transport planning, real-time traffic management and many other fields.

First, I will talk about a goal of the research and problem we would like to solve, which is: *approximating traffic simulation outcomes fast* and with an *acceptable accuracy*. The motivation behind this goal is to have a **meta-model of traffic**, which can allow to effectively evaluate quality of a large number of settings (e.g., traffic control strategies or road infrastructure settings).

Then, I will explain our approach and experiemnts. We built a dataset consisting of almost 120,000 traffic simulation scenarios, using *Traffic Simulation Framework* software, each case corresponded to a different traffic signal control strategy, simulations computed the total waiting time of all cars on a red signal in a given region of Warsaw (Stara Ochota district, 15 crossroads with traffic signals). Then, we built *meta-models* based on machine learning, in order to approximate outcomes of traffic simulations faster and with an acceptable accuracy. 

First, we obtained very good accuracy of predictions using *neural networks* (average error 1.18%), later we even improved these results using **XGBoost** (average error lower than 1%). What is important, results of approximations can be obtained a few orders of magnitude *faster* than by running traffic simulations.

Finally, I will tell about conclusions and possible directions of a future research. I will show how achieved results may be applied in *real-time traffic management* and *transport planning*, which may lead to significant reduction of the required time and cost of traffic engineering works, as well as better results in terms of traffic efficiency. Thus, this may lead to developing *AI-based tools* able to support traffic engineers in their work. An interesting conclusion is that similar approach may be used in many other cases, in which it is required to run a large number of simulations, e.g., weather forecast, medicine, bioinformatics. There may be also important theoretical conclusions, related to automata theory and computational complexity.

<iframe width="600" height="400" src="https://www.youtube.com/embed/XqxwnbKHEEs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
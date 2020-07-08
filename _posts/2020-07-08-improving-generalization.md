---
layout: post
title: Improving Generalization by Self-Training & Self Distillation
date: 2020-07-08
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Improving Generalization by Self-Training & Self Distillation](https://www.youtube.com/watch?v=MvM9J1lj1a8)

----


# Improving Generalization by Self-Training & Self Distillation

## Abstract
In supervised learning we often seek a model which minimizes (to epsilon optimality) a loss function over a training set, possibly subject to some (implicit or explicit) regularization. Suppose you train a model this way and read out the predictions it makes over the training inputs, which may slightly differ from the training targets due to the epsilon optimality. Now suppose you treat these predictions as new target values, and retrain another model from scratch using those predictions instead of the original target values. Surprisingly, the second model can often outperform the original model in terms of accuracy on the test set. Actually, we may repeat this loop a few times, and each time see an increase in the generalization performance. This might sound strange as such a supervised self-training process (aka self-distillation) does not receive any new information about the task and solely evolves by retraining itself. In this talk, I argue such self-training process induces additional regularization, which gets amplified in each round of retraining. In fact, I will rigorously characterize such regularization effects when learning the function in Hilbert space. The latter setting can relate to neural networks with infinite width. I will conclude by discussing some open problems in the area of self-training and self-distillation.

* Speaker: Hossein Mobahi, Google Research

<iframe width="600" height="400" src="https://www.youtube.com/embed/MvM9J1lj1a8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
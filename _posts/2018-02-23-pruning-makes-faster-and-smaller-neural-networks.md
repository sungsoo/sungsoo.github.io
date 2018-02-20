---
layout: post
title: Pruning Makes Faster and Smaller Neural Networks 
date: 2018-02-23
categories: [computer science]
tags: [machine learning]

---


# Pruning Makes Faster and Smaller Neural Networks

## Abstract

Many state-of-the-art computer vision algorithms use large scale *convolutional neural networks* (CNNs) as basic building blocks. These CNNs are known for their huge number of parameters, high redundancy in weights, and tremendous computing resource consumptions. This paper presents a learning algorithm to simplify and speed up these CNNs. Specifically, we introduce a "**try-and-learn**" algorithm to train pruning agents that remove unnecessary CNN filters in a data-driven way. With the help of a novel *reward function*, our agents removes a significant number of filters in CNNs while maintaining performance at a desired level. Moreover, this method provides an easy control of the tradeoff between network performance and its scale. Performance of our algorithm is validated with comprehensive pruning experiments on several popular CNNs for *visual recognition* and *semantic segmentation* tasks.


<iframe width="600" height="400" src="https://www.youtube.com/embed/3yOZxmlBG3Y" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


The paper "*Learning to Prune Filters in Convolutional Neural Networks*" is available here:

[https://arxiv.org/pdf/1801.07365.pdf](https://arxiv.org/pdf/1801.07365.pdf)

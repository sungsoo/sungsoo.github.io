---
layout: post
title: The Information Bottleneck Theory of Deep Learning
date: 2024-02-27
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Information Theory of Deep Learning](https://www.youtube.com/watch?v=bLqJHjXihK8&list=PLe0J3_6vYq7s4Xm5TEhJ_uTn9x3l9Y4Hc)

---

# The Information Bottleneck Theory of Deep Learning

* EE380: Computer Systems Colloquium Seminar
* Information Theory of Deep Learning
* Speaker: Naftali Tishby, Computer Science, Hebrew Univerisity


## Abstract


I will present a novel comprehensive theory of large scale learning with Deep Neural Networks, based on the correspondence between Deep Learning and the Information Bottleneck framework. The new theory has the following components:

1. rethinking Learning theory; I will prove a new generalization bound, the input-compression bound, which shows that compression of the representation of input variable is far more important for good generalization than the dimension of the network hypothesis class, an ill defined notion for deep learning.

2. I will prove that for large scale Deep Neural Networks the mutual information on the input and the output variables, for the last hidden layer, provide a complete characterization of the sample complexity and accuracy of the network. This makes the information Bottleneck bound for the problem as the optimal trade-off between sample complexity and accuracy with ANY learning algorithm.

3. I will show how Stochastic Gradient Descent, as used in Deep Learning, achieves this optimal bound. In that sense, Deep Learning is a method for solving the Information Bottleneck problem for large scale supervised learning problems. The theory provide a new computational understating of the benefit of the hidden layers, and gives concrete predictions for the structure of the layers of Deep Neural Networks and their design principles. These turn out to depend solely on the joint distribution of the input and output and on the sample size.

Based partly on works with Ravid Shwartz-Ziv and Noga Zaslavsky.

About the Speaker:
Dr. Naftali Tishby is a professor of Computer Science , and the incumbent of the Ruth and Stan Flinkman Chair for Brain Research at the Edmond and Lily Safra Center for Brain Science (ELSC) at the Hebrew University of Jerusalem. He is one of the leaders of machine learning research and computational neuroscience in Israel and his numerous ex - students serve at key academic and industrial research positions all over the world.
Prof. Tishby was the founding chair of the new computer - engineering program, and a director of the Leibnitz research center in computer science, at the Hebrew University.

Tishby received his PhD in theoretical physics from the Hebrew university in 1985 and was a research staff member at MIT and Bell Labs from 1985 and 1991. Prof. Tishby was also a visiting professor at Princeton NECI, University of Pennsylvania, UCSB, and IBM research.

His current research is at the interface between computer science, statistical physics, and computational neuroscience. He pioneered various applications of statistical physics and information theory in computational learning theory. More recently, he has been working on the foundations of biological information processing and the connections between dynamics and information. He has introduced with his colleagues new theoretical frameworks for optimal adaptation an d efficient information representation in biology, such as the Information Bottleneck method and the Minimum Information principle for neural coding.


<iframe width="600" height="400" src="https://www.youtube.com/embed/XL07WEc2TRI?si=hM_2uqZm-lDLMnYT" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>



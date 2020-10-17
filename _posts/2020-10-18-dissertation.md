---
layout: post
title: Machine Learning Dissertations
date: 2020-10-18
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [10 Compelling Machine Learning Dissertations from Ph.D. Students](https://medium.com/@ODSC/10-compelling-machine-learning-dissertations-from-ph-d-students-c85a2d73a7e)

----


10 Compelling Machine Learning Dissertations from Ph.D. Students
====

As a data scientist, an integral part of my work in the field revolves
around keeping current with research coming out of academia. I
frequently scour arXiv.org for late-breaking papers that show trends and
fertile areas of research. Other sources of valuable research
developments are in the form of Ph.D. dissertations, the culmination of
a doctoral candidate’s work to confer his/her degree. Ph.D. candidates
are highly motivated to choose research topics that establish new and
creative paths toward discovery in their field of study. In this
article, I present 10 compelling machine learning dissertations that I
found interesting in terms of my own areas of pursuit. I hope you’ll
find several of them that match your own interests. Each thesis may take
a while to consume but will result in hours of satisfying summer
reading. Enjoy!

*\[Related Article:* [***The Best Machine Learning Research of 2019 So
Far***](https://opendatascience.com/the-best-machine-learning-research-of-2019-so-far/)*\]*

## 1. [Recognition of Everyday Activities through Wearable Sensors and Machine Learning](https://oaktrust.library.tamu.edu/handle/1969.1/161664) 

![Image for
post](https://miro.medium.com/max/1214/0*Bm6YPYHwXq0K6ZZ4.png)

Over the past several years, the use of wearable devices has increased
dramatically, primarily for fitness monitoring, largely due to their
greater sensor reliability, increased functionality, smaller size,
increased ease of use, and greater affordability. These devices have
helped many people of all ages live healthier lives and achieve their
personal fitness goals, as they are able to see quantifiable and
graphical results of their efforts every step of the way (i.e. in
real-time). Yet, while these device systems work well within the fitness
domain, they have yet to achieve a convincing level of functionality in
the larger domain of healthcare.

The goal of the research detailed in this dissertation is to explore and
develop accurate and quantifiable sensing and machine learning
techniques for eventual real-time health monitoring by wearable device
systems. To that end, a two-tier recognition system is presented that is
designed to identify health activities in a naturalistic setting based
on accelerometer data of common activities. In Tier I a traditional
activity recognition approach is employed to classify short windows of
data, while in Tier II these classified windows are grouped to identify
instances of a specific activity.

## 2. [Algorithms and analysis for non-convex optimization problems in machine learning](https://smartech.gatech.edu/handle/1853/58642) 

This dissertation proposes efficient algorithms and provides theoretical
analysis through the angle of spectral methods for some important
non-convex optimization problems in machine learning. Specifically, the
focus is on two types of non-convex optimization problems: learning the
parameters of latent variable models and learning in deep neural
networks. Learning latent variable models is traditionally framed as a
non-convex optimization problem through Maximum Likelihood Estimation
(MLE). For some specific models such as multi-view model, it’s possible
to bypass the non-convexity by leveraging the special model structure
and convert the problem into spectral decomposition through Methods of
Moments (MM) estimator. In this research, a novel algorithm is proposed
that can flexibly learn a multi-view model in a non-parametric fashion.
To scale the nonparametric spectral methods to large datasets, an
algorithm called doubly stochastic gradient descent is proposed which
uses sampling to approximate two expectations in the problem, and it
achieves better balance of computation and statistics by adaptively
growing the model as more data arrive. Learning with neural networks is
a difficult non-convex problem while simple gradient-based methods
achieve great success in practice. This part of the research tries to
understand the optimization landscape of learning one-hidden-layer
networks with Rectified Linear (ReLU) activation functions. By directly
analyzing the structure of the gradient, it can be shown that neural
networks with diverse weights have no spurious local optima.

## 3. [Algorithms, Machine Learning, and Speech: The Future of the First Amendment in a Digital World](https://conservancy.umn.edu/handle/11299/190586) 

We increasingly depend on algorithms to mediate information and thanks
to the advance of computation power and big data, they do so more
autonomously than ever before. At the same time, courts have been
deferential to First Amendment defenses made in light of new technology.
Computer code, algorithmic outputs, and arguably, the dissemination of
data have all been determined as constituting “speech” entitled to
constitutional protection. However, continuing to use the First
Amendment as a barrier to regulation may have extreme consequences as
our information ecosystem evolves. This research focuses on developing a
new approach to determining what should be considered “speech” if the
First Amendment is to continue to protect the marketplace of ideas,
individual autonomy, and democracy.

## 4. [Deep in-memory computing](https://www.ideals.illinois.edu/handle/2142/98115) 


There is much interest in embedding data analytics into sensor-rich
platforms such as wearables, biomedical devices, autonomous vehicles,
robots, and Internet-of-Things to provide these with decision-making
capabilities. Such platforms often need to implement machine learning
(ML) algorithms under stringent energy constraints with battery-powered
electronics. Especially, energy consumption in memory subsystems
dominates such a system’s energy efficiency. In addition, the memory
access latency is a major bottleneck for overall system throughput. To
address these issues in memory-intensive inference applications, this
dissertation proposes deep in-memory accelerator (DIMA), which deeply
embeds computation into the memory array, employing two key principles:
(1) accessing and processing multiple rows of memory array at a time,
and (2) embedding pitch-matched low-swing analog processing at the
periphery of bitcell array.

## 5. [Classification with Large Sparse Datasets: Convergence Analysis and Scalable Algorithms](https://ir.lib.uwo.ca/etd/4682/) 

Large and sparse datasets, such as user ratings over a large collection
of items, are common in the big data era. Many applications need to
classify the users or items based on the high-dimensional and sparse
data vectors, e.g., to predict the profitability of a product or the age
group of a user, etc. Linear classifiers are popular choices for
classifying such data sets because of their efficiency. In order to
classify the large sparse data more effectively, the following important
questions need to be answered: (a) Sparse data and convergence behavior.
How different properties of a data set, such as the sparsity rate and
the mechanism of missing data systematically affect convergence behavior
of classification? (b) Handling sparse data with non-linear model. How
to efficiently learn non-linear data structures when classifying large
sparse data? This dissertation attempts to address these questions with
empirical and theoretical analysis on large and sparse data sets.

## 6. [Collaborative detection of cyberbullying behavior in Twitter data](https://scholarworks.iupui.edu/handle/1805/13534) 


As the size of Twitter data is increasing, so are undesirable behaviors
of its users. One such undesirable behavior is cyberbullying, which
could lead to catastrophic consequences. Hence, it is critical to
efficiently detect cyberbullying behavior by analyzing tweets, in
real-time if possible. Prevalent approaches to identifying cyberbullying
are mainly stand-alone, and thus, are time-consuming. This dissertation
proposes a new approach called distributed-collaborative approach for
cyberbullying detection. It contains a network of detection nodes, each
of which is independent and capable of classifying tweets it receives.
These detection nodes collaborate with each other in case they need help
in classifying a given tweet. The study empirically evaluates various
collaborative patterns, and it assesses the performance of each pattern
in detail. Results indicate an improvement in recall and precision of
the detection mechanism over the stand-alone paradigm.

## 7. [Bringing interpretability and visualization with artificial neural networks](https://ir.uiowa.edu/etd/5764/) 


Extreme Learning Machine (ELM) is a training algorithm for Single-Layer
Feed-forward Neural Network (SLFN). The difference in theory of ELM from
other training algorithms is in the existence of explicitly-given
solution due to the immutability of initialed weights. In practice, ELMs
achieve performance similar to that of other state-of-the-art training
techniques, while taking much less time to train a model. Experiments
show that the speedup of training ELM is up to the 5 orders of magnitude
comparing to standard Error Back-propagation algorithm. ELM is a
recently discovered technique that has proved its efficiency in classic
regression and classification tasks, including multi-class cases. In
this dissertation, extensions of ELMs for non-typical for Artificial
Neural Networks (ANNs) problems are presented.

## 8. [Scalable Manifold Learning and Related Topics](https://digital.lib.washington.edu/researchworks/handle/1773/40305) 


The subject of manifold learning is vast and still largely unexplored.
As a subset of unsupervised learning, it has a fundamental challenge in
adequately defining the problem but whose solution is to an increasingly
important desire to understand data sets intrinsically. It is the
overarching goal of this work to present researchers with an
understanding of the topic of manifold learning, with a description and
proposed method for performing manifold learning, guidance for selecting
parameters when applying manifold learning to large scientific data sets
and together with open source software powerful enough to meet the
demands of big data.

## 9. [The Intelligent Management of Crowd-Powered Machine Learning](https://digital.lib.washington.edu/researchworks/handle/1773/40541) 


Artificial intelligence and machine learning power many technologies
today, from spam filters to self-driving cars to medical decision
assistants. While this revolution has hugely benefited from algorithmic
developments, it also could not have occurred without data, which
nowadays is frequently procured at massive scale from crowds. Because
data is so crucial, a key next step towards truly autonomous agents is
the design of better methods for intelligently managing now-ubiquitous
crowd-powered data-gathering processes. This dissertation takes this key
next step by developing algorithms for the online and dynamic control of
these processes. The research considers how to gather data for its two
primary purposes: training and evaluation.

*\[Related Article:* [***25 Excellent Machine Learning Open
Datasets***](https://opendatascience.com/25-excellent-machine-learning-open-datasets/)*\]*

## 10. [System-Aware Optimization for Machine Learning at Scale](https://escholarship.org/uc/item/20n1k4q8) 


New computing systems have emerged in response to the increasing size
and complexity of modern datasets. For best performance, machine
learning methods must be designed to closely align with the underlying
properties of these systems. This dissertation illustrates the impact of
system-aware machine learning through the lens of optimization, a
crucial component in formulating and solving most machine learning
problems. Classically, the performance of an optimization method is
measured in terms of accuracy (i.e., does it realize the correct machine
learning model?) and convergence rate (after how many iterations?). In
modern computing regimes, however, it becomes critical to additionally
consider a number of systems-related aspects for best overall
performance. These aspects can range from low-level details, such as
data structures or machine specifications, to higher-level concepts,
such as the tradeoff between communication and computation. We propose a
general optimization framework for machine learning, CoCoA, that gives
careful consideration to systems parameters, often incorporating them
directly into the method and theory.

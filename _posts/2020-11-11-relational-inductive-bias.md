---
layout: post
title: Principles and Applications of Relational Inductive Biases 
date: 2020-11-11
categories: [computer science]
tags: [machine learning, data management]

---

### Article Source
* [Principles and applications of relational inductive biases in deep learning](https://www.youtube.com/watch?v=sTGKOUzIpaQ&t=14s)

----

# Principles and Applications of Relational Inductive Biases in Deep Learning

* Speaker: Kelsey Allen, MIT
 
## Abstract
Common intuition posits that deep learning has succeeded because of its ability to assume very *little structure* in the data it receives, instead learning that structure from large numbers of training examples. However, recent work has attempted to bring structure back into deep learning, via a new set of models known as "*graph networks*". Graph networks allow for "*relational inductive biases*" to be introduced into learning, ie. explicit reasoning about *relationships* between entities. 
In this talk, I will introduce graph networks and one application of them to a *physical reasoning task* where an agent and human participants were asked to glue together pairs of blocks to stabilize a tower. We will go through DeepMind's recently released graph networks library (implemented in tensorflow) to see how to set up different graph models, and train some simple models on some simple tasks.

<iframe width="600" height="400" src="https://www.youtube.com/embed/sTGKOUzIpaQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Speaker Bio
Kelsey Allen is a PhD student working with Josh Tenenbaum on the problems of structured physical reasoning, planning, and learning from limited data.

Computational tutorial references and videos can be found on our [stellar site](https://stellar.mit.edu/S/project/bcs-comp-tut/index.html) or on the [CBMM learning hub](https://cbmm.mit.edu/learning-hub/tutorials#block-views-learning-hub-block-4).

## Discovering Symbolic Models from Deep Learning with Inductive Biases

Neural networks are very good at predicting systems' *numerical* outputs, but not very good at deriving the *discrete symbolic equations* that govern many physical systems. This paper combines *Graph Networks with symbolic regression* and shows that the strong *inductive biases* of these models can be used to derive accurate symbolic equations from observation data.

<iframe width="600" height="400" src="https://www.youtube.com/embed/LMb5tvW-UoQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
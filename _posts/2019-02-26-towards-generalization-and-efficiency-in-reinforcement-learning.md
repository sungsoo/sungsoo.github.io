---
layout: post
title: Towards Generalization and Efficiency in Reinforcement Learning
date: 2019-02-26
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Towards Generalization and Efficiency in Reinforcement Learning](https://www.youtube.com/watch?v=W62AB6oVhk4)

---


Towards Generalization and Efficiency in Reinforcement Learning
=====

## Abstract

In classic supervised machine learning, a learning agent behaves as a passive observer: it receives examples from some external environment which it has no control over and then makes predictions. Reinforcement Learning (RL), on the other hand, is fundamentally interactive : an autonomous agent must learn how to behave in an unknown and possibly hostile environment, by actively interacting with the environment to collect useful feedback. One central challenge in RL is how to explore an unknown environment and collect useful feedback efficiently. In recent practical RL success stories, we notice that most of them rely on random exploration which requires large a number of interactions with the environment before it can learn anything useful. The theoretical RL literature has developed more sophisticated algorithms for efficient learning, however, the sample complexity of these algorithms has to scale exponentially with respect to key parameters of underlying systems such as the dimensionality of state vector, which prohibits a direct application of these theoretically elegant RL algorithms to large-scale applications. Without any further assumptions, RL is hard, both in practice and in theory.

In this work, we improve generalization and efficiency on RL problems by introducing extra sources of help and additional assumptions. The first contribution of this work comes from improving RL sample efficiency via Imitation Learning (IL). Imitation Learning reduces policy improvement to classic supervised learning. We study in both theory and in practice how one can imitate experts to reduce sample complexity compared to RL approaches. The second contribution of this work comes from exploiting the underlying structures of the RL problems via model-based learning approaches. While there exist efficient model-based RL approaches specialized for specific RL problems (e.g., tabular MDPs, Linear Quadratic Systems), we develop a unified model-based algorithm that generalizes a large number of RL problems that were often studied independently in the literature. We also revisit the long standing debate on whether model-based RL is more efficient than model-free RL from a theoretical perspective, and demonstrate that model-based RL can be exponentially more sample efficient than model-free ones, which to the best of our knowledge, is the first that separates model-based and model-free general approaches.


* [Related Site](https://www.youtube.com/redirect?redir_token=YkXD-Ew2x23FAJAolLQnHLpYCCt8MTU1MTIwODA1NEAxNTUxMTIxNjU0&q=https%3A%2F%2Fwww.microsoft.com%2Fen-us%2Fresearch%2Fvideo%2Ftowards-generalization-and-efficiency-in-reinforcement-learning%2F&event=video_description&v=W62AB6oVhk4)

<iframe width="600" height="400" src="https://www.youtube.com/embed/W62AB6oVhk4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

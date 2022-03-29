---
layout: post
title: Probabilistic Methods for Increased Robustness in Machine Learning
date: 2022-03-31
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Probabilistic Methods for Increased Robustness in Machine Learning](https://www.youtube.com/watch?v=Usr2JJkMeP0)


---

# Probabilistic Methods for Increased Robustness in Machine Learning


## Abstract

### Introduction

The Innovation Symposium was established in 2019 as part of the ongoing collaboration between Accenture and The Alan Turing Institute. Our recently launched strategic partnership has the following goals:

- Delivering value from AI and data
- Enabling safe and robust application of AI
- Lowering barriers to AI adoption.

We are partnering again to deliver the 2021 Innovation Symposium on Thursday 18 November. The Symposium is a completely unique and intimate opportunity for industry and academia to come together to discuss the latest applied data science and artificial intelligence research that is pioneering the conscientious uses of AI, including privacy, explainability, fairness, and security.

### About the event

The Innovation Symposium seeks to showcase exciting and world-leading developments in AI research to the Turing partner community, as well as senior industry representatives. The Accenture Turing strategic partnership allows us to connect industry, government, and academia to ensure that cutting-edge AI and data science research can deliver real value to the economy and society in the UK.

This year, the event will take place remotely and will feature the following speakers:

Professor Sir Adrian Smith- Institute Director and Chief Executive of the Alan Turing Institute, and President of the Royal Society.

Mihaela van der Schaar- John Humphrey Plummer Professor of Machine Learning, Artificial Intelligence and Medicine at the University of Cambridge and Founder and Director of the Cambridge Centre for AI in Medicine

Tim Dodwell- Senior lecturer in industrial applied mathematics within the Institute of Data Science and AI at the University of Exeter, and Turing Fellow

Maria Liakata- Associate Professor in Natural Language Processing (NLP) at Queen Mary, University of London, and Turing Fellow.

Jose Miguel Hernandez Lobato- Lecturer in Machine Learning at the Department of Engineering of the University of Cambridge, and Turing Fellow


<iframe width="600" height="400" src="https://www.youtube.com/embed/Usr2JJkMeP0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Abstract

Most machine learning methods are brittle and their performance degrades catastrophically when the input data distribution changes. In this talk, I will describe two probabilistic approaches to address this problem. First, to obtain methods that degrade gracefully, I will focus on scaling accurate approximate Bayesian inference to large neural networks. I will show that it is enough to perform inference over a small subset of the model weights to obtain accurate predictive posteriors. The resulting method, called subnetwork inference, achieves very significant improvements when making predictions under distribution shift. Second, to avoid performance degradation in specific cases, I will describe invariant Causal Representation Learning (iCaRL), an approach that enables accurate out-of-distribution generalization when there is training data collected under different conditions (environments). iCaRL achieves generalization guarantees by assuming that the latent variables encoding the inputs follow a general exponential family distribution when conditioning on the outputs and the training environment. Experiments on both synthetic and real-world datasets show that iCaRL produces very significant improvements over existing baselines.


<iframe width="600" height="400" src="https://www.youtube.com/embed/4ppFiyXJkiM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
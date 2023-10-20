---
layout: post
title: Tractable Bounding of Counterfactual Queries by Knowledge Compilation 
date: 2023-10-20
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Tractable Bounding of Counterfactual Queries by Knowledge Compilation](https://www.youtube.com/watch?v=4Vsj303LNs4)

---

# Tractable Bounding of Counterfactual Queries by Knowledge Compilation 



## Abstract

We discuss the problem of bounding partially identifiable queries, such as counterfactuals, in Pearlian structural causal models. A recently proposed iterated EM scheme yields an inner approximation of those bounds by sampling the initialisation parameters. Such a method requires multiple (Bayesian network) queries over models sharing the same structural equations and topology, but different exogenous probabilities. This setup makes a compilation of the underlying model to an arithmetic circuit advantageous, thus inducing a sizeable inferential speed-up. We show how a single symbolic knowledge compilation allows us to obtain the circuit structure with symbolic parameters to be replaced by their actual values when computing the different queries. We also discuss parallelisation techniques to further speed up the bound computation. Experiments against standard Bayesian network inference show clear computational advantages with up to an order of magnitude of speed-up.

<iframe width="600" height="400" src="https://www.youtube.com/embed/4Vsj303LNs4?si=4ziS3owjdSXFtSRl" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


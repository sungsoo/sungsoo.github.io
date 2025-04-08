---
layout: post
title: The Analytical Bootstrap
date: 2015-07-07
categories: [computer science]
tags: [big data]

---


# The Analytical Bootstrap: a New Method for Fast Error Estimation in Approximate Query Processing
## Abstract

Sampling is one of the most commonly used techniques in *Approximate Query Processing* (AQP)—an area of research that is now made more critical by the need for timely and cost-effective analytics over “Big Data”. Assessing the quality (i.e., estimating the error) of approximate answers is essential for meaningful AQP, and the two main approaches used in the past to address this problem are based on either (i) *analytic error quantification* or (ii) the *bootstrap method*. The first approach is extremely efficient but lacks generality, whereas the second is quite general but suffers from its high computational overhead. In this paper, we introduce a probabilistic relational model for the bootstrap process, along with rigorous semantics and a unified error model, which bridges the gap between these two traditional approaches. Based on our probabilistic framework, we develop efficient algorithms to predict the error distribution of the approximation results. These enable the computation of any bootstrap-based quality measure for a large class of SQL queries via a single- round evaluation of a slightly modified query. Extensive experiments on both synthetic and real-world datasets show that our method has superior prediction accuracy for bootstrap-based quality measures, and is several orders of magnitude faster than bootstrap. 
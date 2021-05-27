---
layout: post
title: Learned Approximate Query Processing
date: 2021-05-27
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Learned Approximate Query Processing](https://www.youtube.com/watch?v=Ds8lGWLrRh8)
---

# Learned Approximate Query Processing 

## Make it Light, Accurate and Fast 

* Paper: [ICDR 2021](http://cidrdb.org/cidr2021/papers/cidr2021_paper15.pdf)

## Abstract
The advent of learning algorithms has revealed many opportunities
for improving Data Systems’ functionality and performance. Approximate Query Processing (AQP) is one such area where machine
learning (ML) models have been used to improve query execution
efficiency and accuracy, outperforming the traditional samplingbased approaches. Based on our group’s experience in the MLfor-DBs area, [3–7, 29, 37–39], we contribute a novel AQP engine,
coined DBEst++, which extends our previous effort (DBEst, [29])
and sets the state of the art in terms of accuracy and query execution efficiency. The DBEst++ salient design objective is to derive
lightweight ML models for the task, allowing a plethora of ML
models to coexist, covering a very large fraction of the expected
analytical query workload without requiring very large memory
footprints. The DBEst++ salient architectural feature rests on a
novel blending of word embedding models with neural networks
tasked with regression-based predictions for density estimation
and aggregation-attribute values. We present design features and
motivations/rationale behind DBEst++ and discuss how all the ML
models are brought together. We also present how DBEst++ can
deal with challenging scenarios, including how to deal with highcardinality categorical attributes and how to ensure high accuracy
under data updates. We provide a detailed experimental evaluation using the TPC-DS and Flights datasets against state of the art
learned and sampling-based AQP engines, showcasing DBEst++’s
gains in terms of accuracy, response-times, and memory space
overheads.


<iframe width="600" height="400" src="https://www.youtube.com/embed/Ds8lGWLrRh8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
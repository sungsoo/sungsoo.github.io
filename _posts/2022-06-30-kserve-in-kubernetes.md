---
layout: post
title: KServe in Kubenetes
date: 2022-06-30
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [KServe in Kubenetes](https://www.youtube.com/watch?v=qDzTFv91x3A)


---

# KServe in Kubenetes


## Abstract

Serving Machine Learning Models at Scale Using KServing 
KServe (previously known as KFServing) is a serverless open source solution to serve machine learning models. 
With machine learning becoming more widely adopted in organizations, the trend is to deploy larger numbers of models. 
Plus, there is an increasing need to serve models using GPUs. 
As GPUs are expensive, engineers are seeking ways to serve multiple models with one GPU. 
The KServe community designed a Multi-Model Serving solution to scale the number of models that can be served in a Kubernetes cluster. 

By sharing the serving container that is enabled to host multiple models, Multi-Model Serving addresses three limitations that the current ‘one model, one service’ paradigm encounters: 

1. Compute resources (including the cost for public cloud), 
2. Maximum number of pods, 
3. Maximum number of IP addresses. 
4. Maximum number of services 

This talk will present the design of Multi-Model Serving, describe how to use it to serve models for different frameworks, and share benchmark stats that demonstrate its scalability.

<iframe width="600" height="400" src="https://www.youtube.com/embed/qDzTFv91x3A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
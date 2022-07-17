---
layout: post
title: Kubeflow Fairing
date: 2022-07-18
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Kubeflow Fairing](https://www.youtube.com/watch?v=SN70he8oFME)


---

# Kubeflow Fairing

* Lightning talk presented on March 12, 2019 at the Kubeflow Contributor Summit in Sunnyvale, CA. 


## Abstract

Fairing is a python library that makes building, training, and deploying anywhere **simple** for data scientists.

* Run anywhere: Local, Cluster, or Notebook
* Composable architecture
* Reusable building blocks

<iframe width="600" height="400" src="https://www.youtube.com/embed/SN70he8oFME" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

1. **Preprocesses** the code, converting notebooks or gathering source or data dependencies.
2. **Builds** and uploads a Docker image.
3. **Deploys** a job using Kubernetes or Kubeflow primitives.
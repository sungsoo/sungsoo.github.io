---
layout: post
title: The Feature Store
date: 2020-07-12
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [The Feature Store](https://www.youtube.com/watch?v=N1BjPk1smdg)

----


# The Feature Store: the missing API between Data Engineering Science?

## Abstract

Machine Learning (ML) pipelines are the key building block for productionizing ML code. However, pipelines are often developed as "*silos*" - features tend not to be easily re-used across pipelines or even within the same pipeline. Silos lead to duplication, unnecessarily re-implementing features and in the worst case correctness problems, if, for example, the features used for training and serving have inconsistent implementations. The Feature Store solves the problem of siloed and ad-hoc machine learning pipelines, by providing a data layer where feature engineering can be separated from the usage of features to generate training data. That is, the Feature Store should provide a clean API separating Data Engineering from Data Science.

In this talk, we will introduce the world's first open-source Feature Store, built on Hopsworks, Apache Spark, and Apache Hive and targeting both TensorFlow/Keras and PyTorch. We will show how ML pipelines can be programmed, end-to-end, in Python, and the role of the Feature Store as a natural interface between Data Engineers and Data Scientists. In an end-to-end pipeline, we will show how the Feature Store works, and how you can write end-to-end ML pipelines in Python only (if you so choose).

## Speaker Bio:
Jim Dowling is the CEO of Logical Clocks AB, as well as an Associate Professor at KTH Royal Institute of Technology in Stockholm. He is the lead architect of Hops, the world's most fastest and most scalable Hadoop distribution and first Hadoop platform with support for GPUs as a resource. He is a regular speaker at AI industry conferences, and blogs at O'Reilly on AI.

<iframe width="600" height="400" src="https://www.youtube.com/embed/N1BjPk1smdg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


<iframe width="600" height="400" src="https://www.youtube.com/embed/EI2QisCvEM4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
---
layout: post
title: Distributed Deep Learning on Mesos
date: 2018-03-02
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: [Distributed Deep Learning on Apache Mesos with GPUs and Gang Scheduling](https://www.youtube.com/watch?v=90JAQLRhQRo)

---


# Distributed Deep Learning on Apache Mesos with GPUs and Gang Scheduling 


## Abstract

*Distributed deep learning* is essential to speed up complex model training, scale out to hundreds of GPUs, and shard models that can not be fit into a single machine. With recent advance on deep learning models in self-driving car areas such as lane-detection, perception and so on, it is important to enable distributed deep learning with large-scale GPU clusters. 

This presentation will discuss our design and implementation of running distributed TensorFlow on top of Mesos clusters with hundreds of GPUs. It leverages several key features offered by Mesos such as *GPU isolation* and *nested containers*. We also implement several features in our scheduler to support GPU and Gang scheduling, task discovery and dynamic port allocation. Finally, we will show the speed up of distributed training on Mesos using an example TensorFlow model for image classification.

<iframe width="600" height="400" src="https://www.youtube.com/embed/90JAQLRhQRo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## About

### Min Cai
Staff Engineer, UBER
Min Cai is a Staff Engineer at UBER working on cluster management. He received his Ph.D. degree in Computer Science from USC. Before joining Uber, he was a Sr. Staff Engineer at VMware working on vMotion and vSphere.

### Alex Sergeev
Senior Engineer, UBER
Alex Sergeev is a Senior Engineer at UBER working on scalable Deep Learning. He recived his MS. degree in Computer Science from MEPhI. Before joining UBER, he was Senior Engineer at Microsoft working on Big Data Mining.
---
layout: post
title: Optimizing Deep CNN-Based Queries over Video Streams at Scale
date: 2017-03-03
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [Optimizing Deep CNN-Based Queries over Video Streams at Scale](http://hgpu.org/?p=17036)
* Authors: Daniel Kang, John Emmons, Firas Abuzaid, Peter Bailis, Matei Zaharia (Stanford InfoLab)

---



Optimizing Deep CNN-Based Queries over Video Streams at Scale
====

* [Paper](https://arxiv.org/pdf/1703.02529)


## Abstract

Video is one of the *fastest-growing* sources of data and is rich with interesting semantic information. Furthermore, recent advances in computer vision, in the form of *deep convolutional neural networks* (CNNs), have made it possible to query this *semantic information* with near-human accuracy (in the form of image tagging). However, performing inference with state-of-the-art CNNs is computationally expensive: analyzing videos in real time (at 30 frames/sec) requires a $1200 GPU per video stream, posing a serious computational barrier to CNN adoption in *large-scale* video data management systems. In response, we present NOSCOPE, a system that uses cost-based optimization to assemble a specialized video processing pipeline for each input video stream, greatly accelerating subsequent CNNbased queries on the video. As NOSCOPE observes a video, it trains two types of pipeline components (which we call filters) to exploit the locality in the video stream: difference detectors that exploit temporal locality between frames, and specialized models that are tailored to a specific scene and query (i.e., exploit environmental and query-specific locality). We show that the optimal set of filters and their parameters depends significantly on the video stream and query in question, so NOSCOPE introduces an efficient cost-based optimizer for this problem to select them. With this approach, our NOSCOPE prototype achieves up to 120-3,**200x speed-ups** (318- 8,500x real-time) on binary classification tasks over real-world webcam and surveillance video while maintaining accuracy within 1-5% of a state-of-the-art CNN.
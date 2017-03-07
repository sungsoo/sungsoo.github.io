---
layout: post
title: Deep Voice; Real-time Neural Text-to-Speech
date: 2017-03-08
categories: [computer science]
tags: [machine learning]

---


## Article Source

* Title: [Deep Voice: Real-time Neural Text-to-Speech](http://hgpu.org/?p=17022)
* Authors: Sercan O. Arik, Mike Chrzanowski, Adam Coates, Gregory Diamos, Andrew Gibiansky, Yongguo Kang, Xian Li, John Miller, Jonathan Raiman, Shubho Sengupta, Mohammad Shoeybi (Baidu)


-----

Deep Voice: Real-time Neural Text-to-Speech
=====================================

## Abstract

We present **Deep Voice**, a production-quality *text-to-speech system* constructed entirely from *deep neural networks*. Deep Voice lays the groundwork for truly end-to-end *neural speech synthesis*. The system comprises five major building blocks: a *segmentation model* for locating phoneme boundaries, a *grapheme-to-phoneme conversion model*, a *phoneme duration prediction model*, a *fundamental frequency prediction model*, and an *audio synthesis model*. For the segmentation model, we propose a novel way of performing phoneme boundary detection with deep neural networks using connectionist temporal classification (CTC) loss. For the audio synthesis model, we implement a variant of WaveNet that requires fewer parameters and trains faster than the original. By using a neural network for each component, our system is simpler and more flexible than traditional text-to-speech systems, where each component requires laborious feature engineering and extensive domain expertise. Finally, we show that inference with our system can be performed faster than real time and describe *optimized WaveNet inference kernels* on both CPU and GPU that achieve up to **400x speedups** over existing implementations.

* [Paper](https://arxiv.org/pdf/1702.07825)
---
layout: post
title: Massive Exploration of Neural Machine Translation Architectures
date: 2017-03-21
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [Massive Exploration of Neural Machine Translation Architectures](http://hgpu.org/?p=17058)
* Authors: Denny Britz, Anna Goldie, Thang Luong, Quoc Le (Google Brain)

---


Massive Exploration of Neural Machine Translation Architectures
====================================

* Paper: [Download(PDF)](https://arxiv.org/pdf/1703.03906)
* Package: [seq2seq: A general-purpose encoder-decoder framework for Tensorflow](https://github.com/google/seq2seq/)


## Abstract

*Neural Machine Translation* (NMT) has shown remarkable progress over the past few years with production systems now being deployed to end-users. One major drawback of current architectures is that they are *expensive to train*, typically requiring days to weeks of GPU time to converge. This makes *exhaustive hyperparameter search*, as is commonly done with other neural network architectures, prohibitively expensive. 

In this work, we present the first *large-scale analysis* of NMT architecture hyperparameters. We report empirical results and variance numbers for several hundred experimental runs, corresponding to over 250,000 GPU hours on the standard WMT English to German translation task. Our experiments lead to novel insights and practical advice for building and extending NMT architectures. As part of this contribution, we release an [*open-source NMT framework*](https://github.com/google/seq2seq/) that enables researchers to easily experiment with novel techniques and reproduce state of the art results.

[![](http://sungsoo.github.com/images/encoder-decoder.png)](http://sungsoo.github.com/images/encoder-decoder.png)
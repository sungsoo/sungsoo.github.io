---
layout: post
title: Generalization in diffusion models from geometry-adaptive harmonic representation
date: 2024-03-18
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Gemini Multimodal RAG Applications with LangChain](https://www.youtube.com/watch?v=V_t6QppPbwQ)

---

# Generalization in diffusion models from geometry-adaptive harmonic representation


## Abstract

High-quality samples generated with score-based reverse diffusion algorithms provide evidence that deep neural networks (DNN) trained for denoising can learn high-dimensional densities, despite the curse of dimensionality. However, recent reports of memorization of the training set raise the question of whether these networks are learning the "true" continuous density of the data. Here, we show that two denoising DNNs trained on non-overlapping subsets of a dataset learn nearly the same score function, and thus the same density, with a surprisingly small number of training images. This strong generalization demonstrates an alignment of powerful inductive biases in the DNN architecture and/or training algorithm with properties of the data distribution. We analyze these, demonstrating that the denoiser performs a shrinkage operation in a basis adapted to the underlying image. Examination of these bases reveals oscillating harmonic structures along contours and in homogeneous image regions. We show that trained denoisers are inductively biased towards these geometry-adaptive harmonic representations by demonstrating that they arise even when the network is trained on image classes such as low-dimensional manifolds, for which the harmonic basis is suboptimal. Additionally, we show that the denoising performance of the networks is near-optimal when trained on regular image classes for which the optimal basis is known to be geometry-adaptive and harmonic.

* Speaker: Zahra Kadkhodaie

<iframe width="600" height="400" src="https://www.youtube.com/embed/V_t6QppPbwQ?si=35HbiNJfUbDRb9WG" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


### 딥 뉴럴 네트워크의 잡음 제거 능력과 데이터 밀도 학습에 대한 연구

점수 기반 역 확산 알고리즘을 사용하여 생성된 고품질 샘플은 차원의 저주(curse of dimensionality)에도 불구하고 잡음 제거를 위해 훈련된 깊은 신경망(DNN)이 고차원 밀도를 학습할 수 있다는 증거를 제공합니다. 하지만 최근 훈련 데이터 암기 보고로 인해 이러한 네트워크가 데이터의 "실제" 연속 밀도를 학습하고 있는지 의문이 제기되었습니다.

이 연구에서는 데이터 세트의 비 sobre lapping (겹치지 않는) 부분 집합으로 훈련된 두 개의 잡음 제거 DNN이 놀랍게도 적은 수의 훈련 이미지로 거의 동일한 스코어 함수(따라서 동일한 밀도)를 학습한다는 것을 보여줍니다. 이 강력한 일반화는 DNN 아키텍처 및/또는 훈련 알고리즘의 강력한 귀纳적 편향과 데이터 분포 특성의 일치를 보여줍니다. 우리는 이러한 편향을 분석하여 잡음 제거기가 기저 이미지에 적합한 기반에서 수축 연산을 수행한다는 것을 보여줍니다. 이 기반을 검토하면 윤곽선을 따라 반복적인 하모닉 구조와 균일한 이미지 영역에서 관찰됩니다.

네트워크가 저차원 매니폴드와 같은 이미지 클래스에서 훈련되는 경우에도 이러한 하모닉 기반이 최적이 아니지만 훈련된 잡음 제거기는 이러한 기하학적 적응 하모닉 표현에 대한 귀납적 편향을 가진다는 것을 보여줍니다. 또한 네트워크의 잡음 제거 성능은 최적 기반이 기하학적 적응 및 하모닉으로 알려진 일반 이미지 클래스에서 훈련할 때 최적에 근접한다는 것을 보여줍니다.

### 핵심 내용

* 잡음 제거 딥 뉴럴 네트워크(DNN)의 데이터 밀도 학습 능력
* 스코어 기반 역 확산 알고리즘을 통한 고차원 밀도 학습
* 훈련 데이터 암기 문제 제기
* 비 sobre lapping 데이터셋 사용을 통한 강력한 일반화 증명
* 잡음 제거기의 기하학적 적응 하모닉 기반 분석
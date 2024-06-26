---
layout: post
title: The Influence of Computation on Inference
date: 2024-06-26
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Data is as Data Does; The Influence of Computation on Inference](https://www.youtube.com/watch?v=v2HPH0LD0ow)

---


# The Influence of Computation on Inference

* John Patrick Cunningham (Columbia University)
* AI≡Science: Strengthening the Bond Between the Sciences and Artificial Intelligence


## Abstract

Probabilistic models remain a hugely popular class of techniques in modern machine learning, and their expressiveness has been extended by modern large-scale compute. While exciting, these generalizations almost always come with approximations, and researchers typically ignore the fundamental influence of computational approximations. Thus, results from modern probabilistic methods become as much about the approximation method as they are about the data and the model, undermining both the Bayesian principle and the practical utility of inference in probabilistic models for real applications in science and industry.

To expose this issue and to demonstrate how to do approximate inference correctly in at least one model class, in this talk I will derive a new type of Gaussian Process approximation that provides consistent estimation of the combined posterior arising from both the finite number of data observed and the finite amount of computation expended. The most common GP approximations map to an instance in this class, such as methods based on the Cholesky factorization, conjugate gradients, and inducing points. I will show the consequences of ignoring computational uncertainty, and prove that implicitly modeling it improves generalization performance. I will show how to do model selection while considering computation, and I will describe an application to neurobiological data.

## 확률 모델 근사의 중요성과 컴퓨터 계산 불확실성 고려

확률 모델은 여전히 현대 머신 러닝에서 매우 인기 있는 기술 분야이며, 최근의 대규모 컴퓨팅 덕분에 그 표현력이 확장되었습니다. 이러한 일반화는 흥미롭지만 거의 항상 근사와 함께 이루어지며, 연구자들은 일반적으로 컴퓨터 계산 근사의 근본적인 영향을 무시합니다. 따라서 최신 확률 방법론의 결과는 데이터와 모델뿐만 아니라 근사 방법에 대해서도 많이 다루게 되어 베이즈 원리와 과학 및 산업 분야의 실제 응용 프로그램에서 확률 모델 추론의 실용적인 유용성을 저하시킵니다.

이러한 문제를 드러내고 적어도 한 가지 모델 클래스에서 올바른 근사 추론을 수행하는 방법을 보여주기 위해 이 발표에서는 관측된 데이터의 유한 개수와 소비된 컴퓨터 계산량 모두에서 발생하는 결합 후기 분포에 대한 일관적인 추정을 제공하는 새로운 유형의 가우시안 과정 근사를 도출할 것입니다. 가장 일반적인 GP 근사는 Cholesky 분해, 켤레 기울기, 유도 점 등을 기반으로 하는 방법과 같이 이 클래스의 인스턴스에 매핑됩니다. 컴퓨터 불확실성을 무시하는 결과를 보여주고, 암묵적으로 모델링하는 것이 일반화 성능을 향상시킨다는 것을 증명할 것입니다. 계산을 고려하면서 모델 선택을 수행하는 방법을 설명하고 신경생물학 데이터에 대한 응용 사례를 설명할 것입니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/ZVec7pw0bgw?si=wqLzw0HORQTw_R3d" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
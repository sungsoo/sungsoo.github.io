---
layout: post
title: Improving and Generalizing Flow-Based Generative Models 
date: 2024-09-27
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Improving and Generalizing Flow-Based Generative Models with Minibatch Optimal Transport](https://www.youtube.com/watch?v=UhDtH7Ia9Ag)

---


# Improving and Generalizing Flow-Based Generative Models with Minibatch Optimal Transport


## Abstract

Continuous normalizing flows (CNFs) are an attractive generative modeling technique, but they have been held back by limitations in their simulation-based maximum likelihood training. We introduce the generalized conditional flow matching (CFM) technique, a family of simulation-free training objectives for CNFs. CFM features a stable regression objective like that used to train the stochastic flow in diffusion models but enjoys the efficient inference of deterministic flow models. In contrast to both diffusion models and prior CNF training algorithms, CFM does not require the source distribution to be Gaussian or require evaluation of its density. A variant of our objective is optimal transport CFM (OT-CFM), which creates simpler flows that are more stable to train and lead to faster inference, as evaluated in our experiments. Furthermore, OT-CFM is the first method to compute dynamic OT in a simulation-free way. Training CNFs with CFM improves results on a variety of conditional and unconditional generation tasks, such as inferring single cell dynamics, unsupervised image translation, and Schrödinger bridge inference.

Speaker: Alexander Tong - [https://www.alextong.net/](https://www.alextong.net/)

<iframe width="600" height="400" src="https://www.youtube.com/embed/UhDtH7Ia9Ag?si=YFoAV6ziDvl5jS1M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Flow-Based Generative Models (흐름 기반 생성 모델) 상세 설명

**흐름 기반 생성 모델 (Flow-Based Generative Models)**은 최근 딥러닝 분야에서 주목받는 생성 모델 중 하나입니다. 기존의 생성 모델인 GAN이나 VAE와는 다른 접근 방식을 통해 데이터를 생성하며, 특히 **정확한 로그 우도(log-likelihood)**를 계산할 수 있다는 점에서 큰 장점을 가지고 있습니다.

### 흐름 기반 생성 모델의 기본 개념

흐름 기반 모델은 데이터 공간에서 잠재 공간(latent space)으로의 **일대일(one-to-one)** 변환을 수행하는 일련의 **가역적인 변환**을 정의합니다. 이러한 가역적인 변환을 통해 데이터의 복잡한 분포를 단순한 분포 (예: 다변량 정규 분포)로 변환하고, 이 단순한 분포에서 샘플링하여 다시 데이터 공간으로 역변환함으로써 새로운 데이터를 생성합니다.

**핵심 아이디어**는 다음과 같습니다.

1. **가역적인 변환:** 데이터 x를 잠재 변수 z로 변환하는 함수 f와 그 역함수 f^-1을 정의합니다.
2. **단순한 잠재 공간:** 잠재 변수 z는 간단한 분포 (예: 표준 정규 분포)를 따르도록 설정합니다.
3. **로그 우도 계산:** 가역적인 변환의 특성을 이용하여 데이터 x의 로그 우도를 정확하게 계산할 수 있습니다.

### 흐름 기반 모델의 장점

* **정확한 로그 우도 계산:** 기존 모델과 달리 정확한 로그 우도를 계산할 수 있어 모델 평가 및 학습에 유용합니다.
* **안정적인 학습:** 학습 과정이 상대적으로 안정적이며, 모드 붕괴(mode collapse) 문제가 발생할 가능성이 적습니다.
* **다양한 데이터 유형 지원:** 이미지, 텍스트, 오디오 등 다양한 유형의 데이터에 적용 가능합니다.

### 흐름 기반 모델의 종류

* **Normalizing Flows:** 가장 기본적인 흐름 기반 모델로, 여러 개의 간단한 변환을 연속적으로 연결하여 복잡한 변환을 구현합니다.
* **Real NVP:** Coupling layer를 사용하여 변수를 부분적으로 변환하는 모델입니다.
* **Glow:** 인버터블 1x1 convolution을 사용하여 채널 간의 상호 작용을 모델링하는 모델입니다.
* **MAF:** 마스크된 자기 회귀 플로우로, 순차적으로 변수를 변환하는 모델입니다.

### 흐름 기반 모델의 활용

* **데이터 생성:** 새로운 이미지, 음악, 텍스트 등을 생성할 수 있습니다.
* **데이터 증강:** 기존 데이터에 변형을 가하여 더 많은 학습 데이터를 생성할 수 있습니다.
* **확률적 추론:** 데이터의 불확실성을 모델링하고 추론할 수 있습니다.
* **변분 베이즈:** 변분 베이즈 추론에 활용될 수 있습니다.

### 결론

흐름 기반 생성 모델은 정확한 로그 우도 계산과 안정적인 학습이라는 강점을 바탕으로 딥러닝 분야에서 다양한 문제를 해결하는 데 활용되고 있습니다. 앞으로도 흐름 기반 모델은 더욱 발전하여 더욱 복잡하고 다양한 데이터를 생성하고 분석하는 데 기여할 것으로 기대됩니다.


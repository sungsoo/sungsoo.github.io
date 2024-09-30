---
layout: post
title: Geometric Probabilistic Models
date: 2024-09-30
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [UAI 2024 Tutorial 4; Geometric Probabilistic Models](https://www.youtube.com/watch?v=EpMAkczF34Y)

---



# Geometric Probabilistic Models


* Viacheslav Borovitskiy, Alexander Terenin
* [Slides](https://vab.im/download/2024-07-15-Geometric-Probabilistic-Models-Tutorial/)

## Abstract

In applications from drug design to robotics, recent advances in geometric deep learning have demonstrated the value of having specialized methods beyond R^d. Since deep learning tends to require a lot of data, and makes it non-trivial to quantify uncertainty in a way that leads to efficient decision-making, this motivates a need for complementary technical capabilities. In this tutorial, we describe geometric counterparts of data-efficient probabilistic modeling techniques, which are effective in small-data settings, and enable uncertainty to be quantified in a geometry-compatible way. We focus mainly on Gaussian processes and related techniques like Bayesian neural networks. These methods can be used to power automated decision-making systems such as Bayesian optimization, which are used in important applications such as molecular optimization and robotic policy tuning---areas where data-efficiency is key, and geometric properties such as symmetries play a fundamental role. This research area has been rapidly developing, and is starting to become mature enough that comprehensive software packages are becoming available---we will therefore cover both the theory and practical implementation of these methods through software demonstrations, and conclude by showcasing a number of emerging applications.


<iframe width="600" height="400" src="https://www.youtube.com/embed/EpMAkczF34Y?si=iSbQX7XLh-oZiiPe" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


**Geometric Probabilistic Models (기하학적 확률 모델)**은 기하학적 구조와 확률적 개념을 결합한 모델입니다. 이 모델은 데이터를 분석하고 추론하는 데 있어 **기하학적 구조**와 **확률 분포**를 결합하여 다양한 패턴을 학습하는 데 사용됩니다. 이를 통해 복잡한 고차원 데이터에서 학습 및 추론의 효율성을 높이고, 모델의 일반화 성능을 향상시키는 것을 목표로 합니다.

이러한 모델들은 **확률론적 모델링**과 **기하학적 공간**에서의 계산적 기법을 사용하여 데이터를 표현하는 방식에 초점을 둡니다. 데이터의 잠재적 구조를 기하학적으로 해석하고, 이를 확률 분포와 결합하여 복잡한 데이터를 학습, 예측 및 추론합니다.

### 주요 개념

1. **기하학적 구조**:
   - 기하학적 확률 모델에서 **기하학적 구조**는 데이터가 어떤 잠재적 공간(latent space) 또는 다차원 공간에서 어떤 모양을 가지고 분포하는지를 나타냅니다. 예를 들어, 데이터가 고차원 공간의 곡면 위에 분포하거나, 특정 다차원 매니폴드(manifold) 상에 존재할 수 있습니다.
   - 이를 통해, **데이터의 패턴**을 기하학적 공간에서 설명하고, 모델의 가정 하에 그 패턴을 학습할 수 있습니다.

2. **확률적 표현**:
   - 확률 분포는 이러한 기하학적 공간에서 데이터가 어떻게 분포되어 있는지를 설명하는 데 사용됩니다. 각 데이터 포인트가 특정 공간 내에서 어떤 위치를 가질 확률을 정의하고, 기하학적 구조에 따라 데이터를 추론합니다.
   - **잠재 변수(latent variable)**와 **확률적 함수**를 결합하여, 데이터를 생성하는 메커니즘을 이해하고 표현합니다.

3. **잠재 공간 (Latent Space)**:
   - 기하학적 확률 모델은 고차원 데이터의 저차원 표현을 학습하는 데 중요한 역할을 합니다. 데이터가 복잡하고 고차원일 때, 모델은 이를 더 간단한 저차원 **잠재 공간**으로 투영(projection)하여 표현할 수 있습니다.
   - 잠재 공간에서 데이터가 어떻게 분포하는지를 모델링하고, 이를 통해 데이터의 중요한 구조를 파악할 수 있습니다. 이 공간에서의 기하학적 구조를 기반으로 **군집화(clustering)**, **분류(classification)** 또는 **차원 축소(dimensionality reduction)** 등의 작업을 수행할 수 있습니다.

4. **매니폴드 학습 (Manifold Learning)**:
   - **매니폴드(manifold)**는 고차원 공간에서 저차원 기하학적 구조를 나타냅니다. 기하학적 확률 모델은 데이터가 단순한 고차원 공간에 균일하게 분포하는 것이 아니라, 특정 저차원 매니폴드 상에 분포한다고 가정할 수 있습니다.
   - 예를 들어, 얼굴 이미지 데이터는 고차원 픽셀 공간에 분포하지만, 실질적으로 얼굴의 각도, 조명, 표정과 같은 몇 가지 주요 변수들로 설명될 수 있는 저차원 매니폴드 상에 위치할 수 있습니다. 이러한 매니폴드를 학습하고 추론하는 것이 기하학적 확률 모델의 핵심 작업 중 하나입니다.

5. **확률적 추론**:
   - 데이터의 잠재적 기하학적 구조를 바탕으로, 확률론적 방법을 통해 데이터를 추론하고 예측합니다. 이는 모델이 학습한 기하학적 구조와 결합된 확률 분포를 사용하여 새로운 데이터에 대한 예측을 수행할 수 있음을 의미합니다.
   - 예를 들어, 주어진 데이터의 특정 영역에서 데이터가 나타날 확률을 계산하거나, 새로운 데이터가 주어졌을 때 그 데이터가 속할 공간을 추정하는 작업을 수행할 수 있습니다.

### Geometric Probabilistic Models의 예시

1. **변분 오토인코더 (Variational Autoencoder, VAE)**:
   - VAE는 고차원 데이터를 저차원 잠재 공간으로 표현하고, 그 잠재 공간에서 데이터를 생성하는 기하학적 확률 모델입니다. VAE는 **잠재 공간**에서 데이터를 생성할 수 있는 잠재 변수의 확률 분포를 학습합니다.
   - 이 모델은 **정규 분포**와 같은 확률 분포를 기반으로 데이터의 잠재 공간을 학습하며, 이 공간에서 기하학적 구조를 통해 데이터의 분포를 설명하고 재구성(reconstruction)합니다.

2. **확률적 매니폴드 학습 (Probabilistic Manifold Learning)**:
   - 이 방법은 데이터가 특정 저차원 매니폴드 상에 분포한다고 가정하고, 그 매니폴드 상에서의 데이터의 확률 분포를 학습하는 방법입니다. **Laplacian Eigenmaps**나 **Isomap**과 같은 기하학적 차원 축소 기법을 확률적 방법과 결합하여 데이터의 구조를 설명할 수 있습니다.

3. **확률적 그래프 모델 (Probabilistic Graphical Models)**:
   - 기하학적 확률 모델의 한 종류로, 그래프 구조를 사용하여 변수 간의 관계를 확률적으로 모델링합니다. 이 모델들은 **베이지안 네트워크**, **마르코프 랜덤 필드** 등을 포함하며, 복잡한 데이터 간의 관계를 기하학적 그래프로 표현하고, 그 위에서 확률적 추론을 수행합니다.

4. **Riemannian Manifolds in Machine Learning**:
   - Riemannian 매니폴드는 곡률을 가지는 기하학적 공간으로, 기하학적 확률 모델에서 사용되는 공간의 한 예시입니다. 이 공간에서 데이터의 분포를 학습하거나, 곡률에 따라 데이터의 이동 경로를 추정할 수 있습니다.
   - **정보 기하학 (Information Geometry)**는 Riemannian 기하학을 활용하여 확률 분포 간의 거리를 계산하고, 이를 통해 확률적 모델 간의 차이를 설명합니다.

### Geometric Probabilistic Models의 장점

1. **고차원 데이터의 효율적 표현**:
   - 기하학적 확률 모델은 고차원 데이터를 더 저차원 공간에서 표현함으로써 데이터의 구조적 정보를 효율적으로 처리할 수 있습니다. 이는 고차원 데이터의 학습과 처리에서 연산 자원을 절감하고, 더 나은 일반화 성능을 제공합니다.

2. **데이터의 잠재 구조 이해**:
   - 복잡한 데이터에서 단순히 데이터를 나열하는 것이 아니라, 그 내부에 숨겨진 **기하학적 구조**를 발견하여 데이터의 근본적인 패턴을 이해할 수 있습니다. 이러한 기법은 특히 **이미지**, **음성**, **텍스트**와 같은 복잡한 데이터를 처리하는 데 효과적입니다.

3. **확률적 추론을 통한 불확실성 처리**:
   - 기하학적 확률 모델은 데이터의 불확실성을 자연스럽게 처리할 수 있습니다. 확률 분포를 기반으로 추론을 수행하므로, 데이터의 예측값에 대한 **불확실성**을 모델링할 수 있으며, 이는 더 신뢰성 있는 결과를 제공할 수 있습니다.

### 요약

**Geometric Probabilistic Models**는 기하학적 구조와 확률 분포를 결합하여 데이터를 분석하고 추론하는 모델입니다. 이러한 모델들은 고차원 데이터를 효율적으로 처리하고, 데이터의 잠재적 구조를 학습하여 데이터의 불확실성을 처리하는 데 유용합니다. 딥러닝과 머신러닝에서 **VAE**와 같은 모델은 이러한 기하학적 확률 모델의 좋은 예이며, 이 모델들은 복잡한 데이터를 처리하는 데 매우 효과적인 도구로 활용됩니다.


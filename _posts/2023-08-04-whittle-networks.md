---
layout: post
title: Predictive Whittle Networks for Time Series
date: 2023-08-04
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Predictive Whittle Networks for Time Series](https://www.youtube.com/watch?v=aF3LJhLePqk)

---

# Predictive Whittle Networks for Time Series

* [Github](https://github.com/ml-research/PWN)

## Abstract

Recent developments have shown that modeling in the spectral domain improves the accuracy in time series forecasting. However, state-of-the-art neural spectral forecasters do not generally yield trustworthy predictions. In particular, they lack the means to gauge predictive likelihoods and provide uncertainty estimates. We propose predictive Whittle networks to bridge this gap, which exploits both the advances of neural forecasting in the spectral domain and leverage tractable likelihoods of probabilistic circuits. For this purpose, we propose a novel Whittle forecasting loss that makes use of these predictive likelihoods to guide the training of the neural forecasting component. We demonstrate how predictive Whittle networks improve real-world forecasting accuracy, while also allowing a transformation back into the time domain, in order to provide the necessary feedback of when the model’s prediction may become erratic.

---

최근의 발전은 스펙트럼 도메인에서의 모델링이 시계열 예측의 정확도를 높인다는 것을 보여주고 있습니다. 그러나 최첨단 신경 스펙트럼 예측기는 일반적으로 신뢰할 만한 예측을 제공하지 않습니다. 특히, 그들은 예측 확률과 불확실성 추정을 평가하는 수단이 부족합니다. 이 간극을 메우기 위해 우리는 예측 위틀 네트워크를 제안합니다. 이는 스펙트럼 도메인에서의 신경 예측의 발전과 확률 회로의 계산 가능한 확률을 모두 활용합니다. 이를 위해 우리는 예측 위틀 예측 손실을 제안합니다. 이 손실은 이러한 예측 확률을 활용하여 신경 예측 구성 요소의 훈련을 이끌어냅니다. 우리는 예측 위틀 네트워크가 실제 세계의 예측 정확도를 향상시키는 방법을 보여주며, 동시에 시간 도메인으로 변환하여 모델의 예측이 불안정해질 수 있는 시기에 필요한 피드백을 제공할 수 있도록 합니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/aF3LJhLePqk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
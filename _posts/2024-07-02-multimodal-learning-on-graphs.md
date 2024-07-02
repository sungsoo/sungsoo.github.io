---
layout: post
title: Multimodal Learning on Graphs
date: 2024-07-02
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Multimodal Learning on Graphs](https://www.youtube.com/watch?v=hjt4nsN_8iM&list=PL0NRmB0fnLJTEIjTUSrZ206RAiMRZHCuh&index=6)

---


# Multimodal Learning on Graphs

* Big Data Conference 9/1/2023
* Speaker: Marinka Zitnik (Harvard Medical School)
* Title: Multimodal Learning on Graphs


## Abstract

Understanding biological and natural systems requires modeling data with underlying geometric relationships across scales and modalities such as biological sequences, chemical constraints, and graphs of 3D spatial or biological interactions. I will discuss unique challenges for learning from multimodal datasets that are due to varying inductive biases across modalities and the potential absence of explicit graphs in the input. I will describe a framework for structure-inducing pretraining that allows for a comprehensive study of how relational structure can be induced in pretrained language models. We use the framework to explore new graph pretraining objectives that impose relational structure in the induced latent spaces—i.e., pretraining objectives that explicitly impose structural constraints on the distance or geometry of pretrained models. Applications in genomic medicine and therapeutic science will be discussed. These include TxGNN, an AI model enabling zero-shot prediction of therapeutic use across over 17,000 diseases, and PINNACLE, a contextual graph AI model dynamically adjusting its outputs to contexts in which it operates. PINNACLE enhances 3D protein structure representations and predicts the effects of drugs at single-cell resolution.


## 다중 모달 데이터로부터 구조 학습: 생물학 및 자연계 이해

생물 및 자연계 시스템을 이해하기 위해서는 생물 서열, 화학적 제약 조건, 3D 공간 상호 작용 또는 생물학적 상호 작용 그래프와 같은 다양한 규모와 모달에서 기저가 되는 기하학적 관계를 가진 데이터를 모델링해야 합니다. 이 발표에서는 다중 모달 데이터셋으로부터 학습하는 과제에서 직면하는 고유한 어려움에 대해 논의할 것입니다. 이러한 어려움은 모달 간의 귀納적 편향(inductive bias) 차이와 입력 데이터에서 명시적인 그래프가 없는 경우 발생할 수 있는 문제 때문입니다.

저는 관계 구조 유도 사전 훈련 (structure-inducing pretraining) 프레임워크에 대해 설명할 것입니다. 이 프레임워크를 사용하면 사전 훈련된 언어 모델에서 관계 구조가 어떻게 유도되는지를 종합적으로 연구할 수 있습니다. 우리는 이 프레임워크를 활용하여 유도된 잠재 공간에 관계 구조를 부여하는 새로운 그래프 사전 훈련 목적 함수를 탐구합니다. 즉, 사전 훈련된 모델의 거리 또는 기하학에 구조적 제약 조건을 명시적으로 부과하는 사전 훈련 목적 함수입니다.

이 발표에서는 게놈 의학 및 치료 과학 분야의 응용 사례를 다룰 것입니다. 여기에는 17,000개 이상의 질병에 대한 치료 용도를 제로-샷 예측하는 AI 모델인 TxGNN과 작동하는 맥락에 따라 출력을 동적으로 조정하는 맥락적 그래프 AI 모델인 PINNACLE이 포함됩니다. PINNACLE은 3D 단백질 구조 표현을 향상시키고 단일 세포 분해능에서 약물의 효과를 예측합니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/hjt4nsN_8iM?si=ud5PEMFTB9TPiM4J" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
---
layout: post
title: HyperPCM-Robust Task-Conditioned Modeling of Drug-Target Interactions
date: 2024-04-04
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [HyperPCM-Robust Task-Conditioned Modeling of Drug-Target Interactions](https://www.youtube.com/watch?v=H-QQRxEqhas)

---



# HyperPCM-Robust Task-Conditioned Modeling of Drug-Target Interactions

## Summary
A central problem in drug discovery is to identify the interactions between drug-like compounds and protein targets. Over the past few decades, various quantitative structure–activity relationship (QSAR) and proteo-chemometric (PCM) approaches have been developed to model and predict these interactions. While QSAR approaches solely utilize representations of the drug compound, PCM methods incorporate both representations of the protein target and the drug compound, enabling them to achieve above-chance predictive accuracy on previously unseen protein targets. Both QSAR and PCM approaches have recently been improved by machine learning and deep neural networks, that allow the development of drug–target interaction prediction models from measurement data. However, deep neural networks typically require large amounts of training data and cannot robustly adapt to new tasks, such as predicting interaction for unseen protein targets at inference time. We propose to use HyperNetworks to efficiently transfer information between tasks during inference and thus to accurately predict drug–target interactions on unseen protein targets. Our HyperPCM method reaches state-of-the-art performance compared to previous methods on multiple well-known benchmarks, including Davis, DUD-E, and a ChEMBL derived data set, and particularly excels at zero-shot inference involving unseen protein targets.

* Speakers: Emma Svensson

## 의약 발굴의 핵심: 하이퍼 네트워크를 활용한 새로운 단백질-물질 상호 작용 예측 방법

의약 발굴에서 핵심적인 문제는 약물 유사 화합물과 단백질 표적 간의 상호 작용을 규명하는 것입니다. 지난 수십 년 동안 이러한 상호 작용을 모델링하고 예측하기 위한 다양한 QSAR (quantitative structure–activity relationship) 및 PCM (proteochemometric) 방법들이 개발되었습니다. 

QSAR 방법은 단지 약물 화합물의 구조 정보만을 사용하는 반면, PCM 방법은 단백질 표적과 약물 화합물 모두의 구조 정보를 활용하여 기존에 알려지지 않은 단백질 표적에 대해 우연히 예측하는 것 이상의 정확성을 달성할 수 있습니다. 최근에는 기계 학습과 깊은 신경망을 활용하여 QSAR 및 PCM 방법 모두 개선되었으며, 이를 통해 측정 데이터로부터 약물-단백질 상호 작용 예측 모델을 개발할 수 있게 되었습니다.

하지만 딥 러닝은 일반적으로 많은 양의 훈련 데이터를 필요로 하고 추론 시간에 새로운 단백질 표적에 대한 상호 작용을 예측하는 등 새로운 작업에 강건하게 적응하지 못합니다. 우리는 하이퍼 네트워크(HyperNetwork)를 사용하여 추론 과정에서 효율적으로 작업 간 정보를 전달하고 이를 통해 새로운 단백질 표적에 대한 약물-단백질 상호 작용을 정확하게 예측하는 방법을 제안합니다. 

우리의 HyperPCM 방법은 Davis, DUD-E, ChEMBL 데이터셋 등 여러 잘 알려진 벤치마크에서 최첨단 성능을 달성했으며, 특히 새로운 단백질 표적과의 상호 작용 예측 (제로샷 추론)에서 뛰어난 성능을 보여줍니다. 


<iframe width="600" height="400" src="https://www.youtube.com/embed/H-QQRxEqhas?si=BmtgZ2EIZ56hTUmg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
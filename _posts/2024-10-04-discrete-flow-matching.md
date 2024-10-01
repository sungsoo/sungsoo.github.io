---
layout: post
title: Discrete Flow Matching
date: 2024-10-04
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Discrete Flow Matching](https://www.youtube.com/watch?v=fuzYeqp1n5g)

---



# Discrete Flow Matching


* Paper: [https://arxiv.org/abs/2407.15595](https://arxiv.org/abs/2407.15595)
* Speakers: Andrew Campbell



## Abstract

Despite Flow Matching and diffusion models having emerged as powerful generative paradigms for continuous variables such as images and videos, their application to high-dimensional discrete data, such as language, is still limited. In this work, we present Discrete Flow Matching, a novel discrete flow paradigm designed specifically for generating discrete data. Discrete Flow Matching offers several key contributions: (i) it works with a general family of probability paths interpolating between source and target distributions; (ii) it allows for a generic formula for sampling from these probability paths using learned posteriors such as the probability denoiser (x-prediction) and noise-prediction (ϵ-prediction); (iii) practically, focusing on specific probability paths defined with different schedulers considerably improves generative perplexity compared to previous discrete diffusion and flow models; and (iv) by scaling Discrete Flow Matching models up to 1.7B parameters, we reach 6.7% Pass@1 and 13.4% Pass@10 on HumanEval and 6.7% Pass@1 and 20.6% Pass@10 on 1-shot MBPP coding benchmarks. Our approach is capable of generating high-quality discrete data in a non-autoregressive fashion, significantly closing the gap between autoregressive models and discrete flow models.

Flow Matching과 확산 모델이 이미지나 비디오와 같은 연속적인 변수에 대해 강력한 생성 패러다임으로 등장했음에도 불구하고, 언어와 같은 고차원 이산 데이터에 대한 적용은 여전히 제한적입니다. 이 연구에서는 이산 데이터를 생성하기 위해 특별히 설계된 새로운 이산 흐름 패러다임인 Discrete Flow Matching을 소개합니다. Discrete Flow Matching은 다음과 같은 몇 가지 주요 기여를 합니다: (i) 출발 분포와 목표 분포 사이를 보간하는 일반적인 확률 경로에 작동합니다. (ii) 확률 denoiser(x-예측) 및 노이즈 예측(ϵ-예측)과 같은 학습된 사후 확률을 사용하여 이러한 확률 경로에서 샘플링하기 위한 일반적인 공식을 허용합니다. (iii) 실질적으로는 서로 다른 스케줄러로 정의된 특정 확률 경로에 집중하면 이전의 이산 확산 및 흐름 모델에 비해 생성 퍼플렉시티가 상당히 향상됩니다. (iv) Discrete Flow Matching 모델을 최대 17억 개의 파라미터로 확장하여 HumanEval 벤치마크에서 Pass@1 6.7%와 Pass@10 13.4%, 1-shot MBPP 코딩 벤치마크에서 Pass@1 6.7%와 Pass@10 20.6%를 달성합니다. 이 접근 방식은 비자기회귀(non-autoregressive) 방식으로 고품질의 이산 데이터를 생성할 수 있으며, 자기회귀 모델과 이산 흐름 모델 간의 성능 차이를 상당히 좁혔습니다.



<iframe width="600" height="400" src="https://www.youtube.com/embed/fuzYeqp1n5g?si=p93NGpYqBupwAMEy" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

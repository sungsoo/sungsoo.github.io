---
layout: post
title: Diffusion Models on Sampling Rare Events
date: 2024-03-31
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Diffusion Models on Sampling Rare Events](https://www.youtube.com/watch?v=7IJnosb0kNA)

---



# Diffusion Models on Sampling Rare Events

* Speakers: Chenru Duan

## Abstract

Transition state (TS) search is key in chemistry for elucidating reaction mechanisms and exploring reaction networks. The search for accurate 3D TS structures, however, requires numerous com- putationally intensive quantum chemistry calculations due to the complexity of potential energy surfaces. Here, we developed an object-aware SE(3) equivariant diffusion model that satisfies all physical symmetries and constraints for generating sets of structures – reactant, TS, and product – in an elementary reaction. Provided reactant and product, this model generates a TS structure in seconds instead of hours, which is typically required when performing quantum chemistry-based optimizations. The generated TS structures achieve a median of 0.08 Å root mean square deviation compared to the true TS. With a confidence scoring model for uncertainty quantification, we approach an accuracy required for reaction barrier estimation (2.6 kcal/mol) by only performing quantum chemistry-based optimizations on 14% of the most challenging reactions. We envision the proposed approach useful in constructing large reaction networks with unknown mechanisms.

## 화학 반응 경로 탐색을 위한 확산 모델 기반 천이 상태 예측

화학 반응 메커니즘을 규명하고 반응 네트워크를 탐색하는 데 있어 천이 상태(TS) 탐색이 중요합니다. 하지만 3차원 TS 구조의 정확한 예측은 퍼텐셜 에너지 면의 복잡성 때문에 많은 계산 리소스를 요구하는 양자 화학 계산을 필요로 합니다. 이 연구에서는 모든 물리적 대칭 및 제약 조건을 만족하는 객체 인식 SE(3) equivariant 확산 모델을 개발하여 초등 반응에서 반응물, 천이 상태, 생성물 세트를 생성합니다. 이 모델은 제공된 반응물과 생성물을 기반으로 褌 양자 화학 기반 최적화를 통해 일반적으로 필요한 수 시간 대신 불과 몇 초 만에 TS 구조를 생성합니다. 생성된 TS 구조는 실제 TS와 비교하여 평균 0.08 Å의 루트 평균 제곱 편차(RMSD)를 달성합니다. 불확실성 정량화를 위한 신뢰도 측정 모델을 사용하여 가장 어려운 반응의 14%만 양자 화학 기반 최적화를 수행함으로써 반응 장벽 추정 (2.6 kcal/mol)에 필요한 정확도에 근접합니다. 이러한 접근 방식은 메커니즘이 알려지지 않은 대규모 반응 네트워크 구축에 유용할 것으로 예상됩니다.

**핵심 내용:**

* 화학 반응 경로 탐색의 중요성
* 천이 상태(TS) 탐색: 3차원 구조 예측의 어려움
* 객체 인식 SE(3) equivariant 확산 모델 개발
* 정확하고 빠른 TS 구조 생성
* 불확실성 정량화를 통한 신뢰도 평가
* 반응 장벽 추정에 적합한 정확도 달성
* 알려지지 않은 메커니즘을 가진 대규모 반응 네트워크 구축, 응용 가능성
* 
<iframe width="600" height="400" src="https://www.youtube.com/embed/7IJnosb0kNA?si=2Uouj104uFpPix2c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
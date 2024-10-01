---
layout: post
title: Normalizing Flows
date: 2024-09-28
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Normalizing Flows](https://www.youtube.com/watch?v=bu9WZ0RFG0U)

---


# Normalizing Flows

* [Materials](https://github.com/probabilisticai/probai-2022/)


<iframe width="600" height="400" src="https://www.youtube.com/embed/bu9WZ0RFG0U?si=G4DCejRsZbzDnd_j" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## 정규화 플로우(Normalizing Flows) 상세 설명

**정규화 플로우**는 흐름 기반 생성 모델(Flow-Based Generative Model)의 가장 기본적인 형태입니다. 복잡한 데이터 분포를 단순한 분포 (예: 다변량 정규 분포)로 변환하고, 이를 통해 데이터를 생성하는 모델입니다.

### 정규화 플로우의 작동 원리

1. **가역적인 변환:** 정규화 플로우는 데이터 x를 잠재 변수 z로 변환하는 함수 f와 그 역함수 f^-1을 정의합니다. 이 변환들은 가역적이어야 하므로, 데이터 x를 z로 변환하고 다시 z를 x로 복원할 수 있어야 합니다.
2. **단순한 잠재 공간:** 잠재 변수 z는 일반적으로 다변량 정규 분포와 같은 간단한 분포를 따르도록 설정됩니다.
3. **변환 과정:**
   * **데이터 변환:** 실제 데이터 x는 복잡한 분포를 가지고 있습니다. 정규화 플로우는 이 데이터를 일련의 가역적인 변환을 통해 점차 단순한 분포를 가진 잠재 변수 z로 변환합니다.
   * **잠재 공간 샘플링:** 단순한 분포를 가진 잠재 공간 z에서 샘플을 추출합니다.
   * **데이터 생성:** 추출된 잠재 변수 z를 역변환하여 새로운 데이터 x를 생성합니다.

### 정규화 플로우의 구성 요소

* **기본 변환:** 정규화 플로우는 여러 개의 기본 변환을 연속적으로 연결하여 복잡한 변환을 구현합니다. 대표적인 기본 변환으로는 아핀 변환(Affine Transformation), 라디언트 필드(Radial Basis Function), 스플릿-합치기 변환(Split-and-Concat Transformation) 등이 있습니다.
* **합성:** 각 기본 변환은 이전 변환의 출력을 입력으로 받아 새로운 변환을 수행합니다. 이러한 과정을 통해 복잡한 변환을 구축할 수 있습니다.
* **가역성 보장:** 각 변환은 가역적이어야 하므로, 변환의 자코비안 행렬(Jacobian matrix)의 결정자가 0이 되지 않도록 설계해야 합니다.

### 정규화 플로우의 장점

* **유연성:** 다양한 형태의 기본 변환을 조합하여 복잡한 데이터 분포를 모델링할 수 있습니다.
* **해석 가능성:** 각 변환의 역할을 상대적으로 쉽게 이해할 수 있습니다.
* **안정적인 학습:** 학습 과정이 상대적으로 안정적이며, 모드 붕괴 문제가 발생할 가능성이 적습니다.

### 정규화 플로우의 한계점

* **복잡한 모델 설계:** 효과적인 정규화 플로우를 설계하기 위해서는 다양한 변환과 그 조합에 대한 이해가 필요합니다.
* **계산 비용:** 복잡한 모델일수록 계산 비용이 증가할 수 있습니다.

### 결론

정규화 플로우는 흐름 기반 생성 모델의 기본적인 형태로, 다양한 분야에서 활용되고 있습니다. 특히, 이미지 생성, 텍스트 생성 등 다양한 생성 모델링 문제에 적용될 수 있습니다. 하지만, 더욱 복잡한 데이터 분포를 모델링하기 위해서는 더욱 발전된 흐름 기반 모델이 필요합니다.


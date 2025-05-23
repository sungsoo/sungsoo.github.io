---
layout: post
title: Frisch-Waugh-Lovell Theorem and Orthogonalization  
date: 2025-05-11
categories: [artificial intelligence]
tags: [machine learning]

---


# [Frisch-Waugh-Lovell Theorem](https://www.youtube.com/watch?v=u3NeKofbRIw) and Orthogonalization


## Frisch-Waugh-Lovell Theorem과 Orthogonalization

### 주요 요약
- **FWL Theorem**: 연구에 따르면, 다중 회귀분석에서 특정 설명변수의 효과를 추정할 때 다른 변수의 영향을 제거한 잔차를 사용하는 것이 유용할 수 있습니다.  
- **Orthogonalization**: 증거는 설명변수 간의 상관관계를 제거하여 각 변수의 독립적인 기여도를 명확히 하는 과정을 지지하는 것으로 보입니다.  
- 이 주제는 통계 및 경제학에서 논쟁의 여지가 있으며, 다양한 방법론에 따라 해석이 달라질 수 있습니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/u3NeKofbRIw?si=Kf0h9Ze8_8RTHIop" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### FWL Theorem이란?
Frisch-Waugh-Lovell Theorem(FWL Theorem)은 다중 회귀분석에서 각 설명변수의 고유한 영향을 추정하는 방법을 제공합니다. 예를 들어, $$ Y = X_1 \beta_1 + X_2 \beta_2 + \epsilon $$라는 모형에서 $$ X_2 $$의 효과를 추정하려면, 먼저 $$ X_1 $$의 영향을 $$ Y $$와 $$ X_2 $$에서 제거한 후 잔차를 회귀분석하면 됩니다. 이는 계산을 단순화하고 변수 간 상관관계를 관리하는 데 도움을 줍니다.

### Orthogonalization이란?
Orthogonalization은 선형 대수에서 벡터가 서로 직교하도록 만드는 과정입니다. 회귀분석에서는 설명변수 간의 선형 의존성을 제거하여 각 변수의 독립적인 기여도를 명확히 합니다. FWL Theorem에서 $$ X_2 $$를 $$ X_1 $$에 대해 회귀분석하여 얻은 잔차는 $$ X_1 $$과 직교하게 되어, $$ X_2 $$의 순수한 영향을 추정할 수 있습니다.

---

## 상세 내용

### 서론
Frisch-Waugh-Lovell Theorem(FWL Theorem)과 Orthogonalization은 통계학 및 경제학에서 다중 회귀분석의 복잡성을 다루는 데 중요한 개념입니다. 이 보고서는 FWL Theorem의 정의, 작동 방식, 그리고 Orthogonalization과의 연관성을 직관적으로 설명하며, 관련 연구와 사례를 바탕으로 상세히 탐구합니다. 이 주제는 특히 변수 간 상관관계가 높은 상황에서 변수의 독립적인 기여도를 추정하는 데 유용하며, 학문적 논쟁의 여지도 있습니다.

### Frisch-Waugh-Lovell Theorem의 정의 및 작동
FWL Theorem은 Ragnar Frisch, Frederick V. Waugh, Michael C. Lovell의 이름에서 유래된 경제학 이론으로, 1933년과 1963년에 발표된 연구에 기반합니다. 이 정리는 다중 회귀분석에서 특정 설명변수의 회귀계수를 추정할 때, 다른 설명변수의 영향을 제거한 잔차를 사용하여 단순 회귀분석을 수행하면 전체 모형과 동일한 결과를 얻을 수 있음을 보여줍니다.

#### 수학적 표현
다중 회귀모형을 다음과 같이 고려해봅시다:
$$ Y = X_1 \beta_1 + X_2 \beta_2 + \epsilon $$
여기서:
- $$ Y $$: 종속변수
- $$ X_1 $$: 제어 변수
- $$ X_2 $$: 관심 있는 설명변수
- $$ \beta_1, \beta_2 $$: 회귀계수
- $$ \epsilon $$: 오차항

FWL Theorem에 따르면, $$ \beta_2 $$의 OLS(Ordinary Least Squares) 추정치는 다음과 같은 과정을 통해 얻을 수 있습니다:
1. $$ Y $$를 $$ X_1 $$에 대해 회귀분석하여 잔차 $$ Y^* $$를 구합니다:
   $$ Y^* = Y - X_1 \hat{\beta}_1 $$
   여기서 $$ \hat{\beta}_1 $$은 $$ Y $$를 $$ X_1 $$에 대해 추정한 계수입니다.
2. $$ X_2 $$를 $$ X_1 $$에 대해 회귀분석하여 잔차 $$ X_2^* $$를 구합니다:
   $$ X_2^* = X_2 - X_1 \hat{\gamma} $$
   여기서 $$ \hat{\gamma} $$는 $$ X_2 $$를 $$ X_1 $$에 대해 추정한 계수입니다.
3. $$ Y^* $$를 $$ X_2^* $$에 대해 회귀분석하여 얻은 회귀계수가 $$ \beta_2 $$의 추정치와 동일합니다.

수학적으로, 이는 다음과 같이 표현됩니다:
$$ \hat{\beta}_2 = (X_2^T M_{X_1} X_2)^{-1} X_2^T M_{X_1} Y $$
여기서 $$ M_{X_1} = I - X_1 (X_1^T X_1)^{-1} X_1^T $$는 $$ X_1 $$의 열공간에 직교한 공간으로의 투영 행렬입니다.

#### 직관적 의미
FWL Theorem은 다중 회귀분석을 단순 회귀분석의 일련으로 분해할 수 있음을 보여줍니다. 이는 특히 설명변수들 사이에 상관관계가 있을 때 유용합니다. 예를 들어, $$ X_1 $$과 $$ X_2 $$가 상관관계가 있다면, $$ X_2 $$의 회귀계수는 $$ X_1 $$의 영향을 제대로 반영하지 않을 수 있습니다. FWL Theorem은 $$ X_1 $$의 영향을 제거한 후 $$ X_2 $$의 순수한 영향력만을 추정할 수 있게 해줍니다.

- $$ Y^* $$는 $$ X_1 $$의 영향을 제거한 $$ Y $$의 잔차로, $$ X_1 $$과 무관한 부분만 남겨둡니다.
- $$ X_2^* $$는 $$ X_1 $$의 영향을 제거한 $$ X_2 $$의 잔차로, $$ X_1 $$과 직교(orthogonal)한 부분만 남겨둡니다.
- 따라서 $$ Y^* $$를 $$ X_2^* $$에 대해 회귀분석하는 것은 $$ X_1 $$의 영향을 배제한 상태에서 $$ X_2 $$의 순수한 영향력을 추정하는 것입니다.

이 정리는 과거 컴퓨팅 자원이 제한적이었던 시기에 다중 회귀분석보다 단순 회귀분석이 더 쉽게 계산될 수 있었기 때문에 실용적이었습니다. 오늘날에도 변수 간 상관관계를 이해하고, 각 변수의 독립적인 기여도를 분석하는 데 중요한 도구로 사용됩니다.

### Orthogonalization의 정의 및 회귀분석에서의 역할
Orthogonalization은 선형 대수에서 벡터가 서로 직교하도록 만드는 과정입니다. 두 벡터가 직교한다는 것은 그들의 내적(dot product)이 0임을 의미합니다. 회귀분석의 맥락에서 Orthogonalization은 설명변수들 간의 선형 의존성을 제거하여 각 변수의 독립적인 영향력을 명확히 파악하는 데 사용됩니다.

#### Orthogonalization의 과정
회귀분석에서 설명변수들이 서로 직교하지 않으면, 즉 상관관계가 있으면, 각 변수의 회귀계수를 해석하기 어렵습니다. 예를 들어, $$ X_1 $$과 $$ X_2 $$가 강한 상관관계를 가진다면, $$ Y $$에 대한 $$ X_2 $$의 영향력이 실제로는 $$ X_1 $$의 영향력과 혼합되어 있을 수 있습니다.

FWL Theorem은 이러한 문제를 해결하기 위해 Orthogonalization을 사용합니다:
- $$ X_2 $$를 $$ X_1 $$에 대해 회귀분석하여 얻은 잔차 $$ X_2^* $$는 $$ X_1 $$과 직교합니다.
- 즉, $$ X_2^* $$는 $$ X_1 $$의 영향을 완전히 제거한 $$ X_2 $$의 부분입니다.
- $$ Y $$를 $$ X_1 $$에 대해 회귀분석하여 얻은 잔차 $$ Y^* $$도 $$ X_1 $$과 직교합니다.
- 따라서 $$ Y^* $$를 $$ X_2^* $$에 대해 회귀분석하는 것은 $$ X_1 $$과 무관한 $$ X_2 $$의 순수한 영향력을 추정하는 것입니다.

#### 직관적 의미
Orthogonalization은 변수 간의 중복된 정보를 제거하고, 각 변수의 독립적인 기여를 명확히 드러내는 과정입니다. 예를 들어:
- $$ X_1 $$과 $$ X_2 $$가 모두 $$ Y $$를 설명하는 데 기여한다고 가정해봅시다.
- 하지만 $$ X_1 $$과 $$ X_2 $$가 상관관계가 있다면, $$ X_2 $$의 회귀계수는 $$ X_1 $$의 영향을 포함하고 있을 수 있습니다.
- FWL Theorem을 사용하여 $$ X_2 $$를 직교화하면, $$ X_2 $$의 순수한 기여만을 추정할 수 있습니다.

이 개념은 주성분 분석(Principal Component Analysis, PCA)과도 관련이 있습니다. PCA는 변수들을 직교화하여 새로운 직교 변수(주성분)를 생성하고, 이로써 다중 공선성(multicollinearity) 문제를 해결합니다. FWL Theorem은 이러한 직교화 개념을 회귀분석에 적용한 것입니다.

### FWL Theorem과 Orthogonalization의 연관성
FWL Theorem은 Orthogonalization의 개념을 회귀분석에 적용한 예입니다. 구체적으로:
- $$ X_2 $$를 $$ X_1 $$에 대해 회귀분석하여 얻은 잔차 $$ X_2^* $$는 $$ X_1 $$과 직교합니다.
- $$ Y $$를 $$ X_1 $$에 대해 회귀분석하여 얻은 잔차 $$ Y^* $$도 $$ X_1 $$과 직교합니다.
- 따라서 $$ Y^* $$를 $$ X_2^* $$에 대해 회귀분석하는 것은 $$ X_1 $$의 영향을 완전히 배제한 상태에서 $$ X_2 $$의 영향력을 추정하는 것입니다.

이 과정은 다중 회귀분석을 단순 회귀분석으로 분해하여, 각 설명변수의 독립적인 기여를 더 쉽게 이해할 수 있게 해줍니다.

### 활용 사례 및 논쟁
FWL Theorem은 다음과 같은 상황에서 유용합니다:
- **고정 효과(fixed effects) 제거**: 패널 데이터에서 고정 효과를 제거할 때, FWL Theorem을 사용하여 효과적으로 처리할 수 있습니다.
- **상관관계 조정**: 설명변수들 사이에 상관관계가 있을 때, 각 변수의 순수한 영향력을 추정하기 위해 사용됩니다.
- **해석의 명확성**: 다중 회귀분석의 결과를 단순 회귀분석으로 분해하여 해석을 더 쉽게 할 수 있습니다.

이 주제는 학문적 논쟁의 여지도 있습니다. 예를 들어, 일부 연구자는 FWL Theorem이 고정 효과를 다룰 때 특히 유용하다고 보지만, 다른 연구자는 계산 복잡성과 해석의 한계를 지적합니다. 이러한 논쟁은 변수의 상관관계 정도와 데이터의 특성에 따라 달라질 수 있습니다.

### 표를 통한 요약

| **개념**               | **정의**                                                                 | **FWL Theorem과의 관계**                          |
|------------------------|--------------------------------------------------------------------------|--------------------------------------------------|
| FWL Theorem           | 다중 회귀분석에서 특정 변수의 효과를 추정하기 위해 잔차를 사용하는 방법 | 직접 적용, $$ X_1 $$의 영향을 제거한 후 $$ X_2 $$ 추정 |
| Orthogonalization     | 설명변수 간의 선형 의존성을 제거하여 직교화하는 과정                   | FWL Theorem의 핵심 과정, $$ X_2^* $$와 $$ Y^* $$ 생성 |

### 결론
Frisch-Waugh-Lovell Theorem은 다중 회귀분석에서 각 설명변수의 고유한 영향력을 추정하기 위한 강력한 도구입니다. 이 정리는 Orthogonalization의 개념을 활용하여, 설명변수 간의 상관관계를 제거하고, 각 변수의 순수한 기여를 명확히 드러냅니다. 직관적으로, FWL Theorem은 다중 회귀분석을 단순 회귀분석의 일련으로 분해하여, 변수 간의 관계를 더 쉽게 이해할 수 있게 해줍니다. 이 주제는 통계 및 경제학에서 중요한 논의 주제이며, 다양한 방법론과 데이터 특성에 따라 해석이 달라질 수 있습니다.

### 주요 인용
- [Partial Regression 설명 Velog](https://velog.io/@ddangchani/Partial-Regression)
- [Frisch–Waugh–Lovell theorem Wikipedia](https://en.wikipedia.org/wiki/Frisch%E2%80%93Waugh%E2%80%93Lovell_theorem)
- [Understanding the Frisch-Waugh-Lovell Theorem Medium](https://medium.com/data-science/the-fwl-theorem-or-how-to-make-all-regressions-intuitive-59f801eb3299)
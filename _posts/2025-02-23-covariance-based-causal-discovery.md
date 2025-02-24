---
layout: post
title: Covariance-based Causal Discovery
date: 2025-02-23
categories: [artificial intelligence]
tags: [machine learning]
use_math: true

---


# Covariance-based Causal Discovery

Covariance-based causal discovery는 변수들 간의 공분산(covariance) 및 상관관계(correlation) 구조를 활용하여 인과 그래프(Directed Acyclic Graph, DAG)를 추론하는 방법이다. 이 방법은 데이터의 2차 통계량만을 이용하여 조건부 독립성(conditional independence) 관계를 규명하고, 그로부터 인과적 구조를 도출하는 데 초점을 둔다.

---

## 1. 기본 원리

선형 인과 모델(linear causal model)과 가우시안 잡음(Gaussian noise)을 가정할 경우, 변수들의 상관관계 및 공분산 행렬은 인과 구조에 의해 결정된다. 각 변수 $$math X_i$$ 는 부모 변수 집합 $$math \text{Pa}(X_i)$$ 와 외생 변수 $$math U_i$$ 에 의해 결정된다고 모델링한다.

```math
X_i = \sum_{X_j \in \text{Pa}(X_i)} \beta_{ij} X_j + U_i
```

여기서 $$math \beta_{ij}$$ 는 인과 효과를 나타내는 계수이며, $$math U_i$$ 는 평균 0, 분산 $$math \sigma^2_i$$ 를 갖는 독립 가우시안 잡음이다. 이 모델 하에서는 변수 간의 공분산은 인과 경로를 반영하며, 특정 조건부 독립성 제약(condition independence constraint)이 나타난다.

---

## 2. 조건부 독립성과 공분산

두 변수 $$math X$$ 와 $$math Y$$ 가 다른 변수 $$math Z$$ 에 대해 조건부 독립(conditional independence)하다는 것은, $$math Z$$ 를 알고 있을 때 $$math X$$ 와 $$math Y$$  사이에 추가적인 상관관계가 없음을 의미한다. 이는 부분 상관계수(partial correlation)를 통해 측정할 수 있으며, 수식은 다음과 같다.

```math
\rho_{XY\cdot Z} = \frac{\rho_{XY} - \rho_{XZ}\rho_{YZ}}{\sqrt{(1-\rho_{XZ}^2)(1-\rho_{YZ}^2)}}
```

만약 $$math \rho_{XY\cdot Z} = 0$$ 라면, $$math X$$ 와 $$math Y$$ 는 $$math Z$$ 에 대해 조건부 독립임을 의미한다. 이러한 조건부 독립성 관계는 인과 그래프의 엣지(edge) 제거에 사용되며, 변수 간의 직접적 인과관계를 밝혀내는 데 중요한 단서가 된다.

---

## 3. 구체적 예시

### 예시 1: 공통 원인 모형 (Common Cause Model)

변수 $$math Z$$ 가 $$math X$$ 와 $$math Y$$ 의 공통 원인인 상황을 고려하자.

```math
X = \beta_{XZ} Z + U_X,\quad Y = \beta_{YZ} Z + U_Y
```

이 경우, $$math X$$ 와 $$math Y$$ 는 $$math Z$$ 를 통해 간접적으로 연관되어 공분산 $$math \text{Cov}(X,Y) \neq 0$$ 를 보인다. 그러나 $$math Z$$ 를 조건으로 할 경우 $$math X$$ 와 $$math Y$$ 는 조건부 독립이 된다.

수식으로 표현하면,

```math
\rho_{XY\cdot Z} \approx 0
```

이 결과는 $$math X$$ 와 $$math Y$$  사이의 상관관계가 직접적 인과 효과가 아니라, 공통 원인 $$math Z$$ 에 기인함을 시사한다.

### 예시 2: 직접적 인과 모형 (Direct Causal Model)

변수 $$math X$$ 가 직접적으로 $$math Y$$ 에 영향을 미치는 모형을 고려하면,

```math
Y = \beta_{YX} X + U_Y
```

이 경우, $$math X$$ 와 $$math Y$$ 의 공분산은 인과 효과 $$math \beta_{YX}$$ 에 의해 결정되며, 조건부 독립성을 부정한다. 즉, 어떤 다른 변수 $$math Z$$ 를 조건으로 해도 $$math X$$ 와 $$math Y$$  사이의 상관관계는 여전히 존재한다.

---

## 4. 알고리즘 적용

실제 데이터에서 covariance-based causal discovery 알고리즘은 다음과 같은 절차를 따른다.

1. **공분산 행렬 추정:**  
   데이터로부터 변수들 간의 공분산 행렬 $$math \Sigma$$ 를 계산한다.

2. **조건부 독립성 검정:**  
   부분 상관계수를 이용해 각 변수 쌍에 대해 다른 변수들을 조건으로 한 독립성 검정을 수행한다. 예를 들어, $$math X$$ 와 $$math Y$$ 가 $$math Z$$ 에 대해 조건부 독립인지 확인한다.

3. **인과 그래프 구성:**  
   조건부 독립성 관계를 토대로 그래프의 엣지를 제거하거나 방향을 부여하여 가능한 인과 구조(DAG)를 구성한다. 대표적인 알고리즘으로는 PC 알고리즘이나 IC 알고리즘이 있다.

4. **신뢰성 평가:**  
   인과 구조가 데이터의 조건부 독립성 제약을 모두 만족하는지 평가한다.

---

## 5. 결론

Covariance-based causal discovery는 선형 및 가우시안 가정 하에서 변수들의 공분산 및 부분 상관관계를 활용하여 인과적 관계를 도출한다. 구체적인 예로 공통 원인 모형과 직접적 인과 모형을 통해, 조건부 독립성 검정이 인과 구조를 밝히는 데 어떻게 활용되는지 설명하였다. 이 방식은 데이터의 2차 통계량만으로 인과 그래프의 뼈대를 구성할 수 있으나, 비선형성이나 비가우시안 분포가 존재하는 경우에는 한계가 있을 수 있다.
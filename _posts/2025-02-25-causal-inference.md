---
layout: post
title: Potential Outcome Framework and Structured Causal Models
date: 2025-02-25
categories: [artificial intelligence]
tags: [machine learning]

---

# Potential Outcome Framework

Potential Outcome Framework(잠재적 결과 프레임워크)는 인과 추론에서 개별 단위가 특정 처치를 받았을 때와 받지 않았을 때 나타날 결과를 동시에 고려하여 인과 효과를 정의하는 이론적 틀이다. 이 프레임워크는 Rubin Causal Model(RCM)이라고도 불리며, 각 단위에 대해 두 개 이상의 잠재적 결과(potential outcomes)를 가정하여 “만약 처치를 했더라면”과 “만약 처치를 하지 않았더라면”의 결과 차이를 인과 효과로 정의한다.

---

<iframe width="600" height="400" src="https://www.youtube.com/embed/XklkKuC6S58?si=efyetkDoDQzQL5fP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## 1. 기본 개념

각 단위 $$i$$에 대해 처치 $$T$$가 있을 때 나타나는 잠재적 결과를 $$Y_i(1)$$, 처치를 받지 않았을 때의 결과를 $$Y_i(0)$$라고 표기한다. 여기서  
- $$Y_i(1)$$: 단위 $$i$$가 처치(treatment)를 받았을 때의 결과  
- $$Y_i(0)$$: 단위 $$i$$가 처치를 받지 않았을 때의 결과  

인과 효과(individual causal effect)는 단위 $$i$$에 대해  
$$
\text{개별 인과 효과} = Y_i(1) - Y_i(0)
$$
로 정의된다.

그러나 한 단위에 대해 동시에 두 가지 결과를 관찰하는 것은 불가능하다. 이것을 “기본 인과 추론 문제(Fundamental Problem of Causal Inference)”라고 부른다. 따라서 연구자는 모집단 전체의 평균 인과 효과(average treatment effect, ATE)를 추정하는 데 주목한다.  
$$
\text{ATE} = E\left[ Y_i(1) - Y_i(0) \right]
$$

---

## 2. 관찰 가능한 데이터와 반사실적 결과

실제 관측에서는 각 단위에 대해 처치 여부 $$T_i$$에 따라 한쪽 결과만 관찰된다. 즉,  
$$
Y_i = T_i Y_i(1) + (1-T_i) Y_i(0)
$$
여기서 $$T_i$$는 이진 처치 변수로, $$T_i = 1$$이면 처치를 받았고, $$T_i = 0$$이면 받지 않은 상태를 의미한다.

이로 인해 각 단위에 대해 반사실적(counterfactual) 결과, 즉 실제로 관찰되지 않은 $$Y_i(1)$$ 또는 $$Y_i(0)$$는 직접 측정할 수 없으며, 인과 효과 추정은 적절한 비교군 선정, 무작위 배정(randomization) 또는 통계적 보정(methods for confounding control)을 통해 이루어진다.

---

## 3. 구체적 예제: 의료 치료 효과 평가

### (1) 상황 설정

예를 들어, 새로운 항암제의 효과를 평가하는 임상 연구를 생각해보자. 각 환자에 대해  
- $$Y_i(1)$$: 새로운 항암제를 투여받았을 때 생존 기간  
- $$Y_i(0)$$: 기존 치료 또는 위약(placebo)을 받았을 때 생존 기간  

### (2) 인과 효과 정의

환자 $$i$$의 개별 인과 효과는  
$$
\Delta_i = Y_i(1) - Y_i(0)
$$
로 정의된다. 전체 환자 집단에 대해 평균 인과 효과(ATE)는  
$$
\text{ATE} = E\left[ Y_i(1) - Y_i(0) \right]
$$
로 나타낸다.

### (3) 관측 데이터와 반사실적 문제

실제 임상 시험에서는 각 환자가 무작위로 새로운 항암제 또는 위약을 받게 되어,  
$$
Y_i = T_i Y_i(1) + (1-T_i) Y_i(0)
$$
의 형태로 관측된다. 만약 환자 A가 항암제를 받았다면 $$Y_A(1)$$는 관측되지만 $$Y_A(0)$$는 반사실적 결과이므로 직접 알 수 없다.

### (4) 무작위 배정의 역할

무작위 배정을 통해 두 그룹(처치군과 대조군)이 유사한 특성을 갖도록 만들면,  
$$
E\left[ Y_i(0) \mid T_i = 1 \right] \approx E\left[ Y_i(0) \mid T_i = 0 \right]
$$
가 성립한다. 이를 통해 관측된 두 그룹 간의 평균 결과 차이가 새로운 항암제의 인과 효과로 추정될 수 있다.

---

## 4. 잠재적 결과 프레임워크의 의의

- **반사실적 사고의 체계적 정의:** "만약 ~였다면"이라는 반사실적 질문에 대해 명시적인 잠재적 결과를 도입하여 인과 효과를 정의한다.
- **인과 효과 추정의 기준 제공:** 무작위 배정, 매칭, 회귀 보정 등 다양한 방법을 통해 ATE를 추정하는 이론적 근거를 마련한다.
- **정책 및 의사결정에 활용:** 의료, 경제, 사회과학 등 다양한 분야에서 처치의 효과를 객관적으로 평가할 수 있는 틀을 제공한다.

---

Potential Outcome Framework는 인과 추론 문제를 명확하게 정의하고, 관측 데이터의 한계를 극복하기 위한 방법론적 기반을 제공함으로써, 인과 효과를 추론하는 데 있어 핵심적인 역할을 한다.

# Structured Causal Models

Structured Causal Models(SCM)은 인과 관계를 수학적 모델로 표현하는 체계로, 변수들 간의 인과적 상호작용을 구조방정식과 인과 그래프(DAG)를 통해 명시적으로 기술한다. SCM은 각 변수의 발생 메커니즘을 함수 형태로 나타내고, 이 함수들은 해당 변수의 직접적 원인(부모 변수)과 외생적 요인(잠재적 오차 또는 교란 변수)을 인자로 취한다.

---

<iframe width="600" height="400" src="https://www.youtube.com/embed/dQeRqb0N6gs?si=Ve94pQVNDrVzThTC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## 1. SCM의 기본 구성

SCM은 세 가지 핵심 요소로 구성된다.

1. **변수 집합 $$V$$:**  
   인과 시스템을 구성하는 모든 변수들의 집합이다.

2. **구조 방정식 $$F$$:**  
   각 변수 $$X \in V$$에 대해 다음과 같은 방정식이 정의된다.
   $$
   X = f_X(\text{Pa}(X), U_X)
   $$
   여기서 $$\text{Pa}(X)$$는 변수 $$X$$의 직접적 원인(부모 변수) 집합이며, $$U_X$$는 $$X$$에 영향을 미치는 외생적 요인으로, 보통 서로 독립이라고 가정한다. 이 구조 방정식은 인과적 메커니즘을 명시적으로 모델링하는 역할을 한다.

3. **인과 그래프 $$G$$:**  
   구조 방정식에 의해 결정되는 변수들 간의 인과 관계를 방향성 있는 엣지로 표현한 그래프이다. 이 그래프는 Directed Acyclic Graph(DAG) 형태로 구성되며, 각 엣지는 원인에서 결과로의 인과 흐름을 나타낸다.

---

## 2. SCM의 역할과 기능

- **인과 효과의 식별:**  
  SCM을 통해 변수들 간의 인과 경로를 명시하면, 개입(do 연산자)을 도입하여 “만약 $$X$$에 대해 개입을 했다면”이라는 질문에 답할 수 있다. 예를 들어, $$X$$가 $$Y$$에 미치는 인과 효과는 다음과 같이 표현할 수 있다.
  $$
  P(Y \mid do(X=x)) = \sum_{z} P(Y \mid X=x, Z=z) P(Z=z)
  $$
  여기서 $$Z$$는 $$X$$와 $$Y$$ 사이의 교란 변수들을 의미하며, SCM은 이러한 교란 요인들을 구조적으로 나타낸다.

- **반사실적 추론 및 개입 효과 예측:**  
  구조 방정식을 사용하면 관측되지 않은 반사실적 결과를 추론할 수 있으며, 특정 개입이 시스템 전체에 미치는 영향을 예측할 수 있다.

---

## 3. 구체적 예제: 흡연, 타르, 폐암 모델

예를 들어, 흡연(S), 폐에 쌓이는 타르(T), 그리고 폐암(C) 사이의 인과 관계를 SCM으로 모델링한다고 하자.

1. **변수 정의:**  
   - $$S$$: 흡연 여부 (0: 비흡연, 1: 흡연)  
   - $$T$$: 폐에 쌓인 타르의 양  
   - $$C$$: 폐암 발생 여부 (0: 없음, 1: 있음)

2. **구조 방정식 설정:**  
   각 변수에 대해 다음과 같은 구조 방정식을 가정할 수 있다.
   $$
   S = U_S \quad (\text{외생적 요인에 의해 결정되며, 일반적으로 무작위로 할당})
   $$
   $$
   T = f_T(S, U_T) = \alpha S + U_T
   $$
   $$
   C = f_C(T, S, U_C) = \beta_1 T + \beta_2 S + U_C
   $$
   여기서 $$U_S, U_T, U_C$$는 각각 외생적 요인으로, 서로 독립으로 가정한다. 만약 흡연이 타르의 축적에 주된 영향을 미치고, 타르가 폐암 발생에 결정적 역할을 한다면, $$\beta_1$$가 크고, $$\beta_2$$는 직접적 효과를 반영한다.

3. **인과 그래프 구성:**  
   위의 구조 방정식으로부터 도출되는 인과 그래프는 다음과 같다.
   - $$S \rightarrow T$$  
   - $$T \rightarrow C$$  
   - $$S \rightarrow C$$  
   
   이 그래프는 흡연이 타르 축적과 폐암 발생 모두에 영향을 미친다는 것을 나타내며, 타르 역시 폐암에 영향을 미친다는 인과적 연결 구조를 가진다.

4. **개입 효과 계산:**  
   예를 들어, “만약 모든 사람이 흡연을 중단한다면($$do(S=0)$$), 폐암 발생률은 어떻게 될까?”와 같은 질문에 답하기 위해, SCM을 기반으로 개입 효과를 계산할 수 있다. $$do(S=0)$$를 적용하면, 타르 축적 $$T$$는 외생적 요인 $$U_T$$에 의해서만 결정되고, 이후 폐암 발생 $$C$$도 변경된 $$T$$에 따라 결정된다.

---

## 4. 결론

Structured Causal Models는 인과 추론을 위한 강력한 도구로, 변수 간의 인과 관계를 구조 방정식과 인과 그래프로 명시적으로 기술한다. 이를 통해 개입 효과, 반사실적 추론, 교란 요인 통제 등의 인과 효과 추정을 체계적으로 수행할 수 있다. 위의 흡연-타르-폐암 예제는 SCM이 실제 현상에서 인과 메커니즘을 어떻게 모델링하고, 정책 개입이나 의사결정에 있어 어떠한 역할을 수행하는지 명확하게 보여준다.
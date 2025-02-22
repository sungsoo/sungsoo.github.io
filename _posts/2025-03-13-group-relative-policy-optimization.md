---
layout: post
title: Group Relative Policy Optimization(GRPO)
date: 2025-03-13
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Group Relative Policy Optimization(GRPO)](https://www.youtube.com/watch?v=EX8-ucKOBbA)

---


# Group Relative Policy Optimization(GRPO)

## Abstract

Group Relative Policy Optimization (GRPO)는 강화 학습에서 정책을 업데이트할 때 단순히 절대적인 보상 신호만 고려하는 대신, “그룹 내에서의 상대적인” 성능 개선을 함께 반영하여 보다 안정적이고 효율적으로 학습하도록 하는 방법입니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/EX8-ucKOBbA?si=C6Z4qZK0qu1yWk69" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

### 1. GRPO의 기본 개념

- **정책 최적화와 기본 배경:**  
  전통적인 정책 기울기(Policy Gradient) 방식이나 Proximal Policy Optimization (PPO) 같은 알고리즘은 에이전트가 특정 상태에서 취한 행동의 기대 보상(또는 Q-value)과, 그 상태에서의 평균적인 기대 보상(보통 상태 가치 함수, V(s)로 추정됨) 사이의 차이인 *advantage* 값을 사용해 정책 파라미터를 업데이트합니다.  
  \[
  \nabla J(\theta) \approx \mathbb{E}\left[ \nabla \log \pi_\theta(a|s) \, A(s,a) \right]
  \]
  
- **그룹 상대 기준(Group Relative Baseline):**  
  GRPO에서는 각 개별 에피소드나 행동에 대한 보상 외에도, 동일한 상태나 상황에서 여러 에피소드 또는 여러 에이전트의 결과(즉, “그룹”)를 고려합니다. 즉, 개별 행동의 평가를 단순히 절대 보상이 아닌, 그룹 내 평균 성능과의 상대적 차이로 재정의합니다.  
  \[
  A_{\text{group}}(s,a) = Q(s,a) - V_{\text{group}}(s)
  \]
  여기서 \( V_{\text{group}}(s) \)는 동일한 상태 \( s \)에서 그룹 내(예: 여러 에피소드 혹은 다수 에이전트)의 평균 성과를 의미합니다.

---

### 2. GRPO의 작동 원리 및 장점

- **안정성 향상:**  
  단일 에피소드의 보상은 노이즈나 변동성이 클 수 있습니다. 그러나 그룹 평균과 비교하여 업데이트를 수행하면, 개별 에피소드의 편차가 완화되어 보다 안정적인 학습이 가능해집니다.

- **분산 감소:**  
  그룹 내 상대적 기준을 사용하면 업데이트 시 발생하는 분산(variance)이 감소하게 되어, 급격한 정책 변경을 방지하고 점진적인 개선을 유도합니다.

- **협력적 학습 및 비교 기준 제공:**  
  특히 다중 에이전트 환경에서는 각 에이전트가 자신의 행동뿐만 아니라 팀이나 전체 그룹의 평균 성과를 참고하여 행동을 조정하게 됩니다. 이는 자연스럽게 협력과 조화를 도모할 수 있습니다.

---

### 3. 구체적인 예시

**예시: 축구 시뮬레이션 환경에서의 GRPO 적용**

- **시나리오:**  
  가상의 축구 시뮬레이션 환경에서 한 팀의 에이전트(선수)는 개인의 골 넣기 능력뿐 아니라 팀 전체의 성과에 기여해야 합니다. 각 에이전트는 자신의 행동(패스, 드리블, 슛 등)을 선택하고, 그 결과로 팀의 득점 기회가 어떻게 변화하는지를 관찰합니다.

- **전통적인 업데이트 vs. GRPO 업데이트:**  
  - *전통적 방식:*  
    한 에이전트가 슛을 시도하여 득점을 했다면, 이 에이전트는 높은 보상을 받아 자신의 정책이 강화됩니다. 그러나 만약 주변 동료들도 비슷한 상황에서 좋은 성과를 내고 있었다면, 이 행동이 단순히 평균 수준일 수도 있습니다.
    
  - *GRPO 방식:*  
    GRPO는 동일한 상황(예: 상대 수비의 압박 정도, 경기 상황 등)에서 팀의 평균 성과(예: 팀원들이 같은 상황에서 내는 평균 결과)를 계산합니다. 만약 한 에이전트의 슛이 팀 평균보다 더 좋은 결과(예: 팀의 평균 득점 확률보다 높은 득점 확률)를 보인다면, 그 행동의 *그룹 상대 advantage*가 긍정적으로 평가됩니다. 반대로, 팀 평균에 미치지 못하는 행동이라면 업데이트 시 부정적인 방향으로 작용하게 됩니다.

- **결과:**  
  이를 통해 각 에이전트는 단순히 “잘 했다/못 했다”가 아니라, 팀 전체의 맥락 속에서 자신의 행동이 얼마나 뛰어난지를 학습하게 되어, 팀워크를 강화하고 협력적인 전략을 자연스럽게 형성할 수 있습니다.

---

### 4. 요약 및 결론

GRPO는 강화 학습 알고리즘에서 개별 보상 신호의 노이즈와 변동성을 완화하기 위해, 그룹 내 평균 성과와 비교하는 “상대적” 평가 방식을 도입합니다.  
- **안정적 업데이트:** 그룹 평균을 기준으로 업데이트함으로써 학습의 안정성을 높입니다.  
- **협력 촉진:** 특히 다중 에이전트 환경에서 개별 에이전트들이 협력적 행동을 취하도록 유도할 수 있습니다.  
- **효율적 학습:** 불필요한 급격한 정책 변경을 막아, 점진적이고 지속적인 성능 향상을 이끌어냅니다.

이러한 이유로 GRPO는 복잡한 환경이나 다수의 에이전트가 상호작용하는 문제에서 매우 유용한 접근법으로 평가받고 있습니다.


---
layout: post
title: Towards Causal Foundations of Safe AGI  
date: 2025-05-13
categories: [artificial intelligence]
tags: [artificial general intelligence]

---


# [TAIS 2024 | Towards Causal Foundations of Safe AGI — James Fox, Matt MacDermott](https://www.youtube.com/watch?v=oVzPLLdlCQc)

## Abstract

Causality has captivated philosophers for centuries, not merely to grapple with the exact relationship between a cause and an effect, but also because it underpins so many other concepts of interest. In this talk, we will start by exploring how causality is linked to several fundamental issues in AI safety, including incentives, misspecification, generalisation, deception, and corrigibility. Next, we will posit that agency – central to many AGI threat models – is itself a causal concept. We will then bridge our theoretical foundations with practical applications by showcasing our approaches towards developing ‘agency detectors’.

This is a recording from TAIS 2024, a technical AI safety conference hosted at the Plaza Heisei in Tokyo April 5th–6th. TAIS 2024 was organised by AI Safety Tokyo, sponsored by Noeon Research, in collaboration with AI Alignment Network, AI Industry Foundation and Reaktor Japan.

발표자들은 AI 시스템의 안전과 관련된 **개념을 공식화**하기 위해 **인과성**을 사용하는 데 중점을 두고 있습니다. 그들은 인과 그래프를 사용하여 추천 시스템이 사용자의 선호도를 바꾸는 것과 같은 문제를 설명하고, 그러한 undesirable effects를 해결하기 위한 두 가지 방법, 즉 **impact measures**와 **path-specific objectives**를 제시했습니다. 발표자들은 또한 시스템의 **행동이 결과에 의해 좌우되는** 것을 보여주는 **인과적 에이전시 모델**에 대해 논의했습니다. 마지막으로, 그들은 AI 시스템이 **분포 외의 상황에서 일반화**할 수 있는 능력이 **인과적 모델을 암시적으로 학습**하는 것과 관련이 있음을 시사하는 연구를 발표했습니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/oVzPLLdlCQc?si=aSyM3StA8Mt1-VrK" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

AI 안전 분야에서는 에이전시(agency), 속임수(deception), 의도(intent), 위해(harm)와 같은 다양한 개념들이 여전히 상당히 **모호하고 부정확한 개념**으로 남아 있습니다. AI 시스템에 대한 의미 있는 평가(예: 에이전시 또는 속임수 탐지기)를 구축하기 위해서는 이러한 개념이 우리가 중요하게 생각하는 바를 제대로 포착하는 것이 중요합니다.

**인과성(causality)**은 이러한 개념들을 **형식화(formalize)**하는 데 도움이 될 수 있는 언어를 제공합니다. 특히 Judea Pearl이 1990년대 후반에 주로 소개한 인과성은 AI 안전에서 중요한 많은 개념의 기반이 됩니다.

인과성을 통해 이러한 개념을 형식화하는 방법은 다음과 같습니다.

*   **인과 그래프 사용:** 인과성은 종종 **방향 그래프(directed graph)**를 사용하여 명시화될 수 있습니다. 이 그래프는 어떤 변수가 다른 변수에 영향을 미치는지 나타내며, 화살표는 인과 관계를 나타냅니다. 인과 관계의 정확한 관계는 조건부 확률 분포를 사용하여 지정됩니다. 에이전트를 모델링할 때는 의사 결정 노드(사각형), 목표 노드(마름모), 정보 엣지(점선) 등을 추가하여 **인과 영향 다이어그램(causal influence diagram)**으로 확장될 수 있습니다.
*   **개입주의적 설명(interventionist accounts) 채택:** 어떤 이벤트가 다른 이벤트에 인과적으로 영향을 미친다는 것은 첫 번째 이벤트에 대한 외부 **개입(intervention)**이 두 번째 이벤트를 변화시키는 경우를 의미합니다. 이러한 관점은 형식화의 기초를 형성합니다.
*   **핵심 AI 안전 개념 형식화:**
    *   **에이전시:** 에이전시는 **목표가 행동을 이끄는 것**에 관한 것이므로 **인과적 개념**이라고 주장됩니다. 에이전시를 형식화하는 한 가지 방법은 시스템이 **일관되게 장기 목표를 추구**하는 것으로 정의하고, 의사 결정 노드와 목표 노드를 포함하는 인과 그래프를 사용하는 것입니다. 더 나아가, 에이전시를 **결과가 행동을 유발하는 일종의 역 인과성**으로 모델링하는 아이디어가 제시되었습니다. 이는 한 변수의 메커니즘이 다른 변수의 메커니즘 변화에 반응하고, 그들 간의 인과적 연결이 차단될 때 반응을 멈추는 상황으로 포착될 수 있습니다.
    *   **일반화(Generalization):** 특히 분포 외 일반화(out-of-distribution generalization)는 AI 시스템이 **인과 모델을 학습했는지 여부**와 관련이 있습니다. 데이터 생성 프로세스를 인과 베이지안 네트워크로 모델링함으로써 일반화 문제를 인과적인 방식으로 생각할 수 있습니다. 분포 이동(distributional shift)은 이 인과 모델에 대한 개입을 통해 모델링될 수 있습니다. 어떤 시스템이 모든 분포 이동에 걸쳐 성공적으로 일반화한다면, 그 정책으로부터 데이터 생성 프로세스에 대한 인과 베이지안 네트워크를 추론할 수 있다는 결과가 있습니다. 이는 시스템이 명시적으로 구축되지 않았더라도 암묵적으로 인과 모델을 학습해야 함을 시사합니다.
    *   **민감한 변수에 대한 영향:** 로봇이 꽃병을 손상시키거나 AI 시스템이 안전 장치를 방해하거나 추천 시스템이 사용자의 선호도를 형성하는 것과 같은 문제는 결정이 환경의 민감한 변수에 미치는 인과적 영향과 관련이 있습니다. 추천 시스템 예시에서, 콘텐츠 추천자가 보상을 받는 두 가지 인과 경로(선호도에 직접 맞추는 경로 vs 선호도를 변경하여 쉽게 만족하게 만드는 경로)가 **인과 그래프의 경로**를 통해 모델링됩니다. 에이전트가 보상 달성에 **수단적인 통제 동기(instrumental control incentive)**를 가질 수 있다는 것은 결정에서 보상으로 가는 경로가 인간 선호도를 **매개(mediate)**할 때 발생 가능합니다.
*   **문제 해결책 형식화:** 민감한 변수에 대한 undesirable 영향을 다루기 위한 해결책도 인과적 개념을 사용하여 형식화됩니다.
    *   **영향 측정(Impact measures):** 인간 선호도의 변화에 패널티를 부과하는 방법으로, AI 시스템이 선호도에 너무 많은 영향을 미치지 않도록 합니다. 이는 실제 선호도가 안전한 콘텐츠가 주어졌을 때의 선호도와 얼마나 유사한지에 따라 패널티를 부과하며, AI 시스템은 인간 선호도를 어떻게 형성할지에 대한 **모델**을 필요로 합니다. 인과 그래프에서 제어는 여전히 인간 선호도를 매개하지만, AI는 선호도를 변경하지 않도록 인센티브를 받습니다.
    *   **경로 특정 목표(Path-specific objectives):** 에이전트가 사용자의 선호도에 무관심하게 만들고 시간이 지남에 따라 선호도가 진화하도록 허용하여, **수단적 통제 동기를 완전히 제거**하는 것을 목표로 합니다. 에이전트는 선호도가 고정되었을 때 가장 잘 수행될 정책을 선택해야 하며, 선호도를 통과하는 간접적인 경로가 아닌 **보상으로 가는 직접적인 인과 경로를 따라 영향**을 고려해야 합니다. 이 접근 방식에서는 인과 그래프에서 인간 선호도가 시스템의 보상 달성을 더 이상 매개하지 않도록 합니다.

이러한 방식으로 인과적 구조와 개념을 적용함으로써, AI 안전 문제와 관련된 모호한 개념(예: 에이전시, 의도, 시스템의 영향)을 더 명확하고 형식적으로 정의하고 분석할 수 있으며, 이는 평가 구축 및 안전 솔루션 설계에 도움이 됩니다. 이는 의사 결정 이론, 에이전트 인센티브, 속임수, 수정 가능성(corrigibility), 공정성 등 다른 AI 안전 문제에도 적용됩니다.



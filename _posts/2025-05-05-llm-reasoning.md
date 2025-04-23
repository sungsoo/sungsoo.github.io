---
layout: post
title: DeepSeek-R1 Thoughtology; ＜Thinking＞ about LLM Reasoning  
date: 2025-05-05
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [DeepSeek-R1 Thoughtology; ＜Thinking＞ about LLM Reasoning](https://www.youtube.com/watch?v=IeCS6hsnOXs)

* Workshop: The Future of Language Models and Transformers
* Speaker: Siva Reddy (IVADO - Mila - McGill University)

## Abstract

Large Reasoning Models like DeepSeek-R1 mark a fundamental shift in how LLMs approach complex problems. Instead of directly producing an answer for a given input, DeepSeek-R1 creates detailed multi-step reasoning chains, seemingly “thinking” about a problem before providing an answer. This reasoning process is publicly available to the user, creating endless opportunities for studying the reasoning behaviour of the model and opening up the field of Thoughtology. Starting from a taxonomy of DeepSeek-R1’s basic building blocks of reasoning, our analyses on DeepSeek-R1 investigate the impact and controllability of thought length, management of long or confusing contexts, cultural and safety concerns, and the status of DeepSeek-R1 vis-à-vis cognitive phenomena, such as human-like language processing and world modelling. Our findings paint a nuanced picture. Notably, we show DeepSeek-R1 has a ‘sweet spot’ of reasoning, where extra inference time can impair model performance. Furthermore, we find a tendency for DeepSeek-R1 to persistently ruminate on previously explored problem formulations, obstructing further exploration. I will also present, VinePPO, an effective RL algorithm to improve reasoning abilities.

<iframe width="600" height="400" src="https://www.youtube.com/embed/IeCS6hsnOXs?si=C2BVhIpsrLsvxkf9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## AI 추론 과정 분석 및 효율성 개선 연구 요약

다음 발표자는 Mila, Mill, IVADO (이번 학기 공동 후원 기관) 등 다양한 소속을 가진 CA Ready입니다. CA는 질문 답변, 의미론 등 NLP의 여러 분야를 연구했으며, 최근에는 RL과 에이전트 분야에서 활발한 연구를 진행하고 있습니다. 오늘 발표에서는 DC Car1 모델의 추론 과정과 효율성을 분석하고 개선하는 연구를 소개하며, 특히 크레딧 할당과 점진적 보상 기법을 다룰 예정입니다.

CA는 발표 기회를 갑작스럽게 수락해 준 것에 감사를 표하며 발표를 시작했습니다.

**주요 내용:**

* **대형 언어 모델(LLM)에서 대형 추론 모델(LRM)로의 패러다임 전환:** LRM은 프롬프트 수준이 아닌 모델 자체에 추론 능력이 내재되어 있어, 먼저 생각하고 추론한 후 답변을 생성합니다.
* **Chain of Thought 프롬프팅과의 차이점:** LRM은 오류를 허용하며 여러 가능한 해결책을 탐색하여 최종적으로 정답을 찾는 경향이 있습니다. 이는 추론 시간 확장성에 대한 잠재력을 열어줍니다.
* **Thoughtology (사고학):** 연구진은 LRM의 사고 과정을 체계적으로 연구하기 위해 Thoughtology라는 개념을 도입했습니다.
* **DC Car1의 사고 패턴 분석:**
    * **문제 정의 단계:** 입력된 문제를 상세하게 반복합니다.
    * **Bloom 단계:** 문제를 분해하고 첫 번째 해결책을 도출합니다. 이 단계가 가장 많은 토큰을 사용합니다.
    * **재구성 단계:** "잠깐, 다른 방법은?", "만약에..." 등의 표현으로 시작하여 문제의 어려운 부분이나 전체 문제를 다시 고려하며 여러 해결책을 탐색합니다. 이 단계에서 대부분의 시간을 소비합니다.
    * **재개화(Rebloom):** 새로운 해결책을 찾으려는 시도로, 토큰 사용량이 일시적으로 급증하는 현상입니다.
    * **반추(Rumination):** 특정 부분에 집착하여 동일한 내용을 반복하는 현상입니다. 심지어 정확히 동일한 내용을 반복하기도 합니다.
* **순차적 자기 일관성(Sequential Self-Consistency):** DC Car1은 순차적인 샘플링을 통해 자기 일관성을 발견한 것으로 보입니다.
* **비효율적인 추론 과정:** 재구성 단계에서 불필요한 반복(반추)이 많이 발생하여 비효율적인 경향을 보입니다.
* **문제 복잡도에 따른 토큰 사용량 조절:** 모델은 문제의 복잡도에 따라 사용하는 토큰 수를 조절하는 능력을 보입니다. 쉬운 문제는 적은 토큰으로 해결하지만, 어려운 문제는 더 많은 토큰을 사용합니다.
* **추론 시간 확장성의 한계:** 특정 지점 이상으로 추론 예산을 늘려도 정확도 향상에 큰 도움이 되지 않으며, 오히려 감소하는 경향을 보입니다.
* **문맥 충실성:** 모델은 주어진 문맥 정보를 잘 따르는 경향을 보입니다 (길이 제한 제외).
* **분포 외 평가의 어려움:** 시각 추론과 같은 분포 외 작업에서는 사고 과정에 충실하지 않은 모습을 보입니다.
* **DC Car1의 보상 시스템:** 형식 보상 (think, answer 토큰 사용 여부)과 정답 여부 보상만 존재합니다. 길이 제한이나 단계별 보상은 없습니다.
* **단계별 크레딧 할당의 필요성:** 현재 DC Car1은 최종 보상만 고려하므로 모든 추론 단계를 동일하게 취급하는 비효율성이 발생합니다. 단계별로 중요도에 따라 크레딧을 할당하는 방식이 필요합니다.
* **강화 학습(RL) 기반 접근:** 각 추론 단계의 가치를 평가하고 중요한 단계의 확률을 높이는 강화 학습 기법(PPO 등)을 적용하여 효율성을 개선할 수 있습니다.
* **단계 가치(Value of a State):** 특정 추론 단계에서 시작하여 다양한 해결책을 탐색했을 때 최종적으로 얻을 수 있는 보상의 기댓값입니다.
* **이점(Advantage):** 특정 상태에서 특정 행동을 취했을 때 얻을 수 있는 보상이 해당 상태의 가치보다 얼마나 더 높은지를 나타냅니다.

**결론:**

DC Car1은 순차적 자기 일관성과 문맥 충실성 측면에서 인상적인 능력을 보여주지만, 비효율적인 반복적인 추론 과정과 단계별 피드백 부족이라는 한계를 가지고 있습니다. 단계별 크레딧 할당과 강화 학습 기반 접근 방식을 통해 이러한 비효율성을 개선하고 더욱 효율적인 추론 모델을 개발할 수 있을 것으로 기대됩니다.
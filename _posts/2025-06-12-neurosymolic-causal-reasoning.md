---
layout: post
title: NeuroSymbolic Causal Reasoning for AGI 
date: 2025-06-12
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# NeuroSymbolic Causal Reasoning for AGI



### Key Points
- 최근 연구에 따르면, LLM은 인과 관계 발견과 처리 효과 추정에 도움을 줄 가능성이 높습니다.  
- 증거는 LLM이 카운터팩튜얼 생성과 공정성 개선에 유용할 수 있음을 시사합니다.  
- 이 분야는 여전히 초기 단계로, 환각(hallucination)과 계산 비용과 같은 도전 과제가 있습니다.  

---

### Introduction to LLM and Causal Inference  
대규모 언어 모델(LLM)은 방대한 텍스트 데이터를 학습하여 인간과 유사한 언어를 생성하고 이해할 수 있는 AI 모델입니다. 예를 들어, GPT 시리즈나 BERT와 같은 모델들이 이에 해당합니다. 인과추론은 변수 간의 인과 관계를 식별하고 추정하는 방법론으로, 의료, 경제, 정책 결정 등 다양한 분야에서 중요한 역할을 합니다. LLM을 활용한 인과추론 기술은 이 두 영역을 결합하여 더 정확하고 신뢰할 수 있는 AI 시스템을 개발하는 데 기여합니다.  

연구에 따르면, LLM은 강력한 추론 능력과 사전 훈련된 지식을 바탕으로 인과 관계를 발견하고, 카운터팩튜얼 시나리오를 생성하며, 처리 효과를 추정하는 데 유용할 수 있습니다 ([Large Language Models and Causal Inference in Collaboration: A Survey](https://arxiv.org/abs/2403.09606)). 또한, 인과추론은 LLM의 공정성, 안전성, 해석 가능성을 개선하는 데 도움을 줄 수 있습니다. 그러나 이 분야는 초기 단계에 있으며, 환각(hallucination)과 프롬프트 민감성, 계산 비용과 같은 도전 과제가 남아 있습니다.  

---

### Applications and Methods  
LLM을 활용한 인과추론 기술은 다음과 같은 방식으로 적용됩니다:  
- **인과 관계 발견**: LLM은 텍스트 데이터에서 "A가 B를 유발한다"와 같은 인과 관계를 추출할 수 있습니다. 예를 들어, 의료 문서에서 "흡연은 폐암을 유발한다"는 문장을 분석하여 인과 관계를 식별할 수 있습니다.  
- **카운터팩튜얼 생성**: LLM은 "약을 먹지 않았다면 어떻게 됐을까?"와 같은 가상의 시나리오를 생성하여 처리 효과를 추정할 수 있습니다. 예를 들어, DISCO라는 방법은 LLM을 사용하여 카운터팩튜얼 데이터를 생성합니다 ([Causal Inference with Large Language Model: A Survey](https://arxiv.org/html/2409.09822v1)).  
- **처리 효과 추정**: LLM은 다양한 시나리오를 시뮬레이션하여 특정 치료나 개입의 효과를 예측할 수 있습니다. 이는 특히 데이터가 부족한 경우 유용합니다.  

반대로, 인과추론은 LLM을 개선하는 데도 사용됩니다:  
- **공정성**: 인과추론은 LLM의 편향(예: 성별이나 인종에 따른 편향)을 식별하고 제거하는 데 도움을 줍니다.  
- **안전성**: LLM의 출력이 원인과 결과를 올바르게 반영하는지 평가하여 안전성을 높일 수 있습니다.  
- **해석 가능성**: 인과 그래프를 사용하여 LLM의 결정 과정을 더 투명하게 만들 수 있습니다.  

---

---

### Comprehensive Analysis of LLM and Causal Inference  

#### Overview and Background  
대규모 언어 모델(LLM)은 자연어 처리(NLP) 분야에서 혁신을 가져온 기술로, 방대한 텍스트 데이터를 학습하여 인간과 유사한 언어를 생성하고 이해할 수 있습니다. 예를 들어, GPT-3, GPT-4, BERT와 같은 모델들이 대표적입니다. 이러한 모델은 사전 훈련된 지식과 강력한 추론 능력을 바탕으로 다양한 작업에서 뛰어난 성과를 보입니다.  

인과추론(causal inference)은 변수 간의 인과 관계를 식별하고 추정하는 학문적 접근법으로, 전통적으로 통계학과 데이터 과학에서 중요한 역할을 해왔습니다. 인과추론은 단순한 상관관계(correlation)뿐만 아니라 실제 원인과 결과의 관계를 이해하는 데 중점을 둡니다. 예를 들어, "흡연이 폐암을 유발한다"는 인과 관계를 증명하려면, 흡연과 폐암 사이의 상관관계뿐만 아니라 다른 혼란 변수(confounding variables)를 통제해야 합니다.  

최근 연구는 LLM과 인과추론의 상호작용에 주목하고 있습니다. LLM은 텍스트 데이터에서 인과 관계를 추출하고, 카운터팩튜얼 시나리오를 생성하며, 처리 효과를 추정하는 데 도움을 줄 수 있습니다. 반대로, 인과추론은 LLM의 공정성, 안전성, 해석 가능성을 개선하는 데 기여할 수 있습니다. 이 보고서는 [Large Language Models and Causal Inference in Collaboration: A Survey](https://arxiv.org/abs/2403.09606)와 [Causal Inference with Large Language Model: A Survey](https://arxiv.org/html/2409.09822v1)를 기반으로, LLM을 활용한 인과추론 기술을 상세히 분석합니다.  

#### LLM이 인과추론을 돕는 방법  
LLM은 다음과 같은 방식으로 인과추론 작업을 지원할 수 있습니다:  
- **인과 관계 발견**: LLM은 텍스트 데이터에서 인과 관계를 식별할 수 있습니다. 예를 들어, 뉴스 기사나 의료 문서에서 "기후 변화가 해수면 상승을 유발한다"는 문장을 분석하여 인과 관계를 추출할 수 있습니다. 연구에 따르면, LLM은 쌍별 인과 관계(pairwise causal discovery) 작업에서 최대 97%의 정확도를 달성할 수 있습니다 ([Causal Reasoning and Large Language Models: Opening a New Frontier for Causality](https://openreview.net/forum?id=mqoxLkX210)).  
- **카운터팩튜얼 생성**: 카운터팩튜얼은 "어떤 일이 일어나지 않았다면 어떻게 됐을까?"라는 질문에 답하는 시나리오입니다. LLM은 이러한 시나리오를 생성하여 처리 효과를 추정할 수 있습니다. 예를 들어, DISCO(Chen et al., 2023c)와 같은 방법은 LLM을 사용하여 카운터팩튜얼 데이터를 생성하며, 이는 도메인 일반화(domain generalization)에 유용합니다 ([Large Language Models and Causal Inference in Collaboration: A Survey](https://arxiv.org/abs/2403.09606)).  
- **처리 효과 추정**: LLM은 다양한 시나리오를 시뮬레이션하여 특정 치료나 개입의 효과를 예측할 수 있습니다. 이는 특히 실제 데이터가 부족한 경우 유용하며, 의료 연구에서 잠재적인 응용 가능성을 가지고 있습니다.  

LLM은 또한 전통적인 인과추론 방법과 통합될 수 있습니다. 예를 들어, LLM-guided meta-initialization(Li et al., 2024)은 LLM이 사전 지식을 바탕으로 인과 그래프를 초기화하는 방법으로, 더 정확한 결과를 얻는 데 도움을 줍니다. Iterative frameworks(Ban et al., 2023a)와 같은 접근법은 LLM과 전통적인 방법을 반복적으로 결합하여 점진적으로 인과 관계를 발견합니다. 그러나 이러한 방법은 N개의 변수에 대해 N(2)개의 프롬프트를 요구할 수 있어 계산 비용이 높을 수 있습니다.  

#### 인과추론이 LLM을 개선하는 방법  
인과추론은 LLM의 성능과 신뢰성을 높이는 데 중요한 역할을 합니다:  
- **추론 능력 향상**: 인과추론은 LLM의 모델 이해(model understanding), 상식 추론(commonsense reasoning), 카운터팩튜얼 추론(counterfactual reasoning)을 개선할 수 있습니다. 예를 들어, Zečević et al. (2023)와 Kim et al. (2023)은 LLM의 모델 이해를 개선하기 위한 인과적 접근법을 제안했습니다.  
- **공정성과 편향 완화**: LLM은 훈련 데이터의 편향을 반영할 수 있어 공정성 문제가 발생할 수 있습니다. 인과추론은 이러한 편향을 식별하고 제거하는 데 도움을 줍니다. 예를 들어, Ding et al. (2022)와 Zhou et al. (2023a)은 성별 편향(gender bias)을 완화하기 위한 인과적 방법을 제안했습니다.  
- **안전성 강화**: LLM의 출력은 때때로 신뢰할 수 없는 결과를 생성할 수 있습니다. 인과추론은 LLM의 견고성(robustness)을 높이기 위해 사용될 수 있습니다. 예를 들어, Cao et al. (2022)와 Zhao et al. (2023e)은 인과적 개입을 통해 LLM의 안전성을 분석했습니다.  
- **해석 가능성 개선**: LLM은 "블랙박스"로 간주되기 쉽지만, 인과추론은 LLM의 결정 과정을 더 투명하게 만들 수 있습니다. 예를 들어, Wu et al. (2023)은 인과 그래프를 사용하여 LLM의 내적 구성 요소를 설명했습니다.  
- **다중 모달리티 지원**: LLM은 텍스트뿐만 아니라 이미지, 비디오와 같은 다중 모달리티 데이터를 처리할 수 있습니다. 인과추론은 이러한 데이터에서 인과 관계를 파악하는 데 도움을 줍니다. 예를 들어, Pawlowski et al. (2023)와 Chen et al. (2024a)은 비전-언어 모델에서 인과적 추론을 탐구했습니다.  

#### 평가 벤치마크와 성과  
LLM의 인과추론 능력을 평가하기 위한 여러 벤치마크가 존재합니다. 아래 표는 주요 벤치마크와 해당 카테고리를 요약한 것입니다:  

| 벤치마크               | 모델 이해(MU) | 상식 추론(CR) | 카운터팩튜얼(CF) | 공정성/편향(FD) | 텍스트 | 다중 모달리티(MM) |
|-----------------------|---------------|---------------|-------------------|-----------------|--------|-------------------|
| ECHo (Xie et al., 2023) | ✓             | ✓             | ✓                 |                 | ✓      | ✓                 |
| CREPE (Zhang et al., 2023b) | ✓         | ✓             |                   |                 | ✓      |                   |
| CLOMO (Huang et al., 2023) | ✓         |               | ✓                 |                 | ✓      |                   |
| IfQA (Yu et al., 2023) |               |               | ✓                 |                 | ✓      |                   |
| Cladder (Jin et al., 2023a) | ✓       | ✓             | ✓                 |                 | ✓      | ✓                 |
| MoCa (Nie et al., 2023) | ✓           |               |                   |                 | ✓      |                   |
| Jin et al. (2023b)     | ✓           | ✓             |                   |                 | ✓      |                   |
| CVidQA (Su et al., 2023) |           |               |                   |                 |        | ✓                 |
| VQAI (Li et al., 2023b) | ✓          |               |                   |                 |        | ✓                 |
| Chen et al. (2023b)    |               |               | ✓                 |                 | ✓      |                   |
| Gao et al. (2023)      | ✓           | ✓             |                   |                 | ✓      |                   |
| CRAB (Romanou et al., 2023) | ✓     |               |                   |                 | ✓      |                   |
| HELM (Liang et al., 2022) |           |               |                   | ✓              | ✓      |                   |
| Fair-Prism (Fleisig et al., 2023) |   |               |                   | ✓              | ✓      |                   |
| Biasasker (Wan et al., 2023) |       |               |                   | ✓              | ✓      |                   |
| CaLM (Chen et al., 2024b) | ✓       | ✓             | ✓                 | ✓              | ✓      | ✓                 |
| MORE (Chen et al., 2024a) | ✓       |               |                   |                 |        | ✓                 |

이 표는 모델 이해(MU), 상식 추론(CR), 카운터팩튜얼(CF), 공정성/편향(FD) 등의 카테고리별로 벤치마크를 정리한 것입니다. 예를 들어, ECHo(Xie et al., 2023)는 텍스트와 다중 모달리티 데이터에서 모델 이해, 상식 추론, 카운터팩튜얼 추론을 평가합니다.  

#### 도전 과제와 미래 방향  
LLM을 활용한 인과추론 기술은 여전히 초기 단계에 있으며, 여러 도전 과제가 남아 있습니다:  
- **환각(hallucination)**: LLM은 사실과 다른 정보를 생성할 수 있습니다. 이는 인과추론에서 정확성을 해칠 수 있으므로, 이를 해결하기 위한 연구가 필요합니다. 예를 들어, 프롬프트 엔지니어링(prompt engineering)과 모델 디스틸레이션(model distillation)이 제안되고 있습니다 ([Causal Inference with Large Language Model: A Survey](https://arxiv.org/html/2409.09822)).  
- **프롬프트 민감성**: LLM의 출력은 프롬프트의 방식에 따라 크게 달라질 수 있습니다. 이는 인과추론의 신뢰성을 저하시킬 수 있습니다.  
- **계산 비용**: LLM은 대규모 데이터와 높은 계산 자원을 요구합니다. 이는 특히 실시간 응용에서 한계가 될 수 있습니다.  
- **통합 벤치마크 부족**: 현재 여러 벤치마크가 존재하지만, 통합되고 널리 인정받는 평가 기준이 부족합니다. 이는 LLM의 인과추론 능력을 체계적으로 비교하는 데 어려움을 초래합니다.  

미래 방향으로는 다음과 같은 연구가 제안됩니다:  
- LLM을 사용하여 데이터 불균형 문제를 해결하고, 인과추론의 비편향성(unconfoundedness) 가정을 보완하는 방법.  
- 다중 모달리티 데이터에서 인과 관계를 탐구하는 연구. 예를 들어, 이미지와 텍스트를 결합한 인과추론.  
- 인과 중심의 특화 모델(causality-specialized models)을 개발하여 LLM의 성능을 향상시키는 방법.  

#### 결론  
LLM을 활용한 인과추론 기술은 NLP와 AI의 미래를 형성하는 중요한 분야입니다. LLM은 텍스트 데이터에서 인과 관계를 발견하고, 카운터팩튜얼을 생성하며, 처리 효과를 추정하는 데 강력한 도구를 제공합니다. 동시에, 인과추론은 LLM을 더 공정하고 안전하며 해석 가능한 모델로 만들 수 있습니다. 이 기술은 의료, 경제, 정책 결정 등 다양한 분야에서 실질적인 영향을 미칠 잠재력을 가지고 있습니다. 그러나 환각, 계산 비용, 통합 벤치마크 부족과 같은 도전 과제를 해결하기 위한 지속적인 연구가 필요합니다.  

---

### Key Citations
- [Large Language Models and Causal Inference in Collaboration: A Survey](https://arxiv.org/abs/2403.09606)
- [Causal Inference with Large Language Model: A Survey](https://arxiv.org/html/2409.09822v1)
- [Causal Reasoning and Large Language Models: Opening a New Frontier for Causality](https://openreview.net/forum?id=mqoxLkX210)

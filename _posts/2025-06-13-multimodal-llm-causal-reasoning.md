---
layout: post
title: Causal Reasoning using Multimodal Large Language Models 
date: 2025-06-13
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# Causal Reasoning using Multimodal Large Language Models



## 멀티모달 대규모 언어 모델을 이용한 인과추론 연구의 최신 동향

#### 주요 요약
- 연구에 따르면, 멀티모달 대규모 언어 모델(MLLMs)은 텍스트, 이미지, 비디오 등 다양한 데이터를 활용해 인과 관계를 추론하는 데 잠재력을 보입니다.
- 최신 동향은 MLLM의 인과 추론 능력을 평가하고 개선하기 위한 프레임워크와 벤치마크 개발에 초점을 맞추고 있습니다.
- 주요 도전 과제로는 모달리티 간 정보 통합의 어려움과 통합된 평가 기준의 부족이 있습니다.
- 이 분야는 초기 단계로, 데이터 불균형 해결과 인과 전문화 모델 개발이 미래 연구 방향으로 제시됩니다.

#### 멀티모달 대규모 언어 모델이란?
멀티모달 대규모 언어 모델(MLLMs)은 텍스트뿐만 아니라 이미지, 비디오, 오디오 등 다양한 데이터 형태를 처리할 수 있는 인공지능 모델입니다. 예를 들어, 이미지와 텍스트를 함께 분석하여 질문에 답하거나, 비디오에서 사건의 원인과 결과를 추론할 수 있습니다. 이러한 모델은 전통적인 텍스트 기반 대규모 언어 모델(LLMs)을 확장하여 실제 세계의 복잡한 데이터를 이해하는 데 적합합니다.

#### 인과추론이란?
인과추론은 변수 간의 원인과 결과 관계를 식별하고 추정하는 학문적 접근법입니다. 단순히 상관관계를 찾는 것 이상으로, 특정 변수가 다른 변수에 실제로 어떤 영향을 미치는지 파악하는 데 중점을 둡니다. 이는 의료, 경제, 정책 결정 등에서 중요한 의사결정을 돕습니다.

#### 최신 동향 개요
최근 연구는 MLLM을 활용하여 인과추론의 정확성과 신뢰성을 높이는 데 주목하고 있습니다. 특히, 2024년에 발표된 여러 연구는 MLLM이 다중 모달리티 데이터를 처리하여 인과 관계를 추론하는 데 어떻게 기여할 수 있는지 탐구하고 있습니다. 주요 동향으로는 새로운 프레임워크 개발, 벤치마크 설계, 그리고 다중 모달리티 인과추론의 탐구가 있습니다.

---

### 멀티모달 대규모 언어 모델을 이용한 인과추론 연구의 상세 분석

#### 1. 서론
멀티모달 대규모 언어 모델(MLLMs)은 텍스트, 이미지, 비디오, 오디오 등 다양한 모달리티의 데이터를 처리할 수 있는 강력한 인공지능 모델입니다. 이러한 모델은 Transformer 기반 아키텍처를 활용하여, 예를 들어 MiniGPT-4, Google's PaLM-E, OpenAI의 SORA와 같은 모델들이 대표적입니다. MLLM은 단일 모달리티(예: 텍스트만 처리하는 LLM)에 비해 실제 세계의 복잡한 시나리오를 더 잘 반영할 수 있습니다.

인과추론(causal inference)은 변수 간의 인과 관계를 식별하고 추정하는 학문으로, 단순한 상관관계(correlation)를 넘어 원인과 결과의 관계를 명확히 규명합니다. 이는 특히 실험 데이터가 부족한 관찰 데이터 연구에서 중요합니다. MLLM과 인과추론의 결합은 다중 모달리티 데이터를 활용하여 더 정확하고 신뢰할 수 있는 인과 관계를 추론할 수 있는 잠재력을 제공합니다.

이 보고서는 2024년에 발표된 주요 연구를 바탕으로, MLLM을 이용한 인과추론의 최신 동향을 분석합니다. 주요 자료로는 [Large Language Models and Causal Inference in Collaboration: A Survey](https://arxiv.org/abs/2403.09606), [Causal Inference with Large Language Model: A Survey](https://arxiv.org/abs/2409.09822), [CausalMM: A Causal Inference Framework](https://arxiv.org/abs/2410.04780), 그리고 [Multimodal Causal Reasoning Benchmark](https://arxiv.org/abs/2408.08105)가 포함됩니다.

#### 2. 최신 동향

##### 2.1 설문 조사와 포괄적 연구
- **Large Language Models and Causal Inference in Collaboration: A Survey (2024년 3월)**:
  - 이 설문 조사는 MLLM과 인과추론의 상호작용을 포괄적으로 다룹니다. MLLM은 인과 추론을 통해 예측 정확도, 공정성, 견고성, 설명 가능성을 향상시킬 수 있으며, 특히 다중 모달리티 처리에서 잠재력을 보입니다. 예를 들어, Large Vision Language Models (LVLMs)은 이미지와 텍스트를 결합하여 인과 관계를 추론하는 데 사용됩니다. 그러나 LVLMs는 종종 시각적 증거를 무시하는 문제를 보이며, 이를 해결하기 위해 CaKe-LM과 같은 모델이 제안되었습니다 ([Su et al., 2023](https://arxiv.org/abs/2305.17727)).
  - MLLM은 또한 인과 관계 발견과 처리 효과 추정에 기여할 수 있습니다. 예를 들어, DISCO는 MLLM을 사용하여 대규모로 고품질의 카운터팩튜얼 데이터를 생성하며 ([Chen et al., 2023](https://arxiv.org/abs/2305.17727)), 최대 97%의 정확도로 쌍별 인과 관계를 식별할 수 있습니다 ([Kıcıman et al., 2023](https://arxiv.org/abs/2305.00050)).

- **Causal Inference with Large Language Model: A Survey (2024년 9월)**:
  - 이 설문 조사는 MLLM의 인과 추론 능력을 평가하고 개선하는 방법에 초점을 맞춥니다. 특히, 다중 모달리티 인과추론을 미래 연구 방향으로 강조하며, 이미지 ([Li et al., 2024](https://arxiv.org/abs/2408.08105))와 비디오 ([Lam et al., 2024](https://arxiv.org/abs/2409.09822))에서의 인과 관계 탐구를 언급합니다. 이 연구는 MLLM의 설명 가능성과 상호작용성을 높이기 위한 기술(예: 파인튜닝, 프롬프트 엔지니어링)을 제안합니다.

##### 2.2 구체적인 프레임워크 개발
- **CausalMM 프레임워크 (2024년 10월)**:
  - [CausalMM: A Causal Inference Framework](https://arxiv.org/abs/2410.04780)는 MLLM의 모달리티 프라이어(modality priors) 문제를 해결하기 위해 구조적 인과 모델링(SCM)을 적용한 프레임워크입니다. 모달리티 프라이어는 모델의 초기 파라미터에 내재된 편향으로, 출력 품질을 저하시킬 수 있습니다. CausalMM은 개입(intervention)과 카운터팩튜얼 추론을 통해 이러한 편향을 완화하며, 모달리티 간의 인과 관계를 명확히 규명합니다.
  - 이 프레임워크는 VLind-Bench, POPE, MME 벤치마크에서 평가되었으며, LLaVA-1.5와 Qwen2-VL 같은 모델에서 기존 방법 대비 최대 5.37%의 성능 향상을 보였습니다. 특히, 객체 수준의 환각(hallucination)을 줄이고 복잡한 쿼리(예: 개수 세기)에서 성능을 개선했습니다.

##### 2.3 벤치마크 개발
- **MuCR 벤치마크 (2024년 8월)**:
  - [Multimodal Causal Reasoning Benchmark](https://arxiv.org/abs/2408.08105)는 MLLM의 인과 추론 능력을 평가하기 위해 설계된 MuCR(Multimodal Causal Reasoning) 벤치마크를 소개합니다. 이 벤치마크는 4,000개의 원인-결과 캡션 쌍과 12,000개의 이미지 쌍을 포함하며, 이미지, 구문, 문장 수준에서 인과 추론 능력을 평가합니다.
  - 평가 결과, MLLM은 인간에 비해 낮은 성능을 보였습니다. 예를 들어, GPT-o1은 이미지 수준(C2E)에서 87.5%, 구문 수준(CP)에서 62%, 문장 수준(EXP)에서 78%를 기록했지만, 인간은 각각 95.5%, 89.5%, 98.5%를 기록했습니다. 이를 개선하기 위해 VcCoT(Visual cue Chain-of-Thought) 전략이 제안되었으며, 이는 GPT-o1의 성능을 C2E 89.75%, CP 66.5%, EXP 83%로 향상시켰습니다.
  - 프로젝트는 [MuCR GitHub](https://github.com/Zhiyuan-Li-John/MuCR)에서 확인할 수 있습니다.

##### 2.4 다중 모달리티 인과추론
- **이미지와 비디오에서의 인과추론**:
  - 이미지: Li et al. (2024)은 이미지 간의 인과 관계를 추론하는 MuCR 벤치마크를 통해 MLLM의 한계를 분석했습니다. 이는 시각적 단서(visual cues)를 식별하는 능력이 인과 추론 성능에 중요한 영향을 미친다는 점을 보여줍니다.
  - 비디오: Lam et al. (2024)은 비디오 데이터에서 인과 관계를 탐구하며, 비디오 질문 응답(VQA) 작업에서 인과적 개입을 활용했습니다. 또한, MCR ([Zang et al., 2023](https://arxiv.org/abs/2403.09606))은 비디오 질문 응답에서 인과적 특징과 혼란 요인을 분리하여 인식 정확도를 높였습니다.
  - 관련 데이터셋으로는 COCO-QA ([COCO-QA](https://www.cs.toronto.edu/~mren/research/imageqa/data/cocoqa/)), CLEVR ([CLEVR](https://cs.stanford.edu/people/jcjohns/clevr/)), CLEVRER ([CLEVRER](http://clevrer.csail.mit.edu/)) 등이 있으며, 이는 시각-언어 작업에서 인과추론을 평가하는 데 사용됩니다.

##### 2.5 기타 관련 연구
- **비디오 질문 응답(VQA)**:
  - 여러 모델이 비디오 데이터에서 인과추론을 적용하고 있습니다. 예를 들어, CaVIR ([ICCV 2023](https://arxiv.org/abs/2403.09606))는 다중 컨텍스트를 활용한 비디오 질문 응답에서 인과추론을 사용하며, VCSR ([ACM 2023](https://arxiv.org/abs/2403.09606))는 교차 모달리티 추론을 통해 인과 관계를 분석합니다.
  - 이러한 모델들은 프론트-도어(front-door) 및 백-도어(back-door) 조정을 통해 인과 효과를 추정합니다.

- **다중 모달리티 데이터셋**:
  - 인과추론 연구를 지원하는 주요 데이터셋으로는 Visual Genome ([Visual Genome](https://homes.cs.washington.edu/~ranjay/visualgenome/api.html)), VQA v2.0 ([VQA v2.0](https://visualqa.org/download.html)), TVQA ([TVQA](https://tvqa.cs.unc.edu/downloadtvqa.html)) 등이 있습니다. 이들은 이미지와 비디오 데이터를 포함하며, 인과추론 평가에 필수적입니다.

#### 3. 도전 과제
MLLM을 활용한 인과추론 연구는 여러 도전 과제를 안고 있습니다:

- **모달리티 간 정보 통합의 어려움**:
  - MLLM은 텍스트와 시각적 데이터를 통합하여 인과 관계를 추론하는 데 어려움을 겪습니다. 예를 들어, Pawlowski et al. (2023)은 LVLMs가 시각적 증거를 무시하는 경향이 있다고 지적했습니다 ([Pawlowski et al., 2023](https://arxiv.org/abs/2305.17727)).

- **모달리티 프라이어와 편향**:
  - MLLM의 초기 파라미터에 내재된 편향(모달리티 프라이어)은 출력 품질을 저하시킬 수 있습니다. 이는 특히 환각(hallucination) 문제를 유발하며, CausalMM과 같은 프레임워크가 이를 해결하려고 시도하고 있습니다.

- **통합 벤치마크 부족**:
  - 현재 MLLM의 인과 추론 능력을 체계적으로 평가할 수 있는 통합된 벤치마크가 부족합니다. MuCR은 중요한 진전이지만, 더 포괄적인 기준이 필요합니다.

- **계산 비용과 프롬프트 민감성**:
  - MLLM은 높은 계산 자원을 요구하며, 프롬프트의 방식에 따라 결과가 크게 달라질 수 있습니다. 이는 인과추론의 신뢰성을 저하시킬 수 있습니다.

#### 4. 미래 방향
MLLM을 활용한 인과추론 연구의 미래 방향은 다음과 같습니다:

- **다중 모달리티 인과추론 강화**:
  - 이미지, 비디오, 텍스트 등 다양한 모달리티를 결합하여 인과 관계를 추론하는 연구가 필요합니다. 이는 실제 세계의 복잡한 시나리오를 더 잘 반영할 수 있습니다.

- **데이터 불균형 해결**:
  - MLLM은 데이터가 부족한 상황에서도 인과 관계를 추론할 수 있는 잠재력을 가지고 있습니다. 이를 활용하여 소수 데이터에 대한 인과추론을 개선할 수 있습니다.

- **인과 전문화 모델 개발**:
  - 인과 추론에 특화된 MLLM 설계가 필요합니다. 현재 대부분의 모델은 일반적인 작업에 최적화되어 있어, 인과 중심의 설계가 부족합니다.

- **통합 벤치마크 개발**:
  - MLLM의 인과 추론 능력을 체계적으로 평가할 수 있는 표준화된 벤치마크가 필요합니다. 이는 모델 간 비교를 용이하게 하고 연구의 진전을 가속화할 것입니다.

#### 5. 결론
MLLM을 활용한 인과추론 연구는 인공지능의 미래를 형성하는 중요한 분야입니다. MLLM은 텍스트, 이미지, 비디오 등 다양한 모달리티를 처리하여 인과 관계를 추론하는 데 강력한 도구를 제공합니다. 2024년의 주요 연구는 CausalMM과 같은 프레임워크와 MuCR과 같은 벤치마크를 통해 MLLM의 인과 추론 능력을 평가하고 개선하는 데 기여하고 있습니다. 그러나 모달리티 간 정보 통합, 편향 문제, 통합 벤치마크 부족 등의 도전 과제가 남아 있습니다. 이 분야는 의료, 경제, 정책 결정 등 다양한 영역에서 실질적인 영향을 미칠 잠재력을 가지고 있으며, 지속적인 연구를 통해 더 정확하고 신뢰할 수 있는 AI 시스템으로 발전할 것으로 기대됩니다.


# 멀티모달 대규모 언어 모델을 이용한 인과추론 연구 요약

## 주요 동향
- **프레임워크**: CausalMM은 구조적 인과 모델링을 사용하여 MLLM의 모달리티 프라이어를 완화합니다.
- **벤치마크**: MuCR은 이미지와 텍스트를 결합한 인과 추론 능력을 평가하며, 인간 대비 낮은 성능을 보여줍니다.
- **다중 모달리티**: 이미지(Li et al., 2024)와 비디오(Lam et al., 2024)에서의 인과추론 연구가 진행 중입니다.

## 성과 지표
| 모델/주체 | C2E (이미지 수준) | CP (구문 수준) | EXP (문장 수준) |
|-----------|-------------------|----------------|-----------------|
| GPT-o1    | 87.5%             | 62%            | 78%             |
| 인간      | 95.5%             | 89.5%          | 98.5%           |

## 데이터셋
- **COCO-QA**: 123,287 이미지, 78,736 학습, 38,948 테스트 ([COCO-QA](https://www.cs.toronto.edu/~mren/research/imageqa/data/cocoqa/)).
- **CLEVRER**: 20,000 합성 비디오, 300,000+ Q&A ([CLEVRER](http://clevrer.csail.mit.edu/)).
- **VQA v2.0**: 1.1M 이미지-질문 쌍, 13M 답변 ([VQA v2.0](https://visualqa.org/download.html)).

## 미래 방향
- 다중 모달리티 인과추론 강화.
- 데이터 불균형 해결.
- 인과 전문화 모델 개발.


#### 주요 인용
- [Large Language Models and Causal Inference in Collaboration: A Comprehensive Survey](https://arxiv.org/abs/2403.09606)
- [Causal Inference with Large Language Model: A Survey](https://arxiv.org/abs/2409.09822)
- [CausalMM: A Causal Inference Framework for Multimodal Large Language Models](https://arxiv.org/abs/2410.04780)
- [Multimodal Causal Reasoning Benchmark: Challenging Vision Large Language Models](https://arxiv.org/abs/2408.08105)
- [MuCR Project GitHub Repository](https://github.com/Zhiyuan-Li-John/MuCR)
- [COCO-QA Dataset for Visual Question Answering](https://www.cs.toronto.edu/~mren/research/imageqa/data/cocoqa/)
- [CLEVRER Dataset for Video Question Answering](http://clevrer.csail.mit.edu/)
- [VQA v2.0 Dataset for Visual Question Answering](https://visualqa.org/download.html)
- [CaKe-LM: Causal Knowledge for Video Understanding](https://arxiv.org/abs/2305.17727)
- [Causal Reasoning and Large Language Models](https://arxiv.org/abs/2305.00050)
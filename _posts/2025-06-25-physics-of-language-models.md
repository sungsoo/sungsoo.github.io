---
layout: post
title: Physics of Language Models
date: 2025-06-25
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [ICML 2024 Tutorial: Physics of Language Models](https://www.youtube.com/watch?v=yBL7J0kgldU)

## Abstract

Project page (with further readings): [https://physics.allen-zhu.com/](https://physics.allen-zhu.com/)

Abstract: We divide "intelligence" into multiple dimensions (like language structures, knowledge, reasoning, etc.). For each dimension, we create synthetic data for LLM pretraining to understand the theory and push the capabilities of LLMs to the extreme.

Unlike benchmarking, by controlling the synthetic data, we aim to discover universal laws of all LLMs, not just a specific version like GPT/Llama. By tweaking hyperparameters such as data amount, type, difficulty, and format, we determine factors affecting LLM performance and suggest improvements.

Unlike black-box training, we develop advanced probing techniques to examine the inner workings of LLMs and understand their hidden mental processes. This helps us gain a deeper understanding of how these AI models function and moves us closer to creating more powerful and transparent AI systems.

This talk will cover language structures (Part 1), reasoning (Part 2), and knowledge (Part 3). These sections explain why and how language models succeed or fail on certain AI tasks and provide practical suggestions for necessary changes to (1) model architecture, (2) data preparation, and (3) the training process to move us closer to AGI.


<iframe width="600" height="400" src="https://www.youtube.com/embed/yBL7J0kgldU?si=jcCR30IAbPeow1Ta" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## 합성 데이터: AGI를 위한 언어 모델의 미래

언어 모델 물리학 연구에서 **합성 데이터는 인공 일반 지능(AGI)으로 나아가기 위한 매우 중요한 잠재력**을 가지고 있으며, 미래 언어 모델 개발의 핵심 요소로 제시됩니다.

합성 데이터가 AGI 달성에 기여하는 주요 측면은 다음과 같습니다:

*   **현재 LLM의 한계 극복**: 현재 GPT-4o와 같은 최신 LLM조차도 모든 인터넷 데이터를 학습했음에도 불구하고 10단계 이상의 추론 작업에서 실패하는 한계를 보입니다. 이는 실제 데이터만으로는 모델의 특정 능력을 충분히 향상시키기 어렵다는 것을 시사합니다. 합성 데이터는 이러한 **"장벽을 넘어서기 위한" 필수적인 수단**으로 간주됩니다.
*   **과학적 엄격성과 통제된 실험 가능**:
    *   합성 데이터는 연구자들이 **데이터의 난이도, 유형, 양, 형식 등을 완벽하게 통제**할 수 있도록 하여 이상적인 환경에서 연구를 수행하게 합니다. 이를 통해 데이터 오염 가능성을 배제하고, 모델이 단순 암기가 아닌 진정한 지능적 기술을 습득했는지 과학적으로 입증할 수 있습니다.
    *   "물리학" 접근 방식은 지능을 언어 구조, 지식, 추론과 같은 **구성 요소(building blocks)로 분해하여 개별적으로 연구**할 것을 제안하며, 합성 데이터는 이러한 개별 구성 요소에 대한 심층적인 분석을 가능하게 합니다.
*   **모델의 내부 작동 원리 및 보편적 원리 이해**:
    *   합성 데이터를 사용한 제어된 실험을 통해 연구자들은 모델이 지식을 **어떻게 저장하고 추출하는지**, **추론 능력을 어떻게 개발하고 어떤 실수**를 하는지, 그리고 언어 구조를 **어떻게 학습하는지** 등 모델의 내부 작동 방식에 대한 깊은 통찰력을 얻을 수 있습니다.
    *   이를 통해 특정 모델 버전에 국한되지 않고 **모든 가능한 언어 모델에 적용될 수 있는 "보편적인 원리(Universal Principles)"를 식별**할 수 있습니다.
*   **추론 능력의 체계적인 향상**:
    *   합성 수학 데이터셋을 통해 언어 모델이 **단순히 정답을 암기하는 것이 아니라 실제 문제 해결 기술을 학습한다**는 것을 입증할 수 있습니다.
    *   모델이 자신의 **실수를 인지하고(regretful behavior) 수정하는 능력**을 학습하도록 돕기 위해, 의도적으로 실수와 수정이 포함된 합성 데이터를 사전 학습 단계에 주입하는 방법을 제안합니다. 이는 단순히 탐색(beam search)이나 파인튜닝으로는 얻기 어려운 중요한 능력입니다.
    *   **합성 데이터는 모델의 추론 성능을 향상**시키기 위해 반드시 필요하다고 언급됩니다. 특히, 모델이 추론에서 실수를 할 때, 이러한 실수는 종종 시스템적이며(systematic) 모델의 내부 상태에서 예측될 수 있음을 제어된 실험으로 밝혀냈습니다.
*   **효율적이고 반복 가능한 연구 환경 제공**:
    *   대규모 모델 사전 학습에 막대한 비용(예: 1천만 달러)이 드는 반면, 합성 데이터를 사용하면 **1억 개 정도의 매개변수를 가진 작은 모델로도 지능의 개별 구성 요소를 집중적으로 연구**할 수 있습니다. 이러한 작은 모델은 하루 이내에 재학습이 가능하여 실험의 반복 가능성과 경제성을 크게 향상시킵니다.
    *   이를 통해 다양한 훈련 프로세스, 데이터 유형, 아키텍처 변경 등이 모델 성능에 미치는 영향을 체계적으로 탐구할 수 있습니다.
*   **AGI를 향한 올바른 데이터 형식 탐색**: 합성 데이터 연구는 궁극적으로 **"올바른 형식의 데이터"**를 찾는 데 중점을 둡니다. 이는 모델이 최대한의 지식을 습득하고, 가능한 한 길게 추론할 수 있도록 하는 데이터 형식을 식별하는 것을 목표로 합니다. 이러한 연구는 AGI에 더 가까이 다가갈 수 있는 언어 모델을 구축하는 데 필수적인 고려 사항으로 강조됩니다.

요약하자면, 합성 데이터는 현재 LLM이 가진 지식 저장, 추출, 조작, 추론 능력의 한계를 극복하고, 모델의 내부 작동 방식에 대한 깊은 과학적 이해를 바탕으로 **AGI 개발에 필요한 핵심적인 학습 능력(예: 장기 추론, 오류 수정)을 주입하고 최적화하는 데 필수적인 "미래 과학"**으로 간주됩니다.

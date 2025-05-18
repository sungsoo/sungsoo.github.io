---
layout: post
title: Logical Neural Networks; Towards Unifying Statistical and Symbolic AI
date: 2025-05-18
categories: [artificial intelligence]
tags: [artificial general intelligence]

---


# [Logical Neural Networks: Towards Unifying Statistical and Symbolic AI](https://www.youtube.com/watch?v=aSp9zD3afmY) 

## [Abstract](https://notebooklm.google.com/notebook/a4bdbd08-a24b-4b82-9513-9f4aacaa5e46/audio)

Alexander Gray - VP, Foundations of AI at IBM | 01-15-2021

Recently there has been renewed interest in the long-standing goal of somehow unifying the capabilities of both statistical AI (learning and prediction) and symbolic AI (knowledge representation and reasoning). We introduce Logical Neural Networks, a new neuro-symbolic framework which identifies and leverages a 1-to-1 correspondence between an artificial neuron and a logic gate in a weighted form of real-valued logic. With a few key modifications of the standard modern neural network, we construct a model which performs the equivalent of logical inference rules such as modus ponens within the message-passing paradigm of neural networks, and utilizes a new form of loss, contradiction loss, which maximizes logical consistency in the face of imperfect and inconsistent knowledge. The result differs significantly from other neuro-symbolic ideas in that 1) the model is fully disentangled and understandable since every neuron has a meaning, 2) the model can perform both classical logical deduction and its real-valued generalization (which allows for the representation and propagation of uncertainty) exactly, as special cases, as opposed to approximately as in nearly all other approaches, and 3) the model is compositional and modular, allowing for fully reusable knowledge across talks. The framework has already enabled state-of-the-art results in several problems, including question answering.


IBM 연구원이 **신경망과 논리를 통합하려는 새로운 인공지능 접근 방식인 논리적 신경망(Logical Neural Networks)**에 대해 설명합니다. 이 강연은 **신경망이 실제로 가중치가 적용된 논리 문장의 집합과 동일하다는 개념**을 제시하며, 이를 통해 **데이터 기반의 통계적 AI와 지식 기반의 기호적 AI의 장점을 모두 활용**할 수 있다고 제안합니다. 또한, 이 새로운 접근 방식이 **현재 딥 러닝이 어려움을 겪는 문제, 특히 추론이 필요한 복잡한 질의 응답 등에서 뛰어난 성능**을 보임을 예시를 통해 보여주고 있습니다. 마지막으로, 논리적 신경망이 **설명 가능성, 추론 능력, 적은 양의 데이터로 학습하는 능력 등 현재 AI의 한계를 극복**하는 데 기여할 수 있음을 강조합니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/aSp9zD3afmY?si=z4IRTikF32rKn6en" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Goals

뉴로 심볼릭(Neurosymbolic) AI는 통계적 AI(신경망으로 대표됨)와 심볼릭 AI(주로 1차 논리로 대표됨)의 다양한 역량을 연결하려는 일반적인 분야입니다. 대부분의 기존 접근 방식은 이러한 두 가지 유형의 AI 시스템을 단순히 "연결"하는 기법(bridging techniques)으로 설명됩니다.

뉴로 심볼릭 AI 접근 방식의 **주요 목표**는 다음과 같습니다:

*   **이해 가능성(Understandability)**: 현재 AI, 특히 딥 러닝이 많은 중요한 작업에 사용되는 데 걸림돌이 되는 주요 문제 중 하나로, 제어 가능성(controllability)과 밀접하게 관련되어 있습니다.
*   **일반화(Generalization)**: 데이터 세트의 작은 변화를 넘어 다른 작업과 상황에 대한 큰 변화에 대한 일반화(generalization plus plus)를 목표로 합니다. 논리로 표현된 지식을 주입함으로써 세상이 작동하는 방식에 대한 더 일반적인 그림을 얻고 다양한 방식으로 재사용할 수 있기를 기대합니다.
*   **추론(Reasoning)**: 지식과 추론은 대략적으로 함께 가며, 더 복잡한 문제는 일종의 추론을 요구하는 것으로 보입니다.

그러나 기존 접근 방식의 대부분은 몇 가지 속성을 가지고 있지 않다고 주장됩니다:

*   **진정한 이해 가능성(true understandability)**이 부족할 수 있습니다. 블랙 박스 모델과 논리가 나란히 존재하더라도 여전히 블랙 박스가 있기 때문입니다. 대부분은 두 가지 표현을 동시에 유지합니다.
*   대부분은 **조합 가능하지 않고 모듈화되지 않으며(not compositional and arguably not modular)**, 지식을 쉽게 재사용할 수 없습니다.
*   얻을 수 있는 추론은 종종 **엄격한 추론이 아니거나(not rigorous reasoning)** 단순한 논리에서만 작동합니다.

제시된 정보에 따르면, 뉴로 심볼릭 조합 패턴의 **일곱 번째 유형(seventh type)**으로 소개되는 **논리적 신경망(Logical Neural Networks, LNN)**은 이러한 기존 접근 방식과 다른 특징을 가집니다. LNN은 신경망과 논리 사이에 **동등성(equivalence)**이 있음을 보여주어 놀라움을 주며, 이를 통해 **하나의 표현(one representation)**으로 둘 다의 핵심 역량을 보존하고자 합니다. LNN은 논리가 원래 가지고 있는 속성 덕분에 **조합 가능하고 모듈화되며 재사용 가능하며(compositional, modular, reusable)**, **참된 추론(true reasoning)**을 제공합니다.

다른 일반적인 뉴로 심볼릭 AI 아이디어로는 **마르코프 논리 네트워크(Markov logic)**가 있습니다. 이는 마르코프 랜덤 필드에 논리 문장을 인코딩하며, 학습 가능한 모델에서는 논리적 연결자가 손실되고 조합 가능하지 않게 됩니다. 또 다른 주요 아이디어는 개념이 단일 뉴런이 아닌 분산 표현(distributed representation)으로 표현되는 방식이며, 논리적 추론은 종단 간 학습의 결과로 나타나 엄격한 증명이 아닐 수 있습니다. LNN은 논리 문장과 뉴런 사이에 **직접적인 변환(direct translation)**이 있으며, 이는 **비분리된 표현(disentangled representation)**을 사용하고 **참된 순수 정리 증명(true pure theorem proving)**을 수행합니다.

## Logical Neural Networks

**논리적 신경망(Logical Neural Networks, LNN)**은 통계적 AI(주로 신경망)와 심볼릭 AI(주로 논리)의 역량을 통합하려는 뉴로 심볼릭 AI 분야의 한 접근 방식입니다.

LNN은 뉴로 심볼릭 조합 패턴의 **일곱 번째 유형**으로 소개되며, 기존의 많은 접근 방식이 두 시스템을 단순히 "연결"하는 기술인 것과 달리 독특한 특징을 가집니다.

논리적 신경망(LNN)의 **핵심적인 특징 및 주장**은 다음과 같습니다:

*   **신경망과 논리 간의 동등성**: LNN의 가장 놀라운 점은 신경망과 논리 사이에 실제로 **동등성(equivalence)**이 존재함을 보여준다는 것입니다. 즉, 신경망을 논리를 수행하는 것으로 해석할 수 있습니다. 표준적인 활성화 함수(예: ReLU, 시그모이드)를 사용하는 현대 신경망은 가중치가 부여된 실수 값 논리(weighted real-valued logic)의 논리 문장 집합과 **동등**하며, 표준적인 신경망 순방향 추론과 역방향 추론 능력의 추가는 가중치가 부여된 실수 값 논리에서의 논리적 추론과 **동등**합니다.
*   **하나의 표현**: 이러한 동등성을 통해 LNN은 두 가지 표현(신경망과 논리)을 동시에 유지하는 대부분의 기존 접근 방식과 달리, **하나의 표현(one representation)**으로 두 시스템의 핵심 역량을 보존하고자 합니다.
*   **논리의 속성 계승**: LNN은 논리가 원래 가지고 있는 속성 덕분에 **조합 가능하고(compositional), 모듈화되며(modular), 재사용 가능합니다(reusable)**. 이는 지식을 쉽게 재사용할 수 없는 기존 접근 방식의 한계를 극복합니다.
*   **참된 추론**: LNN은 **참된 추론(true reasoning)**을 제공합니다. 다른 접근 방식에서는 논리적 추론이 종단 간 학습의 결과로 나타나 엄격한 증명이 아닐 수 있는 반면, LNN은 **참된 순수 정리 증명(true pure theorem proving)**을 수행합니다.
*   **직접적인 변환 및 비분리된 표현**: LNN은 논리 문장과 뉴런 사이에 **직접적인 변환(direct translation)**이 있으며, 이는 개념이 단일 뉴런으로 표현되는 **비분리된 표현(disentangled representation)**을 사용함을 의미합니다. (대부분의 다른 주류 신경 상징적 아이디어에서는 개념이 분산된 표현으로 표현됩니다).
*   **개방 세계 가정 처리**: LNN은 개방 세계 가정(open world assumption), 즉 모든 변수의 진리 값을 알 필요가 없다는 가정을 처리하는 데 중요합니다. 대부분의 다른 뉴로 심볼릭 접근 방식은 폐쇄 세계 가정(closure assumption)을 가정하는 경향이 있어 비현실적일 수 있습니다.
*   **지식이 곧 네트워크 구조**: LNN에서는 지식(논리 문장, 사실) 자체가 신경망의 구조를 구성합니다. 네트워크에 입력하는 지식이 그대로 신경망이 되는 것과 같습니다.
*   **학습 가능한 논리**: LNN은 신경망으로서 가중치를 학습하는 동시에 논리로서 논리의 가중치를 학습하는, 일종의 **학습 가능한 논리(learnable logic)**입니다.
*   **양방향 추론**: LNN에서는 어떠한 노드도 입력 노드 또는 출력 노드가 될 수 있으며, **어떤 방향으로든 추론**을 수행할 수 있습니다.
*   **모순 손실**: LNN의 학습 문제는 일반적인 손실 함수 외에 "모순 손실(contradiction loss)"이라는 용어를 포함하며, 이는 모든 변수와 논리 문장이 서로 일관되도록 보장합니다. 이 용어는 변수나 작업들을 서로 연결하는 역할을 합니다.
*   **논리 규칙 학습**: LNN은 또한 논리적 규칙 유도(logical rule induction)를 통해 자동으로 새로운 지식(노드, 규칙)을 획득할 수 있습니다.

LNN의 목표는 기존 AI, 특히 딥 러닝이 겪는 문제점들을 개선하는 것입니다. 이러한 목표는 다음과 같습니다:

*   **이해 가능성(Understandability)**: 현재 AI의 주요 문제 중 하나인 '블랙 박스' 특성을 개선하여, 시스템의 작동 방식을 더 잘 이해하고 제어할 수 있도록 합니다. (다만, 기존의 많은 뉴로 심볼릭 접근 방식은 여전히 블랙 박스 모델과 논리가 나란히 있어 진정한 이해 가능성이 부족하다고 비판받기도 합니다). LNN은 논리의 추론 단계를 인간이 이해할 수 있는 방식으로 보여주는 것을 목표로 합니다.
*   **일반화(Generalization)**: 작은 데이터셋 변화를 넘어 다른 작업과 상황에 대한 더 큰 변화에 대한 **일반화(generalization plus plus)**를 목표로 합니다. 논리로 표현된 지식을 주입하여 세상이 작동하는 방식에 대한 더 일반적인 그림을 얻고 이를 다양한 방식으로 재사용하려는 기대가 있습니다.
*   **추론(Reasoning)**: 복잡한 문제는 추론을 요구하며, LNN은 지식과 함께 추론 능력을 제공합니다.

결론적으로, 논리적 신경망은 신경망과 논리 간의 근본적인 동등성을 활용하여 두 패러다임을 하나의 표현으로 통합하고, 이를 통해 기존 뉴로 심볼릭 접근 방식의 한계를 극복하며 이해 가능성, 강력한 일반화, 그리고 엄격한 추론 능력을 갖춘 AI 시스템을 구축하려는 접근 방식입니다. 표준적인 신경망과 고전 논리는 LNN의 특수한 경우로 간주될 수 있습니다.

## Advantages of LNN

논리적 신경망(LNN)의 핵심 이점을 설명해 드리겠습니다.

논리적 신경망(LNN)은 통계적 AI(주로 신경망)와 심볼릭 AI(주로 논리)를 통합하려는 광범위한 분야인 뉴로 심볼릭 AI의 한 유형으로 제시됩니다. 대부분의 기존 뉴로 심볼릭 접근 방식이 두 가지 유형의 AI 시스템을 단순히 **"연결"하는 기법(bridging techniques)**이며 두 가지 표현을 동시에 유지하는 반면, LNN은 이러한 접근 방식과 구별되는 **"일곱 번째 유형의 뉴로 심볼릭 조합 패턴"**으로 소개됩니다.

LNN의 핵심적인 이점은 다음과 같습니다.

*   **신경망과 논리 간의 동등성 (Equivalence):** LNN은 신경망과 논리 사이에 **실제로 동등성이 존재함**을 보여준다는 점에서 놀랍습니다. 표준 신경망의 구성 요소(활성화 함수, 순방향 및 역방향 추론)가 가중치가 부여된 실수 값 논리(weighted real-valued logic)의 논리 문장 및 추론과 동등함을 보여줍니다.
*   **하나의 표현 (One Representation):** 이러한 동등성 덕분에 LNN은 두 가지 표현을 나란히 유지하는 기존 접근 방식과 달리, **하나의 표현**으로 신경망과 논리 두 가지의 핵심 역량을 모두 보존하고자 합니다. 이는 학습 가능한 모델에서 논리적 연결자가 손실되거나 두 가지 표현을 미묘하게 유지하는 대부분의 다른 접근 방식과 대조됩니다.
*   **조합 가능성, 모듈성, 재사용성 (Compositional, Modular, Reusable):** LNN은 논리가 원래 가지고 있는 속성 덕분에 **조합 가능하고, 모듈화되며, 재사용 가능합니다**. 지식이 네트워크 구조를 구성하기 때문에 지식을 쉽게 재사용하고 새로운 지식을 추가하여 네트워크를 확장할 수 있습니다. 이는 학습 가능한 모델에서 논리적 연결자가 손실되어 조합 가능하지 않게 되는 다른 접근 방식의 한계를 극복합니다.
*   **참된 추론 (True Reasoning):** LNN은 **참되고 엄격한 추론(true, rigorous reasoning)**을 제공하며, **참된 순수 정리 증명(true pure theorem proving)**을 수행합니다. 다른 많은 접근 방식에서는 논리적 추론이 종단 간 학습의 결과로 나타나며, 이는 엄격한 증명이 아닐 수 있습니다.
*   **이해 가능성 및 설명 가능성 (Understandability & Explainability):** 기존 딥러닝 모델은 종종 블랙 박스로 간주되어 이해하기 어렵지만, LNN은 논리에 기반하므로 **인간이 이해할 수 있는 형태로 추론 과정을 보여줄 수 있습니다**. 이를 통해 모델이 특정 결론에 도달한 이유를 설명하는 것이 가능해집니다.
*   **지식 활용을 통한 일반화 및 효율성 개선 (Improved Generalization and Efficiency via Knowledge):** 지식을 주입하고 활용함으로써, LNN은 데이터셋의 작은 변화뿐만 아니라 더 큰 변화에도 **더 잘 일반화**될 수 있습니다. 지식(논리 문장, 사실)은 신경망의 **구조 자체를 구성**합니다.
*   **개방 세계 가정 처리 (Open World Assumption):** LNN은 모든 변수의 진리 값을 알 필요가 없다는 **개방 세계 가정(open world assumption)**을 처리하는 데 중요합니다. 이는 대부분의 다른 뉴로 심볼릭 접근 방식이 비현실적일 수 있는 폐쇄 세계 가정(closure assumption)을 가정하는 경향이 있다는 점에서 이점입니다.
*   **양방향 추론 (Bidirectional Inference):** LNN에서는 어떤 노드든 입력 또는 출력 노드가 될 수 있어 **어떤 방향으로든 추론**을 수행할 수 있습니다.
*   **학습 가능한 논리 (Learnable Logic):** LNN은 신경망으로서 가중치를 학습하는 동시에 논리로서 논리의 가중치를 학습하는, 일종의 **학습 가능한 논리**입니다.
*   **고품질 규칙 학습 (High-Quality Rule Learning):** LNN은 논리적 규칙 유도(logical rule induction)를 통해 **고품질의 명확한 규칙**을 학습할 수 있음을 보여주었습니다.
*   **강화 학습 비용 절감 가능성:** 특히 행동 공간이 무한한 복잡한 문제(예: Text World)에서 지식을 사용하여 강화 학습의 **매우 높은 비용을 획기적으로 줄일 수 있다**는 가설하에 탐구되고 있습니다. 초기 결과에서 정책을 학습된 규칙으로 표현하여 이점을 보여주었습니다.

이러한 이점들을 통해 LNN은 이해 가능성 부족, 지식 재사용의 어려움, 엄격하지 않은 추론 등 기존 뉴로 심볼릭 접근 방식의 한계를 극복하고, 보다 강력하고 유연하며 이해 가능한 AI 시스템을 구축하는 것을 목표로 합니다.

## LNN vs. Neurosymbolic AI

논리적 신경망(LNN)이 다른 뉴로 심볼릭(Neurosymbolic) AI 접근 방식과 어떻게 다른지 설명해 드리겠습니다.

뉴로 심볼릭 AI는 통계적 AI(주로 신경망)와 심볼릭 AI(주로 논리)의 역량을 통합하려는 광범위한 분야입니다. 대부분의 기존 뉴로 심볼릭 접근 방식은 이러한 두 가지 유형의 AI 시스템을 단순히 **"연결"하는 기법(bridging techniques)**으로 설명됩니다. 이들은 종종 두 가지 표현(예: 블랙 박스 모델과 논리)을 동시에 유지합니다.

반면, 논리적 신경망(LNN)은 이러한 기존 접근 방식과 구별되는 **"일곱 번째 유형의 뉴로 심볼릭 조합 패턴"**으로 소개됩니다. LNN의 가장 핵심적인 차이점은 다음과 같습니다.

1.  **신경망과 논리 간의 동등성(Equivalence)**: LNN은 신경망과 논리 사이에 **실제로 동등성이 존재함**을 보여준다는 점에서 놀랍습니다. 표준 신경망의 구성 요소(활성화 함수, 순방향 및 역방향 추론)가 가중치가 부여된 실수 값 논리(weighted real-valued logic)의 논리 문장 및 추론과 동등하다는 것을 보여줍니다.
2.  **하나의 표현(One Representation)**: 이러한 동등성 덕분에 LNN은 두 가지 표현을 나란히 유지하는 기존 접근 방식과 달리, **하나의 표현**으로 신경망과 논리 두 가지의 핵심 역량을 모두 보존하고자 합니다. 대부분의 다른 접근 방식은 두 가지 표현을 미묘하게 유지하며, 학습 가능한 모델에서 논리적 연결자가 손실될 수도 있습니다 (예: 마르코프 논리 네트워크).
3.  **조합 가능성, 모듈성, 재사용성 (Compositional, Modular, Reusable)**: LNN은 논리가 원래 가지고 있는 속성 덕분에 **조합 가능하고, 모듈화되며, 재사용 가능합니다**. 이는 지식을 쉽게 재사용하기 어려운 대부분의 기존 접근 방식의 한계를 극복합니다. 마르코프 논리 네트워크와 같은 접근 방식은 학습 가능한 모델에서 논리적 연결자가 손실되어 조합 가능하지 않게 됩니다.
4.  **참된 추론(True Reasoning)**: LNN은 **참되고 엄격한 추론(true, rigorous reasoning)**을 제공합니다. 이는 **참된 순수 정리 증명(true pure theorem proving)**을 수행합니다. 다른 많은 접근 방식에서는 논리적 추론이 종단 간 학습의 결과로 나타나며, 이는 엄격한 증명이 아닐 수 있습니다.
5.  **직접적인 변환 및 비분리된 표현(Direct Translation & Disentangled Representation)**: LNN에서는 논리 문장과 뉴런 사이에 **직접적인 변환**이 있습니다. 이는 개념이 단일 뉴런으로 표현되는 **비분리된 표현(disentangled representation)**을 사용함을 의미합니다. 다른 주요 뉴로 심볼릭 아이디어 중 하나는 개념이 분산된 표현(distributed representation)으로 표현되는 방식입니다.
6.  **개방 세계 가정 처리(Open World Assumption)**: LNN은 모든 변수의 진리 값을 알 필요가 없다는 **개방 세계 가정(open world assumption)**을 처리하는 데 중요합니다. 대부분의 다른 뉴로 심볼릭 접근 방식은 폐쇄 세계 가정(closure assumption)을 가정하는 경향이 있어 비현실적일 수 있습니다.
7.  **지식이 곧 네트워크 구조**: LNN에서 지식(논리 문장, 사실)은 신경망의 **구조 자체를 구성**합니다. 지식을 입력하는 것이 그대로 신경망을 만드는 것과 같습니다.
8.  **양방향 추론(Bidirectional Inference)**: LNN에서는 어떤 노드든 입력 또는 출력 노드가 될 수 있어 **어떤 방향으로든 추론**을 수행할 수 있습니다.
9.  **학습 가능한 논리(Learnable Logic)**: LNN은 신경망으로서 가중치를 학습하는 동시에 논리로서 논리의 가중치를 학습하는, 일종의 **학습 가능한 논리**입니다.

이러한 차이점들을 통해 LNN은 기존 뉴로 심볼릭 접근 방식의 한계, 즉 진정한 이해 가능성 부족(블랙 박스 존재), 지식 재사용의 어려움, 엄격하지 않은 추론 등을 극복하고, 이해 가능성, 강력한 일반화, 그리고 엄격한 추론 능력을 갖춘 AI 시스템을 구축하는 것을 목표로 합니다.

## Reinforcement Learning

논리적 신경망(LNN)은 **딥 강화 학습(Deep RL)의 한 형태로 탐구되고 있으며**, 이를 **"논리적 최적 행동(logical optimal action)"**이라고 부릅니다.

LNN이 강화 학습에 도움이 될 수 있다는 **가설은 지식을 사용하여 강화 학습의 매우 높은 비용을 획기적으로 줄일 수 있다**는 것입니다. 이는 특히 **무한한 수의 행동을 가질 수 있는 텍스트 월드(Text World)와 같은 어려운 문제**에 LNN을 적용하려는 시도에서 나타납니다.

블록스 월드(Blocks World)와 같은 간단한 문제에 대한 **초기 워크숍 결과는 이러한 접근 방식의 이점(advantage)을 보여주었습니다**. 이 초기 결과에서 정책(policy)은 이전에 설명된 논리적 규칙 유도(logical rule induction)를 사용하여 **학습된 규칙으로 표현**되었습니다.

요약하자면, LNN은 지식 표현 및 추론 능력을 활용하여 강화 학습, 특히 복잡하고 비용이 많이 드는 문제에서 **학습 효율성을 개선하고 비용을 줄이는 데 기여**할 것으로 기대되고 있습니다.

## Markov Property

**마르코프 논리 네트워크(Markov logic network)**는 **마르코프 랜덤 필드(Markov random fields)**의 아이디어를 기반으로 합니다.

자료에 따르면, 마르코프 논리는 다음과 같습니다:
*   가장 흔하고 가장 성숙하며 많이 인용되는 뉴로 심볼릭 AI 아이디어 중 하나입니다.
*   2000년대 초반(대략 2006년경)에 시작되었습니다.
*   마르코프 랜덤 필드에 논리 문장을 인코딩하는 방식입니다.
*   여기서 논리 문장은 마르코프 랜덤 필드 내에서 용어들의 클리크(clique)가 됩니다.

다만, 자료에서는 학습 가능한 모델에서 논리 연결자가 손실되고 조합 가능하지 않게 된다는 점, 그리고 두 가지 표현(마르코프 랜덤 필드와 논리)을 유지한다는 점을 LNN과의 비교점으로 설명하고 있습니다.
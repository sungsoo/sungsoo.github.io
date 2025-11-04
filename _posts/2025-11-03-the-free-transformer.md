---
layout: post
title: The Free Transformer
date: 2025-11-03
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [[Paper Analysis] The Free Transformer (and some Variational Autoencoder stuff)](https://www.youtube.com/watch?v=Nao16-6l6dQ)

* [https://arxiv.org/abs/2510.17558](https://arxiv.org/abs/2510.17558)

## Abstract

We propose an extension of the decoder Transformer that conditions its generative process on random latent variables which are learned without supervision thanks to a variational procedure. Experimental evaluations show that allowing such a conditioning translates into substantial improvements on downstream tasks.


<iframe width="600" height="400" src="https://www.youtube.com/embed/Nao16-6l6dQ?si=M6oCnW8Bzbk4QVhB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

"The Free Transformer(FT)"는 기존의 디코더 트랜스포머(예: GPT 모델에 사용되는 모델)를 확장한 모델로, **변이 절차(variational procedure)를 통해 비지도 학습된 무작위 잠재 변수($Z$)를 사용하여 생성 프로세스를 조건화**합니다.

---

### 1. Free Transformer의 핵심 목표 및 동기

**문제점:** 기존 디코더 트랜스포머는 본질적으로 자기회귀적(auto-regressive) 모델입니다. 이는 토큰을 하나씩 순차적으로 생성하며, 다음에 올 토큰의 분포를 이전 토큰들에 기반하여 추정합니다.

1.  **잠재적 결정의 부재:** 기존 모델은 생성할 심볼 스트림에 대해 **추가적인 잠재적 결정(latent decisions)을 내리지 않고**, 오직 토큰의 선택만을 결정합니다.
2.  **복잡한 암시적 추론:** 예를 들어, 모델이 긍정적인 영화 리뷰를 생성할지 부정적인 영화 리뷰를 생성할지 결정한다고 가정해봅시다. 기존 모델은 이 결정을 명시적으로 내리지 않고, **이미 생성된 토큰들의 후천적 확률(posterior probabilities)에 긍정 또는 부정이라는 개념이 암묵적으로 내재**되게 합니다.
3.  **비효율성과 취약성:** 이러한 순수 자기회귀적 밀도 모델은 잠재된 양을 암묵적으로 추론하기 위해 **불필요하게 복잡한 계산**과 더 큰 모델 용량을 요구하며, 만약 몇 개의 토큰이 잘못 생성되면 프로세스가 궤도에서 이탈될 수 있습니다.

**해결책:** Free Transformer는 훈련 예제에 의해 부과되지 않은 **잠재적인 무작위 양($Z$)에 따라 자기회귀 프로세스를 조건화할 수 있는 자유(freedom)**를 모델에 제공하여 이러한 문제를 해결하는 것을 목표로 합니다.

### 2. Free Transformer의 작동 방식 (C-VAE 구조)

Free Transformer는 **조건부 변이형 오토인코더(Conditional Variational Autoencoder, C-VAE)**의 추상적인 구조를 가집니다.

| 구성 요소 | 역할 | 생성 시 ($\text{Inference}$) | 학습 시 ($\text{Training}$) |
| :--- | :--- | :--- | :--- |
| **디코더** | 토큰 시퀀스 생성 | **표준 자기회귀 프로세스**를 $Z$의 변조(modulation) 하에 실행. | $S$를 가장 잘 재구성하도록 $Z$를 조건으로 학습됨. |
| **인코더** | 훈련 샘플 $S$에 일관된 잠재 변수 $Z$ 샘플링. | **평가되지 않음**. | $Q(Z|S)$ 분포를 통해 $Z$를 샘플링하여 디코더 학습을 지원. |
| **잠재 변수 ($Z$)** | 생성 프로세스를 구조화하고 조정하는 무작위 상태. | **균일 분포에서 무작위로 샘플링됩니다** ($Z \sim P(Z)$). | 인코더에 의해 토큰 $S$와 일관되게 샘플링됩니다. |

**구현 및 효율성:**

*   **$Z$ 주입 위치:** Free Transformer는 **표준 디코더에 잡음 $Z$를 중간 계층에 주입**합니다.
*   **효율적인 구조 공유:** 이러한 중간 계층 주입 덕분에 **디코더의 절반을 인코더와 공유**할 수 있으며, 이는 계산 및 메모리 사용 오버헤드를 **크게 줄입니다**.
*   실제로 8B 모델 기준으로 인코더를 위한 하나의 추가적인 비인과적(non-causal) 블록만 필요하며, 이로 인해 약 **3.1%의 컴퓨팅 및 메모리 오버헤드**가 발생합니다.
*   **학습 목표:** 학습은 표준 교차 엔트로피 손실(재구성 손실)과 $Q(Z|S)$와 사전 분포 $P(Z)$ 사이의 **쿨백-라이블러(KL) 발산**을 최소화하는 방식으로 진행됩니다. KL 발산은 인코더가 디코더가 계산해야 할 정보를 $Z$를 통해 너무 많이 복사하는 것을 방지합니다.

### 3. 주요 결과

실험 평가는 잠재 변수 $Z$를 조건화하는 것이 다운스트림 작업에서 **상당한 개선**으로 이어진다는 것을 보여줍니다.

특히, Free Transformer는 다음과 같은 분야에서 성능 향상을 보였습니다.

*   **추론/수학/코드 생성 벤치마크:** HumanEval+, MBPP, GSM8K와 같이 **어떤 형태의 추론이 필요한** 벤치마크에서 상당한 성능 증가가 관찰되었습니다.
*   **일반 지식 및 상식:** 8B 모델의 경우 MMLU 및 CSQA와 같은 다중 선택 질문에서도 명확한 개선이 있었습니다.

이러한 성능 향상은 Free Transformer의 접근 방식이 바닐라 트랜스포머의 **유도 편향(inductive bias)을 실제로 개선**한다는 강력한 신호입니다.

---

## **직관적인 비유:**

표준 트랜스포머가 마치 강물 위를 흐르는 뗏목과 같다면, 매 순간 현재 위치(이전 토큰)만을 보고 다음 행동(다음 토큰)을 결정하는 것과 같습니다. 큰 구조(예: '긍정 리뷰'라는 개념)는 수많은 작은 결정들의 결과로 *자연스럽게* 발생하기를 기대해야 합니다.

반면, **Free Transformer는 배의 키(rudder) 역할**을 하는 $Z$를 탑재합니다. 글을 쓰기 시작하기 전에 **$Z$라는 '의도'나 '고차원적 구조'를 무작위로 뽑아두고**, 이 의도($Z$)가 모델의 생성 과정 전체를 일관되게 조절합니다. 이로 인해 모델은 매 토큰을 생성할 때마다 복잡하게 의도를 추론할 필요 없이, 이미 결정된 '의도'에 따라 더 명확하고 효율적으로 생성할 수 있게 됩니다.
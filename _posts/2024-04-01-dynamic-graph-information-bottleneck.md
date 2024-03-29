---
layout: post
title: Dynamic Graph Information Bottleneck
date: 2024-04-01
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Dynamic Graph Information Bottleneck](https://www.youtube.com/watch?v=CwWbxmOhOfE)

---



# Dynamic Graph Information Bottleneck

* Temporal Graph Learning Reading Group
* Paper: "Dynamic Graph Information Bottleneck"
* Speaker: Haonan Yuan
* Date: March 21, 2024

## Abstract

Dynamic Graphs widely exist in the real world, which carry complicated spatial and temporal feature patterns, challenging their representation learning. Dynamic Graph Neural Networks (DGNNs) have shown impressive predictive abilities by exploiting the intrinsic dynamics. However, DGNNs exhibit limited robustness, prone to adversarial attacks. This paper presents the novel Dynamic Graph Information Bottleneck (DGIB) framework to learn robust and discriminative representations. 
Leveraged by the Information Bottleneck (IB) principle, we first propose the expected optimal representations should satisfy the Minimal-Sufficient-Consensual (MSC)
Condition. To compress redundant as well as conserve meritorious information into latent representation, DGIB iteratively directs and refines the structural and feature information flow passing through graph snapshots. To meet the MSC Condition, we decompose the overall IB objectives into DGIB𝑀𝑆 and DGIB𝐶, in which the DGIB𝑀𝑆 channel aims to learn the minimal and sufficient representations, with the DGIB𝐶 channel guarantees the predictive consensus. Extensive experiments on real-world and synthetic dynamic graph datasets demonstrate the superior robustness of DGIB against
adversarial attacks compared with state-of-the-art baselines in the
link prediction task. To the best of our knowledge, DGIB is the first
work to learn robust representations of dynamic graphs grounded
in the information-theoretic IB principle.


## 동적 그래프의 견고한 표현 학습을 위한 동적 그래프 정보 병목 (DGIB) 프레임워크

실 세계에는 다양한 공간적, 시간적 특징 패턴을 가지는 동적 그래프가 널리 존재하며, 이는 그래프 표현 학습에 있어 어려움을 제시합니다. 동적 그래프 신경망 (DGNN)은 내재적 동적 특성을 활용하여 인상적인 예측 능력을 보여주었지만, 적대적 공격에 취약하다는 한계가 있습니다. 이 논문에서는 견고하고 판별력 있는 표현을 학습하기 위한 새로운 동적 그래프 정보 병목 (DGIB) 프레임워크를 제안합니다.

정보 병목 (IB) 원리 활용을 통해 먼저, 기대 최적 표현은 최소-충분-합의 (MSC) 조건을 만족해야 한다고 제안합니다. DGIB는 정보 병목 원리를 이용하여 불필요한 정보를 압축하고 중요한 정보를 잠재적 표현으로 유지하기 위해 그래프 스냅샷을 통과하는 구조적 및 특징 정보 흐름을 반복적으로 지시 및 개선합니다. MSC 조건을 충족하기 위해 전체 IB 목적 함수를 DGIB_MS 및 DGIB_C로 분해합니다. 여기서 DGIB_MS 채널은 최소한의 충분한 표현을 학습하는 것을 목표로 하고, DGIB_C 채널은 예측 합의를 보장합니다.

실제 및 합성 동적 그래프 데이터 세트에 대한 광범위한 실험을 통해 최첨단 기 baseline 모델과 비교하여 링크 예측 작업에서 DGIB의 견고성이 뛰어나다는 것을 입증했습니다. 저자들의 연구 결과에 따르면, DGIB는 정보 이론적 IB 원리 기반으로 동적 그래프의 견고한 표현을 학습하는 최초의 연구입니다.


<iframe width="600" height="400" src="https://www.youtube.com/embed/CwWbxmOhOfE?si=qJ9_8Vs2QHK8WKym" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
---
layout: post
title: Design of Protein Structure with RFdiffusion  
date: 2025-04-30
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

### Article Source


* [Design of Protein Structure with RFdiffusion](https://www.youtube.com/watch?v=agiHi6hOE3Q)

---

# [Design of Protein Structure with RFdiffusion](https://www.youtube.com/watch?v=agiHi6hOE3Q)

This week we discuss RFDiffusion[1] a diffusion denoising model based on RoseTTAFold to generate realistic protein protein backbones. Nick Randolf gives an overview of the method and we discuss the method details.

* slides: [https://bit.ly/46Terw4](https://bit.ly/46Terw4)
* codes: [https://github.com/RosettaCommons/RFdiffusion](https://github.com/RosettaCommons/RFdiffusion)

[1] *De novo design of protein structure and function with RFdiffusion*

Joseph L. Watson, David Juergens, Nathaniel R. Bennett, Brian L. Trippe, Jason Yim, Helen E. Eisenach, Woody Ahern, Andrew J. Borst, Robert J. Ragotte, Lukas F. Milles, Basile I. M. Wicky, Nikita Hanikel, Samuel J. Pellock, Alexis Courbet, William Sheffler, Jue Wang, Preetham Venkatesh, Isaac Sappington, Susana Vázquez Torres, Anna Lauko, Valentin De Bortoli, Emile Mathieu, Sergey Ovchinnikov, Regina Barzilay, Tommi S. Jaakkola, Frank DiMaio, Minkyung Baek & David Baker
Nature 620, 1089–1100 (2023).

## 주요 내용

이 세미나는 분자 모델링 분야의 최신 연구 동향을 소개하며, 특히 베이커 연구실에서 개발한 단백질 구조 생성 모델인 **RF Diffusion**에 대해 심층적으로 논의합니다. 주요 핵심 내용은 다음과 같습니다.

### **1. RF Diffusion 모델 개요:**

* RF Diffusion은 RosettaFold를 기반으로 구축된 확산 모델(Diffusion Model)로, 단백질 백본 구조 생성을 목표로 합니다.
* 기존 단백질 구조 예측 모델(RosettaFold, AlphaFold)과는 달리, 단백질 서열 정보 없이도 백본 구조를 생성할 수 있습니다.
* FrameDiff와 유사하게 단백질 잔기를 SE(3) 다양체의 요소(회전 행렬과 병진 벡터)로 표현하고, 이 다양체 상에서 확산 및 역확산 과정을 수행합니다.

### **2. FrameDiff와의 유사점 및 차이점:**

| 특징             | FrameDiff                               | RF Diffusion                             |
| ---------------- | --------------------------------------- | ---------------------------------------- |
| **주요 목표** | 단백질 백본 생성                          | 단백질 백본 생성                           |
| **입력 정보** | (주로) 초기 노이즈                       | (주로) 초기 노이즈 (선택적으로 추가 정보 활용) |
| **단백질 표현** | SE(3) 다양체 기반 잔기 표현                | SE(3) 다양체 기반 잔기 표현                 |
| **확산 공간** | SE(3) 다양체 (SO(3) 및 병진 독립적 확산) | SE(3) 다양체 (SO(3) 및 병진 독립적 확산) |
| **모델 아키텍처** | SE(3) 등변성 유지하는 어텐션 및 트랜스포머 | SE(3) 등변성 유지하는 어텐션 및 트랜스포머 |
| **손실 함수** | 이론적 기반의 Denoising Score Matching | 경험적 기반의 평균 제곱 오차 (MSE)        |
| **사전 학습** | 없음                                    | RosettaFold의 사전 학습된 가중치 활용 및 Fine-tuning |

### **3. 백본 생성 과정:**

* 초기에는 가우시안 분포의 병진 벡터와 균일 분포의 회전 행렬로 이루어진 노이즈 잔기 분포에서 샘플링합니다.
* 학습 과정에서는 실제 단백질 구조에 노이즈를 점진적으로 추가하고, 이를 역전시키는(Denoising) 과정을 학습합니다.
* 역확산 과정은 여러 단계(예: 200단계)를 거쳐 점진적으로 노이즈를 제거하며, 각 단계에서 RosettaFold 모델을 사용하여 Denoised된 구조를 예측하고 보간(Interpolation)합니다.
* Self-conditioning 기법을 사용하여 이전 단계에서 예측된 구조 정보를 모델 입력에 다시 활용합니다.

### **4. 모델 아키텍처 (RosettaFold 활용):**

* RF Diffusion은 RosettaFold 2의 아키텍처를 기반으로 합니다.
* RosettaFold는 MSA(Multiple Sequence Alignment) 트랙, Pair 트랙, 3D 트랙의 세 가지 트랙을 사용하여 단백질 구조를 예측합니다.
* RF Diffusion에서는 서열 정보가 마스크 처리되므로 MSA 트랙의 입력은 마스크 토큰으로 채워집니다.
* Self-conditioning을 통해 얻은 예측 구조로부터 Pair 특징(Distogram, Anglogram)을 계산하여 Pair 트랙의 입력으로 사용합니다.
* 확산된 좌표는 3D 트랙의 입력으로 사용됩니다.
* RosettaFold와 달리 RF Diffusion에서는 Recycling 과정이 사용되지 않습니다.

### **5. 확장 기능:**

* **대칭 구조 생성:** 노이즈 분포를 대칭화하여 대칭적인 단백질 구조를 생성할 수 있습니다.
* **결합 부위 특이적 결합체 디자인:** 특정 결합 부위(Hotspot 잔기 지정)에 결합하는 단백질을 디자인할 수 있습니다.
* **모티프 스캐폴딩:** 특정 기능성 모티프를 유지하면서 주변 스캐폴드 구조를 디자인할 수 있습니다.
* **대칭 모티프 스캐폴딩:** 대칭적인 모티프를 유지하면서 대칭적인 스캐폴드 구조를 디자인할 수 있습니다.

### **6. 학습 및 구현 세부 사항 (보충 자료 기반):**

* RosettaFold는 SE(3) 등변성 레이어, 어텐션 메커니즘 등을 사용하여 좌표를 업데이트하고, 곁사슬 비틀림 각 및 산소 원자 위치를 예측합니다.
* RosettaFold 학습에는 FAPE 손실, 비틀림 각 손실, 결합 거리 및 방향 손실 등 다양한 손실 함수가 사용됩니다.
* RF Diffusion은 RosettaFold의 사전 학습된 가중치를 활용하여 Fine-tuning 방식으로 학습됩니다.
* RF Diffusion의 역확산 과정은 회전과 병진에 대해 독립적으로 파라미터화됩니다.

### **결론:**

이 세미나는 RF Diffusion이 단백질 구조 생성 분야에서 보여주는 혁신적인 가능성을 강조합니다. 특히 서열 정보 없이도 구조를 생성하고, 다양한 조건 및 제약 사항을 통합하여 특정 기능을 갖는 단백질을 디자인할 수 있다는 점이 주목할 만합니다. RosettaFold의 강력한 구조 예측 능력을 기반으로 구축된 RF Diffusion은 향후 신약 개발, 생체 재료 디자인 등 다양한 분야에 기여할 것으로 기대됩니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/agiHi6hOE3Q?si=XRStS_tPX1l1XsUb" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

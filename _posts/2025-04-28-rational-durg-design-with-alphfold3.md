---
layout: post
title: Towards Rational Drug Design with AlphaFold 3  
date: 2025-04-28
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

### Article Source


* [Towards Rational Drug Design with AlphaFold 3](https://www.youtube.com/watch?v=AE35XCN5NuU)

---


# [Towards Rational Drug Design with AlphaFold 3](https://www.youtube.com/watch?v=AE35XCN5NuU)

* This is a recording from the 2024 Molecular Machine Learning conference hosted at Mila. 

<iframe width="600" height="400" src="https://www.youtube.com/embed/AE35XCN5NuU?si=dMgVMds9JbRZt64I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## AlphaFold 3를 활용한 합리적 약물 설계

**발표자:** Max Jaderberg (Isomorphic Labs 최고 AI 책임자, Alphabet 자회사)

### **주요 핵심 내용:**

Max Jaderberg는 Isomorphic Labs와 Google DeepMind의 협력을 통해 개발된 새로운 모델인 **AlphaFold 3**를 소개하며, AI 기반의 혁신적인 약물 설계 방식에 대한 비전을 제시했습니다. 그는 현재 약물 발견 과정의 여러 병목 현상을 지적하고, AlphaFold 3가 이러한 문제들을 해결하고 약물 개발의 효율성과 성공률을 획기적으로 높일 수 있는 잠재력을 강조했습니다.

**1. 약물 설계 과정의 병목 현상:**

* **질병 생물학 이해 및 타겟 발굴:** 어떤 단백질 타겟을 조절해야 질병 상태를 효과적으로 변화시킬 수 있는지에 대한 깊이 있는 이해 부족.
* **분자 설계:** 특정 타겟 단백질에 결합하여 기능을 조절하는 화학 물질(분자) 설계의 어려움.
* **화합물 품질 및 독성 평가:** 설계된 분자가 인체 내에서 예상대로 작용하고, 원치 않는 부작용을 일으키지 않는지 확인하는 과정의 복잡성.
* **지식 이전 및 확장성:** 특정 타겟에 대한 연구 경험과 지식을 다른 타겟 연구에 효과적으로 이전하고 확장하는 능력 부족.

**2. AlphaFold 3의 목표 및 특징:**

* AlphaFold 계열의 진화된 모델로, **단일 모델**을 통해 단백질-단백질 복합체뿐만 아니라 **DNA, RNA, 소분자 리간드, 이온, 번역 후 변형**과의 복합체 구조까지 예측 가능합니다.
* 질병 관련 단백질과 분자들의 상호작용 방식을 더 깊이 이해함으로써 약물 설계자들에게 새로운 통찰력을 제공합니다.
* 약물 설계자가 화합물 설계를 **컴퓨터 시뮬레이션(in silico)** 환경에서 직접 테스트하고 3차원 구조 변화를 시각화하여 더욱 합리적인 설계를 가능하게 합니다.
* AlphaFold 2의 핵심 아이디어를 더욱 발전시키고 단순화했으며, **확산 모델(Diffusion Model)** 아키텍처를 채택했습니다.
* 단백질-단백질, 단백질-리간드, 단백질-핵산 구조 예측에서 **최첨단(State-of-the-art)** 성능을 달성했습니다.
* 예측된 구조의 **신뢰도(Confidence)**를 함께 제공하여 결과의 정확성을 판단하는 데 도움을 줍니다.

**3. AlphaFold 3의 응용 및 사례:**

* **새로운 상호작용 방식 예측:** 훈련 데이터에서 보지 못했던 완전히 새로운 폴딩 구조나 결합 부위를 정확하게 예측하는 능력을 보여줍니다 (예: 알로스테릭 결합 부위).
* **"Undruggable" 타겟 공략:** 기존 약물 설계가 어려웠던 타겟에 대한 새로운 접근 방식을 제시하고, 분자 접착제(Molecular Glue)와 같은 복잡한 결합 메커니즘을 예측합니다.
* **구조 기반 약물 설계 반복 최적화:** 초기 리간드 구조에서 시작하여 점진적인 원자 추가를 통해 결합력을 강화하는 과정을 정확하게 예측하여 구조 기반 약물 설계 과정을 효율적으로 지원합니다.
* **공유 결합 예측:** 입력으로 명시되지 않은 공유 결합 형성 가능성을 예측하여 더욱 정확한 복합체 구조를 제시합니다.

**4. AlphaFold 3의 한계:**

* 생성 모델이므로 예측된 구조의 **배치(Conformation) 다양성이 제한적**일 수 있으며, 훈련 데이터의 편향에 영향을 받을 수 있습니다.
* **환각(Hallucination)** 현상이 발생하여 실제 존재하지 않는 구조를 예측할 수 있으며, 특히 무질서한 영역에서 그럴 가능성이 있습니다.

### **결론:**

AlphaFold 3는 AI를 활용한 합리적 약물 설계 분야에서 획기적인 발전을 이루었으며, 기존의 약물 발견 과정의 여러 난관을 극복하고 효율성과 성공률을 높이는 데 중요한 역할을 할 것으로 기대됩니다. Isomorphic Labs는 AlphaFold 3를 실제 약물 설계 파트너십에 적극적으로 활용하며 그 가능성을 입증하고 있습니다. 다만, AI 모델로서의 inherent 한 한계를 인지하고 지속적인 연구 개발을 통해 더욱 발전시켜 나갈 필요가 있습니다.
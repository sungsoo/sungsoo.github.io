---
layout: post
title: New "Absolute Zero" Model Learns with NO DATA  
date: 2025-05-12
categories: [artificial intelligence]
tags: [artificial general intelligence]

---



# [New "Absolute Zero" Model Learns with NO DATA](https://www.youtube.com/watch?v=CqdqZNqljdI)

* Paper: [Absolute Zero: Reinforced Self-play Reasoning with Zero Data](https://arxiv.org/abs/2505.03335)

## Abstract

인간의 개입 없이 자체적으로 학습하고 추론 능력을 향상시키는 언어 모델을 제안합니다.  **절대 영점 패러다임**이라는 새로운 접근 방식을 통해, 모델은 학습에 최적화된 과제를 스스로 생성하고, 코드 실행 환경과 상호작용하며 얻은 피드백을 바탕으로 해결 방법을 학습합니다.  **Absolute Zero Reasoner (AZR)**라는 구체적인 모델은 코딩 과제를 생성하고 해결하며, 코드 및 수학적 추론 벤치마크에서 기존 모델을 능가하는 뛰어난 성능을 보입니다.  이는 **수퍼비전 학습이나 검증 가능한 보상을 통한 강화 학습과 달리**, 사람의 데이터 없이도 일반적인 추론 능력이 향상될 수 있음을 시사합니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/CqdqZNqljdI?si=1wJ8G3OhXgj4B2IN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## [Overview](https://notebooklm.google.com/notebook/298b4fc1-e594-4a72-b4e6-980fd25acf75/audio)

인간 데이터 없이 강화 학습 모델을 학습시키고 성능을 향상시키는 방법은 **앱솔루트 제로(Absolute Zero) 패러다임**을 통해 구현됩니다. 이 패러다임 하에 구축된 시스템인 **앱솔루트 제로 리즈너(Absolute Zero Reasoner, AZR)**는 강화 자기 플레이 추론(Reinforced Self-play Reasoning)을 사용하여 데이터에 대한 외부 의존 없이 발전합니다.

앱솔루트 제로 패러다임은 다음과 같이 작동합니다:

*   **자기 플레이 순환 (Self-play Loop)**: 모델은 **제안자(proposer)**와 **해결자(solver)**라는 두 가지 역할을 동시에 수행합니다. 이 과정은 무한히 반복될 수 있습니다.
*   **작업 제안 (Task Proposal)**: 제안자 역할을 하는 모델은 학습에 가장 도움이 될 만한 작업을 자체적으로 제안합니다. AZR의 경우, 이는 코딩 작업을 제안하는 것을 포함하며, 프로그램-입력-출력(p, i, o) 삼중항을 기반으로 연역, 귀추, 귀납의 세 가지 추론 방식에 해당하는 작업을 만듭니다. 제안자는 이전의 자체 생성 작업들을 저장한 버퍼에서 참고할 수 있습니다.
*   **환경 검증 (Environment Validation)**: 제안된 작업은 **환경(environment)**에 의해 검증됩니다. AZR에서는 **코드 실행기(code executor)**가 환경 역할을 하며, 제안된 작업이 유효한지 확인하고 정답(y\*)을 생성합니다. 이 환경은 개방형이지만 실제에 근거한(grounded) 설정에서 검증 가능한 피드백의 통일된 소스로 기능합니다. 예를 들어, 연역 및 귀추 작업의 경우, 제안된 프로그램과 입력을 실행하여 정답 출력을 얻습니다. 단순한 검증을 위해, 제안된 프로그램은 결정론적이어야 합니다.
*   **보상 시스템 (Reward System)**:
    *   **학습 가능성 보상 (Learnability Reward)**: 제안자는 자신이 만든 작업의 **학습 가능성**에 대해 보상을 받습니다. 이 보상은 작업의 난이도를 조절하도록 설계되었습니다. 해결자가 너무 쉽게 풀거나(성공률 1) 전혀 풀 수 없는(성공률 0) 작업은 보상이 적고, 해결자가 때때로 성공하는 **적당히 어려운 작업**에 가장 높은 보상이 주어집니다. 이는 해결자의 예상 성공률을 기반으로 계산됩니다.
    *   **해결 보상 (Solution Reward)**: 해결자는 제안된 작업을 해결한 결과에 대해 보상을 받습니다. 코드 실행기 환경이 해결자의 답(y)을 정답(y\*)과 비교하여 검증합니다. 답이 맞으면 1, 틀리면 0의 이진 보상($r_{solve}$)이 주어집니다.
*   **공동 학습 (Joint Training)**: 제안자와 해결자 역할은 **동시에 학습**됩니다. 모델은 제안된 작업의 학습 가능성 보상과 해결된 작업의 정확성 보상을 통합한 복합 보상을 사용하여 강화 학습 알고리즘(REINFORCE++ 기반의 PPO 목적 함수 사용)으로 업데이트됩니다.

이러한 연속적인 작업 제안, 검증, 해결, 그리고 검증 가능한 보상을 통한 학습 순환을 통해 모델은 자체적인 학습 커리큘럼과 추론 능력을 **스스로 발전**시킵니다. 이 과정은 환경과의 상호작용에 기반하며, 인간이 세상을 통해 배우고 추론하는 방식을 반영합니다. 이를 통해 작업, 추론 과정, 정답 등 인간이 큐레이션한 데이터셋에 대한 필요성이 제거됩니다.

AZR은 이러한 앱솔루트 제로 패러다임을 구현하여 외부 데이터 없이도 코딩 및 수학적 추론 작업에서 **최첨단 성능(SOTA)**을 달성했으며, 이는 수만 개의 도메인 내 인간이 큐레이션한 예시로 학습된 기존의 제로 설정(zero setting) 모델들보다 우수한 결과입니다. 궁극적으로 이 패러다임은 인간이 큐레이션한 데이터의 제약에서 벗어나 모델이 스스로 발전할 수 있도록 하는 유망한 방향으로 여겨집니다.
---
layout: post
title: Robust Link Prediction over Noisy Hyper Relational Knowledge Graphs
date: 2025-07-17
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [Robust Link Prediction over Noisy Hyper Relational Knowledge Graphs via Active Learning](https://www.youtube.com/watch?v=KIbKfITcAOA)


## Abstract

Weijian Yu, State Key Laboratory of Internet of Things for Smart City and Department of Computer and Information Science, University of Macau, Macau, Macau

<iframe width="600" height="400" src="https://www.youtube.com/embed/KIbKfITcAOA?si=2xEFxDBrgHC4lEA0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


노이즈가 많은 하이퍼 관계형 지식 그래프(KGs)에서 링크 예측의 근본적인 과제는 다음과 같습니다:

*   **본질적인 노이즈의 존재**: 현대 지식 그래프는 구성 과정의 특성상 필연적으로 노이즈를 포함하고 있습니다.
    *   **자동 추출 방식의 한계**: 대규모 웹 말뭉치에서 자동으로 추출된 지식 그래프(예: NELL, YAGO)는 노이즈가 많은 소스 말뭉치와 불완전한 추출 기술로 인해 노이즈가 발생합니다. 예를 들어, NELL은 74%의 정밀도를 보이며 약 0.6백만 개의 노이즈 트리플을 포함하고, YAGO는 95%의 정확도를 보고하지만 약 7.5백만 개의 노이즈 트리플에 해당합니다.
    *   **크라우드소싱 방식의 취약성**: 위키데이터와 같이 크라우드소싱을 통해 구축된 지식 그래프는 참가자의 동기 부여에 민감하고 악의적인 참가자에게 취약하여 빈번하게 훼손될 수 있습니다.
    *   이러한 노이즈는 링크 예측과 같은 하위 애플리케이션에 매우 해로울 수 있습니다.

*   **하이퍼 관계형 사실의 복잡성으로 인한 신뢰도 평가의 어려움**:
    *   전통적인 지식 그래프는 주어-관계-목적어(triple) 형태의 사실로 구성되지만, 현대 지식 그래프는 기본 트리플에 추가 정보를 설명하는 임의의 수의 키-값 쌍이 연관된 **하이퍼 관계형 사실**을 포함하는 경우가 많습니다.
    *   기존의 로버스트 학습 기법들은 대부분 트리플 사실에 중점을 두었으며, 트리플 사실의 경우 사실 단위의 신뢰도를 평가하는 것이 비교적 간단합니다.
    *   그러나 하이퍼 관계형 사실의 정확성은 **포함된 모든 요소의 호환성**에 따라 달라지기 때문에, **사실의 신뢰도 평가를 상당히 복잡하게 만듭니다**. 이는 기존의 많은 신뢰도 평가 기술 적용을 어렵게 합니다.
    *   트리플과 달리 하이퍼 관계형 사실은 임의의 수의 키-값 쌍을 포함할 수 있으며, 이로 인해 크라우드 어노테이터(crowd annotator)가 많은 요소를 확인하는 데 상당한 노력이 필요할 수 있습니다 (예: 한 사실에 67개의 엔티티와 66개의 관계가 포함될 수 있음).

*   **제한된 인간 라벨링 예산 활용의 비효율성**:
    *   크라우드소싱을 통한 인간의 신뢰도 평가는 유망한 해결책이지만, 크라우드 어노테이터의 **높은 비용** 때문에 제한된 라벨링 예산을 효과적으로 활용하는 것이 중요합니다.
    *   현대 지식 그래프에 포함된 엄청난 수의 사실은 크라우드 어노테이터의 라벨링 용량을 크게 초과하므로, 가장 유익한 샘플을 선택하고 라벨링 효율성을 높이는 메커니즘을 설계하는 것이 중요합니다.
    *   대규모의 노이즈가 많은 지식 그래프에 대한 수동 수정은 노력이 많이 들고 항상 제한된 인적 자원에 의해 제약을 받습니다.
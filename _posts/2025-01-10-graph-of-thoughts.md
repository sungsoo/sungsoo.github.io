---
layout: post
title: Graph-of-Thoughts (GoT) for AI reasoning Agents 
date: 2025-01-10
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Graph-of-Thoughts (GoT) for AI reasoning Agents](https://www.youtube.com/watch?v=tCPA89n6NGQ)

---


# Graph-of-Thoughts (GoT) for AI reasoning Agents


## Abstract

From Chain-of Thoughts (CoT) to a higher dimensional Graph-of-Thought (GoT) reasoning algorithm. The reasoning evolution for LLM-augmented autonomous agents is accelerating rapidly, with significant input from the open-source research community.

<iframe width="600" height="400" src="https://www.youtube.com/embed/tCPA89n6NGQ?si=r6OpsTEtiODX00as" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>



## Graph of Thought : Solving Elaborate Problems with Large Language Models

최근 대규모 언어 모델(LLM)을 활용한 연구가 활발히 진행되면서, 복잡한 문제를 효과적으로 해결하기 위한 다양한 프롬프팅 방법론들이 제안되고 있습니다. 이번 논문에서는 ETH Zurich 연구팀이 제안한 "Graph of Thoughts (GoT)" 프레임워크를 소개합니다.

GoT의 핵심 아이디어는 다음과 같습니다:

기존의 Chain-of-Thought (CoT) 또는 Tree of Thoughts (ToT)와 달리, GoT는 LLM의 사고 과정을 임의의 그래프 구조로 모델링합니다.
각 "생각"을 그래프의 노드로, 생각 간의 의존 관계를 그래프의 엣지로 표현하여 보다 복잡한 사고 과정을 가능하게 합니다.
이러한 구조를 통해, 다양한 경로에서 도출된 생각들을 결합하거나, 피드백 루프를 통해 생각을 개선하는 등 다양한 사고 전환이 가능합니다.
이 연구는 다음과 같은 점에서 주목할 만합니다:

GoT는 LLM이 생성한 정보를 체계적으로 연결하고 결합하여, 단순한 체인이나 트리 구조보다 더 정교한 문제 해결 방안을 도출할 수 있습니다.
실험 결과, 기존 ToT 대비 정렬 작업의 정확도를 62% 향상시키면서도 비용은 31% 이상 절감하는 성과를 보였습니다.
GoT는 새로운 프롬프팅 스키마로 확장 가능하며, 다양한 LLM 모델에 적용할 수 있어 그 활용도가 매우 높습니다.
이 논문은 특히, 복잡한 문제를 해결할 때 인간의 사고 과정에 가까운 방법론을 LLM에 도입함으로써, AI의 사고 능력을 한 단계 발전시킬 수 있는 가능성을 보여줍니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/psVspnBJ9qM?si=0OsoYkpeIav0v5fk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
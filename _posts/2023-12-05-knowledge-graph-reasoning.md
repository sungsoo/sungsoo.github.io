---
layout: post
title: Knowledge Graph Reasoning with Graph Neural Networks 
date: 2023-12-05
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Knowledge Graph Reasoning with Graph Neural Networks](https://www.youtube.com/watch?v=WeH3h-o1BgQ)

---

# Knowledge Graph Reasoning with Graph Neural Networks  

## Abstract

Knowledge graphs encode real-world facts and are critical in various applications and domains such as natural language understanding, recommender systems, drug discovery. A fundamental problem on knowledge graphs is to predict the answer to some queries by reasoning over existing facts, a.k.a. knowledge graph reasoning. Such a problem is commonly solved by embedding methods. In this talk, we take another approach, and solves knowledge graph reasoning with graph neural networks. First, we propose Neural Bellman-Ford Networks (NBFNet) that solves single-hop reasoning with the generalized Bellman-Ford algorithm and learned operators in the path formulation. Then we introduce Graph Neural Network Query Executor (GNN-QE) that combines GNNs with fuzzy sets for answering multi-hop queries on knowledge graphs. Both models are highly related to traditional symbolic methods, such as personalized PageRank and subgraph matching, but can additionally deal with the missing links in knowledge graphs. Meanwhile, both models can visualize their intermediate steps, which may help us better understand the reasoning process.

지식 그래프는 실제 세계의 사실을 인코딩하며, 자연어 이해, 추천 시스템, 약물 개발과 같은 다양한 응용 분야에서 중요합니다. 지식 그래프에서의 기본적인 문제 중 하나는 기존 사실을 기반으로 일부 쿼리에 대한 답을 추론하는 것이며, 이를 지식 그래프 추론이라고 합니다. 이러한 문제는 주로 임베딩 방법을 사용하여 해결됩니다. 본 강의에서는 다른 접근 방식을 취하고, 그래프 신경망을 사용하여 지식 그래프 추론을 해결합니다. 먼저, 우리는 단일 홉 추론을 일반화된 벨만-포드 알고리즘과 경로 공식에서 학습된 연산자로 해결하는 Neural Bellman-Ford Networks (NBFNet)를 제안합니다. 그런 다음, 우리는 Graph Neural Network Query Executor (GNN-QE)를 소개하며, 이는 GNNs를 퍼지 집합과 결합하여 지식 그래프에서의 다중 홉 쿼리에 답합니다. 두 모델 모두 개인화된 페이지랭크 및 서브그래프 매칭과 같은 전통적인 기호적 방법과 관련이 많지만, 지식 그래프에서 누락된 링크를 처리할 수 있습니다. 한편, 두 모델 모두 중간 단계를 시각화할 수 있어 추론 과정을 더 잘 이해하는 데 도움이 될 수 있습니다.


<iframe width="600" height="400" src="https://www.youtube.com/embed/WeH3h-o1BgQ?si=pgoUBdDSpLYADLQ-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
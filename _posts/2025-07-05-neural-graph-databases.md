---
layout: post
title: Neural Graph Databases
date: 2025-07-05
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# [Neural Graph Databases](https://www.youtube.com/watch?v=OZBLgKKU7IY)

* Paper Title: Neural Graph Databases 
* Conference: First Learning on Graphs Conference (LoG'22)
* Speaker: Maciej Besta 
* Authors: Maciej Besta, Patrick Iff, Florian Scheidl, Kazuki Osawa, Nikoli Dryden, Michal Podstawski, Tiancheng Chen, Torsten Hoefler



## [Abstract](https://notebooklm.google.com/notebook/2b8744d6-6bea-4d4a-8b71-b73cb284167c/audio)

Graph databases (GDBs) enable processing and analysis of unstructured, complex, rich, and usually vast graph datasets. Despite the large significance of GDBs in both academia and industry, little effort has been made into integrating them with the predictive power of graph neural networks (GNNs). In this work, we show how to seamlessly combine nearly any GNN model with the computational capabilities of GDBs. For this, we observe that the majority of these systems are based on, or support, a graph data model called the Labeled Property Graph (LPG), where vertices and edges can have arbitrarily complex sets of labels and properties. We then develop LPG2vec, an encoder that transforms an arbitrary LPG dataset into a representation that can be directly used with a broad class of GNNs, including convolutional, attentional, message-passing, and even higher-order or spectral models. In our evaluation, we show that the rich information represented as LPG labels and properties is properly preserved by LPG2vec, and it increases the accuracy of predictions regardless of the targeted learning task or the used GNN model, by up to 34% compared to graphs with no LPG labels/properties. In general, LPG2vec enables combining predictive power of the most powerful GNNs with the full scope of information encoded in the LPG model, paving the way for neural graph databases, a class of systems where the vast complexity of maintained data will benefit from modern and future graph machine learning methods.


<iframe width="600" height="400" src="https://www.youtube.com/embed/OZBLgKKU7IY?si=LvDteAYHj5LZG7Vp" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


---

## 신경 그래프 데이터베이스(Neural Graph Databases)

신경 그래프 데이터베이스(Neural Graph Databases)는 기존 **그래프 데이터베이스(Graph Databases, GDBs)와 그래프 신경망(Graph Neural Networks, GNNs)의 역량을 결합하여 그래프 데이터에 대한 고급 분석 및 예측 기능을 제공**합니다. 이는 두 분야의 핵심적인 장점들을 활용하는 방식으로 통합됩니다.

통합 방식은 다음과 같습니다:

*   **그래프 데이터베이스의 이해**:
    *   그래프 데이터베이스는 방대한 양의 복잡하고 풍부한 비정형 그래프 데이터셋을 저장, 처리, 분석 및 관리하는 데 사용되는 시스템입니다.
    *   대부분의 그래프 데이터베이스에서 사용되는 데이터 모델은 **레이블 속성 그래프(Labeled Property Graph, LPG)**입니다.
    *   LPG 모델에서 그래프는 정점(vertices)과 엣지(edges)로 구성되며, 이 정점과 엣지에는 **풍부한 데이터(레이블 및 속성)**가 첨부될 수 있습니다. 예를 들어, 논문을 모델링하는 정점은 제목, 저자 수, 방정식 수 등의 속성을 가질 수 있고, 컨퍼런스 논문 또는 기술 보고서와 같은 레이블을 가질 수 있습니다. LPG는 이질적인 그래프(heterogeneous graphs)나 RDF(Resource Description Framework)와 같은 다른 그래프 모델에 비해 훨씬 더 풍부하고 복잡한 데이터 모델링을 가능하게 합니다.

*   **그래프 신경망의 이해**:
    *   그래프 신경망(GNN)은 최근 기계 학습(Machine Learning, ML) 분야에서 중요한 부분으로 자리 잡았습니다.
    *   GNN은 그래프 데이터에 대한 추론 능력을 향상시키기 위해 그래프와 신경망을 결합하는 도구입니다.
    *   GNN은 입력 샘플(예: 정점)과 연결(connections)을 사용하며, 각 정점에는 특징 벡터(feature vector)가 수반됩니다.
    *   단일 GNN 계층은 일반적으로 **집계(aggregation) 단계**와 **신경망(neural) 단계**로 구성됩니다. 집계 단계에서는 정점의 이웃 특징 벡터를 결합하고(예: 합산 또는 평균), 신경망 단계에서는 이를 MLP(Multi-Layer Perceptron)와 같은 신경망을 통해 처리한 후 비선형성(non-linearity)을 적용합니다.
    *   GNN은 정점, 엣지 또는 전체 그래프에 대한 **분류(classification) 및 회귀(regression)와 같은 예측 작업**을 수행하는 데 사용될 수 있습니다.

*   **통합의 핵심 과제 및 해결책**:
    *   신경 그래프 데이터베이스의 근본적인 질문은 **LPG 기반 그래프 데이터베이스와 GNN을 어떻게 효과적으로 결합할 것인가**였습니다. 이는 GDB의 풍부한 데이터 모델과 GNN의 예측 능력을 활용하고자 하는 목표에서 비롯됩니다.
    *   주요 과제는 이 두 가지를 개념적으로 통합하는 방법을 이해하는 것이었습니다.
    *   해결책은 **GNN 워크로드를 LPG 데이터 모델의 관점에서 생각하는 것**입니다.
        *   **노드/엣지/그래프 분류**는 그래프 데이터베이스의 컨텍스트 내에서 **레이블 예측 문제**가 됩니다. 예를 들어, 새로운 정점에 대한 레이블을 예측하거나 기존 정점에 대한 추가 레이블을 예측할 수 있습니다.
        *   **GNN 회귀 작업**은 **속성 예측 문제**가 됩니다. 이는 새로운 정점이나 기존 정점에 대한 속성 또는 속성 집합을 예측하는 데 사용될 수 있습니다.
    *   이를 구현하기 위해 **LPG2vec**이라는 인코더를 도입했습니다.
        *   LPG2vec은 LPG 그래프의 모든 다른 속성과 레이블 등을 **벡터화**합니다. 문자열, 수치 속성, 다른 유형의 속성 등 다양한 유형의 데이터를 특징 벡터로 변환합니다.
        *   이 특징 벡터들은 연결(concatenate)되어 각 정점과 엣지에 할당되는 **단일의 긴 특징 벡터**를 형성합니다.
        *   이를 통해 **풍부한 LPG 그래프가 베어본(barebone) 그래프 구조와 이 모든 풍부한 정보를 인코딩하는 특징 벡터로 변환**됩니다.
        *   이 변환된 그래프는 PyG 또는 DGL과 같은 **기존 GNN 인프라에 직접 입력**될 수 있습니다. LPG2vec은 특징 벡터를 "풍부하게" 제공하여 GNN 모델 및 프레임워크와의 원활한 통합을 가능하게 합니다.

*   **통합의 장점**:
    *   **향상된 예측 정확도**: LPG 레이블과 속성을 GNN에 통합하면 예측 정확도가 일관되게 향상됩니다. 특정 노드 분류 작업에서는 LPG 레이블과 속성을 사용하지 않는 경우와 비교하여 최대 **34% 더 나은 정확도**를 달성할 수 있습니다. 이는 LPG 데이터에 포함된 풍부한 정보를 성공적으로 활용하기 때문입니다.
    *   **새로운 예측 작업**: GNN은 LPG에 적합한 **레이블 예측 및 속성 예측과 같은 새로운 예측 작업**을 수행하는 데 사용될 수 있습니다. 이는 종종 노이즈가 많은 데이터셋에서 누락된 레이블이나 속성을 찾는 **그래프 완성(graph completion) 작업**으로 이어집니다.
    *   **모델 호환성**: LPG2vec의 설계 덕분에, 이는 **거의 모든 GNN 모델(예: GCN, GAT, GIN)** 및 프레임워크와 호환됩니다.

결론적으로, 신경 그래프 데이터베이스는 LPG 데이터 모델을 통해 그래프 데이터베이스의 풍부한 정보를 GNN의 예측 능력과 연결하며, LPG2vec 인코더를 사용하여 이를 원활하게 통합하고 예측 정확도를 크게 향상시킵니다.


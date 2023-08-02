---
layout: post
title: Locally Private Graph Neural Network 
date: 2023-08-02
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Locally Private Graph Neural Network](https://www.youtube.com/watch?v=1LdC5G_p-0g)

---

# Locally Private Graph Neural Network


* Locally Private Graph Neural Networks
* [https://arxiv.org/abs/2006.05535](https://arxiv.org/abs/2006.05535)
* Presented in 2021 ACM SIGSAC Conference on Computer and Communications Security (CCS '21)

## Abstract

Graph Neural Networks (GNNs) have demonstrated superior performance in learning node representations for various graph inference tasks. However, learning over graph data can raise privacy concerns when nodes represent people or human-related variables that involve sensitive or personal information. While numerous techniques have been proposed for privacy-preserving deep learning over non-relational data, there is less work addressing the privacy issues pertained to applying deep learning algorithms on graphs. In this paper, we study the problem of node data privacy, where graph nodes have potentially sensitive data that is kept private, but they could be beneficial for a central server for training a GNN over the graph. To address this problem, we develop a privacy-preserving, architecture-agnostic GNN learning algorithm with formal privacy guarantees based on Local Differential Privacy (LDP). Specifically, we propose an LDP encoder and an unbiased rectifier, by which the server can communicate with the graph nodes to privately collect their data and approximate the GNN's first layer. To further reduce the effect of the injected noise, we propose to prepend a simple graph convolution layer, called KProp, which is based on the multi-hop aggregation of the nodes' features acting as a denoising mechanism. Finally, we propose a robust training framework, in which we benefit from KProp's denoising capability to increase the accuracy of inference in the presence of noisy labels. Extensive experiments conducted over real-world datasets demonstrate that our method can maintain a satisfying level of accuracy with low privacy loss.

---

그래프 신경망(GNNs)은 다양한 그래프 추론 작업을 위해 노드 표현 학습에서 우수한 성능을 보여주고 있습니다. 그러나 그래프 데이터를 학습하는 것은 노드가 사람이나 인간 관련 변수를 나타내는 경우, 민감하거나 개인적인 정보를 포함할 수 있어서 개인정보 보호 문제를 야기할 수 있습니다. 비관계형 데이터에 대한 개인정보 보호를 위한 다양한 기술들이 제안되었지만, 그래프에 대해 딥러닝 알고리즘을 적용하는 것과 관련된 개인정보 문제에 대한 연구는 적습니다. 이 논문에서는 그래프 노드 데이터의 개인정보 보호 문제를 연구합니다. 그래프 노드에는 개인정보가 있을 수 있지만, 중앙 서버가 그래프를 기반으로 GNN을 학습하는 데 유용할 수 있습니다. 이 문제를 해결하기 위해, 우리는 Local Differential Privacy (LDP)를 기반으로 하는 개인정보 보호, 아키텍처에 구애받지 않는 GNN 학습 알고리즘을 개발합니다. 구체적으로, 우리는 LDP 인코더와 무편향 리티파이어를 제안합니다. 이를 통해 서버는 그래프 노드와 개인정보를 비공개로 수집하고 GNN의 첫 번째 레이어를 근사할 수 있습니다. 주입된 노이즈의 효과를 더욱 줄이기 위해, 우리는 KProp이라고 하는 간단한 그래프 합성곱 레이어를 제안합니다. 이 레이어는 노드의 특징을 다중 홉 집계하여 노이즈 제거 메커니즘으로 작용합니다. 마지막으로, 노이즈가 있는 레이블이 있는 상태에서 추론 정확도를 향상시키기 위해 KProp의 노이즈 제거 능력을 활용하는 강건한 학습 프레임워크를 제안합니다. 실제 데이터셋에서 수행한 포괄적인 실험은 우리의 방법이 낮은 개인정보 손실과 만족스러운 수준의 정확도를 유지할 수 있음을 보여줍니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/1LdC5G_p-0g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


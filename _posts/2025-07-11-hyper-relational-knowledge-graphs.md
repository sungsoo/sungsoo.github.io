---
layout: post
title: Hyper-Relational Knowledge Graphs
date: 2025-07-11
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# Hyper-Relational Knowledge Graphs 

Hyper-Relational Knowledge Graphs (HKGs)는 전통적인 지식 그래프(knowledge graphs)를 넘어, 단순한 엔티티-관계-엔티티 삼중구조(triplets)뿐만 아니라 추가적인 qualifier(예: 속성-값 쌍)를 포함하여 더 복잡하고 세밀한 실세계 지식을 표현할 수 있는 구조를 가집니다. HKGs는 다양한 응용 분야에서 중요한 역할을 하며, 최근 연구는 이러한 구조를 효과적으로 모델링하고 활용하는 데 초점을 맞추고 있습니다. 아래에서는 2025년 기준으로 HKGs에 대한 최신 국내외 연구동향을 상세히 정리하였습니다.

## 국제적 연구동향

### 1. 대표적 연구 주제와 방법론

#### 표현 학습 (Representation Learning)
HKGs의 표현 학습은 복잡한 관계와 qualifier를 효과적으로 모델링하는 데 초점을 맞추고 있습니다. 주요 연구는 다음과 같습니다:
- **HyNT 프레임워크**: "Representation Learning on Hyper-Relational and Numeric Knowledge Graphs with Transformers" ([arXiv:2305.18256](https://arxiv.org/abs/2305.18256))에서는 숫자형 리터럴(numeric literals)을 포함한 HKGs의 표현 학습을 위해 context transformer와 prediction transformer를 활용한 HyNT 프레임워크를 제안하였습니다. 이 프레임워크는 삼중구조와 qualifier 간의 상관관계뿐만 아니라 숫자 정보를 효과적으로 학습합니다.
- **다중 집계기 활용**: "Learning Representations for Hyper-Relational Knowledge Graphs" ([arXiv:2208.14322](https://arxiv.org/abs/2208.14322))에서는 base triple과 qualifier의 관점에서 각각 표현을 학습하는 다중 집계기(multiple aggregators)를 제안하여 qualifier 표현의 최적화를 도모하였습니다.

#### 완성 및 예측 (Completion and Prediction)
HKGs의 완성은 결측된 링크나 삼중구조를 예측하는 것을 목표로 합니다. 주요 연구는 다음과 같습니다:
- **STARE 개선**: "Improving Hyper-Relational Knowledge Graph Completion" ([arXiv:2104.08167](https://arxiv.org/abs/2104.08167))에서는 기존 STARE 방법을 개선하여 계산 비용이 높은 그래프 신경망을 가벼운 임베딩 기법으로 대체하고, qualifier 중심의 보조 학습 과제를 추가하여 예측 성능을 향상시켰습니다.
- **HyperFormer**: "HyperFormer: Enhancing Entity and Relation Interaction for Hyper-Relational Knowledge Graph Completion" ([ACM SIGKDD 2023](https://dl.acm.org/doi/10.1145/3583780.3614922))에서는 로컬 수준의 시퀀스 정보를 활용하여 엔티티와 관계의 상호작용을 강화한 HyperFormer 모델을 제안하였습니다.
- **StarE**: "Message Passing for Hyper-Relational Knowledge Graphs" ([EMNLP 2020](https://aclanthology.org/2020.emnlp-main.596/))에서는 메시지 패싱 기반의 StarE 인코더를 제안하여 임의의 qualifier를 처리할 수 있는 모델을 개발하였으며, 새로운 데이터셋 WD50K를 도입하였습니다.

#### 임베딩 기법 (Embedding Techniques)
HKGs의 복잡한 구조를 반영하기 위해 다양한 임베딩 기법이 제안되고 있습니다:
- **TransHR**: "Knowledge graph embedding for hyper-relational data" ([ResearchGate, 2020](https://www.researchgate.net/publication/316253391_Knowledge_graph_embedding_for_hyper-relational_data))에서는 hyper-relational 데이터를 개별 벡터로 변환하여 표현하는 TransHR 모델을 제안하였습니다.
- **다양한 임베딩 접근법**: TransE, ComplEx, R-GCN, Graph Transformers 등 기존 임베딩 기법을 확장하여 HKGs의 n-ary 관계와 qualifier를 처리하는 연구가 진행 중입니다 ([Medium, 2025](https://medium.com/@adnanmasood/the-knowledge-graph-advantage-how-smart-companies-are-using-knowledge-graphs-to-power-ai-and-drive-59f285602683)).

#### 대규모 언어 모델 (LLMs) 활용
최근에는 대규모 언어 모델(LLMs)을 HKGs 구성에 활용하는 연구가 활발합니다:
- **GPT-3.5 기반 추출**: "Construction of Hyper-Relational Knowledge Graphs Using Pre-Trained Large Language Models" ([arXiv:2403.11786](https://arxiv.org/abs/2403.11786))에서는 OpenAI의 GPT-3.5를 활용하여 텍스트에서 hyper-relational 지식을 추출하는 zero-shot prompt-based 방법을 제안하였습니다. 이 방법은 0.77의 재현율(recall)을 달성하며 유망한 결과를 보였으나, 정밀도(precision) 향상이 과제로 남아 있습니다.

### 2. 응용 분야
HKGs는 다양한 응용 분야에서 활용되고 있습니다:
- **위치 기반 추천 시스템**: "Hyper-relational knowledge graph neural network for next POI recommendation" ([World Wide Web, 2024](https://link.springer.com/article/10.1007/s11280-024-01279-y))에서는 HKGs를 활용하여 위치 기반 소셜 네트워크(LBSN)에서 다음 POI(Point of Interest)를 추천하는 HKGNN 모델을 제안하였습니다.
- **질의 응답 및 추론**: HKGs는 질의 응답 시스템에서 복잡한 질의를 처리하는 데 사용되며, 특히 다중 홉 추론(multi-hop reasoning)을 지원합니다 ([ResearchGate, 2023](https://www.researchgate.net/publication/352428684_Query_Embedding_on_Hyper-relational_Knowledge_Graphs)).
- **과학적 발견**: HKGs는 생물의학, 지질학, 법률 등 도메인별 지식 그래프 구축에 활용되어 과학적 가설 생성을 지원합니다 ([Medium, 2025](https://medium.com/@adnanmasood/the-knowledge-graph-advantage-how-smart-companies-are-using-knowledge-graphs-to-power-ai-and-drive-59f285602683)).

### 3. 2025년 최신 동향
2025년에는 HKGs 연구가 다음과 같은 방향으로 발전하고 있습니다:
- **KG-LLM 통합**: 지식 그래프와 LLM의 상호 보완적 시스템이 주목받고 있습니다. Retrieval-Augmented Generation(RAG)을 통해 LLM의 hallucination을 줄이고, LLM을 활용한 자동화된 KG 구성 방법이 연구되고 있습니다 ([Medium, 2025](https://medium.com/@adnanmasood/the-knowledge-graph-advantage-how-smart-companies-are-using-knowledge-graphs-to-power-ai-and-drive-59f285602683)).
- **고급 추론 및 추론**: HKGs는 단순 삼중구조를 넘어 n-ary fact와 qualifier를 처리하기 위해 SPARQL-Star, SHACL 등의 기술이 발전하고 있습니다. 또한, 시간적, 확률적, 인과적 추론을 지원하는 방향으로 연구가 진행 중입니다.
- **다모달 데이터 통합**: 이미지, 오디오, 비디오 등 다양한 데이터 유형을 HKGs에 통합하여 AI의 이해를 깊게 하는 연구가 진행되고 있습니다.
- **개인화 및 연합 KG**: 사용자 선호도를 반영한 개인화된 KG와 대규모 KG와의 연합(federated) 구조가 연구되고 있습니다.
- **연구 프론티어**: 자가 치유(self-healing) KG, LLM+KG 시스템 평가, LLM의 KG 기반 grounding, 윤리적 프레임워크, 과학적 발견을 위한 KG 등이 주요 연구 주제입니다.

| **연구 주제** | **설명** | **대표 논문/출처** |
|---------------|----------|---------------------|
| 표현 학습 | Transformer 기반 모델로 qualifier와 숫자형 데이터를 포함한 표현 학습 | [arXiv:2305.18256](https://arxiv.org/abs/2305.18256) |
| 완성 및 예측 | 결측 링크 예측을 위한 HyperFormer, StarE 모델 | [ACM SIGKDD 2023](https://dl.acm.org/doi/10.1145/3583780.3614922), [EMNLP 2020](https://aclanthology.org/2020.emnlp-main.596/) |
| 임베딩 기법 | TransHR, TransE, ComplEx 등으로 n-ary 관계 처리 | [ResearchGate, 2020](https://www.researchgate.net/publication/316253391_Knowledge_graph_embedding_for_hyper-relational_data) |
| LLM 활용 | GPT-3.5로 hyper-relational 지식 추출 | [arXiv:2403.11786](https://arxiv.org/abs/2403.11786) |
| 응용 분야 | POI 추천, 질의 응답, 과학적 발견 | [World Wide Web, 2024](https://link.springer.com/article/10.1007/s11280-024-01279-y) |

## 국내 연구동향

한국에서는 HKGs에 대한 직접적인 연구는 제한적이지만, 지식 그래프와 그래프 기반 AI 연구가 활발히 진행되고 있으며, 이는 HKGs 연구로 확장될 가능성이 높습니다.

### 1. 주요 연구자 및 기관
- **U Kang (강유)**: 서울대학교 데이터과학연구실(DATALAB)을 이끌며 대규모 그래프 마이닝 연구를 진행하고 있습니다. PEGASUS(Peta-Scale Graph Mining System)와 같은 도구를 개발하였으며, 이는 지식 그래프 연구와 연관될 수 있습니다 ([SNU DATALAB](https://datalab.snu.ac.kr/~ukang/)).
- **Chanyoung Park (박찬영)**: KAIST에서 추천 시스템과 그래프 기반 머신러닝을 연구하고 있습니다. 그의 연구는 지식 그래프를 기반으로 한 추천 시스템 개발과 관련이 있을 수 있습니다 ([KAIST DSAIL](https://dsail.kaist.ac.kr/professor/)).
- **Chanyoung Chung (정찬영)**: "Representation Learning on Hyper-Relational and Numeric Knowledge Graphs with Transformers" ([arXiv:2305.18256](https://arxiv.org/abs/2305.18256)) 논문의 저자로, 한국인 연구자로 보이며 HKGs 연구에 직접 기여하고 있습니다.

### 2. 국내에서 진행된 관련 연구
- **공공 데이터 기반 지식 그래프**: "An Approach to Constructing a Knowledge Graph Based on Korean Open-Government Data" ([MDPI, 2019](https://www.mdpi.com/2076-3417/9/19/4095))에서는 한국의 공공 데이터를 활용한 지식 그래프 구축 방법을 제안하였습니다. 이는 HKGs로 확Jang될 잠재력을 가집니다.
- **국제 컨퍼런스 참여**: 2022년 경주에서 열린 "29th International Conference on Computational Linguistics (COLING)"에서는 "Data Augmentation for Few-Shot Knowledge Graph Completion from Hierarchical Perspective" ([ACL Anthology, 2022](https://aclanthology.org/2022.coling-1.220/))와 같은 지식 그래프 완성 관련 연구가 발표되었습니다. 이는 한국이 국제적 지식 그래프 연구의 일부를 담당하고 있음을 보여줍니다.

### 3. 한국의 연구 기여
- 한국의 연구자들은 국제적 컨퍼런스와 저널에 지식 그래프 관련 연구를 발표하고 있으며, 특히 대규모 데이터 처리와 그래프 기반 머신러닝 분야에서 두각을 나타내고 있습니다. HKGs는 이러한 연구의 자연스러운 연장선상에 있습니다.
- 한국은 AI와 데이터 과학 분야에서 글로벌 리더로서의 역할을 하고 있으며, 이는 HKGs 연구에서도 기여할 것으로 기대됩니다.

| **연구자/기관** | **연구 분야** | **대표 업적/출처** |
|-----------------|---------------|---------------------|
| U Kang (서울대학교) | 대규모 그래프 마이닝 | PEGASUS 개발 ([SNU DATALAB](https://datalab.snu.ac.kr/~ukang/)) |
| Chanyoung Park (KAIST) | 추천 시스템, 그래프 기반 ML | 추천 시스템 연구 ([KAIST DSAIL](https://dsail.kaist.ac.kr/professor/)) |
| Chanyoung Chung | HKGs 표현 학습 | [arXiv:2305.18256](https://arxiv.org/abs/2305.18256) |
| 한국 공공 데이터 | 지식 그래프 구축 | [MDPI, 2019](https://www.mdpi.com/2076-3417/9/19/4095) |

## 종합적 분석
- **국제적 트렌드**: HKGs는 표현 학습, 완성, 임베딩, 그리고 LLM 통합 등에서 빠르게 발전하고 있습니다. 2025년에는 KG와 LLM의 상호 보완적 시스템, 고급 추론 능력, 다모달 데이터 통합 등이 주요 연구 방향입니다.
- **국내 트렌드**: 한국에서는 HKGs에 대한 직접적인 연구보다는 일반적인 지식 그래프와 그래프 기반 AI 연구가 활발합니다. 그러나 연구자들(예: U Kang, Chanyoung Park, Chanyoung Chung)의 활동과 국제 컨퍼런스 참여를 통해 HKGs 연구에 기여하고 있으며, 향후 더 많은 연구가 진행될 가능성이 높습니다.

## 참고 문헌
- "Representation Learning on Hyper-Relational and Numeric Knowledge Graphs with Transformers" ([arXiv:2305.18256](https://arxiv.org/abs/2305.18256))
- "Improving Hyper-Relational Knowledge Graph Completion" ([arXiv:2104.08167](https://arxiv.org/abs/2104.08167))
- "Construction of Hyper-Relational Knowledge Graphs Using Pre-Trained Large Language Models" ([arXiv:2403.11786](https://arxiv.org/abs/2403.11786))
- "HyperFormer: Enhancing Entity and Relation Interaction for Hyper-Relational Knowledge Graph Completion" ([ACM SIGKDD 2023](https://dl.acm.org/doi/10.1145/3583780.3614922))
- "The Knowledge Graph Advantage: How Smart Companies Are Using Knowledge Graphs to Power AI and Drive Real-World Results" ([Medium, 2025](https://medium.com/@adnanmasood/the-knowledge-graph-advantage-how-smart-companies-are-using-knowledge-graphs-to-power-ai-and-drive-59f285602683))
- "An Approach to Constructing a Knowledge Graph Based on Korean Open-Government Data" ([MDPI, 2019](https://www.mdpi.com/2076-3417/9/19/4095))
- "Data Augmentation for Few-Shot Knowledge Graph Completion from Hierarchical Perspective" ([ACL Anthology, 2022](https://aclanthology.org/2022.coling-1.220/))
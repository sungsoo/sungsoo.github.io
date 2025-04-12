---
layout: post
title: Boosting Relational Deep Learning with Pretrained Tabular Models 
date: 2025-04-19
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Boosting Relational Deep Learning with Pretrained Tabular Models](https://www.youtube.com/watch?v=DS_0-7XIc5s)

---


# [Boosting Relational Deep Learning with Pretrained Tabular Models](https://www.youtube.com/watch?v=DS_0-7XIc5s)

* Temporal Graph Learning Reading Group
* Paper: "Boosting Relational Deep Learning with Pretrained Tabular Models"
* Speaker: Veronica Lachi
* Date: Apr. 10, 2025

<iframe width="600" height="400" src="https://www.youtube.com/embed/DS_0-7XIc5s?si=5tFnJygharcF0Hum" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Graph representation learning을 relational databases에 적용하는 접근법은 관계형 데이터의 구조와 의미를 그래프 형태로 변환하고 이를 기반으로 머신러닝 모델을 효율적으로 학습시키는 것을 목표로 한다. 관계형 데이터베이스의 테이블, 컬럼, 외래 키(foreign key) 관계를 그래프 구조로 매핑하여 노드(node)와 엣지(edge)로 표현하는 것이 핵심 시작점이다. 예를 들어, 테이블의 각 행(row)을 노드로, 외래 키 연결을 엣지로 정의하고, 컬럼 값을 노드의 속성(attribute)으로 부여한다. 이 과정에서 그래프는 이종(heterogeneous) 특성을 가지며, 노드/엣지 유형(type)과 다중 관계(multi-relational)를 명시적으로 모델링해야 한다.

주요 기법으로는 **이종 그래프 신경망(Heterogeneous Graph Neural Networks, HGNN)**이 활용된다. HGNN은 메타 경로(meta-path)를 기반으로 노드 임베딩을 학습하거나, 관계별 메시지 전달(relation-specific message passing)을 통해 다양한 유형의 엣지 정보를 통합한다. 예를 들어, CompGCN은 엣지 유형을 임베딩 공간에 투영하여 관계의 방향성과 유형을 동시에 반영한다. 또한, 그래프의 규모 확장성을 위해 **서브그래프 샘플링(subgraph sampling)**이나 엣지/노드 단위의 미니배치 처리가 적용되며, 특히 GraphSAME의 이웃 샘플링 전략이 대용량 데이터베이스에 적합하다.

관계형 데이터베이스의 스키마(schema) 정보는 그래프 모델링에 중요한 컨텍스트로 작용한다. **스키마 인식 임베딩(schema-aware embedding)** 기법은 테이블 간 계층 구조나 제약 조건(constraints)을 그래프의 속성이나 엣지 가중치로 인코딩한다. 이를 통해 "일대다(one-to-many)" 또는 "다대다(many-to-many)" 관계의 의미적 차이를 모델에 반영할 수 있다. 예를 들어, Neo4j의 속성 그래프 모델을 확장하여 데이터베이스 스키마를 그래프 메타데이터로 통합하는 접근이 있다.

효율적인 학습을 위해 **구조적 특징 추출**과 **임베딩 기반 쿼리 최적화**가 결합된다. JOIN 연산의 비용을 예측하기 위해 엔티티 임베딩 간 유사도를 활용하거나, 그래프 탐색 기반의 인덱싱으로 쿼리 실행 계획을 개선한다. AutoML 기법과 통합하여 임베딩 차원 수나 GNN 레이어 깊이를 자동 조정하는 하이브리드 방식도 연구된다. 예를 들어, Google의 ML4DB 프로젝트는 GNN을 사용하여 SQL 쿼리 실행 시간을 예측하고 최적의 인덱싱 전략을 추천한다.

실제 적용 시 **증분 학습(incremental learning)**과 **온라인 임베딩 업데이트**가 필수적이다. 데이터베이스의 동적 갱신(insert/update/delete)에 따라 그래프 구조가 변경될 때 전체 재학습을 피하기 위해 TGN(Temporal Graph Networks) 같은 시계열 그래프 모델이 활용된다. Amazon Aurora나 Microsoft SQL Server는 변경 로그(log)를 스트리밍하여 실시간 임베딩 보정을 수행하는 아키텍처를 실험 중이다.

성능 평가 측면에서는 기존 관계형 머신러닝 작업(예: JOIN 결과 예측, 결측값 대체)과 그래프 기반 예측 정확도를 비교한다. 특히, 복잡한 다중 홉(multi-hop) 질의를 그래프 탐색으로 대체할 때의 latency-정확도 트레이드오프를 분석해야 한다. 벤치마크로는 Spider Text-to-SQL 데이터셋이나 TPC-H를 그래프 형식으로 변환한 데이터가 사용된다.
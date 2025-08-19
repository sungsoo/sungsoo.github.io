---
layout: post
title: Building Hyper-Relational Knowledge Graphs
date: 2025-08-19
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

# Building Hyper-Relational Knowledge Graphs


Hyper-relational knowledge graphs (HKGs) incorporate qualifiers (e.g., time, location, or additional attributes) to relations, making them suitable for capturing complex interactions in dialogues like scam calls. While direct papers on constructing HKGs specifically from Korean voice phishing transcripts are limited, recent research focuses on HKG extraction from text/dialogues (applicable to transcripts) and scam call analysis (including Korean datasets). Below, I detail key recent papers (2022–2025) that are related, including methods for HKG construction from text, KG preprocessing in scam detection, and Korean voice phishing datasets/analysis. These can be integrated for the queried task, e.g., using multilingual models like GPT for Korean text. Explanations are provided in English and Korean.

## 1. Construction of Hyper-Relational Knowledge Graphs Using Pre-Trained Language Models (2024, arXiv)
**English Explanation:**  
This paper proposes a zero-shot prompt-based method using GPT-3.5 to extract hyper-relational facts from unstructured text, constructing HKGs without labeled data. The approach uses Chain-of-Thought (CoT) prompting with ontology integration to identify entities, relations, and qualifiers (e.g., "end time: 1991"). It's applicable to dialogues/transcripts by processing sequential text, enabling capture of nuanced scam tactics like temporal qualifiers in phishing calls (e.g., "urgent action by tomorrow"). Contributions include reducing training needs and high recall (0.77 via BERTScore) on the HyperRED dataset (39,840 samples from Wikipedia). Experiments compare to CubeRE, showing reproducibility improvements with GPT-4. For Korean voice phishing, multilingual LLMs could adapt prompts to Korean transcripts for extracting fraud-related hyper-relations like scammer-victim interactions with qualifiers (e.g., "method: fake bank transfer").

**한국어 설명:**  
이 논문은 GPT-3.5를 사용한 제로-샷 프롬프트 기반 방법을 제안하여 비구조화된 텍스트에서 하이퍼-관계 사실을 추출하고 HKG를 구축합니다. CoT 프롬프팅과 온톨로지 통합을 사용하여 엔티티, 관계, 한정자(예: "end time: 1991")를 식별합니다. 대화/전사본에 적용 가능하며, 순차 텍스트를 처리하여 피싱 통화의 시간 한정자(예: "내일까지 긴급 조치") 같은 미묘한 사기 전술을 포착합니다. 기여점으로는 훈련 데이터 불필요와 HyperRED 데이터셋(위키피디아 39,840 샘플)에서 높은 재현율(0.77, BERTScore 기준)이며, CubeRE와 비교 실험에서 GPT-4로 재현성 향상을 보여줍니다. 한국어 보이스피싱에 대해, 다국어 LLM으로 프롬프트를 한국어 전사본에 적응시켜 사기 관련 하이퍼-관계(예: "방법: 가짜 은행 이체")를 추출할 수 있습니다.

## 2. A Dataset for Hyper-Relational Extraction and a Cube-Filling Approach (2022, EMNLP)
**English Explanation:**  
This work introduces the HyperRED dataset and CubeRE model for hyper-relational extraction, building HKGs from text by jointly identifying triplets (head-relation-tail) and qualifiers (e.g., time, quantity). HyperRED has 44,840 sentences from Wikipedia/Wikidata, with 62 relations and 44 qualifiers across domains like politics. CubeRE extends table-filling to cube-filling using BERT encoding and cube-pruning for efficiency, outperforming pipelines (higher F1). Applicable to transcripts by treating dialogue sentences as input for extracting hyper-facts, e.g., in fraud detection for qualifier-enriched relations like "scammer requests money [amount: 1,000,000 KRW]". No direct fraud mention, but relevant for scam transcripts. Contributions: First large-scale hyper-relational dataset; code at github.com/declare-lab/HyperRED.

**한국어 설명:**  
이 연구는 HyperRED 데이터셋과 CubeRE 모델을 소개하여 텍스트에서 하이퍼-관계 추출을 통해 HKG를 구축합니다. 트리플(헤드-관계-테일)과 한정자(예: 시간, 수량)를 공동 식별하며, HyperRED는 위키피디아/위키데이터 44,840 문장으로 62 관계와 44 한정자를 포함합니다. CubeRE는 BERT 인코딩과 큐브-프루닝으로 테이블-필링을 큐브-필링으로 확장, 파이프라인보다 높은 F1 성능을 보입니다. 전사본에 적용하여 대화 문장을 입력으로 사용, 사기 탐지에서 "사기범 돈 요구 [금액: 1,000,000 KRW]" 같은 한정자 풍부 관계 추출 가능. 사기 직접 언급 없으나 사기 전사본에 관련. 기여점: 최초 대규모 하이퍼-관계 데이터셋; 코드 github.com/declare-lab/HyperRED.

## 3. Text2NKG: Fine-Grained N-ary Relation Extraction for N-ary Relational Knowledge Graph Construction (2024, NeurIPS)
**English Explanation:**  
Text2NKG is a framework for extracting fine-grained n-ary relations (hyper-relational) from text to build N-ary KGs (NKGs), handling complex multi-entity relations. It uses a multi-stage process: entity detection, relation clustering, and n-ary fact generation, with LLMs for zero/few-shot extraction. Applicable to dialogues/transcripts for capturing multi-party scam interactions (e.g., scammer-victim-bank with qualifiers like "urgency: high"). Contributions: Outperforms baselines in precision/recall on custom datasets; focuses on scalability for real-world text. For Korean voice phishing, it could process multilingual transcripts to build fraud-specific NKGs, though no fraud mention.

**한국어 설명:**  
Text2NKG는 텍스트에서 세밀한 n-ary 관계(하이퍼-관계)를 추출하여 N-ary KG(NKG)를 구축하는 프레임워크로, 복잡한 다중 엔티티 관계를 처리합니다. 다단계 프로세스: 엔티티 탐지, 관계 클러스터링, n-ary 사실 생성, LLM으로 제로/퓨-샷 추출. 대화/전사본에 적용하여 다자간 사기 상호작용(예: 사기범-피해자-은행, "긴급성: 높음" 한정자) 포착 가능. 기여점: 커스텀 데이터셋에서 베이스라인보다 정밀도/재현율 우수; 실세계 텍스트 확장성 강조. 한국어 보이스피싱에 다국어 전사본 처리로 사기 특화 NKG 구축 가능, 사기 언급 없음.

## 4. Classifying Scam Calls Through Content Analysis With Dynamic Sparsity Top-k Attention Regularization (2025, IEEE Access)
**English Explanation:**  
This paper develops D-STAR, a transformer model for scam call classification, using KG-based preprocessing on 800 transcripts (400 scam/non-scam). The KG is manually curated from scam reports/social media, hierarchically linking scam types to keywords/behaviors (e.g., phishing to "spoofed links"). Updated periodically for new tactics. Not hyper-relational, but enriches context for detection (94% accuracy). Relevant to building KGs from transcripts for fraud analysis; could extend to hyper-relational by adding qualifiers. No Korean mention, but applicable to Korean datasets like KorCCVi.

**한국어 설명:**  
이 논문은 D-STAR 트랜스포머 모델을 개발하여 사기 통화 분류, 800 전사본(사기/비사기 400씩)에서 KG 기반 전처리 사용. KG는 사기 보고/소셜 미디어에서 수동 큐레이션, 사기 유형을 키워드/행동에 계층 연결(예: 피싱 "스푸핑 링크"). 신규 전술로 주기 업데이트. 하이퍼-관계 아님, 그러나 탐지 맥락 풍부(94% 정확도). 전사본에서 KG 구축 관련; 한정자 추가로 하이퍼-관계 확장 가능. 한국어 언급 없으나 KorCCVi 같은 한국어 데이터셋에 적용 가능.

## 5. An Analysis of Scam Baiting Calls: Identifying and Extracting Scam Tactics (2023, arXiv)
**English Explanation:**  
This study analyzes 341 scam call transcripts (90 hours) from YouTube, using topic modeling, emotion recognition, and HMMs to extract tactics/stages (e.g., intimidation via fake evidence). No explicit KG, but structured extraction (scam types, sequences) could inform HKG building, e.g., hyper-relations like "threat [evidence: fake car accident]". Achieves 92-98% early prediction accuracy. Relevant for voice phishing transcripts; no Korean, but methods adaptable.

**한국어 설명:**  
이 연구는 YouTube 341 사기 통화 전사본(90시간) 분석, 토픽 모델링, 감정 인식, HMM으로 전술/단계 추출(예: 가짜 증거 위협). 명시 KG 없으나 구조화 추출(사기 유형, 시퀀스)로 HKG 구축 정보 제공, 예: "위협 [증거: 가짜 차 사고]". 초기 예측 정확도 92-98%. 보이스피싱 전사본 관련; 한국어 아님, 그러나 방법 적응 가능.

## 6. Attention-Based 1D CNN-BiLSTM Hybrid Model Enhanced with FastText Word Embedding for Korean Voice Phishing Detection (2023, Mathematics)
**English Explanation:**  
Focuses on detecting Korean voice phishing using a hybrid CNN-BiLSTM model on real scam transcripts (vishing samples) and benign conversations. No KG construction, but provides Korean datasets for potential HKG building (e.g., extracting relations from transcripts). Achieves high accuracy; relevant as a foundation for applying HKG methods to Korean fraud data.

**한국어 설명:**  
한국어 보이스피싱 탐지를 위한 하이브리드 CNN-BiLSTM 모델, 실제 사기 전사본(비싱 샘플)과 정상 대화 사용. KG 구축 없으나 한국어 데이터셋 제공으로 HKG 구축 기반(예: 전사본 관계 추출). 높은 정확도 달성; 한국어 사기 데이터에 HKG 방법 적용 기반.

These papers bridge HKG extraction techniques with scam transcript analysis, offering pathways for Korean voice phishing applications via multilingual adaptations.

**Citations:**
- https://arxiv.org/abs/2403.11786
- https://aclanthology.org/2022.emnlp-main.688
- https://neurips.cc/virtual/2024/poster/94929
- https://ieeexplore.ieee.org/document/11050370
- https://arxiv.org/abs/2307.01965
- https://www.mdpi.com/2227-7390/11/14/3217
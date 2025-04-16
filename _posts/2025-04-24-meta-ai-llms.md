---
layout: post
title: Metas AI Boss Says He DONE With LLMS... 
date: 2025-04-24
categories: [artificial intelligence]
tags: [artificial general intelligence]

---

### Article Source


* [Metas AI Boss Says He DONE With LLMS...](https://www.youtube.com/watch?v=p1QXZHV4jkM)

---


# [Metas AI Boss Says He DONE With LLMS...](https://www.youtube.com/watch?v=p1QXZHV4jkM)

<iframe width="600" height="400" src="https://www.youtube.com/embed/p1QXZHV4jkM?si=EpyDTxv_Rxu_R9C4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## World Foundation Model

World Foundation Model(WFM)은 특정 작업이나 도메인에 특화되지 않고, **다양한 종류의 데이터와 작업을 이해하고 수행할 수 있도록 설계된 범용적인 인공지능 모델**을 의미한다. 마치 인간의 기본적인 지능처럼, 텍스트, 이미지, 오디오, 비디오 등 여러 형태의 정보를 학습하여 광범위한 task에 적용될 수 있는 잠재력을 가진다.

**핵심 아이디어**는 방대한 양의 비정형 데이터를 사전 학습하여 얻은 일반적인 지식과 능력을 바탕으로, 새로운 특정 작업에 대해 적은 양의 데이터만으로도 빠르게 적응하고 뛰어난 성능을 보이는 것이다. 이는 기존의 task별 개별 모델 개발 방식에 비해 효율성과 확장성 면에서 큰 장점을 가진다.

### 주요 구성 요소 기술

WFM을 구현하기 위해서는 다음과 같은 핵심 구성 요소 기술들이 필요하다.

**1. 대규모 데이터 학습 (Large-scale Data Training):**

* **개념:** 다양한 양식(multimodal)과 방대한 양의 데이터를 모델이 학습하는 과정이다. 텍스트, 이미지, 오디오, 비디오, 센서 데이터 등 이질적인 데이터를 통합적으로 학습하여 세상에 대한 폭넓은 이해를 가능하게 한다.
* **예시:**
    * **텍스트:** 위키피디아, 뉴스 기사, 책, 웹 문서 등 다양한 텍스트 데이터를 학습하여 언어 이해 능력, 상식, 지식 등을 습득한다.
    * **이미지:** ImageNet, COCO와 같은 대규모 이미지 데이터셋과 텍스트 설명을 함께 학습하여 시각적 개념 이해 및 이미지-텍스트 간 연관성을 학습한다.
    * **오디오:** LibriSpeech와 같은 음성 데이터셋과 텍스트를 함께 학습하여 음성 인식, 음성 합성, 음성 의미 이해 능력을 키운다.
    * **비디오:** Kinetics와 같은 비디오 데이터셋과 텍스트 설명을 함께 학습하여 시간적 흐름에 따른 시각적 정보 이해 및 이벤트 인식 능력을 학습한다.

**2. 트랜스포머 (Transformer) 아키텍처:**

* **개념:** 자연어 처리 분야에서 혁신적인 성능을 보인 self-attention 메커니즘 기반의 신경망 구조이다. 문맥 속에서 단어 간의 관계를 파악하는 능력이 뛰어나 텍스트뿐만 아니라 이미지, 오디오 등 다양한 형태의 데이터 처리에도 효과적으로 확장되고 있다.
* **예시:**
    * **텍스트 처리:** 문장 내 단어들의 중요도를 파악하여 의미를 정확하게 이해하고, 번역, 텍스트 생성, 질의응답 등의 task에서 높은 성능을 보인다 (예: GPT 시리즈, BERT).
    * **이미지 처리:** 이미지를 작은 패치(patch)로 나누어 각 패치 간의 관계를 self-attention으로 모델링하여 이미지 분류, 객체 탐지, 이미지 생성 등에서 뛰어난 성능을 보인다 (예: Vision Transformer - ViT).
    * **오디오 처리:** 오디오 데이터를 시간 순서에 따라 처리하고, 각 시간대별 특징 간의 관계를 모델링하여 음성 인식, 화자 인식 등에서 활용된다.

**3. 자기 지도 학습 (Self-Supervised Learning):**

* **개념:** 명시적인 레이블(정답) 없이 모델 스스로 데이터 내에서 패턴이나 관계를 학습하는 방법이다. 방대한 비정형 데이터에서 유용한 표현(representation)을 효과적으로 학습할 수 있도록 한다.
* **예시:**
    * **마스크 언어 모델링 (Masked Language Modeling):** 텍스트의 일부 단어를 가리고(masking), 가려진 단어를 예측하도록 학습한다 (예: BERT의 pre-training). 이를 통해 문맥 이해 능력을 향상시킨다.
    * **이미지 패치 예측 (Image Patch Prediction):** 이미지의 일부 패치를 가리고, 주변 패치 정보를 이용하여 가려진 패치를 예측하도록 학습한다 (예: iGPT). 이를 통해 이미지의 시각적 구조를 이해하는 능력을 키운다.
    * **대조 학습 (Contrastive Learning):** 유사한 데이터 샘플은 가깝게, 다른 데이터 샘플은 멀리 임베딩하도록 학습한다. 이를 통해 데이터의 핵심 특징을 효과적으로 추출할 수 있다 (예: SimCLR, CLIP).

**4. 프롬프트 엔지니어링 (Prompt Engineering):**

* **개념:** WFM에게 원하는 작업을 효과적으로 수행하도록 지시하는 자연어 또는 시각적 입력(프롬프트)을 설계하는 기술이다. 잘 설계된 프롬프트는 모델의 잠재력을 최대한으로 끌어낼 수 있다.
* **예시:**
    * **텍스트 생성:** "프랑스 혁명에 대해 3문장으로 요약해 줘."와 같은 구체적인 지시를 통해 원하는 형식과 내용의 텍스트를 생성하도록 유도한다.
    * **이미지 생성:** "푸른 눈을 가진 검은 고양이 그림을 그려줘."와 같은 설명을 통해 원하는 이미지를 생성하도록 지시한다 (예: DALL-E, Stable Diffusion).
    * **질의응답:** "에펠탑이 건설된 연도는 언제인가?"와 같은 질문을 통해 모델이 가지고 있는 지식에서 정확한 답변을 얻어낸다.

**5. 파인튜닝 (Fine-tuning):**

* **개념:** 사전 학습된 WFM을 특정 작업이나 도메인에 맞춰 추가적으로 학습시키는 과정이다. 적은 양의 레이블된 데이터만으로도 높은 성능을 달성할 수 있도록 한다.
* **예시:**
    * 감성 분석: 사전 학습된 텍스트 기반 WFM을 영화 리뷰 데이터셋으로 파인튜닝하여 긍정 또는 부정 감성을 분류하는 모델을 개발한다.
    * 객체 인식: 사전 학습된 이미지 기반 WFM을 특정 물체(예: 자동차, 보행자)가 포함된 데이터셋으로 파인튜닝하여 해당 물체를 정확하게 인식하고 위치를 파악하는 모델을 개발한다.

이러한 핵심 기술들의 발전과 융합을 통해 WFM은 다양한 분야에서 혁신적인 가능성을 제시하고 있으며, 앞으로 더욱 강력하고 범용적인 인공지능 시스템으로 발전해 나갈 것으로 기대된다.

## Frontiers of AI and Computing: A Conversation With Yann LeCun and Bill Dally

<iframe width="600" height="400" src="https://www.youtube.com/embed/eyrDM3A_YFc?si=0kg7vNM8Ewe4O-fj" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
---
layout: post
title: Prompt Engineering
date: 2023-08-22
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source

* [Prompt engineering](https://en.wikipedia.org/wiki/Prompt_engineering)

---

# Prompt Engineering

프롬프트 엔지니어링은 주로 텍스트 대 텍스트 모델과의 의사소통에서 사용되며, 생성형 AI 모델이 해석하고 이해할 수 있는 텍스트를 구조화하는 과정이다.
프롬프트 엔지니어링은 컨텍스트 내 학습 (in-context learning)에 의해 가능하며, 이는 모델이 프롬프트에서 임시로 학습할 수 있는 능력으로 정의된다. 
컨텍스트 내 학습 능력은 대형 언어 모델의 신흥 능력(emergent ability) 중 하나다.

프롬프트는 AI가 수행해야 할 작업을 설명하는 자연어 텍스트다.
텍스트 대 텍스트 모델의 프롬프트는 "페르마의 소정리란 무엇인가요?"와 같은 질문, "낙엽이 떨어지는 시를 써보세요"와 같은 명령, 피드백의 짧은 문장 ("너무 길어요", "너무 공식적이에요", "다시 다시 말해보세요", "이 단어를 생략하세요") 또는 컨텍스트, 지침 및 입력 데이터를 포함하는 긴 문장일 수 있다. 프롬프트 엔지니어링은 질문을 작성하거나 스타일을 지정하거나 관련된 컨텍스트를 제공하거나 AI에게 역할을 할당하는 등의 과정을 포함할 수 있다. 
프롬프트 엔지니어링은 모델이 학습할 몇 가지 예제를 포함하는 단일 프롬프트로 구성될 수도 있다. 
이런 접근법을 몇 개의 예시를 포함한 단일 프롬프트에 "maison -> house, chat -> cat, chien ->"과 같이 사용하는데, 이를 퓨-샷 러닝(few-shot learning) 이라고 한다.

텍스트 대 이미지 또는 텍스트 대 오디오 모델과의 의사소통 시에는 일반적인 프롬프트는 "말을 탄 우주 비행사의 고품질 사진" 또는 "로우파이 슬로우 BPM 일렉트로 칠 아웃과 유기적인 샘플"과 같은 원하는 출력의 설명이다.
텍스트 대 이미지 모델에 프롬프트를 주입하는 과정은 주제, 스타일, 레이아웃, 조명 및 미적인 측면을 달성하기 위해 단어를 추가, 제거, 강조 및 재배열하는 것을 포함할 수 있다.

## 컨텍스트 내 학습 (In-Context Learning)

프롬프트 엔지니어링 기술은 컨텍스트 내 학습에 의해 가능해진다. 
컨텍스트 내 학습 자체는 모델 규모의 신흥 속성으로, 하류 규모 법칙의 중단이 발생하여 더 큰 모델에서 더 작은 모델보다 더 높은 효능을 나타낸다.

특정 작업마다 교육 및 미세 조정과 대조적으로 컨텍스트 내 학습에서 학습된 내용은 일시적인 성격을 갖는다. 
이는 한 대화에서 다른 대화로 이동할 때 (미)학습 데이터셋에서 이미 존재하는 임시 컨텍스트나 편향을 제외한 것이다.
변압기 레이어 내에서의 "메사 최적화(mesa-optimization)"의 결과로 나타난 것으로, 메타 학습(meta-learning)이나 "학습하기 위해 학습(learning to learn)"의 형태다.

## 정의
프롬프트 엔지니어링은 생성형 AI 모델에 텍스트 또는 이미지 형태의 입력을 제공하여 모델이 생성할 수 있는 응답 집합을 지정하고 제한하는 학문이다. 
이러한 입력은 실제 모델의 가중치를 업데이트하지 않으면서 원하는 결과를 생성하는 집합을 프롬프트한다 (미세 조정과 같이 모델의 가중치를 업데이트하지 않는 것과 동일한 방식). 프롬프트 엔지니어링은 "컨텍스트 내 학습"이라고도 불리며, 모델을 더욱 지도하는 예제를 제공하는 과정이다.

## 중요성
프롬프트 엔지니어링은 원하는 결과에 대한 비즈니스 정렬의 핵심 역할을 한다. 
프롬프트 엔지니어링은 중요한 이유는 대규모 언어 모델 (LLM)과 일반적인 생성형 AI 모델이 입력의 뉘앙스와 작은 차이에 극도로 민감하기 때문이다. 
미세 조정으로 잘못된 답변이 출력 가능한 답변으로 변경될 수 있다. 
각 모델은 자체적인 민감도 수준을 가지며, 프롬프트 엔지니어링의 원칙은 반복적인 테스트와 평가를 통해 민감도를 파악하는 것이다.

## 비즈니스 영향
프롬프트 엔지니어링은 다음과 같은 비즈니스 영향을 미친다.

* 성능: 모델의 성능을 향상시키고 환상을 줄이는 데 도움이 된다.
* 비즈니스 정렬: 주제 데이터 과학자, 주제 전문가 및 소프트웨어 엔지니어가 일반적인 기본 모델을 비즈니스, 도메인 및 산업에 맞게 조정할 수 있도록 한다.
* 효율성과 효과성: 모델을 처음부터 구축하거나 미세 조정하는 대안 옵션과 비교하여 훨씬 복잡하며, 시장 진입 시간이 더 오래 걸리고 더 비용이 많이 들 수 있다.

## 주요 동력 요인
* 균형과 효율성: 프롬프트 엔지니어링의 근본적인 동력 요인은 "있는 그대로" 옵션과 미세 조정 기반 접근법 (또는 접근법의 조합) 사이의 균형을 맞출 수 있도록 조직이 허용하는 것이다. 생성형 AI 모델, 특히 LLM은 미리 학습되므로 기업이 이러한 모델과 함께 사용하려는 데이터를 학습 세트에 추가할 수 없다. 대신 프롬프트를 사용하여 모델에 내용을 공급하고 기능을 수행하도록 지시할 수 있다.
* 프로세스나 작업별 사용자 정의 또는 새로운 사용 사례: 모델이 출력을 영향을 주기 위해 사용하는 컨텍스트와 패턴을 삽입함으로써 특정 기업이나 도메인, 규제 사항에 대한 사용자 정의를 가능하게 한다. 프롬프트는 도메인별 질문 응답, 요약, 분류 등과 같은 다양한 사용 사례의 품질을 개선하기 위해 만들어진다. 모델을 미세 조정하거나 조정하는 데 비용이 많이 들거나 현실적이지 않을 경우에도 해당된다. 또한 이미지와 텍스트 생성 기능을 활용하는 새로운 사용 사례를 생성하고 디자인하는 데 적용된다.
* 유효성 검증과 확인: 모델의 한계와 약점을 테스트하고 이해하며 문제가 생기지 않도록 관리하기 위해 모델을 검증하고 검증하고 문서화하는 것이 중요하다.

## 장애요인
* 학문의 초기 단계: 프롬프트 엔지니어링 프로세스와 역할은 알려져 있지 않거나 기업에서 이에 대한 이해와 경험이 부족한 경우가 많다. 
Gartner 웨비나 투표 데이터 (2500개 이상의 응답; Executive Pulse: AI Investment Gets a Boost From ChatGPT Hype 참조)에 따르면 응답자의 약 60%가 프롬프트 엔지니어링에 대해 들어보지 못했다고 자진 보고했다. 그리고 동일한 응답자의 90%가 자신의 조직에 프롬프트 엔지니어가 없다고 밝혔다.
* 역할 정렬: 데이터 과학자는 모델의 능력과 한계를 이해하고 순수히 프롬프트 기반 또는 미세 조정 기반 (또는 접근 방식의 조합)을 추구할지 결정하는 데 중요하다. 궁극적인 목표는 기계 학습 자체를 사용하여 최상의 프롬프트를 생성하고 자동 프롬프트 최적화를 달성하는 것이다. 이는 LLM의 최종 사용자가 답변을 개선하기 위해 프롬프트를 수동으로 변경하는 것과 대조된다.
* 비즈니스 정렬의 부재: 프롬프트 엔지니어링의 비즈니스 접근 방식에 대한 합의나 합의된 표준, 방법론 및 접근 방식이 종종 부재한 상황이다. 이로 인해 프롬프트 엔지니어링의 가치와 거버넌스를 어떻게 확립할지에 대한 치열한 논쟁이 벌어진다.
* 리스크: 인식과 이해의 초기 단계를 넘어서 가장 큰 장애물은 프롬프트 엔지니어링이 검증, 검증, 개선 및 정제를 위한 것임에도 불구하고, 모든 도전에 대한 판별력을 제공하지만 완전히 제거하지는 않는다는 점일 수 있다. 오류가 여전히 발생할 수 있으며 잠재적인 책임이 있을 수 있다.

## 사용자 권장 사항
1. 프롬프트 엔지니어링의 인식과 이해를 신속하게 구축하여 적절한 프롬프트 엔지니어링 학문과 팀의 변형을 신속하게 시작하자.
2. 다양한 팀 구성원 간의 중요한 역할을 협력적으로 수행할 수 있는 핵심 기술을 구축하자. 예를 들어 데이터 과학자, 비즈니스 사용자, 도메인 전문가, 소프트웨어 엔지니어 및 시민 개발자의 중요한 역할이 있다.
3. 프롬프트 엔지니어링이 무조건적으로 완벽하지 않다는 메시지를 전달하고 전달하자. 엄격함과 근면은 모든 기업 팀 전반에 퍼져서 성공적인 솔루션을 보장하기 위해 필요하다.

## 샘플 공급 업체
* FlowGPT; HoneyHive; LangChain; PromptBase; Prompt Flow; PromptLayer

## Prompt Engineering 101 

Learn all about Prompt Engineering in this Beginner Crash Course. In this video you will learn all the basics of prompt engineering so you can get the best results when working with Large Language Models.

This is not a list with the best ChatGPT prompts. Instead, we compiled the best resources we found into one straightforward guide that teaches you basic concepts and the fundamentals of prompt engineering.

<iframe width="600" height="400" src="https://www.youtube.com/embed/aOm75o2Z5-o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

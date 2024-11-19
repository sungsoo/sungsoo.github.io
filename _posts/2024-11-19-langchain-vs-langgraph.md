---
layout: post
title:  LangChain vs LangGraph; A Tale of Two Frameworks
date: 2024-11-19
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [LangChain vs LangGraph; A Tale of Two Frameworks](https://www.youtube.com/watch?v=qAF1NjEVHhY)

---


# LangChain vs LangGraph; A Tale of Two Frameworks

## Abstract

Get ready for a showdown between LangChain and LangGraph, two powerful frameworks for building applications with large language models (LLMs.) Master Inventor Martin Keen compares the two, taking a look at their unique features, use cases, and how they can help you create innovative, context-aware solutions.

<iframe width="600" height="400" src="https://www.youtube.com/embed/qAF1NjEVHhY?si=Rx9XkJpQBEKSzpdt" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## LangChain이란?

**LangChain**은 대규모 언어 모델(LLM)을 활용하여 다양한 언어 기반 애플리케이션을 개발하기 위한 프레임워크입니다. 즉, LLM의 잠재력을 극대화하고, 실제 문제 해결에 적용할 수 있도록 돕는 도구라고 할 수 있습니다.

**LangChain의 주요 기능:**

* **모듈화된 구성:** LLM, 데이터 소스, API 등을 모듈화하여 재사용성을 높이고, 복잡한 애플리케이션도 쉽게 구축할 수 있도록 합니다.
* **다양한 LLM 지원:** OpenAI의 GPT 모델, Hugging Face Transformers 등 다양한 LLM을 지원하여 유연하게 모델을 선택하고 활용할 수 있습니다.
* **데이터 연결:** 다양한 형태의 데이터 (텍스트, 문서, 데이터베이스 등)를 LLM과 연결하여 지식 기반 애플리케이션을 구축할 수 있습니다.
* **체인(Chain) 개념:** 여러 LLM 모듈을 연결하여 복잡한 작업을 수행할 수 있는 체인을 구성할 수 있습니다. 예를 들어, 질문에 대한 답변을 찾기 위해 정보 검색, 요약, 생성 등의 과정을 연결할 수 있습니다.

## LangGraph란?

**LangGraph**는 LangChain의 확장 개념으로, LLM 기반 애플리케이션을 그래프 형태로 모델링하여 더욱 복잡하고 유연한 시스템을 구축할 수 있도록 돕는 프레임워크입니다.

**LangGraph의 주요 특징:**

* **그래프 기반 모델링:** LLM 애플리케이션을 노드와 에지로 구성된 그래프로 표현하여 시스템의 흐름을 시각적으로 파악하고 관리할 수 있습니다.
* **상태 관리:** 각 노드에서 처리된 결과를 상태로 저장하고, 이를 다른 노드에서 참조하여 상태를 유지하는 애플리케이션을 구축할 수 있습니다.
* **에이전트 시스템:** LangGraph는 에이전트 기반 시스템 구축에 적합하며, 각 노드를 하나의 에이전트로 생각하고, 에이전트 간의 상호 작용을 통해 복잡한 문제를 해결할 수 있습니다.

## LangChain과 LangGraph의 차이점

| 특징 | LangChain | LangGraph |
|---|---|---|
| **핵심 개념** | 체인 (Chain) | 그래프 |
| **복잡도** | 상대적으로 단순한 시스템 | 복잡하고 유연한 시스템 |
| **표현 방식** | 선형적인 흐름 | 그래프 형태의 비선형적인 흐름 |
| **활용 분야** | 다양한 언어 기반 애플리케이션 | 에이전트 기반 시스템, 복잡한 워크플로 |

### 왜 LangChain과 LangGraph를 사용해야 할까요?

* **생산성 향상:** 모듈화된 구성과 높은 수준의 추상화를 통해 개발 시간을 단축하고 생산성을 높일 수 있습니다.
* **유연성:** 다양한 LLM과 데이터 소스를 연결하여 다양한 종류의 애플리케이션을 구축할 수 있습니다.
* **확장성:** 그래프 기반 모델링을 통해 시스템을 확장하고 복잡한 문제를 해결할 수 있습니다.
* **재사용성:** 미리 구축된 모듈과 체인을 재사용하여 새로운 애플리케이션을 빠르게 개발할 수 있습니다.

## 결론

LangChain과 LangGraph는 LLM을 활용하여 강력하고 유연한 언어 기반 애플리케이션을 개발하기 위한 필수적인 도구입니다. 특히, LangGraph는 더욱 복잡하고 지능적인 시스템을 구축하고자 할 때 유용하게 활용될 수 있습니다.


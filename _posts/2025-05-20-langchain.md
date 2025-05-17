---
layout: post
title: LangChain Mastery in 2025
date: 2025-05-20
categories: [artificial intelligence]
tags: [artificial general intelligence]

---


# [LangChain Mastery in 2025](https://www.youtube.com/watch?v=Cyv-dgv80kE) 

## [Abstract](https://notebooklm.google.com/notebook/eeb932e3-17db-452d-a0ae-dd6afa4cdd77/audio)

The Langchain library is a powerful tool for AI engineering, acting as the foundation of the broader LangChain-ecosystem (that is, LangGraph, LangSmith, LangServe, etc). In this course, you'll learn the fundamentals of building with LLMs and the essentials of LangChain — allowing you to build modern agentic systems and potentially move onto other components in the ecosystem such as LangGraph.

<iframe width="600" height="400" src="https://www.youtube.com/embed/Cyv-dgv80kE?si=d8mqMuBsWJS06E93" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Design Patterns

LangChain은 AI 엔지니어를 위한 프레임워크로, 특히 AI 애플리케이션을 구축하는 데 사용되는 파이썬 생태계에서 가장 인기 있는 오픈 소스 프레임워크 중 하나입니다. LangChain을 사용하면 복잡한 사용 사례를 다룰 때 API만 사용하는 것보다 훨씬 간단하게 시작할 수 있습니다. 이 프레임워크는 많은 부분을 추상화하며, 이는 시작하는 데 큰 장점이지만 경험이 많아짐에 따라 제약처럼 느껴질 수도 있습니다.

LangChain을 사용하여 고급 AI 애플리케이션을 구축하기 위한 핵심 개념 및 패턴은 다음과 같습니다.

*   **LLM (Large Language Model)**: LangChain 애플리케이션의 기본 구성 요소입니다. LangChain은 OpenAI와 같은 다양한 LLM API와 상호 작용할 수 있는 기능을 제공합니다.
*   **Prompt**: LLM에 지침을 제공하는 근본적인 부분입니다. LangChain은 **시스템 프롬프트** (LLM의 역할 및 목표 정의), **사용자 프롬프트** (사용자 입력), **AI 프롬프트** (AI 응답)와 같은 프롬프트 유형을 위한 유틸리티와 템플릿을 제공합니다. 프롬프트 템플릿을 사용하면 입력 변수를 기반으로 프롬프트의 구조와 내용을 동적으로 수정할 수 있습니다. Few-shot 프롬프팅 및 Chain of Thought 프롬프팅과 같은 기술을 구현하여 LLM 성능을 개선할 수 있습니다. Chain of Thought 프롬프팅은 LLM이 추론 과정을 단계별로 작성하도록 유도하여 정확도를 높입니다.
*   **LangChain Expression Language (LCEL)**: LangChain에서 체인(chain)을 구축하는 권장 방식입니다. LCEL은 파이프 연산자 (`|`)를 사용하여 여러 구성 요소(Runnable 객체)를 연결합니다. 이는 이전 버전의 `LLMChain`과 같은 추상화보다 더 유연하고 강력한 구성을 가능하게 합니다. `Runnable Lambda`, `Runnable Parallel`, `Runnable Passthrough`와 같은 LCEL 구성 요소를 사용하여 복잡한 워크플로우를 정의할 수 있습니다.
*   **Agent**: AI 애플리케이션의 미래로 간주되며, LLM이 외부 **도구 (Tool)**를 사용하여 정보를 얻고 작업을 수행하며 반복적인 추론 프로세스를 수행하도록 합니다. 도구는 Google Search, 계산기, 또는 API 호출과 같이 코드 로직이나 함수를 LLM이 이해하고 사용할 수 있도록 포맷한 것입니다. **Agent Executor**는 Agent의 핵심 로직으로, LLM 호출, 출력 처리, 도구 실행 및 관찰(observation)을 반복하는 스캐폴딩 역할을 합니다. React 패턴과 같은 아키텍처 패턴이 Agent 구축에 사용됩니다. Agent는 대화 이력(Memory)을 통해 이전 상호 작용을 기억할 수 있으며, 병렬 도구 호출 및 최대 반복 횟수 설정과 같은 기능을 지원합니다.
*   **Memory**: 챗봇 및 Agent가 이전 대화 상호 작용을 기억하도록 하는 데 중요합니다. LangChain은 **Conversational Buffer Memory**, **Conversation Summary Memory**, **Conversation Summary Buffer Memory**와 같은 다양한 메모리 타입을 지원합니다. 최신 버전의 LangChain에서는 `runnable with message history`를 사용하여 대화 메모리를 구현하며, 프롬프트 템플릿 내에서 `messages placeholder`를 사용하여 대화 이력을 삽입합니다.
*   **Streaming**: AI 애플리케이션, 특히 대화형 인터페이스의 필수적인 사용자 경험 기능입니다. Streaming은 LLM 출력 토큰을 실시간으로 표시하고, Agent가 도구를 사용하는 것과 같은 중간 단계를 사용자에게 보여줄 수 있습니다. LangChain은 비동기 스트리밍(`a stream`)을 지원하며, Agent와 함께 스트리밍을 구현하기 위해 콜백 핸들러와 큐(Queue)를 사용하여 토큰 및 중간 단계를 관리하고 전송합니다.
*   **Async (비동기 프로그래밍)**: 특히 LLM API 호출과 같이 대기 시간이 긴 작업이 많은 AI 애플리케이션에서 성능과 확장성을 향상시키는 데 매우 중요합니다. LangChain은 비동기 실행을 지원하며, `asyncio`, `aiohttp`와 같은 파이썬 비동기 라이브러리를 통합하여 사용할 수 있습니다. `asyncio.gather`를 사용하면 여러 비동기 작업을 병렬로 실행할 수 있습니다.
*   **Structured Output**: LLM의 출력을 미리 정의된 특정 구조(예: JSON 딕셔너리)로 강제하는 기술입니다. Pydantic 모델을 사용하여 원하는 출력 구조를 정의하고, LangChain의 `with_structured_output` 메서드를 LLM과 함께 사용하여 LLM이 해당 구조를 따르도록 할 수 있습니다. 이는 프로그램에서 LLM 응답을 파싱하고 사용하는 것을 훨씬 신뢰성 있게 만듭니다.
*   **Observability (LangSmith)**: LangChain 생태계의 일부로, LLM, Agent 등의 동작을 추적하고 시각화하는 데 초점을 맞춥니다. 애플리케이션이 무엇을 하고 있는지 확인하고 문제를 진단하는 데 매우 유용하며 권장되는 선택적 의존성입니다.

이러한 핵심 개념들을 조합하고 LCEL을 통해 유연하게 연결하며, Agent를 통해 외부 기능 및 반복을 추가하고, Memory를 통해 상태를 유지하며, Streaming 및 Async를 통해 성능과 사용자 경험을 개선하고, Structured Output으로 출력 신뢰성을 확보함으로써 LangChain을 사용한 고급 AI 애플리케이션을 구축할 수 있습니다. 이 과정은 처음에는 추상적인 방식으로 시작하여 점차 추상화를 벗겨내고 내부 메커니즘을 이해하는 방식으로 진행될 수 있습니다.

## Major Components

LangChain v0.3을 사용하여 **실용적인 AI 시스템을 개발하는 데 필요한 주요 구성 요소**는 다음과 같습니다. 이 과정은 LangChain의 기초부터 시작하여, 이러한 구성 요소를 통합한 AI 에이전트 애플리케이션 구축에 이르기까지 다룹니다.

*   **LangChain 프레임워크 기본 이해**: LangChain은 파이썬 AI 생태계에서 가장 인기 있는 오픈 소스 프레임워크 중 하나입니다. **언제 LangChain을 사용해야 하고 언제 다른 방법을 고려해야 하는지**, 장단점을 이해하는 것이 중요합니다. LangChain은 복잡한 AI 사용 사례(예: 에이전트, RAG)를 구축할 때 유용하며, 많은 세부 사항을 추상화하여 빠르게 시작할 수 있게 돕습니다. 하지만 때로는 이러한 추상화가 제한처럼 느껴질 수 있으며, 더 경험이 많거나 프로젝트가 복잡해짐에 따라 LangGraph와 같은 다른 프레임워크로 이동할 수도 있습니다. 그럼에도 LangChain은 AI 엔지니어의 도구 키트에서 핵심적인 도구로, 학습 가이드 역할(on-ramp)을 할 수 있습니다.
*   **LangChain Expression Language (LCEL)**: LCEL은 **LangChain을 사용하여 체인 및 애플리케이션을 구축하는 권장 방식**입니다. LCEL은 표준 파이썬 구문과 약간 다르지만, 파이프 연산자(`|`)를 사용하여 **다양한 컴포넌트(프롬프트, LLM, 파서 등)를 연결**합니다. `runnable` 및 관련 객체(예: `runnable parallel`, `runnable pass through`)를 사용하여 함수나 다른 로직을 체인에 통합할 수 있습니다. LCEL은 스트리밍 및 비동기 처리를 기본적으로 지원하므로, 실용적인 애플리케이션에 필수적입니다.
*   **프롬프트(Prompts)**: LLM에게 작업을 수행하도록 지시하는 것은 **프롬프트 엔지니어링**의 핵심입니다. LangChain은 동적이고 유연한 프롬프트 파이프라인을 구축하는 기능을 제공합니다. 주요 프롬프트 구성 요소는 다음과 같습니다:
    *   **시스템 프롬프트(System Prompt)**: LLM의 역할, 목표, 행동 방식 등 전반적인 지침을 제공합니다.
    *   **사용자 프롬프트(User Prompt)**: 사용자의 현재 요청이나 질문을 포함합니다.
    *   **AI 프롬프트(AI Prompt)**: LLM의 응답입니다.
    *   **프롬프트 템플릿(Prompt Templates)**: 변수를 받아 프롬프트 문자열을 구성하는 데 사용됩니다. LangChain은 다양한 프롬프트 유형(예: 채팅 프롬프트)에 대한 템플릿을 제공합니다.
    *   **구조화된 출력(Structured Output)**: LLM의 출력이 특정 구조(예: JSON 딕셔너리)를 따르도록 강제합니다. Pydantic 모델을 사용하여 출력 스키마를 정의하고, LLM이 이 스키마에 맞춰 응답하도록 유도할 수 있습니다.
    *   **Few-Shot Prompting**: LLM에게 몇 가지 입출력 예시를 제공하여 원하는 응답 스타일이나 형식을 학습시킵니다.
    *   **Chain-of-Thought Prompting**: LLM에게 문제를 해결하기 위해 단계별로 추론 과정을 작성하도록 지시합니다. 이를 통해 LLM의 정확도를 높이고 환각을 줄일 수 있으며, LLM이 왜 특정 응답을 생성했는지 디버깅하는 데도 유용합니다.
*   **거대 언어 모델(LLMs)**: LangChain은 OpenAI, Mistral 등 다양한 LLM API와 쉽게 통합할 수 있습니다. LLM 인스턴스를 초기화하고 (예: 모델 이름 지정), Temperature와 같은 **생성 매개변수를 설정**하여 출력의 창의성/무작위성을 제어할 수 있습니다.
*   **대화 메모리(Conversational Memory)**: 챗봇이나 에이전트가 이전 상호작용을 기억하여 대화의 문맥을 유지할 수 있도록 합니다. LangChain은 다양한 메모리 유형을 지원하며, 최신 버전에서는 `runnable with message history` 클래스와 `messages placeholder`를 사용하여 **대화 기록을 관리하고 프롬프트에 삽입**하는 것을 권장합니다. Conversation Buffer Memory는 모든 메시지를 저장하고, Conversation Summary Buffer Memory는 일정 토큰 수를 초과하면 메시지 일부를 요약합니다.
*   **도구(Tools)**: LLM 자체는 외부 정보에 접근하거나 코드를 실행할 수 없습니다. 도구는 이러한 한계를 극복하기 위해 **LLM에게 외부 기능(API 호출, 데이터베이스 조회, 계산 등)을 사용할 수 있도록 제공**하는 인터페이스입니다. LangChain의 `@tool` 데코레이터를 사용하여 파이썬 함수를 LLM이 이해할 수 있는 `structured tool` 객체로 정의합니다. 도구는 명확한 설명과 타입 힌트를 포함해야 LLM이 이를 사용하는 방법을 이해할 수 있습니다.
*   **에이전트(Agents)**: 에이전트는 **복잡한 목표를 달성하기 위해 도구를 사용하고 LLM 호출을 반복적으로 수행**하는 지능형 시스템입니다. 에이전트는 사용자의 요청을 받아 어떤 도구를 사용할지, 어떤 매개변수로 사용할지를 결정하고, 도구 실행 결과를 관찰하여 다음 단계를 결정합니다. React(Reasoning and Acting)와 같은 패턴을 따르며, 이러한 반복적인 실행 로직을 **에이전트 실행기(Agent Executor)**라고 부릅니다. 에이전트는 중간 단계(agent scratchpad)를 통해 자신의 추론 과정을 기록합니다.
*   **스트리밍 및 비동기 처리(Streaming and Async)**: **사용자 경험 개선 및 확장성 확보**를 위해 중요합니다.
    *   **비동기(Async)**: 특히 LLM API 호출과 같이 대기 시간이 긴 작업에서 애플리케이션이 멈추지 않고 여러 작업을 동시에 처리할 수 있도록 합니다. `asyncio` 라이브러리 및 비동기 HTTP 클라이언트(`httpx` 또는 `aiohttp`) 사용법을 익히는 것이 유용합니다. 여러 도구 호출을 병렬로 실행하는 데 `asyncio.gather`를 사용할 수 있습니다.
    *   **스트리밍(Streaming)**: LLM이 응답 토큰을 생성하는 즉시 사용자에게 실시간으로 보여주거나, 에이전트가 도구를 사용하는 중간 단계 정보를 실시간으로 제공합니다. **콜백 핸들러(Callback Handler)**와 **비동기 큐(Async Queue)**를 사용하여 에이전트 실행 중 생성되는 토큰과 중간 단계 정보를 캡처하고 전달할 수 있습니다.
*   **관찰 가능성(Observability) - LangSmith**: LangSmith는 LangChain으로 구축된 애플리케이션의 **실행 흐름을 추적, 시각화 및 디버깅**할 수 있게 해주는 도구입니다. LLM 호출, 체인 실행, 에이전트의 결정 과정 등을 상세히 살펴볼 수 있어 **문제 진단 및 성능 최적화**에 필수적입니다.

이러한 핵심 구성 요소들을 이해하고 조합하는 능력이 LangChain을 활용하여 실용적인 AI 시스템을 개발하는 데 중요합니다.

## Agents

LangChain에서 **에이전트(Agents)가 중요한 이유**는 LLM(거대 언어 모델) 자체의 한계를 극복하고 더 복잡하고 실용적인 AI 시스템을 구축할 수 있게 해주기 때문입니다. 에이전트는 다양한 핵심 구성 요소들을 조합하여 지능적인 행동을 수행합니다.

에이전트의 주요 중요성은 다음과 같습니다:

1.  **외부 도구(Tools) 활용을 통한 LLM 능력 확장**: LLM 자체는 외부의 실시간 정보에 접근하거나, 복잡한 계산을 수행하거나, 코드 실행과 같은 외부 기능에 직접 접근할 수 없습니다. 에이전트는 이러한 LLM에게 외부 세계와 상호작용할 수 있는 도구(API 호출, 데이터베이스 조회, 검색, 계산기 등)를 제공합니다. 이를 통해 LLM은 단순한 텍스트 생성이나 질문 답변을 넘어 실제 작업을 수행할 수 있게 됩니다.
2.  **복잡한 다단계 작업 처리**: 에이전트는 사용자의 복잡한 목표를 달성하기 위해 **여러 단계에 걸쳐 LLM 호출과 도구 실행을 반복적으로 수행**하는 지능형 시스템입니다. React(Reasoning and Acting)와 같은 패턴을 따르며, 사용자의 요청을 받아 어떤 도구를 사용할지, 도구 사용 결과는 어떤지 등을 판단하여 다음 행동을 결정하는 반복적인 추론 및 실행 로직을 가집니다. 이러한 **에이전트 실행기(Agent Executor)**를 통해 단일 LLM 호출로는 해결하기 어려운 복잡한 문제를 해결할 수 있습니다.
3.  **추론 과정 가시화 및 디버깅 용이성**: 에이전트는 작업을 수행하는 동안 중간 단계(agent scratchpad)를 통해 자신의 추론 과정을 기록합니다. 또한, LangSmith와 같은 관찰성(Observability) 도구를 사용하면 에이전트의 복잡한 실행 흐름, LLM 호출, 도구 사용 결정 과정 등을 상세히 추적하고 시각화할 수 있습니다. 이는 문제 진단, 디버깅 및 성능 최적화에 매우 유용합니다.
4.  **향상된 사용자 경험 제공**: 에이전트의 다단계 실행 과정과 도구 사용 정보를 스트리밍하여 사용자에게 실시간으로 제공함으로써 사용자 경험을 개선할 수 있습니다. 사용자는 에이전트가 무엇을 하고 있는지 (예: 웹 검색 중, 계산 중) 중간 과정을 볼 수 있어 답답함을 줄이고 시스템의 작동 방식을 더 잘 이해할 수 있습니다.
5.  **대화 문맥 유지 (대화 메모리 활용)**: 에이전트는 대화 메모리를 활용하여 이전 상호작용의 문맥을 기억하고 이를 바탕으로 현재의 의사결정 및 응답을 조정할 수 있습니다. 이는 챗봇과 같은 대화형 AI 시스템에서 필수적입니다.

결론적으로, 에이전트는 LLM의 잠재력을 현실적인 애플리케이션으로 확장하고, 복잡한 작업을 자동화하며, 개발 및 사용 경험을 향상시키는 데 핵심적인 역할을 하기 때문에 중요합니다.


## LangChain Expression Language (LCEL)

**LangChain Expression Language (LCEL)**은 다음과 같습니다.

*   **LangChain을 사용하여 체인 및 애플리케이션을 구축하는 권장 방식**입니다. LangChain v0.3에서는 이전 버전의 `LLMChain`과 같은 방식보다 LCEL을 사용하는 것이 선호됩니다.
*   **표준 파이썬 구문과 약간 다른 구문**을 사용합니다. 핵심은 **파이프 연산자 (`|`)**입니다.
*   파이프 연산자 (`|`)는 **다양한 컴포넌트(객체)를 연결**하는 역할을 합니다. 한 컴포넌트의 출력을 파이프의 다음 컴포넌트의 입력으로 전달합니다.
*   LCEL 체인에 사용되는 컴포넌트들을 **`runnable` 객체**라고 부릅니다. 일반 파이썬 함수도 `RunnableLambda`를 사용하여 `runnable` 객체로 만들 수 있습니다.
*   `runnable` 객체는 내부적으로 `or` 메소드를 가지고 있으며, 파이프 연산자는 이 `or` 메소드의 단축키 역할을 합니다.
*   프롬프트 템플릿, LLM, 출력 파서 등 다양한 컴포넌트를 LCEL을 사용하여 쉽게 연결하고 파이프라인을 구축할 수 있습니다. 또한 `runnable parallel`, `runnable pass through`와 같은 객체를 사용하여 병렬 처리나 특정 변수 통과 등 더 복잡한 구조를 만들 수 있습니다.
*   **스트리밍(Streaming) 및 비동기(Async) 처리를 기본적으로 지원**합니다. 이는 실용적인 AI 애플리케이션에서 사용자 경험 개선과 확장성을 위해 중요합니다.
*   명확성을 위해 명시적으로 입력 키를 매핑하는 방식도 사용할 수 있습니다.
*   LangSmith와 같은 관찰성(Observability) 도구에서 LCEL 체인의 실행 흐름을 추적하는 데 도움이 됩니다.

요약하자면, LCEL은 LangChain v0.3에서 복잡한 AI 애플리케이션의 구성 요소를 유연하고 효율적으로 연결하고 구축하기 위한 핵심적인 언어이며, 특히 파이프 연산자를 사용한 체이닝과 비동기/스트리밍 지원이 특징입니다.

## Chain of Thoughts Prompting

**체인 오브 소트 프롬프팅(Chain of Thought Prompting)**은 LLM(거대 언어 모델)이 응답을 생성하기 전에 **추론 과정이나 생각을 단계별로 거치도록 유도하는 프롬프팅 기법**입니다.

이 기법의 아이디어는 어린 시절 수학 시간에 선생님이 풀이 과정을 적어보도록 시키는 것과 유사합니다. 이는 아이가 속도를 늦추고 자신의 추론 과정을 실제로 기록하게 함으로써, 머릿속으로만 하려다가 건너뛸 수 있는 단계들을 실제로 생각하게 강제합니다. 마찬가지로 LLM에게 단계별 추론 과정을 요구함으로써, LLM이 문제를 더 체계적으로 해결하고 보다 정확하고 일관된 결과물을 내놓도록 도울 수 있습니다.

Chain of Thought 프롬프팅은 일반적으로 Few-Shot 프롬프팅(모델에게 소수의 예시를 제공하여 학습시키는 방식)보다 **더 흔하게 사용되는 프롬프팅 기법**입니다. 특히 최신 또는 더 큰 모델의 경우 instruction following(명령 따르기) 능력이 뛰어나 Chain of Thought 기법만으로도 충분한 효과를 볼 수 있습니다.

LangChain의 에이전트(Agents)와 관련하여, **React(Reasoning and Acting)**와 같은 에이전트 패턴은 본질적으로 Chain of Thought 개념을 구현한 것입니다. 에이전트는 사용자의 요청을 처리하기 위해 **추론(Reasoning), 행동(Action), 관찰(Observation)**의 반복적인 루프를 따릅니다. 여기서 LLM은 어떤 작업을 수행해야 할지 추론하는 텍스트를 생성하고, 어떤 도구를 사용할지, 도구에 어떤 입력값을 줄지 등을 결정하는 역할을 합니다.

에이전트가 작업을 수행하는 동안 거치는 이러한 중간 단계, 즉 LLM의 추론 과정, 도구 사용 결정, 도구 실행 결과(관찰) 등은 **에이전트 스크래치패드(agent scratchpad)**라는 곳에 기록됩니다. 이 스크래치패드는 에이전트의 "중간 생각" 또는 "체인 오브 소트"를 담고 있으며, 에이전트 실행기(agent executor)가 이러한 정보들을 바탕으로 다음 단계를 결정하고 반복을 이어갑니다. 따라서 에이전트의 복잡한 다단계 작업 처리 과정 자체가 체인 오브 소트 프롬프팅의 한 형태라고 볼 수 있습니다.

요약하자면, 체인 오브 소트 프롬프팅은 LLM이 문제를 해결하기 위해 단계별 추론 과정을 거치도록 유도하는 기법이며, LangChain에서는 에이전트의 React 패턴 및 스크래치패드 메커니즘을 통해 이 개념이 구현되어 있습니다.
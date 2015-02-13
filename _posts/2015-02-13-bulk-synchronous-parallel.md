---
layout: post
title: The Bulk Synchronous Parallel Model
date: 2015-02-13
categories: [computer science]
tags: [parallel computing]

---

# The Bulk Synchronous Parallel Model

BSP 모델은 널리 연구되었던 PRAM 모델의 일반화이며 하버드 대학의 L. G. Valiant 교수에 의해 Bridging Model for Parallel Computation이라는 이름으로 처음 제안되었다. 범용의 병렬 컴퓨팅에 대한 BSP 접근법은 지난 8년여 동안 옥스포드 대학의 W. F. McColl 교수에 열정적으로 개발되었다.

## BSP 컴퓨터

하나의 BSP 컴퓨터는 다음과 같이 구성된다.

* 프로세서-메모리 쌍의 집합
* point-to-point 메시지 전달을 위한 communication network
* 모든 프로세서 혹은 그 일부를 효율적으로 동기화하기 위한 메커니즘

## 현재의 BSP 컴퓨터

현재 BSP 컴퓨터 모델을 만족하는 것들은 다음과 같은 것들이다.

* cache를 가진 하나의 프로세서와 분리된 메모리
* PVM 또는 MPI와 같은 메시지 전달 소프트웨어와 함께 구비된 PC 혹은 Workstation들의 네트워크
* 분산 메모리 프로세서 array (e.g. IBM SP2, Intel Paragon, Meiko CS2, Parsytec GC/PowerPlus)
* 공유 메모리 다중프로세서 (e.g. Multi-processor INTEL Pentium Pro, Silicon Graphics Origin or Power Challenge, CRAY T3D/T3E, Convex SPP).

## 성능을 정의하는 파라미터들

*step* : 계산(calculation)의 기본 단위

* p = 프로세서 개수
* s = 프로세서 속도 (초당 step의 개수)
* l = barrier 동기화에 드는 비용 (step의 수)
* g = 메시지 자료를 전달하기 위해 드는 비용 (word당 step의 수)

## BSP 컴퓨터에서의 Computation

병렬 프로그래밍을 위한 BSP 접근법의 본질은 communication과 synchronisation이 완전히 분리된 *superstep*이라는 개념이다. BSP 프로그램은 단지 단계(phase)들 사이에서 이루어지는 전체적인 communication을 필요로 하는 그리고 여러 단계로 수행되는 하나이다. 이러한 병렬 프로그래밍 접근법은 모든 종류의 병렬 아키텍쳐(분산 메모리형, 공유 메모리형, 워크스테이션들의 네트워크 등)에 적용될 수 있다.

지역 데이터에 일어나는 기본적인 연산들을 step이라고 정의한다. BSP computation은 병렬 superstep의 sequence로 구성된다. 여기서 각각의 superstep은 지역 데이터에서 수행되는 그리고 비지역 데이터 접근이 효과를 지점에서의 barrier synchronisation에 뒤따르는 step의 sequence이다. 비지역 데이터에 대한 요청 또는 비지역 데이터에 대한 갱신은 superstep 동안에 일어날 수 있지만 superstep의 마지막에서 동기화가 일어나기 전까지는 완결되었다든 보장을 할 수 없다. 그러한 요청은 non-blocking이다.

## BSP 프로그래밍

프로그래머의 관점에서 바라본 컴퓨터는 마치 매우 크고 전체적으로 접근 가능한 메모리로 보인다. 지역 데이터의 접근과 외부 프로세서의 데이터 접근으로의 구분은 2 단계의 메모리 접근 시간의 특징을 가지는 NUMA(non-uniform memory architecture) 시스템의 구조와 일치한다. 이것은 모든 형태의 coherent 또는 non-coherent 캐쉬 구조와 함께 가상 공유 메모리(virtual shared memory) 기계도 포함한다. 이러한 타입의 아키텍쳐는 프로그램하기에 쉽기 때문에 우위를 차지한다.

BSP 프로그램의 superstep 구조 자체가 데이터 전송의 최적화를 유도한다. superstep에서 주어진 프로세서들의 쌍 사이의 모든 전송은 더 큰 메시지를 만들기 위해 통합되어질 수 있다. 이것은 오버헤드를 적게할 수 있고 네트워크의 contention을 피할 수 있다. 더 낮은 레벨의 communication 소프트웨어는 실제 하드웨어에서 가장 효율적인 communication 메커니즘을 사용해야만 한다. 이 소프트웨어는 응용에 독립적이기 때문에 효율성의 달성을 위한 비용은 많은 응용으로 퍼지게 된다.

　
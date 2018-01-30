---
layout: post
title: Neuromorphic Chip
date: 2015-07-27
categories: [computer science]
tags: [parallel computing]

---

# Intel's New 49-qubit Quantum Chip & Neuromorphic Chip


Intel's CES 2018 keynote focused on its 49-qubit quantum computing chip, VR applications for content, its AI self-learning chip, and an autonomous vehicles platform.

<iframe width="600" height="400" src="https://www.youtube.com/embed/nE819PPCA5o" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Quantum Computing

양자 컴퓨팅(量子 - , *quantum computing*) 또는 양자 컴퓨터(*quantum computer*)는 얽힘(*entanglement*)이나 중첩(*superposition*) 같은 **양자역학적인 현상을 이용하여 자료를 처리하는 계산 기계**이다. 고전적인(전통적인) 컴퓨터에서 자료의 양은 비트로 측정된다. 양자 컴퓨터에서 자료의 양은 **큐비트**로 측정된다. 양자 계산의 기본적인 원칙은 입자의 양자적 특성이 자료를 나타내고 구조화할 수 있다는 것과 양자적 메카니즘이 고안되어 이러한 자료들에 대한 연산을 수행할 수 있도록 만들어질 수 있다는 것에 기한다.

양자 컴퓨팅이 여전히 유아기에 있지만, 매우 작은 수의 큐비트를 가지고 양자 수치 계산이 수행되는지에 관한 실험들이 행해져 왔다.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Blochsphere.svg/220px-Blochsphere.svg.png)

*양자 컴퓨터의 기초가 되는 큐비트를 그림으로 나타내기 위한 블로흐 구 모형*

### 양자 컴퓨팅과 계산 복잡도 이론

이 절에서는 양자 컴퓨터의 능력에 대해 현재 알려진 수학적인 결과를 조사한다. 이 결과는 양자 컴퓨터와 관계된 계산 복잡도 이론과 계산 이론에서 나온 것이다.

**양자 컴퓨터가 효율적으로 풀 수 있는 문제군**을 *BQP*라 한다. 여기서 **효율적이란**, "*정해진 오차범위 내에서 다항 시간 안에*" 푼다는 뜻이다. 양자 컴퓨터는 확률적 알고리즘을 실행할 뿐이므로 양자 컴퓨터에 대한 BQP는 기존 컴퓨터에 대한 BPP에 대응한다. BPP는 오차 확률을 1/4로 제한하며 다항 시간에 풀 수 있는 문제의 집합으로 정의된다. 양자 컴퓨터가 문제를 "푼다"는 것은 모든 예제에 대해 높은 확률로 올바른 결과가 나온다는 뜻이다. 그 결과가 다항 시간에 나왔다면 그 문제는 BQP에 속한다.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/BQP_complexity_class_diagram.svg/220px-BQP_complexity_class_diagram.svg.png)

*BQP와 다른 문제 공간의 관계 추정 도식*

BQP는 NP-완전과 서로소 집합이고, **P가 BQP의 진부분집합일 것으로 추정되나 아직 증명되지는 않았다**. 소인수 분해와 이산 로그 문제가 BQP에 속한다. 두 문제 모두 NP문제이고, BPP가 아닐 것으로 추정되므로 P에도 속하지 않는다. 또한 NP-완전도 아닐 것으로 추정된다. 양자 컴퓨터가 NP-완전 문제를 다항 시간에 풀 수 있다는 잘못된 인식이 널리 퍼져 있으나 확실히 증명된 바는 없다. 양자 컴퓨터도 NP-완전 문제는 다항 시간에 풀 수 없다는 견해가 일반적이다.

양자 컴퓨터의 연산자는 벡터에 특정한 행렬을 곱해서 바꾸는 것으로 생각할 수 있다. 행렬을 곱하는 연산은 선형 연산이다. 대니얼 S. 에이브럼스와 세트 로이드는 양자 컴퓨터가 비선형 연산자로 설계될 수 있다면 NP-완전 문제를 다항 시간에 풀 수 있음을 보였다. #P-완전 문제 역시 가능하다. 그러나 그러한 기계는 불가능하다고 보았다.

양자 컴퓨터가 기존 컴퓨터보다 빠를 수는 있지만, 기존 컴퓨터로 풀 수 없는 문제는 양자 컴퓨터 역시 풀 수 없다. 충분한 시간과 메모리가 주어지더라도 마찬가지이다. 튜링 기계가 양자 컴퓨터를 시뮬레이트할 수 있기 때문에 양자 컴퓨터가 정지 문제 같은 결정 불가능 문제를 풀 수는 없다. "표준" 양자 컴퓨터의 존재가 처치-튜링 명제를 반증하지는 않는다.

최근에 수많은 연구자들이 양자 역학을 하이퍼 계산에 사용할 수 있는지를 연구하기 시작하였다. 즉, 결정 불가능 문제를 풀 수 있을지를 연구하는 것이다. 그러한 주장은 이론적으로도 가능하지 않을 것으로 보는 회의적인 견해가 많다.

### 상용화

2011년 5월 11일, 캐나다의 D-Wave Systems에서 128큐비트 프로세스가 장착된 세계최초의 상용화 양자컴퓨터인 D-Wave One을 내놓았으며, 5월 20일 1000만 달러의 가격으로 시장에 내놓았다.

D-Wave One 은 범용 양자 컴퓨터는 아니며, *Quantum Annealing* 이라는 특정한 양자 알고리즘에 특화된 하드웨어를 갖고 있다.

2013년 NASA와 구글이 공동으로 설립할 인공지능 연구소에서 D-Wave 2를 구매할 계획이라고 밝혔다.

이후 D 웨이브는 D 웨이브 1의 후속으로 512개의 큐비트를 사용하는 D 웨이브 2(D-WAVE 2)를 출시했는데 구글이 이를 구입했다. D-Wave 2는 머신러닝과 음성인식, 자연어 처리를 위해 방대한 데이터를 분석할 수 있고, 싱글코어 칩을 활용하는 일반 컴퓨터보다 1억배 이상 빠른 속도로 처리할 수 있는 것으로 알려졌다.
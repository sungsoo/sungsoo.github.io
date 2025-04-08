---
layout: post
title: Computational Thinking
date: 2014-01-05
categories: [computer science]
tags: [machine learning]

---
<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

정보과학적인 사고(*computational thinking*)는 병렬 응용프로그램 개발에서 가장 중요한 요소로 여겨진다. 정보과학적인 사고란 계산 과정과 알고리즘 등으로 도메인 문제를 표현하는 사고 과정이라고 정의할 수 있다. 다른 사고 과정이나 문제 해결 능력과 마찬가지로, 정보과학적인 사고는 어쩌면 예술 행위와 같다. 정보과학적인 사고은 실전적인 경험과 추상적인 개념을 번갈아 적용하면서 점진적인 방식으로 배우는 것이 가장 좋다.


문제가 분해된 다음에 병렬 프로그래머는 병렬화, 실행 효율, 메모리 대역폭의 소비 등의 주요 난관을 극복하는 알고리즘을 설계하는 힘든 작업에 직면하게 된다. 이해하기 쉽지 않은 광범위한 알고리즘 기술에 대한 많은 문헌들이 존재한다.

우리는 보통 밑바닥부터 차례로 배울 때 이해를 잘 하게 된다. 따라서, 특정 프로그래밍 모델을 가지고 개념을 먼저 배워서 기초를 다진 다음 이 지식을 다른 프로그래밍 모델에 적용하는 게 좋다.
CUDA 모델을 통해 얻은 심도 있는 경험을 통해 우리가 성숙해지면 CUDA 모델과 직접적인 관련이 없는 개념도 쉽게 배울 수 있을 것이다.

병렬 프로그래머들이 효과적인 정보과학적인 사고를 갖기 위해서는 수많은 기술이 필요하다.
이들 중 기초가 되는 기술들을 아래와 같이 요약한다.

+ **컴퓨터 구조** - 메모리 구성; 캐쉬와 지역성; 메모리 대역폭; SIMT(single-instruction multiple-thread)와 SPMD(single-program multiple-data)와 SIMD(single-instruction multiple-data)의 차이; 부동소수점의 정밀도와 정확성. 이러한 개념은 알고리즘의 장단점을 이해하는 데 핵심적인 요소이다.
+ **프로그래밍 모델과 컴파일러** - 병렬 실행 모델, 사용 가능한 메모리 종류, 데이터 배열의 레이아웃과 루프 변환; 이 모든 개념은 더 좋은 성능을 얻기 위해서 데이터 구조와 루프 구조를 결정할 때 필요하다.
+ **알고리즘 기술** - 타일 분할, 컷오프, 비닝, 그리고 고도의 병렬 알고리즘을 설계하기 위한 툴박스를 구성하는 다른 기술들; 이 기술들의 확장가능성과 효율, 그리고 메모리 대역폭에 미치는 영향 등을 이해하는 것이 정보과학적인 사고에 필수적이다.
+ **도메인 지식** - 수치해석 기법, 모델, 정확도에 대한 요구사항, 수학적 특성; 이와 같은 기반 규칙을 이해해야 개발자가 알고리즘 기술을 더 창의적으로 적용할 수 있다.

> 무엇보다 중요한 것은 정보과학적인 사고의 기술을 쌓는 가장 좋은 방법은 뛰어난 정보과학적인 해법을 가지고 도전적인 문제를 푸는 것을 지속하는 것이다.

> Most importantly, the best way to build up more computational thinking skills is to keep solving challenging problems with execellent computatonal solutions.

### References

[1] David B. Kirk and Wen-mei W. Hwu, *Programming Massively Parallel Processors: A Hands-on Approach*, Morgank Kaufmann, 2010.
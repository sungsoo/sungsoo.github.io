---
layout: post
title: Impedance Mismatch
date: 2013-08-21
categories: [computer science]
tags: [big data, data management, NoSQL]

---
##  Impedance Mismatch: 객체-관계 불일치

관계형 데이터베이스는 장점이 많지만 완벽하지는 않으며, 초창기부터 많은 불만이 있었다.  
애플리케이션 개발자에게 가장 큰 불만은 객체-관계 불일치, 즉 관계형 모델과 메모리 내 데이터 구조 간 차이였다. 관계형 데이터 모델에서는 테이블과 행, 즉 관계와 튜플로 데이터를 구조화한다. 관계형 모델에서 튜플은 이름-값 쌍의 집합이고 관계는 튜플의 집합이다(튜플의 관계형 정의는 튜플을 값들의 나열로 정의하는 수학이나 다른 프로그래밍 언어에서의 튜플 데이터 타입과는 조금 다르다). SQL에서 모든 연산은 관계를 소비하고 반환하는데, 모든 것이 수학적으로 우아한 관계 대수로 설명된다.

관계에 대한 이런 기반은 어느 정도의 우아함과 단순함을 제공하지만 제약도 생긴다. 특히 관계형 튜플 안의 값은 단순해야 하며, 중첩된 레코드나 리스트 등 다른 구조를 포함할 수 없다. 메모리 내 데이터 구조에서는 이런 제약이 없어 관계보다 훨씬 복잡한 구조를 사용할 수 있다. 그 결과 복잡한 메모리 내 데이터 구조를 데이터베이스에 저장하려면 먼저 관계형 표현으로 변환해야 한다.

![http://sungsoo.github.io/images/rdb-tables.png](http://sungsoo.github.io/images/rdb-tables.png)

### References
[1] Pramod J. Sadalage, Martin Fowler, NoSQL Distilled, A Brief Guide to the Emerging World of Polyglot Persistence, Pearson Education, Inc, 2012.
---
layout: post
title: Introduction to Bug Patterns in Java 
date: 2013-12-26
categories: [computer science]
tags: [design patterns]

---


초보프로그래머들이 버그를 만났을 때 취하는 일반적인 행동은 다음과 같다.

1. 자기 코드의 결점은 보지 못하고 시스템만 탓한다.
2. 자신이 목격한 버그가 절대 일어날 수 없는 것이라며 우긴다.
3. 광분하여 사경을 헤매면서 버그를 찾아다니다가 코드 이곳저곳을 고쳐본다.

초보들의 이러한 행동은 모두 경험이 부족하여 생긴 일이다. 나중에 진짜로 무엇이 문제였는지 알게되면 그제서야 그런 문제가 발생하지 않게 하는 방법을 알게 된다.

버그 패턴(bug patterns)은 버그의 원인과 그에 의한 현상을 기술한 것이다. 이러한 패턴을 익힘으로써 좀 더 빨리 버그의 존재를 파악할 수 있을 뿐 아니라, 애초에 이러한 버그가 발생하지 않도록 할 수 있다.

버그 패턴은 일반적인 소프트웨어에서 잘못된 디자인만을 모아놓은 패턴인 안티 패턴(Anti-Pattern)과 유사한 개념이다. 이렇게 좋지 않은 디자인 사례들을 알아봄으로써 거꾸로 좋은 디자인이 무엇인지 다시금 생각해 볼 수 있기 때문이다. 하지만 안티 패턴과 버그 패턴이 완전히 같은 것은 아니다. 어디까지나 안티 패턴은 디자인에 관한 것이고, 버그 패턴은 프로그래머의 실수로 인해 나타나는 예외적인 상황들에 대해 다룬 것이기 때문이다. 즉, 버그 패턴이 다루는 내용은 디자인이 아니라 코딩과 디버깅 방법에 대한 내용이다.

프로그래머들이 오랜 시간 동안 오직 경험에 의지해서 이러한 패턴들을 알아왔다는 것은 분명 잘못된 것이다. 이러한 버그 패턴들을 명확하게 정의하고 배울 수 있다면 우리는 노련한 프로그래머들이 가진 "강건한 소프트웨어 개발을 위한 진수"를 어느새 익히게 될 것이다.

버그 패턴은 절대 황당무계한 개념이 아니다. 버그 패턴은 마치 의사들이 환자들의 유사한 현상을 통해 병을 진단해 내는 것과 같다.

일단 한 번 버그 패턴에 익숙해지면 비슷한 유형의 버그를 찾는 것은 식은 죽 먹기이다. 그 뿐 아니라, 버그에 대한 치료도 좀 더 빠르게 할 수 있게 된다. 마지막 이러한 경험들을 함께 나눔으로써 프로그램 전체 일정도 앞당기게 될 것이다.

### References

[1] Eric Allen, *Bug Patterns in Java*, 2003.

![bug patterns book](http://sungsoo.github.com/images/bug-patterns-book.png)
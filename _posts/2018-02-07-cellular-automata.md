---
layout: post
title: Cellular Automata
date: 2018-02-07
categories: [computer science]
tags: [design patterns]

---


# Cellular Automata



<iframe width="600" height="400" src="https://www.youtube.com/embed/eUcviWn9ACc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


세포 자동자(細胞自動子) 또는 셀룰러 오토마타(cellular automata, 단수 cellular automaton)는 계산 가능성 이론, 수학, 물리학, 복잡계, 수리생물학, 미세구조 모델링에서 다루는 이산 모형이다. 여러 개의 세포 자동자를 세포 공간, 테셀레이션 구조라고도 부른다.

세포 자동자는 규칙적인 격자 형태로 배열된 세포 또는 칸(cell)들에서 정의된다. 각 세포는 유한한 수의 "상태"를 가질 수 있는데 예를 들어 "살아 있음/죽음"이 있다. 격자는 유한한 수의 아무 차원이면 된다. 각 세포에 대하여, "이웃들"이라 부르는 세포들은 그 세포에 대한 관계로 정의하는데, 예를 들어 그 세포에 대해 모든 방향으로 한 칸씩 떨어져 있는 세포들이라는 식으로 하면 된다. 시간 t=0 일 때의 각각의 세포의 상태를 지정해놓고 이를 초기 상태라고 한다. 새로운 "세대"(시간 t가 그 다음 자연수)는 고정된 "규칙"에 의해 이전 세대로부터 만들어지는데, 규칙은 각 세포와 그 이웃들의 상태에 따라 그 세포의 새로운 상태가 지정하는 수학적인 함수이다. 일반적으로 그 규칙은 각 세포에 대해 동일하고 시간에 따라 변하지 않으며 각 세대의 모든 세포에 동시에 적용되는데, 물론 일반적이지 않은 규칙을 적용한 세포 자동자도 있다.(예: 확률론적 세포 자동자, 비동시적 세포 자동자)

1940년대에 스타니스와프 울람과 존 폰 노이만이 로스앨러모스 국립 연구소에서 함께 연구하면서 이 개념을 처음 발견했으나, 학계 밖에서 활발히 화자되기 시작한 것은 1970년대에 2차원 세포 자동자의 하나인 존 호턴 콘웨이의 라이프 게임이 소개된 이후였다.

## What is cellular automata modeling?

<iframe width="600" height="400" src="https://www.youtube.com/embed/EyrwOf239M4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
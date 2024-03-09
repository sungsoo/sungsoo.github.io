---
layout: post
title: Differential Privacy and Machine Unlearning
date: 2024-03-09
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Differential Privacy and Machine Unlearning](https://www.youtube.com/watch?v=34Xrv6FZEOQ)

---

# Differential Privacy and Machine Unlearning

오늘은 Aaron Roth가 있습니다. 그는 Penn의 교수입니다. Penn 이전에는 Microsoft Research New England에서 박사후 연구원으로 1년을 보냈습니다. 그 전에 그는 Avrim Blum이 조언했던 CMU에서 박사 학위를 받았습니다. Aaron은 개인 정보 보호와 공정성에 중점을 두고 알고리즘, 기계 학습, 게임 이론, 메커니즘 설계 등 다양한 주제를 다루고 있습니다. 그는 과학자 및 엔지니어를 위한 대통령 조기 경력상, Alfred P. Sloan Research를 비롯한 여러 상을 받았습니다. 펠로우십, NSF CAREER 상. 오늘 우리는 차등 프라이버시와 머신 언러닝에 관한 그의 연구에 대해 듣게 될 것입니다.

## Abstract
 
데이터 삭제 또는 "기계 학습 해제"의 문제는 모델을 완전히 재학습하는 기본 솔루션보다 훨씬 더 나은 계산 비용으로 학습된 모델에 대한 데이터 포인트의 영향을 제거하는 것입니다. 차등 개인 정보 보호에서는 서로 다른(인접) 입력에서 동일한 알고리즘을 실행하여 가까운 분포를 생성하도록 요구하는 반면, 데이터 삭제 문제에서는 동일한 입력에서 실행될 때 두 개의 서로 다른 알고리즘(전체 재훈련 대 삭제 작업 순서)이 가까운 분포를 생성해야 합니다. 따라서 두 가지 목표는 동일하지 않습니다. 그럼에도 불구하고 차등 개인 정보 보호 기술은 자연스러운 방식으로 데이터 삭제 문제로 이어집니다. 이번 강연에서는 이 점을 설명하는 두 가지 간단한 예를 살펴보겠습니다. 제가 논의할 작업은 Varun Gupta, Chris Jung, Seth Neel, Saeed Sharifi 및 Chris Waites가 공동으로 작성한 두 편의 논문에서 나온 것입니다.


<iframe width="600" height="400" src="https://www.youtube.com/embed/34Xrv6FZEOQ?si=il7lA-OEi7fKbIgK" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Machine Unlearning

<iframe width="600" height="400" src="https://www.youtube.com/embed/eiZuQmImxEE?si=oJn_6STsN4mAu-FS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
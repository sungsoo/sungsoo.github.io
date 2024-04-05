---
layout: post
title: Towards Federated Analytics with Local Differential Privacy
date: 2024-04-08
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Towards Federated Analytics with Local Differential Privacy](https://www.youtube.com/watch?v=nWFCRzSzfzs)

---

# Towards Federated Analytics with Local Differential Privacy

## Abstract

* Virtual Seminar, Interest Group on Privacy and Machine Learning

## 여러 소스를 통한 개인정보 보호 그래프 분석

여러 소스에서 수집된 그래프 데이터를 분석하여 가치 있는 정보를 얻을 수 있지만, 이 과정에서 개인 정보 보호는 점점 더 어려운 문제가 되고 있습니다. 연합 분석(Federated analytics)은 개인 정보를 보호하면서 데이터 분석을 수행할 수 있는 유망한 프레임워크입니다. 하지만 현재 대부분의 기존 연구는 일반적인 표 형태 데이터를 대상으로 이루어져 복잡한 그래프 분석에는 효과가 떨어집니다.

이 논문에서는 먼저 분산된 서브 그래프 간의 공통적인 그래프 통계 정보 (예: 도 분포, 서브 그래프 개수 등)를 계산하는 새로운 패러다임인 연합 그래프 분석 (FGA)를 소개합니다. FGA의 핵심적인 문제는 각 클라이언트가 전체 그래프를 제한된 시각으로만 볼 수 있기 때문에 정확한 그래프 통계 정보를 얻기 어렵다는 점입니다. 이 문제를 해결하기 위해 저자들은 개인 정보 보호를 보장하면서 다양한 그래프 분석을 지원하는 FGA 프레임워크를 제안합니다.

분산된 서브 그래프 간의 중복 정보는 불필요한 난독화를 야기하여 유용성에 영향을 미친다는 점을 발견했습니다. 이 문제를 완화하기 위해 저자들은 개인 집합 교집합 (PSI) 기법을 기반으로 개선된 방법을 제안합니다. 이 방법은 서로 분리된 서브 그래프에 있는 각 항목을 한 번만 난독화함으로써 추가되는 잡음 수준을 크게 줄입니다. 실제 세계 그래프 데이터를 대상으로 실시한 광범위한 실험 결과, 제안된 개선된 방법은 기존 방법에 비해 대부분의 경우 70% 이상 우수한 성능을 보였습니다.




<iframe width="600" height="400" src="https://www.youtube.com/embed/cCEgFNtWG5E?si=mJeRM0psopKGy4na" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


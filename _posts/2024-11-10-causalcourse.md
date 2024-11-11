---
layout: post
title:  A Brief Introduction to Causal Inference
date: 2024-11-10
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [A Brief Introduction to Causal Inference](https://www.youtube.com/watch?v=CfzO4IEMVUk&list=PLoazKTcS0Rzb6bb9L508cyJ1z-U9iWkA0)

---


# A Brief Introduction to Causal Inference


## Abstract

In this part of the Introduction to Causal Inference course, we introduce and outline the first talk of the course: "A Brief Introduction to Causal Inference." Please post questions in the YouTube comments section.

* Introduction to Causal Inference Course Website: [causalcourse.com](causalcourse.com)

<iframe width="600" height="400" src="https://www.youtube.com/embed/CfzO4IEMVUk?si=wwHFpzULC2eAA23q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## 심슨의 역설(Simpson's Paradox)

심슨의 역설은 통계학에서 매우 흥미롭고 역설적인 현상 중 하나입니다. 전체 데이터를 분석할 때는 특정한 경향이 나타나는데, 그 데이터를 부분집합으로 나누어 분석하면 오히려 반대되는 경향이 나타나는 현상을 말합니다. 

**간단히 말해,** 전체적으로 보면 A가 B보다 더 좋지만, 각 부분집합별로 보면 B가 A보다 더 좋은 경우가 발생하는 것입니다. 마치 전체 그림은 다르지만, 부분 그림들을 보면 또 다른 이야기가 나오는 것과 같습니다.

### 심슨의 역설이 발생하는 이유는 무엇일까요?

* **은폐 변수:** 전체 데이터에는 드러나지 않지만, 부분집합을 나누면 드러나는 변수가 존재할 수 있습니다. 이 변수가 전체적인 경향을 왜곡시켜 심슨의 역설을 발생시키는 것입니다.
* **집단 간 차이:** 데이터를 구성하는 각 집단 간에 근본적인 차이가 존재할 수 있습니다. 이러한 차이가 전체적인 경향을 가리는 역할을 할 수 있습니다.

### 심슨의 역설 예시

* **대학 입학률:** 두 개의 대학 A와 B가 있다고 가정해봅시다. 전체적으로는 대학 A의 합격률이 더 높지만, 남학생과 여학생으로 나누어 보면 대학 B의 합격률이 더 높을 수 있습니다. 이는 각 대학의 남녀 성비가 다르기 때문일 수 있습니다.
* **치료 효과:** 두 가지 치료법 A와 B의 효과를 비교하는 연구에서, 전체 환자를 대상으로 분석할 때는 치료법 A가 더 효과적인 것으로 나타날 수 있습니다. 하지만 환자의 연령대별로 분석해 보면 치료법 B가 더 효과적인 경우가 있을 수 있습니다.
* **선거 결과:** 특정 후보 A와 B의 지지율을 분석할 때, 전체 유권자를 대상으로 분석하면 후보 A가 더 높은 지지율을 얻을 수 있습니다. 하지만 연령대별로 분석해 보면 후보 B가 더 높은 지지율을 얻는 연령대가 있을 수 있습니다.

### 심슨의 역설의 중요성

심슨의 역설은 통계 분석 시 주의해야 할 중요한 함정 중 하나입니다. 데이터를 분석할 때 단순히 전체적인 경향만을 보고 결론을 내리기보다는, 다양한 변수를 고려하고 부분집합별 분석을 통해 결과를 검증해야 합니다.

**심슨의 역설이 주는 교훈:**

* **데이터를 다양한 관점에서 분석해야 한다.**
* **은폐 변수의 존재 가능성을 고려해야 한다.**
* **결론을 내릴 때는 신중해야 한다.**

**심슨의 역설은** 단순히 통계학적인 현상을 넘어, 우리가 세상을 바라보는 시각에 대한 중요한 시사점을 제공합니다. 전체적인 그림만을 보지 않고, 부분적인 그림들을 종합적으로 고려해야 진실에 더 가까이 다가갈 수 있습니다.


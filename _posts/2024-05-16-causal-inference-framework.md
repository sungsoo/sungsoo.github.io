---
layout: post
title: A Causal Inference Framework for Combinatorial Interventions
date: 2024-05-16
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [A Causal Inference Framework for Combinatorial Interventions](https://www.youtube.com/watch?v=73RskRdYcQQ)

---

# A Causal Inference Framework for Combinatorial Interventions

* Portal is the home of the TechBio community. Join for more details on this talk and to connect with the speakers: [https://portal.valencelabs.com/care](https://portal.valencelabs.com/care)

## Summary
Consider a setting where there are N heterogeneous units and p interventions. Our goal is to learn unit-specific potential outcomes for any combination of these p interventions, i.e., N×(2^p) causal parameters. Choosing a combination of interventions is a problem that naturally arises in a variety of applications such as factorial design experiments, recommendation engines, combination therapies in medicine, conjoint analysis, etc. Running N×(2^p) experiments to estimate the various parameters is likely expensive and/or infeasible as N and p grow. Further, with observational data there is likely confounding, i.e., whether or not a unit is seen under a combination is correlated with its potential outcome under that combination. To address these challenges, we propose a novel latent factor model that imposes structure across units (i.e., the matrix of potential outcomes is approximately rank r), and combinations of interventions (i.e., the coefficients in the Fourier expansion of the potential outcomes is approximately s sparse). We establish identification for all N×(2^p) parameters despite unobserved confounding. We propose an estimation procedure, Synthetic Combinations, and establish it is finite-sample consistent and asymptotically normal under precise conditions on the observation pattern. Our results imply consistent estimation given poly(r)×(N+(s^2)p) observations, while previous methods have sample complexity scaling as min[N×(s^2)p, poly(r)×(N+(2^p))]. We use Synthetic Combinations to propose a data-efficient experimental design. Empirically, Synthetic Combinations outperforms competing approaches on a real-world dataset on movie recommendations. Lastly, we extend our analysis to do causal inference where the intervention is a permutation over p items (e.g., rankings).

이 논문은 N개의 이기종 단위와 p개의 개입으로 구성된 설정을 다룹니다. 우리의 목표는 이러한 p개 개입의 모든 조합에 대한 단위별 잠재적 결과, 즉 N×(2^p) 개의 인과적 매개 변수를 학습하는 것입니다. 개입 조합의 선택은 요인 설계 실험, 추천 시스템, 의료 분야의 복합 치료, 공 conjoint 분석 등 다양한 응용 분야에서 자연스럽게 발생하는 문제입니다. N×(2^p) 개의 실험을 실행하여 다양한 매개 변수를 추정하는 것은 N과 p가 커질수록 비용이 많이 들거나 실행 불가능할 수 있습니다. 또한 관측 데이터에는 혼란 변수가 존재할 가능성이 높습니다. 즉, 단위가 조합 하에서 관찰되었는지 여부는 해당 조합 하에서의 잠재적 결과와 상관 관계가 있습니다. 이러한 문제를 해결하기 위해 우리는 단위 간 (즉, 잠재적 결과 행렬은 대략 rank r)과 개입 조합 (즉, 잠재적 결과의 푸리에 급수 계수는 대략 s 희소) 간에 구조를 부여하는 새로운 잠재 변수 모델을 제안합니다. 우리는 관측되지 않은 혼란 변수에도 불구하고 모든 N×(2^p) 매개 변수에 대한 식별을 설정합니다. 우리는 합성 조합(Synthetic Combinations) 추정 절차를 제안하며, 관측 패턴에 대한 정확한 조건 하에서 유한 샘플 일치적이고漸近的으로 정규 분포(asymptotically normal)임을 증명합니다. 이 결과는 이전 방법의 샘플 복잡성이 최소[N×(s^2)p, poly(r)×(N+(2^p))]인 반면, poly(r)×(N+(s^2)p) 개의 관측치만으로도 일관적인 추정을 의미합니다. 우리는 합성 조합을 사용하여 데이터 효율적인 실험 설계를 제안합니다. 경험적으로 합성 조합은 영화 추천 실제 데이터 세트에서 경쟁 접근 방식보다 우수한 성능을 보여줍니다. 마지막으로, 우리는 분석을 확장하여 개입이 p개 항목에 대한 순열 (예: 순위)인 경우 인과 추론을 수행합니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/73RskRdYcQQ?si=CQWhlkdVzPy1_bFB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
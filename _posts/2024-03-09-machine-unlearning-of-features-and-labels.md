---
layout: post
title: Machine Unlearning of Features and Labels
date: 2024-03-09
categories: [artificial intelligence]
tags: [machine learning]

---

### Article Source


* [Machine Unlearning of Features and Labels](https://www.youtube.com/watch?v=TA234TRt8Cg)

---


* PAPER:[https://www.ndss-symposium.org/wp-content/uploads/2023/02/ndss2023_s87_paper.pdf](https://www.ndss-symposium.org/wp-content/uploads/2023/02/ndss2023_s87_paper.pdf)
* AUTHORS: Alexander Warnecke (TU Braunschweig), Lukas Pirch (TU Braunschweig), Christian Wressnegger (Karlsruhe Institute of Technology (KIT)), Konrad Rieck (TU Braunschweig)

* Network and Distributed System Security (NDSS) Symposium 2023, 27 February – 3 March 2023 in San Diego, California.   
* SESSION 2B-3 Machine Unlearning of Features and Labels


## Abstract

Removing information from a machine learning model is a non-trivial task that requires to partially revert the training process. This task is unavoidable when sensitive data, such as credit card numbers or passwords, accidentally enter the model and need to be removed afterwards. Recently, different concepts for machine unlearning have been proposed to address this problem. While these approaches are effective in removing individual data points, they do not scale to scenarios where larger groups of features and labels need to be reverted.

In this paper, we propose the first method for unlearning features and labels. Our approach builds on the concept of influence functions and realizes unlearning through closed-form updates of model parameters. It enables to adapt the influence of training data on a learning model retrospectively, thereby correcting data leaks and privacy issues. For learning models with strongly convex loss functions, our method provides certified unlearning with theoretical guarantees. For models with non-convex losses, we empirically show that unlearning features and labels is effective and significantly faster than other strategies.


머신 러닝 모델에서 정보를 제거하는 것은 훈련 과정을 부분적으로 되돌리는 복잡한 작업입니다. 이 작업은 신용 카드 번호 또는 비밀번호와 같은 민감한 데이터가 실수로 모델에 입력된 후 제거해야 할 때 불가피합니다. 최근에는 이 문제를 해결하기 위해 다양한 기계 학습 역학습(machine unlearning) 개념들이 제안되었습니다. 하지만 이러한 접근 방식은 개별 데이터 포인트를 제거하는 데 효과적이지만 더 큰 그룹의 특징(feature)과 레이블(label)을 되돌릴 필요가 있는 시나리오에는 적용 범위가 제한적입니다.

이 논문에서는 처음으로 특징과 레이블을 역학습하는 방법을 제안합니다. 제안된 방법은 영향 함수(influence function) 개념을 기반으로 하며 모델 매개변수의 닫힌 형태 업데이트를 통해 역학습을 수행합니다. 이를 통해 학습 모델에 대한 훈련 데이터의 영향을 거꾸로 조정하여 데이터 누출 및 개인 정보 문제를 수정할 수 있습니다. 강한 볼록 손실 함수(strongly convex loss function)를 갖는 학습 모델의 경우, 제안된 방법은 이론적 보장을 갖춘 인증된 역학습을 제공합니다. 비 볼록 손실 함수를 갖는 모델의 경우에도 제안된 방법은 특징과 레이블을 역학습하는 것이 다른 전략보다 효과적이고 훨씬 빠르다는 것을 경험적으로 보여줍니다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/TA234TRt8Cg?si=p79O4cboUK_Bz09t" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
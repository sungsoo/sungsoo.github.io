---
layout: post
title: Deep Learning Outline
date: 2021-05-25
categories: [computer science]
tags: [machine learning, graph mining]

---

### References 

* [Lecture: Deep Learning](https://uni-tuebingen.de/fakultaeten/mathematisch-naturwissenschaftliche-fakultaet/fachbereiche/informatik/lehrstuehle/autonomous-vision/lectures/deep-learning/)

---

# Deep Learning

## Abstract
Within the last decade, deep neural networks have emerged as an indispensable tool in many areas of artificial intelligence including computer vision, computer graphics, natural language processing, speech recognition and robotics. This course will introduce the practical and theoretical principles of deep neural networks. Amongst other topics, we will cover computation graphs, activation functions, loss functions, training, regularization and data augmentation as well as various basic and state-of-the-art deep neural network architectures including convolutional networks and graph neural networks. The course will also address deep generative models such as auto-encoders, variational auto-encoders and generative adversarial networks. In addition, applications from various fields will be presented throughout the course. The tutorials will deepen the understanding of deep neural networks by implementing and applying them in Python and PyTorch.

# Outline [김성수 초안, 05-24]

## 1. 머신러닝과 딥러닝
1.1. 소개

1.2. 딥러닝의 역사

1.3. 머신러닝 기본

## 2. 계산 그래프
2.1. 로지스틱 회귀

2.2. 계산 그래프

2.3. 역전파 알고리즘

2.4. 계산 그래프 처리 프레임워크

## 3. 심층 신경망 개념
3.1. 텐서

3.2. 텐서로 역전파 수행하기

3.3. XOR 문제

3.4. 다층 퍼셉트론

3.5. 보편적인 근사 (Universal Approximation)

## 4. 심층 신경망 구조
4.1. 신경망 출력과 손실함수

4.2. 활성화 함수

4.3. 전처리와 초기화

## 5. 정칙화
5.1. 매개변수 페널티

5.2. 조기 중단 (Early Stopping)

5.3. 앙상블 기법

5.4. 드롭 아웃

5.5. 데이터 증강


## 6. 최적화
6.1. 최적화 도전과제

6.2. 최적화 알고리즘

6.3. 최적화 전략

6.4. 디버깅 전략

## 7. 합성곱 신경망
7.1. 합성곱 개념

7.2. 다운 샘플링

7.3. 업 샘플링

7.4. 다양한 합성 신경망 구조

7.5. 컴퓨터 비전 응용

## 8. 순차 모델
8.1. 순환 신경망

8.2. 순환 신경망 응용

8.3. 게이트화된 순환 신경망

8.4. 자기회귀 모델


## 9. 자연어 처리
9.1. 언어 모델

9.2. 전통적인 언어 모델

9.3. 신경망기반 언어 모델 (Neural Language Models)

9.4. 신경망기반 기계 번역 (Neural Machine Translation)

## 10. 선형 인자 모델
10.1. 주성분 분석

10.2. 확률적 주성분 분석과 인자 분석

10.3. 독립성분분석

10.4. 희소 인코딩

10.5. 주성분 분석의 다양체 해석


## 11. 오토인코더
11.1. 과소완전 오토인코더

11.2. 정칙화된 오토인코더

11.3. 확률적 인코더와 디코더

11.4. 잡음 제거 오토인코더

11.5. 축약 오토인코더

11.6. 예측 희소 분해


## 12. 표현 학습 
12.1. 탐욕적 층별 비지도 사전훈련

12.2 전이 학습과 도메인 적응 

12.3 준지도 학습 기법을 이용한 원인 분리 

12.4 분산 표현

12.5 깊이의 지수적 이득 

## 13. 근사 추론
13.1 최적화로서의 추론 

13.2 기댓값 최대화

13.3 MAP 추론과 희소 인코더

13.4 변분 추론과 변분 학습

13.5 학습된 근사 추론 


## 14. 심층 생성 모델 기본
14.1 볼츠만 기계

14.2  심층 믿음망 (Deep Belief Nets)

14.3 합성곱 볼츠만 기계 

14.4 생성 확률적 신경망 

14.5 변분 오토인코더

## 15. 생성적이고 적대적인 신경망
15.1 게임이론과 신경망

15.2 생성적이고 적대적인 신경망: GAN

15.3 바닐라 GAN의 문제점

15.4 GAN의 확장: DCGAN, StyleGAN....

15.4. GAN의 응용

## 16. 그래프 신경망
16.1 그래프에서 머신러닝

16.2 그래프 합성곱 필터

16.3. 그래프 합성곱 신경망

16.4. 그래프 신경망이 강력한 이유

16.5. GNN 응용분야





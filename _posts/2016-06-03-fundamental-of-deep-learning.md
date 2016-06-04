---
layout: post
title: Fundamentals of Deep Learning
date: 2016-06-03
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [‘Fundamental of Deep Learning’ Preview](https://tensorflowkorea.wordpress.com/2016/04/18/fundamental-of-deep-learning-preview/)

---


# Fundamentals of Deep Learning

![](https://tensorflowkorea.files.wordpress.com/2016/04/rc_lrg.jpg?w=229&h=300)

O’Reilly에서 텐서플로우와 관련된 첫 번째 책인 ‘Fundamental of Deep Learning‘이 2016년 말에 출간 예정입니다. 지금은 Early Release 단계로 미리 구입해서 PDF나 이북 리더기로 읽으실 수 있습니다. 이 글은 2016년 4월 8일자 판을 기준으로 처음 작성되었습니다. 책이 업데이트 되면 포스트의 내용을 수정하거나 추가하도록 하겠습니다.

이 전 포스트에서 말씀드린대로 이 책은 원래 Theano를 기반으로 딥러닝을 설명하려고 했으나 구글에서 텐서플로우를 발표하고 나서 Theano대신 텐서플로우를 선택하게 되었습니다. 이런 결정을 하게 된 이유가 무엇인지 두 프레임워크의 차이를 비교하며 설명하고 있습니다.

책의 전체 챕터는 총 12장 이지만 현재 작성된 것은 5장까지 입니다. 아직 절반도 쓰여지지 않았지만 도서의 평점은 매우 좋은 편입니다. 마지막까지 좋은 결과물로 이어지길 기대합니다.

## 1. The Neural Network

- Building Intelligent Machines
- The Limits of Traditional Computer Programs
- The Mechanics of Machine Learning
- The Neuron
- Expression Linear Perceptrons as Neurons
- Feed-forward Neural Networks
- Linear Neurons and their Limitations
- Sigmoid, Tanh, and ReLU Neurons
- Softmax Output Layers
- Looking Forward

1장은 뉴럴 네트워크(Neural Network)에 대해 기본적인 이해를 돕는 도입부 입니다. 갓난 아이가 태어나서 부모로 부터 주변 사물에 대한 학습을 받는 과정을 비유로 들어 인공지능을 학습시키는 것을 설명합니다. 이미지 분류(Cassification)를 전통적인 프로그래밍 방법으로 해결하려 했을 때에 겪는 어려움과 이를 극복하기 위한 다른 접근 방법으로 머신러닝에 대해 설명합니다. 맨 처음 설명을 하는 알고리즘은 인공신경망 알고리즘의 가장 기본이 되는 선형 퍼셉트론(Linear Perceptron)입니다. 하지만 알고리즘을 단번에 모두 파헤쳐 설명하지 않고 단계를 거치면서 조금씩 상세화하고 있습니다. 어느 인공신경망 책에서도 나올 법한 뉴런에 대해 설명을 하면서 이와 유사한 개념을 선형 퍼셉트론에 적용합니다. 테스트 데이터를 이용하여 선형함수의 가중치를 결정하는 가장 간단한 모델입니다.

선형 퍼셉트론을 설명하면서 간단한 Python 클래스를 만들기 시작합니다. 이 클래스는 입력값과 가중치를 곱한 값을 이용해 결과를 리턴하는 기능을 합니다. 입력값과 가중치의 벡터 연산을 위해 Numpy를 사용합니다. 이 책은 Python, Numpy 등에 이미 익숙한 독자를 대상으로 하고 있는 것 같습니다. 따라서 Python 문법이나 Numpy 에 대해 장황하게 설명을 늘어놓지 않고 있습니다. 이 클래스는 하나의 뉴런(Neuron)처럼 행동하게 되고 바로 선형 퍼셉트론에 대응되는 클래스 입니다.

인간의 대뇌 피질이 6개의 레이어로 되어 있는 것처럼 인공신경망을 다층으로 구성하게 되었고 레이어(layer)간에 데이터 이동은 앞으로만 전달되는 피드포워드(feed forward) 네트워크가 기본입니다. 하지만 선형함수만을 이용하여 뉴런을 만드는 것은 입력 레이어(input layer)와 출력 레이어(output layer) 사이에 있는 인공 신경망 알고리즘의 핵심인 히든 레이어(hidden layer)를 무색하게 만드는 셈이라고 합니다. 따라서 선형 함수외에 세가지의 다른 뉴런 즉 시그모이드(Sigmoid), 하이퍼볼릭 탄젠트(tanh), 렐루(ReLU, Rectified Linear Unit) 뉴런을 사용합니다.

하이퍼볼릭 탄젠트 함수는 출력 값의 범위가 -1~+1 사이의 값을 가지므로 시그모이드 함수보다 좀 더 선호되는 편이며 입력 값이 0보다 작은 경우 출력 값을 0으로 만드는  렐루 뉴런의 경우 이미지 분류나 컴퓨터 비전 분야에서 널리 사용됩니다. 출력 값을 0, 1과 같은 이진 값이 아니라 각 레이블(label)에 대한 확률로 표현하기 위해 소프트맥스(softmax) 레이어를 사용합니다.

## 2. Training Feed Forward Neural Networks
- The Cafeteria Problem
- Gradient Descent
- The Delta Rule and Learning Rate
- Gradient Descent with Sigmoidal Neurons
- The Backpropagation Algorithm
- Stochastic and Mini-Batch Gradient Descent
- Test Sets, Validation Sets, and Overfitting
- Preventing Overfitting in Deep Neural Networks
- Summary

2장은 조금 더 수학적 이론에 대해 설명을 하고 뉴럴 네트워크를 학습시키는 방법과 최적의 가중치를 찾는 방법에 대해 설명하고 있습니다. 예측 오차를 제곱하여 합(Sqaure Error)하는 것으로 에러 함수(Error Function)을 정의하고 가중치 변수가 2개일 경우 가중치의 변화에 따른 에러 분포를 3차원 공간에 표시할 수 있습니다. 마치 지도의 등고선처럼 3차원 공간에서 동일한 에러의 위치를 이은 등고선을 생각하면 등고선 간의 가장 빠른(기울기가 가파른) 길은 등고선에 직각인 그래디언트(Gradient) 벡터임을 설명합니다. 그래서 에러가 가장 낮은 가중치 변수를 찾는 방법 중 하나는 임의의 위치에서 기울기가 가장 급하게 하강하는 방향을 쫓는 그래디언트 디센트(Gradient Descent)입니다.

가중치 변수외에 알고리즘을 학습시키기 위해 학습속도(Learning Rate)같은 하이퍼파라메타(hyperparameter)가 필요합니다. 편미분 방정식을 이용해 가중치 변수를 업데이트하는 공식을 유도하지만 자세한 설명을 하지는 않습니다. 그 다음엔 시그모이드(Sigmoid) 함수를 이용한 뉴런의 가중치 변수를 그래디언트 디센트 방식으로 업데이트 하기 위해  편미분 방정식을 유도합니다. 시그모이드 외에 하이퍼볼릭 탄젠트나 렐루 뉴런의 방정식 유도는 독자들을 위해 남겨둔다고 하네요. 하나의 뉴런의 가중치 변수를 업데이트하기 위한 편미분 방정식을 뉴럴 네트워크로 확장하여 방정식을 유도합니다. 상위 레이어의 결과를 이용하여 하위 레이어의 가중치 변수의 변화량을 계산하는 이 방정식이 백프로파게이션(backpropagation) 알고리즘입니다.

전체 트레이닝 데이터를 이용하는 배치 그래디언트 디센트(batch gradient descent)가 로컬 최저값(local minima)에 고착되는 것을 피하기 위해 하나의 트레이닝 데이터마다 알고리즘을 학습시키는 확률적 그래디언트 디센트(stochastic gradient descent)과 두 알고리즘의 절충안을 노리는 미니 배치 그래디언트 디센트(mini-batch gradient descent)에 대해 설명합니다.

모델의 오버피팅(overfitting)을 피하기 위해 트레이닝 데이터와 테스트 데이터, 밸리데이션(validation) 데이터를 구분하고 활용하는 방법에 대해 설명합니다. 오버피팅을 막기 위한 L1, L2 레귤러리제이션(regularization), 맥스 놈(max norm), 드롭아웃(dropout)을 소개합니다.

## 3. Implementing Neural Networks in TensorFlow
- What is TensorFlow?
- How Does TensorFlow Compare to Alternatives?
- Installing TensorFlow
- Creating and Manipulating TensorFlow Variables
- TensorFlow Operations
- Placeholder Tensors
- Sessions in TensorFlow
- Navigating Variable Scopes and Sharing Variables
- Managing Models over the CPU and GPU
- Specifying the Logistic Regression Model in TensorFlow
- Logging and Training the Logistic Regression Model
- Leveraging TensorBoard to Visualize Computation Graphs and Learning
- Building a Multilayer Model for MNIST in TensorFlow
- Summary

3장에서 부터 본격적으로 텐서플로우를 이용하기 시작합니다. 특히 3장에서는 텐서플로우를 소개하는 장으로서의 역할도 합니다. 대표적인 딥러닝 프레임워크로는 Theano, Torch, TensorFlow 등이 있습니다. 이 중에 이 책에서 사용할 프레임워크로는 TensorFlow를 선택하였습니다. Torch는 루아(Lua) 스크립트로 개발되어 있어서 딥러닝을 배우려 하는데 새로운 언어까지 배우기에는 부담스러워 제외하였다고 합니다. Theano는 컴파일 단계가 있는 점이 조금 단점이고 텐서플로우가 조금 더 깨꿋한 인터페이스를 가지고 있습니다. 그리고 Theano는 몬트리올 대학의 LISA 랩에서 개발한 것으로 조금 더 연구용의 목적에 가깝고 텐서플로우는 실제 업무용을 목표로 한 것이기에 텐서플로우를 선택했습니다.

그 다음에는 텐서플로우를 설치하는 방법이 자세히 소개됩니다. GPU가 있는 컴퓨터의 경우 CUDA, CUDNN 툴킷을 설치합니다. 텐서플로우의 변수(variable)의 특징과 tensorflow.Variable 메소드를 소개합니다. 텐서플로우의 오퍼레이션(operation)과 CPU/GPU 에 따라 다른 구현을 갖는 커널(kernel)에 대해 설명합니다. 변수와 달리 모델이 실행될 동안에 학습 데이터 등을 변경시킬 수 있는 플레이스홀더(placeholder)와 오퍼레이션의 실행 환경을 만드는 세션(session) 대해 설명합니다. 그리고 변수의 재사용을 위한 스코핑(scoping) 함수인 get_variable과 variable_scope를 설명합니다. 텐서플로우는 자동으로 GPU를 인식하여 사용하지만 명시적으로 CPU, GPU 코어를 선택해서 그래프 오퍼레이션을 할당할 수 있습니다.

이제 텐서플로우에서 MNIST 데이터를 가지고 로지스틱 회귀분석(Logistic Regression)을 수행합니다. MNIST 데이터는 28×28 이미지이므로 784개의 입력 레이어(input layer)를 가지고 숫자 0~9까지를 구분하기 위한 10개의 소프트맥스(softmax) 출력 레이어(output layer)로 첫번째 뉴럴 네트워크를 구성합니다. 책 속의 예제는 크게 네개의 함수를 만듭니다. 소프트맥스 함수로 0~9까지의 출력값의 확률을 계산하는 ‘inference’와 에러 함수(error function)의 값을 계산하는 ‘loss’, 그래디언트 값을 계산하고 모델을 업데이트 하는 ‘training’입니다. 마지막으로 테스트 데이터와 밸리데이션 데이터를 이용하여 결과를 평가하기 위한 ‘evaluate’ 함수입니다.

모델을 학습하면서 여러 통계들을 로그에 기록하기 위해 scalar_summary, histogram_summary, merge_all_summary, train.SummaryWriter 들을 소개합니다. 이런 코드들을 모두 합쳐 최종 모델을 학습시킵니다. 하지만 이 책은 텐서플로우의 메소드 하나하나를 세세히 설명하지는 않습니다. 로그로 기록한 통계 데이터를 이용해서 비주얼하게 보여주는 TensorBoard에 대해 설명합니다. 마지막으로 256개의 렐루(ReLU) 뉴런을 가지는 두개의 히든 레이어를 추가하여 더 높은 정확도의 모델을 만듭니다.

## 4. Beyond Gradient Descent
- The Challenges with Gradient Descent
- Local Minima in the Error Surfaces of Deep Networks
- Model Identifiability
- How Pesky are Spurious Local Minima in Deep Networks?
- Flat Regions in the Error Surface
- When the Gradient Points in the Wrong Direction
- Momentum-Based Optimization
- A Brief View of Second Order Methods
- Learning Rate Adaptation
- AdaGrad - Accumulating Historical Gradients
- RMSProp - Exponentially Weighted Moving Average of Gradients
- Adam - Combining Momentum and RMSProp
- The Philosophy Behind Optimizer Selection
- Summary

4장 부터는 더 심화된 알고리즘으로 들어갑니다. 예전엔 볼록하지만 않은(non-convex) 에러 함수의 최저값을 탐색하기 위해 레이어 별로 일일이(layer-wise greedy) 최적의 파라메타를 찾는 방법을 써왔습니다. 하지만 최근에는 렐루(ReLU) 뉴런과 함께 개선할 수 있는 여러 방법들이 나왔습니다. 2장에서 볼록하지만 않은(non-convex) 에러 함수를 탐색할 때 확률적 그래디언트 디센트(stochastic gradient descent)로 로컬 최저값(local minima)을 탈피할 수 있다고 했지만 로컬 최저값이 매우 낮은 경우에는 피할 수가 없습니다. 그렇다면 이런 로컬 최저값이 얼마나 자주 딥 뉴럴 네트워크에서 문제가 될까요? 로컬 최저값에 대한 오해가 있습니다.

뉴럴 네트워크에서 한 레이어의 뉴런의 위치를 바꾸어도 결과 값은 동일하게 되고 렐루(ReLU) 뉴런의 경우 입력 값에 K를 곱했다가 다시 출력 값을 K로 나누어도 뉴럴 네트워크의 결과는 동일하게 됩니다. 따라서 동일한 결과를 갖는 가능한 뉴럴 네트워크의 종류는 무수히 많게 됩니다. 하지만 이런 동일한 뉴럴 네트워크가 많이 있더라도 로컬 최저값은 모두 동일하기 때문에 문제가 되지 않습니다. 하지만 진짜 문제는 가중치의 변화에 따라 나타나는 가짜 로컬 최저값입니다. Ian Goodfellow가 쓴 논문의 내용을 인용하면서 가중치 파라메타 공간에서의 변화를 선형적으로 추적해나가는 과정을 앞서 만든 뉴럴 네트워크를 이용하여 진행합니다. 이를 이용하여 딥 뉴럴 네트워크에서 SGD(stochastic gradient descent)가 로컬 최저값으로 인해 갇히지 않는다는 것을 보여줍니다.

로컬 최저값(local minima)나 로컬 최대값(local maxima) 등을 크리티컬 포인트(critical point, 임계값)라고 합니다. 새들 포인트는 이들 중간에 위치한 크리티컬 포인트입니다. 최근의 발표된 논문처럼 고차원에서는 로컬 최저값이 발생할 가능성이 매우 낮고 대부분 이들은 새들 포인트(saddle point, 안장점)라는 것을 설명합니다. 새들 포인트에서의 그래디언트를 향해 움직이는 방향은 로컬 최저값을 향한 방향이 아닐 수 있습니다. 따라서 이차 미분(second derivatives)을 통해 그래디언트의 변화 방향을 보정하여 최적값을 찾아 나아갈 수 있습니다. 하지만 이 때 헤시안(Hessian) 매트릭스를 계산해야 하는 비용이 크기 때문에 다른 방법을 사용하게 됩니다.

모멘텀 기반(momentum-based)의 최적화는 이전의 그래디언트 값에 현재 위치에서의 그래디언트의 값을 더해서 로컬 최저값으로의 방향을 결정합니다. 이전 위치에서의 그래디언트 값의 얼만큼을 반영할 지 결정하는 모멘텀 파라메타는 또 하나의 하이퍼 파라메타가 됩니다. 랜덤한 시그널을 데이터를 생성하여 모멘텀 최적화가 어떻게 들쭉 날쭉한 시그널을 완만하게 따라가는지 예를 듭니다. 최근에 발표된 Nesterov 모멘텀 방식은 보다 민감하게 그래디언트를 변화시키지만 배치 그래디언트 방식 외에 미니배치(minibatch) SGD(stochastic gradient descent)에도 효과를 발휘하는 지는 아직 확실하지 않습니다. 텐서플로우에서는 아직 Nesterov 모멘텀 방식을 지원하지 않습니다.

최근에는 헤시안 매트릭스를 직접 계산하지 않고 거의 비슷하게 모사할 수 있는 방식이 연구되고 있습니다. 여기에는 컨주게이트(conjugate) 그래디언트 디센트, BFGS(Broyden-Fletcher-Goldfarb-Shanno) 알고리즘, L-BFGS 알고리즘이 있습니다만 널리 사용되지는 않고 있으며 텐서플로우에서도 아직 지원하지 않고 있습니다.

러닝 속도(Running Rate)가 너무 크면 로컬 최저값에 수렴하는 것이 어렵고 너무 작으면 학습 속도가 너무 느려지게 됩니다. 학습을 진행하면서 러닝 속도를 적절히 조절해 가는 방법으로 AdaGrad, RMSProp, Adam을 소개합니다만 자세한 예제를 들지는 않습니다. 가장 널리 사용되는 알고리즘은 미니배치 SGD, 모멘텀을 사용한 미니배치 SGD, RMSProp, 모멘텀을 사용한 RMSProp, Adam, AdaDelta(텐서플로우에서 아직 지원안됨)입니다.

## 5. Convolutional Neural Networks:
- Neurons in Human Vision
- The Shortcomings of Feature Selection
- Vanilla Deep Neural Networks Don’t Scale
- Filters and Feature Maps
- Full Description of the Convolutional Layer
- Max Pooling
- Full Architectural Description of Convolution Networks
- Closing the Loop on MNIST with Convolutional Networks
- Image Preprocessing Pipelines Enable More Robust Models
- Accelerating Training with Batch Normalization
- Building a Convolutional Network for CIFAR-10
- Visualizing Learning in Convolutional Networks
- Leveraging Convolutional Filters to Replicate Artistic Styles
- Learning Convolutional Filters for Other Problem Domains
- Summary

5장은 컨볼루션 뉴럴 네트워크에 대한 내용으로 채워져 있습니다. 이미지에서 얼굴을 찾아내는 예를 설명하면서 전통적인 머신러닝 방법으로는 어렵다는 점을 피력합니다. 2012년 토론토 대학의 AlexNet이 ImageNet 대회에서 약 16% 에러율이라는 놀라운 성과를 냄으로써 컴퓨터 비전분야에 딥 러닝 바람을 일으켰습니다. 딥 뉴럴 네트워크는 컴퓨터 비전 분야의 골칫거리인 특징(feature) 추출 부분을 없앨 수 있게 합니다. 하지만 단순하게 완전 연결된(full connected) 뉴럴 네트워크만을 사용하게 되면 파라메타의 수가 급격하게 늘어나게 되고 학습 데이터에 너무 오버피팅(overfitting)하게 됩니다.

컨볼루션 뉴럴 네트워크에서는 입력 레이어에서 특성(feature)을 추출하여 다음 레이어(feature map)를 만듭니다. 입력 레이어에 어떤 특징이 있는지를 찾기 위해 전체 레이어를 스캔하면서 비교하는 데 사용하는 패치를 필터라고 합니다. 컨볼루션 뉴럴 네트워크에서 필터는 레이어간에 뉴런이 연결되는 방식으로 표현됩니다. 이미지는 RGB 세개의 색깔로 이루어져 있어 이는 한 픽셀에 세개의 뉴런이 있는 것으로 표현될 수 있습니다. 즉 입력 레이어가 뉴런의 볼륨으로 표현될 수 있고 필터도 입력 데이터의 형태를 따라 볼륨으로 구성됩니다.

얼굴을 찾기 위해서는 얼굴의 여러 요소가 필요하듯이 컨볼루션 뉴럴 네트워크에서는 많은 필터가 사용됩니다. 한 레이어에 여러 필터가 적용되어 출력되는 데이터는 다음 레이어에서 필터당 한층씩 겹겹히 쌓이게 됩니다. 필터에 따라오는 하이퍼파라메타는 필터의 넓이와 높이, 필터의 적용 간격(stride), 입력 이미지의 일정 테두리를 0으로 채우는 패딩 등이 있습니다. 패딩과 필터를 적용하여 출력값을 계산하는 예를 그림을 통해 설명하고 텐서플로우의 conv2d 함수를 설명합니다.

특징 맵(feature map)을 타일처럼 일정한 사이즈로 잘라서 각 조각안의 가장 큰 값을 대표 값으로 새로운 특징 맵을 만드는 맥스 풀링(max pooling)에 대해 설명합니다. 맥스 풀링은 이미지의 작은 변화에도 결과 값이 크게 영향을 받지 않는 특징을 가집니다. 그리고 ImageNet에 참여했던 VGGNet의 컨볼루션 네트워크의 구조를 통해 컨볼루션 레이어와 풀링 레이어를 어떻게 쌓고 있는지를 예로 보여줍니다. 그런 후 MNIST 데이터를 가지고 컨볼루션 뉴럴 네트워크를 구현해 봅니다. 이 예에서는 컨볼루션과 맥스 풀링을 두번 반복한 후 드롭 아웃, 소프트맥스 함수를 거치도록 구성하였습니다.

MNIST 이미지는 미리 잘 정돈된 것이지만 실제 이미지는 어떤 형태를 가질지 예측할 수 없습니다. 따라서 이미지를 전처리하는 과정이 필요한데요. 이를 위해 텐서플로우에서 제공하는 여러 함수들을 아주 간단히 소개합니다. 그리고 2015년 구글에서 제안한 배치 노말라이제이션(batch normalization) 기법을 소개합니다. 뉴럴 네트워크에서 레이어 간의 입력 데이터의 편차를 줄이기 위해 제안된 방법으로 학습속도와 정확도를 향상시킬 수 있습니다. 텐서플로우에 있는 batch_norm_with_global_normalization 함수를 이용하여 간단한 예제를 보여 줍니다. CIFAR-10 데이터셋을 학습시켰 경우 배치 노말라이제이션을 했을 경우와 안했을 경우 성능 차이를 예제를 통해 보여 줍니다.

## 6. Embedding and Representation Learning

## 7. Deep Learning Models for Sequence Analysis

## 8. Memory-Augmented Deep Learning Models

## 9. Generative Deep Learning Models

## 10. Deep Reinforcement Learning

## 11. Towards General Unsupervised Learning

## 12. Training Extremely Deep Neural Networks
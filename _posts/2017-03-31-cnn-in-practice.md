---
layout: post
title: CNNs in Practice
date: 2017-03-31
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [CNNs in Practice](http://nmhkahn.github.io/CNN-Practice)
* Authors: NamHyuk Ahn

---

CNNs in Practice
================

Contents
--------

-   Data augmentation
-   Transfer learning
-   How to stak layers?
-   How to compute network?
-   Floating point precision

Data augmentation
-----------------


![](http://nmhkahn.github.io/assets/CNN-Practice/augmentation.png)

Data augmentation은 CNN의 성능을 높이기 위해 사용하는 방법이다. 위
그림과 같이 학습(혹은 테스트) 이미지를 디스크에서 읽은 후, 이미지를 여러
방법을 통해 변형(transform) 한 뒤에 네트워크의 입력 이미지로 사용하는
방식이다. 만약 고양이 이미지에서 모든 픽셀을 오른쪽으로 1칸 이동하여도
사람의 눈에는 같은 이미지로 보인다. 하지만 컴퓨터는 이미지를 픽셀 벡터의
형태로 표현하고 인식하기 때문에 1픽셀씩 이동한 고양이 이미지는 원본
이미지와 다른 것으로 인식하게 된다. 이를 해결하기 위해 data
augmentation을 사용하는 것이다.

다시 정리하자면 data augmentation은 **이미지의 레이블을 변경하지 않고
픽셀을 변화 시키는 방법**이며, **변형된 데이터를 이용하여 학습을
진행**한다. 또한 AlexNet부터 지금까지 거의 모든 네트워크들이 data
augmentation을 사용하는 등, **매우 보편적으로 사용**되는 방법이다. 그럼
data augmentation은 어떤 방법을 사용하여 이미지를 변형하는지 알아보자.

## Horizontal flips



![](http://nmhkahn.github.io/assets/CNN-Practice/flip.png)



가장 간단한 방법으로 이미지를 좌우 반전 시키는 것이다. 이 방법 자체만
사용하는 경우는 드물며 아래에 설명한 다른 다양한 방법과 결합하여
사용하는 편이다.

## Random crops/scales



![](http://nmhkahn.github.io/assets/CNN-Practice/crops.png)



이미지를 랜덤하게 자르거나, 스케일링 하는 방법이다. 학습 단계에서는 왼쪽
그림처럼 이미지를 랜덤하게 자르거나 스케일링 한 샘플을 사용한다.
예를들어 ResNet에서는 L을 \[256, 480\]사이의 숫자 중 선택하고, 이미지의
작은 변이 L이 되도록 리사이징한다. 리사이징된 이미지는 224x224의 크기로
랜덤하게 잘라져서 입력 이미지에 사용하게 된다.\
테스트 단계에서는 학습 단계와 약간 다른 방법을 사용하는데, 랜덤하게
잘라진 몇개의 이미지의 출력값을 평균내는 방식을 사용하여 평가한다.
ResNet은 {224, 256, 384, 480, 640}의 L을 사용하며, 모든 사이즈마다
오른쪽 그림처럼 5개x2(flip하기 때문에)의 224x224 이미지를 입력 이미지로
사용한다.

## Color jittering



![](http://nmhkahn.github.io/assets/CNN-Practice/jitter.png)



간단하게는 이미지의 채도를 랜덤하게 노이즈를 주는 방식을 사용할 수 있고,
조금 더 복잡하게는 학습이미지 셋의 픽셀들을 R,G,B 채널마다 PCA를 적용할
수도 있다. PCA를 이용한 방법도 AlexNet, ResNet등 다양한 네트워크에서
사용하였다.

## etc.. 

이외에도 data augmentation은 다양한 방법을 적용하여 사용할 수 있다. 예를
들어 이미지를 translation, rotation, shearing등의 transformation을
사용하는 경우도 많다.

정리하자면 data augmentation은 학습 단계에서 다양한 랜덤 노이즈를 준 뒤
사용하며, 테스트 단계에서는 노이즈를 준 셋들을 평균내는 방식이다. 사실
data augmentation의 동작 방식은 dropout, dropconnect, BN, 모델
앙상블같이 regularizor의 역할을 하는 방법들도 비슷한 역할로 동작하는
매우 일반적인 것이다.

## Conclusion

data augmentation은 외부 라이브러리를 사용한다면 쉽게 구현할 수 있는
방법이고 특히 학습 데이터셋이 작다면 data augmentation을 사용하는게 매우
효과적이다.\
참고로 강의도중 어떤 학생이 data augmentation은 on-line으로 진행하는지
아니면 off-line으로 미리 저장해놓고 사용하는지 질문을 했는데, 답변으로
만약 off-line으로 사용한다면 디스크 공간을 매우 많이 잡아먹기 때문에
네트워크의 학습 혹은 테스트와 동시에 on-line 방식을 사용한다고 하였다.
이 때 GPU에서는 (GPU가 있다면..) 네트워크의 학습, 테스트와 관련된 일을
하고 이와 동시에 CPU에 쓰레드를 하나 만들어 이 쓰레드에서 다음
mini-batch의 augmentation을 pipeline을 하나 만들면 큰 overhead 없이
적용할 수 있다.

Transfer Learning
-----------------


흔히 생각하는 뉴럴넷에 대한 편견은 “CNN을 학습시키는데 많은 데이터와
GPU가 필요하지 않을까?” 이다. 꼭 그렇진 않다. Transfer Learning과
fine-tuning을 사용하면 비교적 적은 데이터로도 괜찮은 성능을 낼 수 있다.



![](http://nmhkahn.github.io/assets/CNN-Practice/vggnet.png)



위 이미지와 같은 VGGNet을 어떤 도메인에 사용해야 할 경우가 있다고
생각해보자. 맨땅에 VGGNet을 학습시키기 위해서는 매우매우 많은 데이터가
필요하고, 학습하는데 걸리는 시간도 매우 긴 것은 사실이다 (2\~3주 걸린
것으로 알고 있다). 하지만 VGGNet의 pre-train된 모델을 구할 수 있다면
(Caffe model zoo) 이를 갖다가 사용하면 문제가 매우 쉬워진다.

만약 적용해야 하는 **도메인의 데이터셋이 작다면** VGGNet의 끝에 있는
FC-1000과 softmax 레이어를 지워버리고 내게 맞는 도메인 예를 들어
CIFAR-10이라면 FC-10, softmax로 바꾼다. 또 softmax 대신 SVM을 사용하거나
다른 loss function을 사용하거나.. 뭐 자기 마음이다. 그리고 네트워크를
학습 할 때 기존의 레이어는 pre-train된 모델의 weight, bias를 그대로
사용하고 추가한 레이어만 학습을 시킨다. 모든 레이어를 학습시키면 좋은
성능이 나올지는 모르지만 적은 데이터셋에서는 그렇게 효과적인지 의문이고
가장 큰 문제는 학습이 오래걸린다..

**도메인의 데이터셋이 적당히 있다면** 추가한 레이어와 그 위 몇개
레이어를 (그 위 maxpool과 conv 2개 정도?) fine-tune한다. 데이터가 많으면
많을 수록 fine-tune하는 레이어를 늘려도 괜찮고 데이터가 꽤 많으면 모든
레이어를 학습시키는 것도 고려할 수 있다.\
**fine-tune을 할 때 한가지 팁**은 새로 추가한 레이어의 learning\_rate는
기존 네트워크에서 사용한 것 보다 10배 작게, 중간 레이어들은 100배 작게
learning\_rate를 사용하는 게 좋다고 한다.

정리하자면 다음과 같다.

-   **도메인이 기존 데이터셋과 비슷하고, 데이터가 적다** : 끝 레이어(top
    layer)에 도메인에 맞는 레이어를 추가하고 추가한 레이어만 학습한다.
-   **도메인이 기존 데이터셋과 비슷하고, 데이터가 많다** : 추가한
    레이어와 몇개 레이어를 fine-tune 한다.
-   **도메인이 기존 데이터셋과 매우 다르고, 데이터가 적다**
    : 큰일이다…..
-   **도메인이 기존 데이터셋과 매우 다르고, 데이터가 많다** : 많은
    레이어를 fine-tune 한다.

뉴럴넷의 얕은 레이어(입력 이미지와 가까운 레이어)는 edge나 texture를
검출하는 등의 역할을 하는 이미지에 대해 매우 포괄적으로 사용 가능한
레이어이다. 반면에 깊은 레이어는 학습에 사용된 데이터셋에 specfic하기
때문에 얕은 레이어도 fine-tune하면 물론 좋지만, 꼭 그럴 필요는 없다.\
마지막으로 transfer learning에 대해 요약하면, **만약 이미지셋이
100만개보다 적다면 pre-train 모델을 사용하라** 로 요약할 수 있겠다.

How to stack layers?
--------------------


사실 이 주제도 VGGNet 등의 포스트에서 언급한 내용이지만… 다시 한번
정리해보도록 하겠다.



![](http://nmhkahn.github.io/assets/CNN-Practice/q1.png)



위의 그림에서 두번째 레이어의 뉴런 한개에 해당되는 입력 레이어의 뉴런은
몇개일까?\
정답은 5x5이다. 문제를 조금 어렵게 서술하긴 했는데 찬찬히 생각해보면
왜인지 알 수 있을 것이다. (원문은 How big of a region in the input does
a neuron on the second conv layer see? 이다) 3개의 3x3뉴런은 입력
레이어의 7x7영역에 해당되는 부분을 본다. 이 의미는 3개의 3x3 레이어는
1개의 7x7 레이어와 비슷한 representation 능력을 갖는다는 의미이다.

입력으로 H x W x C 의 이미지가 들어오고, C 개의 width를 가지는 레이어가
있다고 가정하자. 이 때 stride는 1이고 출력 이미지의 H, W의 값은 입력값과
같다.

이 때 7x7 레이어 한개의 weight 개수는 \$C \\times (7 \\times 7 \\times
C) = 49C\^2\$ 이며, 3x3 레이어 3개의 weight의 개수는 \$3 \\times C
\\times (3 \\times 3 \\times C) = 27C\^2\$ 이다. 뿐만 아니라 곱셈과 덧셈
연산의 경우도 7x7 레이어는 \$49HWC\^2\$, 3개의 3x3 레이어는 \$27HWC\^2\$
이다.

작은 필터를 사용하는 레이어는 **parameter도 더 적고**, **연산도 더
적게**하는데다, ReLU와 같은 **non-linearlity를 더 많이 사용**할 수 있다.
더 많은 non-linearlity는 네트워크를 더 discriminative하게 만들 수 있기
때문에 좋다. 때문에 많은 네트워크들은 작은 필터 사이즈를 사용한다.

3x3보다 더 작은 1x1 필터도 있지만 1x1은 receptive 영역이 없기 때문에
convolution을 하는데 큰 의미는 없다. 하지만 1x1은 다른 목적으로 많이
사용되고 있다. (ResNet, NIN, Inception..)



![](http://nmhkahn.github.io/assets/CNN-Practice/bottleneck.png)



1x1 필터는 위 그림과 같이 사용된다. 위 구조는 bottleneck 구조라고
불리는데 살펴보면 먼저 1x1 conv를 통해 width를 절반으로 줄인다. 그 후
원래 목표인 3x3 conv를 하고 다시 1x1 conv를 이용해 절반으로 줄였던
width를 원상복귀 시킨다.

bottleneck 디자인은 \$3.25C\^2\$ 개의 parameter를, 기본 3x3 레이어는
\$9C\^2\$ 개의 parameter를 가지며 더 적은 parameter는 연산도 더 적음을
의미하기 때문에 성능면에서 이점을 가지고 더 많은 non-linearlity를
포함한다.



![](http://nmhkahn.github.io/assets/CNN-Practice/squeezing.png)



작은 필터는 항상 좋다. 하지만 3x3보다 작은 필터는 없다. 과연?\
사실 필자는 이 디자인을 Inception-ResNet에서 처음 봤는데 이 디자인을
보고 뭔가 싶었다. 3x3 대신 1x3, 3x1을 차례대로 적용시키면 더 적은
parameter를 가진다. 정말 성능을 squeezing하는데 도가 텄다라는 생각이
든다.



![](http://nmhkahn.github.io/assets/CNN-Practice/inception-v3.png)



GoogLeNet의 최신 버전 중 하나인 inception-v3가 factorize 방식을
사용하였다. 몇일 전 발표된 inception-v4와 inception-ResNet 또한 이
factorize 방식을 사용하였는데, 성능을 최대로 끌어올려야 하는
네트워크들의 특성상 아마 이 방식이 점차 주류가 되지 않을까 하는 생각을
한다.

## Conclusion

-   큰 필터 대신 작은 필터 (3x3)를 사용하라.
-   1x1 bottleneck 디자인은 성능 향상에 효과적이다.
-   NxN 레이어는 1xN, Nx1 레이어로 factorize 할 수 있다.
-   위 방법들을 사용하면 적은 parameter와 연산, 더 많은
    non-linearity라는 장점을 얻을 수 있다.

How to compute network?
-----------------------


parameter를 줄이는 방법을 통해 성능을 향상시킬 수 있지만 CNN은 최소한
어느정도 이상의 convolution 연산을 필요로 한다. 그럼 convolution을
최대한 빠르게 하는 방법은 무엇이 있을까?

## im2col

다양한 알고리즘과 특히 GPGPU를 이용하면 행렬의 곱셈을 매우 빠르게 할 수
있다. im2col은 convolution 연산을 행렬의 곱으로 변환하여 성능을 높이자는
것이다.



![](http://nmhkahn.github.io/assets/CNN-Practice/im2col.png)



위 그림은 im2col이 어떤식으로 동작하는 지를 나타낸다. 먼저 \$H \\times W
\\times C\$ 크기의 feature map을 \$(K\^2C) \\times N\$ 으로 reshape
한다. 이 때 \$K\$는 필터의 크기를 의미한다. \$K \\times K \\times C\$
꼴의 필터도 \$D \\times (K\^2C)\$의 형태로 reshape 해준다. 그 후 두
행렬을 곱하면 \$D \\times N\$의 출력 tensor가 나온다.

사실 im2col 방식을 사용하면 행렬로 reshape 할 때의 overhead와, 만약
overlap하게 필터를 convolution 하는 경우 행렬에 나타나는 element들이
중복된다는 문제가 있지만 실제 사례에서는 무시하고 im2col 방식을 사용하는
것 같다. 실제로 Caffe 라이브러리는 im2col을 이용하여 행렬로 변환하고
cuBLAS로 행렬의 곱을 빠르게 구하는 방식을 사용한다.

## FFT

사실 Fourier transform을 배워본적이 없어 어떻게 동작하는지는 잘
모르지만, \$f\$와 \$g\$의 convolution은 fourier transform한 결과를
element-wise product한 결과와 같다고 한다. FFT를 이용하면 fourier
transform을 \$O(NlogN)\$으로 할 수 있다. (행렬의 곱은 \$O(n\^3)\$ 이다)

만약 FFT를 사용하면 다음의 과정을 거쳐 연산을 하게 된다.

1.  weight들의 FFT를 계산한다 : \$F(W)\$
2.  이미지들의 FFT를 계산한다 : \$F(X)\$
3.  element-wise product를 구한다 : \$F(W) \\cdot F(X)\$
4.  구한 FFT의 inverse를 구한다 : \$Y = F\^{-1} (F(W) \\cdot F(X))\$



![](http://nmhkahn.github.io/assets/CNN-Practice/fft.png)



[N Vasilache., 2014](http://arxiv.org/abs/1412.7580) 에 의하면 FFT를
이용한 방식은 큰 필터에서 매우 효과적이지만 3x3과 같은 작은 사이즈의
필터는 큰 성능 향상을 보이지 않다고 한다.

## Fast algorithms

일반적인 행렬 곱은 \$O(N\^3)\$이다. 알고리즘 시간에 배웠던 기억만 나는
스트라슨 알고리즘을 행렬곱에 사용하면 \$O(N\^(log2(7)) \~ O(N\^2.81)\$로
성능 향상을 할 수 있다. [A Lavin.,
2015](http://arxiv.org/abs/1509.09308) 은 3x3 필터에 대해 스트라슨
알고리즘을 이용한 특별한 방법을 사용하고, GPU 연산을 최적하하여 높은
성능 향상을 보였다.

## Conclusion

-   im2col은 구현하기 쉽지만, 메모리 overhead가 크다.
-   FFT는 큰 필터의 경우 좋은 성능 향상을 보인다.
-   Fast Algorithm은 좋은 방법이지만 아직 많이 사용되고 있지는 않다.


Implementation details
----------------------

사실 크게 중요한 내용 (분산처리에 대해 다루긴 했다)이 없어서 간단한
요약만 하려고 한다.

-   GPU는 CPU보다 좋다
-   큰 문제의 경우 분산 처리를 이용하여 학습시키면 효과적이다
-   CPU - GPU와 CPU - disk 사이의 병목현상을 유의해야 한다

Floating Point Precision
------------------------


대부분 프로그래밍을 할 때 64bit의 double precision을 이용하여 실수
계산을 한다. 반면 메모리와 계산 성능상의 문제 때문에 CNN은 32bit의
single precision을 사용한다. 더 나아가 16bit의 half precision도 점차
많이 사용해 나가는 추세인데 cuDNN은 이미 16bit 실수 계산을 지원한다고
한다. Fast algorithms에서 언급한 논문에서 fp16을 사용한 커널이 현재 가장
빠른 연산을 할 수 있다.



![](http://nmhkahn.github.io/assets/CNN-Practice/16fp.png)



사실 16fp를 사용하면 왼쪽 그래프처럼 제대로 수렴하지 못하는 문제가
생기지만, [S Gupta., 2015](http://arxiv.org/abs/1502.02551)에 의하면
stochastic rounding 방식을 사용하면 비슷한 성능을 낼 수 있다고 한다.

이 외에 [Courbariaux et al, 2015](http://arxiv.org/abs/1602.02830) 는
10bit의 activation과 12bit의 parameter를 사용하는 방식을 제안하였으며,
심지어 최근에는 1bit를 이용하여 activation과 weight를 표현하자는 제안도
나오게 되었다. activation과 weight는 -1과 +1로 나타내며, 곱셈은 XNOR
비트연산으로 대체할 수 있다. 대신 gradient는 비교적 높은 precision을
사용한다고 한다.

레퍼런스 
--------

이미지와 내용은 모두 CS231n 강의 노트와 강의를 참고하였습니다.
[CS231n](http://cs231n.stanford.edu/syllabus.html)






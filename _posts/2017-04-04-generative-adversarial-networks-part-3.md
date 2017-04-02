---
layout: post
title: Generative Adversarial Networks - Part III
date: 2017-04-04
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Generative Adversarial Networks (3)](http://www.khshim.com/archives/218)
* Authors: [khshim](http://www.khshim.com/archives/author/skhu20)

---

Generative Adversarial Networks - Part III
===================================

Measures
--------

Generative model(생성모델)의 성능을 판단하고 논문에 싣는 것은 쉽지
않습니다. 아무래도 정확도로 바로 나타낼 수도 없고, 사람마다 느끼는 바도
다 다르기 때문입니다. GAN이 만든 이미지가 ‘얼마나’ 정확한지에 대한
이야기를 하기 위해서는 그에 맞는 측정 방법(measure, criteria)이
필요합니다. 아무래도 제일 쉽게 사용할 수 있는 방법은 <font color="red">선호도
조사(preference test)</font>입니다. 여러 명의 사람에게 무작위로 이미지를
보여주고 몇 점을 주겠는지 물어보는 방식입니다. 이 방법은 주관적일 뿐만
아니라, 주로 자기 편을 들어줄 근처 연구실 사람들에게 부탁하기 떄문에
엄청 많은 사람에게 부탁하지 않는 이상(그리고 부탁한다고 해도) 신뢰도가
많이 떨어지는 방법입니다. 그 외에 인간이 직접 분류기가 되어 이 이미지가
원본인지 제대로 만든 것인지에 대해 답을 붙일 수도 있습니다. 이렇게
계산한 에러율(human error rate)은 보통 원본은 90% 이상 원본이라고
하지만, 생성한 이미지는 초기 GAN의 경우 10% 정도만 원본이라고 하기도
합니다. 두 모두 수치적으로 검증해 볼 방법이 별로 없습니다. 객관적인
지표를 소개하기 앞서, 우선 아직까지 생성모델에서 명확하게 사용하는
공통적인 측정 방법은 없는 것 같다는 사실을 먼저 밝힙니다. 처음 GAN
논문에서는 <font color="blue">Parzan window based likelihood(파첸 창 기반의 유사도
측정)</font>이라는 방식을 사용해 생성한 이미지와 원래 이미지가 얼마나 유사한지
비교했지만, <U>이후 논문에서는 잘 사용되지 않고 있습니다.</U>

GAN 뿐만 아니라 생성 모델을 다룬 연구에서는 측정 방법보다 훨씬 중요한 정보가 있어야 합니다.

-   이미지를 그대로 외워서 내보내는 것이 아니라는 점을 확인해 줘야 합니다.
-   잠재 공간(latent space)에서 움직일 때 부드러운 전환(transition)이 일어나야 합니다.

첫째 정보를 검증하기 위해서 논문들에서는 생성한 이미지와 (어떤 방식으로든 측정해서) 가장 유사한 이미지를 같이 표시합니다. 
혹은, 훈련 데이터를 오직 한 번만 보고도(*only one epoch*) 이미지를 잘 만들 수 있다는 것을 보여줘야 합니다. 
둘째 정보를 검증하는 예시는 이미 앞에서 많이 나왔습니다.

Deep Convolutional GAN
----------------------

CNN을 이용하는 GAN의 경우 [1] 이전에도 몇 가지가 있었지만, 이 논문은 특히 압도적인 성능과 계층적인(hierarchical) 표현을 학습할 수 있다는 점 덕분에 독보적인 논문입니다. 
페이스북 팀이 포함되어 있기도 합니다. 
이 논문에서 사용한 구조는 줄여서 **DCGAN**이라고 하며, 제일 유명한 구조입니다.
무엇보다, <U>GAN이 거의 언제나 훈련이 되도록 해 줍니다!</U> 
DCGAN에서 제안하는 다섯 가지 테크닉은 이 논문이 처음 나온 이후 모든 GAN에서 사용되고 있습니다. 
DCGAN 구조를 따랐다고 하면 다음 다섯가지를 따라 만든 것입니다.

-   풀링(pooling) 대신 <font color="blue">간격을 둔 컨볼루션(strided convolution)</font>을 하고 <font color="blue">분수 컨볼루션(fractional convolution)</font>을 할 것.
-   *배치 표준화(batch normalization)*을 전부 적용하되, 생성기의 제일 끝 레이어와 분류기의 제일 첫 레이어에는 넣지 않을 것.
-   <font color="red">Fully-connected 층을 전부 빼고 사용할 것.</font>
-   생성기의 마지막 층에는 tanh, 그 외 층에는 전부 ReLU.
-   분류기는 전부 Leaky ReLU.

![fig1](https://i1.wp.com/khshim.files.wordpress.com/2016/09/fig12.png?resize=688%2C290&ssl=1)

(출처: [1]의 Figure 1) 분명 CNN 인데, 다음 맵의 크기가 계속 커집니다.
이 구조를 보고 <font color="red">*역 컨볼루션(deconvolution)*</font>이라고 부르는 사람이 있는데
<font color="red">그건 용어를 잘못 쓰는 거라고 논문에서는 명시</font>하고 있습니다. 아마도 원래
역 컨볼루션이 있기 때문인 것 같습니다. 위 그림에서 보면 풀링이 하나도
없고, 분수 컨볼루션으로 크기를 키워나가고 있는 것을 확인할 수 있습니다.

정확한 명칭은 분수 크기의 간격으로 하는 컨볼루션(*fractionally-strided convolution*), 혹은 순서가 뒤집힌 컨볼루션(*transposed convoluton*)입니다.
[2]의 강의 슬라이드를 보면 좀 더 잘 파악할 수 있습니다.

LSUN, Face, Imagenet에 대해 실험했습니다. LSUN의 경우 특히 데이터의 중복을 없애기 위한(deduplication) 자동 인코더(autoencoder) 이진(binary)화를 통한 전처리를 하는데, GAN과 직접적인 관련은 없어 보입니다.

![fig2](https://i2.wp.com/khshim.files.wordpress.com/2016/09/fig22.png?resize=688%2C350&ssl=1)

(출처: [1]의 Figure 3) 5번 epoch를 지난 후 생성한 방들의 이미지인데, 제 눈에는 거의 완벽한 침실 이미지인것 같습니다.

GAN이 효과적으로 이미지를 생성한다면 GAN의 생성기 G와 분류기 D에 들어
있는 특징 추출(feature extraction) 기능도 꽤 좋을 것이라고 생각할 수
있습니다. 즉, D와 G 모두 좋은 필터를 학습한다는 것입니다. 그래서 DCGAN은
다른 비지도학습(unsupervised learning) 으로 얻어진 필터와 자신들의
필터를 분류 문제에 사용해 보는 것으로 성능을 추가로 검증하기도 합니다.
여기서는 D의 필터를 가져다 써서 검증합니다.

![fig3](https://i1.wp.com/khshim.files.wordpress.com/2016/09/fig32.png?resize=688%2C690&ssl=1)

(출처: [1]의 Figure 4) 잘 보면, 왼쪽에서 오른쪽 끝까지 이동한 후 다시
다음 줄의 왼쪽 끝으로 이어지는 이미지입니다. 없던 창문이 생기고, TV가
창문이 되는 등 다이나믹한 변화를 볼 수 있습니다. 노이즈 공간에서 서서히
이미지를 바꾸는 것을 잠재 공간 탐색(latent space walking)이라고 합니다.

이정도만 해도 DCGAN이 끝판왕이라고 할 수 있을 텐데, 거기서 더
나아갑니다. 이제는 G의 필터도 좋은 필터라는 것을 보여 줍니다. 두 가지를
더 시도하는데, 첫 번째는 ‘창문’을 그리는 방법을 의도적으로 잊게 했하는
것이고 두 번째는 단어 임베딩(word embedding)에서처럼 Z 공간에서의 덧셈과
뺄셈으로 생성하는 이미지를 변경시키는 것입니다.

![fig4](https://i2.wp.com/khshim.files.wordpress.com/2016/09/fig41.png?resize=688%2C147&ssl=1)

(출처: [1]의 Figure 6) 창문을 생성하는 필터를 찾아 모든 연결을 끊었을
경우, 원래 이미지와 새로 만든 이미지에서 창문이 있다 없어지는 것을
확인할 수 있습니다.

![fig5](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig51.png?resize=688%2C361&ssl=1)

(출처: [1]의 Figure 7) 선글라스를 끼고 있는 남성을 생성하는 경우의 Z
등 각 상황에 맞는 Z를 구하고 더해 새로운 사람을 생성해 냅니다.

이정도까지 해서 GAN이 좋다는 것을 보여주니, 그 이후 GAN 논문이 1년 사이
폭발적으로 등장해서 지금에 이르게 됩니다. 이후의 GAN들은 거의 대부분
DCGAN의 구조와 방법론을 사용합니다.

> [1] [Unsupervised Representation Learning with Deep Convolutional Generative Adversarial Networks](https://arxiv.org/pdf/1511.06434) – Alec Radford et al. – 2016 – ICLR
>
> [2] Transposed Convolution – Fei-Fei Li, Andrej Karpathy – 2015 – CS231n Stanford – [pdf](http://cs231n.stanford.edu/slides/winter1516_lecture13.pdf)



GAN and Z-space embedding
-------------------------

[3]는 이미지 왜곡 및 손실을 다시 복원해주는 것인데, 이 분야는 *이미지 재채색(image impainting)*이라고 합니다. 
[3]를 가능하게 해 주는 것은 손실 식을 새롭게 나눠 정의하기 때문입니다. 
첫 번째 항은 *개념손실(conceptual loss)*항이고, 두 번째 항은 *판단손실(perceptual loss)*항입니다. 
개념손실은 남자, 여자 등 보다 추상적인 측면에서의 정보이고 판단손실은 근처 픽셀과의 관계 등 좀 더 현실적인 측면에서의 정보입니다.

어딘가 손실이 발생한 이미지의 구멍을 메우기 위해서는 근처 픽셀의 값을 가져와 뭉개거나(interpolation), 완전히 다른 이미지에서 정보를 가져와 메우는 것이 기존 방법이었습니다. 
최근에는 빈칸 주변을 입력으로 받아 빈칸을 예측하는 딥러닝 구조도 나왔다고 합니다. [3]에서 생각한 방법은, 그렇다면 이 이미지를 Z로 되돌린 후 다시 생성하면 빈칸이 없지 않을까 하는
것입니다. 말은 되는데, 두 가지 문제가 있습니다.

* 첫 번째는 그 이미지를 생성하는 Z를 찾을 수 없다는 문제입니다. InfoGAN 같은 구조도 아닌데다, 빈칸이 많은 채로 Z를 찾으러 나서면 분명 엉뚱한 Z에 도달하게 됩니다. 
* 두 번째는, 도대체 어떻게 해야 Z 공간으로 다시 되돌아갈 수 있냐는 것입니다. 사실 두 번째가 해결이 되어야 첫 번째를 고민할 수 있겠습니다.

우선 왜곡되지 않은 이미지로 일반적인 DCGAN을 *사전학습(pre-training)* 시킵니다. 
그리고 이 인공신경망을 역전파(backpropagation) 방식으로 거슬러 올라가 원래 입력 Z를 찾습니다.
관련 방법은 DeepDream 등에서 소개되어 있다고 하니, Z를 찾는 것은 큰 문제가 없습니다. 
이제 첫 번째 문제이자 제일 중요한 문제로, 왜곡된 이미지에서도 어떻게 원래 이미지와 비슷한 Z를 찾는지가 남았습니다. 
여기서 위에서 소개한 두 가지 손실항을 사용해 다시 전체 구조를 학습시킵니다.

개념손실항은 문제가 있는 부분을 제외한 다른 부분이 얼마나 유사한가를 판단합니다. 
M은 이진 마스크입니다. 판단손실항은 D를 사용해 새로 만든 이미지가 얼마나 진짜같은지를 판단합니다.

![L_C = |M bigodot G(z) - M bigodot y|_1  L_P = log(1
-D(G(z)))  Loss = L_C + lambda L_P
](http://s0.wp.com/latex.php?latex=L_C+%3D+%5C%7CM+%5Cbigodot+G%28z%29+-+M+%5Cbigodot+y%5C%7C_1+%5C%5C+L_P+%3D+log%281+-D%28G%28z%29%29%29+%5C%5C+Loss+%3D+L_C+%2B+%5Clambda+L_P+&bg=ffffff&fg=000&s=1 "L_C = |M bigodot G(z) - M bigodot y|_1  L_P = log(1 -D(G(z)))  Loss = L_C + lambda L_P ")

![lambda ](http://s0.wp.com/latex.php?latex=%5Clambda%C2%A0&bg=ffffff&fg=000&s=1 "lambda ")는
보통 작은 값을 사용한다고 합니다. 최종적으로 생성한 이미지에서 빈 칸에
해당하는 부분만 가져와 원본 이미지에 채워 넣으면 됩니다. 푸아송
혼합(Poisson blending)으로 좀 더 부드럽게 연결되게 섞어주면 더 좋다고
합니다.

![fig6](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig61.png?resize=688%2C93&ssl=1)

(출처: [3]의 Figure 2) 순서대로 원본, 삭제본, 제안하는 방법으로 복원한
이미지, 판단손실항 없이 복원한 이미지입니다. 이미지가 얼마나 실제같은지
나타내는게 엄청 큰 영향을 줍니다.

![fig7](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig71.png?resize=688%2C343&ssl=1)

(출처: [3]의 Figure 4) CelebA 데이터로 복원한 이미지입니다. 이 정도면
성공이지요!

![fig8](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig8.png?resize=688%2C83&ssl=1)

(출처: [3]의 Figure 5) 실패한 이미지들입니다. 어느 정도 비율로
성공하고 실패하는지에 대한 이야기는 나와 있지 않은 것 같습니다.

그 외 SVHN 실험도 있는데, 8의 한 가운데 구멍을 내고 복원하라고 시키면
6으로 복원하기도 하고, 3의 한 가운데 구멍을 내고 복원하라고 시키면 5가
되기도 한다고 합니다.

[4]는 Adobe에서 후원하는 멋진 논문입니다. 우선 동영상 [5]부터
봅시다. 무궁무진한 응용을 할 수 있겠다고 상상하게 됩니다. [4]는 아직
이 세상에서 그림을 사용한 의사소통은 단방향이라고 아쉬워하는 말로 논문을
시작합니다. 사진을 보고 글로 감상을 쓰고, 글로 설명하면 그림을 그리는
식입니다. 그림을 그림으로 받고 바꾸고 이해하는것을 아마도 이상적으로
스스로를 표현할 수 있는 방법으로 여기는 것 같습니다.

DCGAN과 마찬가지로, 한 이미지에서 다른 이미지로 가는 것은 Z를  천천히
바꾸는 것으로 해결합니다. [4]의 특별한 점은, 제한(constraint)를 뒀을
때 이미지가 최대한 그 제한을 지키면서 생성되도록 하는 방식으로
훈련시키고 Z에서 점을 이동시킨다는 것입니다. 자세한 내용과 방법은 논문을
참고해 주세요.

![fig9.PNG](https://i2.wp.com/khshim.files.wordpress.com/2016/09/fig9.png?resize=688%2C278&ssl=1)

(출처: [4]의 Figure 8) 아무렇게나 스케치한 그림도 가장 비슷하게
찾아주는 것을 볼 수 있습니다. 이 논문에서 잊지 말아야 할 것은, 범용적인
이미지가 아니라 특정 종류의 이미지만으로 훈련한 GAN만을 사용했다는
것입니다. 모든 이미지에 대해서 이런 일을 할 수 있다는 것은 아닙니다.

DCGAN이 등장하면서, Z 공간으로의 이미지 임베딩의 길이 본격적으로 열린 것
같습니다. 제일 처음 GAN이 나왔을 때만 해도 노이즈를 더하는 것은 그냥
초기에 무작위 값을 준다는 느낌이었는데, 이렇게 본격적으로 좋은 성능을
내는 논문이 나오는 것은 신기한 것을 넘어 무시무시하기까지 합니다. 곧
포토샵에서 이 기능을 볼 수 있을 것 같군요!

> [3] [Semantic Image Impainting with Perceptual and Contextual Losses](https://arxiv.org/pdf/1607.07539) – Raymond Yeh et al. – 2016 – Arxiv
> 
> [4] [Generative Visual Manipulation on the Natural Image Manifold](https://arxiv.org/pdf/1609.03552v2.pdf) – Jun-Yan Zhu et al. – 2016 – ECCV
> 
> [5] GVM ECCV Youtube video – Jun-Yan Zhu – 2016 – [youtube](https://people.eecs.berkeley.edu/~junyanz/projects/gvm/)



Other GAN variants
------------------

[5]는 LeCun 팀에서 만든, (제 기준) 현존하는 최고 성능을 보여주는 생성
모델입니다. EBGAN이라고 합니다. 자동인코더(autoencoder) 스타일의 분류기
D를 사용하고, 0~1까지 점수를 내 판단하는 대신 이미지가 갖고 있는 에너지
E를 판단합니다. 에너지라고 해서 좀 낯설 수 있지만, 간단히 말하면
낮을수록 좋습니다. 모든 입력은 고차원 공간상의 어느 한 점으로
매칭됩니다. 매칭되는 점 부근에 다른 이미지들이 많으면 (즉, 밀도가 높은,
비슷한 이미지들이 많은 곳이면) 에너지가 낮고 그렇지 않으면 에너지가
높도록 하는 함수를 만들었습니다.

이 외에 [6]은 GAN과는 약간 다른 대립 구조를 사용해 훈련을 시도합니다.
BiGAN과 비슷한 느낌이 들기도 하는 구조인데, 변화형 자동인코더(VAE,
variational autoencoder)를 연구하던 팀이라 그런지 그 분야에서 영감을
많이 받은 논문인 것 같습니다.

[7] 은 GAN을 재귀(recurrent) 경로에 넣어 만들었다고 하는데, GAN 구조
자체에 재귀 경로가 들어간 것은 아닙니다. 자세한 것은 논문을 참고해
주세요. 이 논문의 appendix에 순서가 뒤집힌 컨볼루션에 대한 좀 더 자세한
내용이 나옵니다.

> [5] [Energy-Based Generative Adversarial Network](https://arxiv.org/pdf/1609.03126) – Junbo Zhao et al. – Arxiv – 2016
> 
> [6] [Adversarially Learned Inference](https://arxiv.org/pdf/1606.00704) – Vincent Dumoulin et al. – Arxiv – 2016
> 
> [7] [Generating images with recurrent adversarial networks](https://arxiv.org/pdf/1602.05110) – Daniel Jiwoong Im et al. – Arxiv – 2016


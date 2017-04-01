---
layout: post
title: Generative Adversarial Networks - Part I
date: 2017-04-02
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Generative Adversarial Networks (1)](http://www.khshim.com/archives/20)
* Authors: [khshim](http://www.khshim.com/archives/author/skhu20)

---

Generative Adversarial Networks - Part I 
===================================

## Fast Forward! GAN
Recorded at the Music, Art & Machine Intelligence 2016 workshop in San Francisco.

Emily Denton (New York University) shared her experiences with image modeling using generative adversarial networks, along with a machine generated demo.

<iframe width="600" height="400" src="https://www.youtube.com/embed/JEJk-Ug_ebI" frameborder="0" allowfullscreen></iframe>


GAN Introduction
----------------

*Generative Adversarial Network*, GAN은 한국어로 번역하면 “대립쌍 구조를 사용하는 생성모델”이라고 할 수 있습니다. 서로 대립하는 두 개의 네트워크를 만들고 대립 과정에서 훈련 타겟을 생성하는 방법을 알도록 학습시키는 구조입니다.[Quora](https://www.quora.com/What-are-some-recent-and-potentially-upcoming-breakthroughs-in-deep-learning)에서 Yann Lecun은 최근 등장한 놀라운 딥러닝 기술을 묻는 질문에 GAN이야말로 제일 중요한 연구가 될 것이라고 대답했습니다. 이 연구는 지금까지의 머신러닝이 잘 하지 못했던 것들, 더 나아가 인간만이 할 수 있는 것이라고 여겨졌던 것에 정면으로 반박합니다. 바로 지금까지 없던 것을 잘, 멋지게, 그럴 듯하게 창조해 내는 것입니다.

Generative vs Discriminative
----------------------------

머신러닝은 간단한 사고(*thinking*, *reasoning*)를 하는 기계를 만드는
것입니다. 그리고 대부분의 사고 문제는 알고 보면 **확률 문제**입니다.
수학같이 명확한 답이 있는 경우가 아닌 이상, 인간은 늘 확률에 기반한
사고를 하면서 살아갑니다. 다만 우리 스스로도 그것을 인지하지 못하고 있을
뿐입니다.

두 개의 random variable(확률변수) X, Y와 그 관계를 생각해 보겠습니다.
X가 0부터 9까지의 숫자가 그려진 이미지 데이터이고 Y가 그 이미지가
무엇인지 나타내는 정답이라고 할 때, 일반적인 머신러닝은 X가 주어졌을 때
Y가 나올 확률(*likelihood*)을 최대화하려고 합니다. 이를
*discriminative*(분류기) 모델이라고 하고, 이 모델을 이용한 학습을
*discriminative learning*(분류학습)이라고 합니다. 대표적인 분류 학습
모델이 logistic regression(선형회귀) 모델입니다.

![P(Y|X)
](http://s0.wp.com/latex.php?latex=P%28Y%7CX%29+&bg=ffffff&fg=000&s=1 "P(Y|X) ")

그런데 사실, <font color="red">입력과 출력이 있는 위와 같은 형태의 방식은 인간이 사고하는
방식이 아닙니다.</font> <font color="blue">인간은 X를 보고도 Y를 생각하고 Y를 보고도 X를
생각합니다. 즉, 창의력을 발휘하기 위해서는 **결합확률**(*joint
distribution*)을 학습해야 합니다.</font> 이 모델을 <font color="blue">*generative*(생성기) 모델</font>이라고
하고, 이 모델을 이용한 학습을 *generative learning*(생성학습)이라고
합니다. Y를 예측하기 위해 결합확률을 학습하고 Bayes rule(베이즈
법칙)으로 확률을 계산하는 방식입니다. 대표적인 생성 학습 모델은 <U>*naive
Bayes*(느긋한 베이즈) 모델</U>입니다.

![displaystyle P(X,Y) = P(Y|X)P(X) = P(X|Y)P(Y)  P(Y|X) = P(X,Y) /
P(X)
](http://s0.wp.com/latex.php?latex=%5Cdisplaystyle+P%28X%2CY%29+%3D+P%28Y%7CX%29P%28X%29+%3D+P%28X%7CY%29P%28Y%29+%5C%5C+P%28Y%7CX%29+%3D+P%28X%2CY%29+%2F+P%28X%29+&bg=ffffff&fg=000&s=1 "displaystyle P(X,Y) = P(Y|X)P(X) = P(X|Y)P(Y)  P(Y|X) = P(X,Y) / P(X) ")

두 모델 중 실제로 어느 것이 좋으냐는 논쟁의 여지가 있습니다. [1]에서는 <font color="blue">분류 학습기가 더 낮은 에러율을 보이는 대신 생성 학습기가 더 빠르게 학습한다</font>고 하며, 이는 충분한 데이터가 있을 때는 분류 학습기가 더 낮은 에러율을 보이지만 데이터가 충분하지 않을 때는 생성 학습기가 더 좋은 결과로 이어진다고 합니다. 개인적으로는 에러율을 따지는 것 자체가 분류 학습기에게 더 유리할 수 밖에 없다고 생각합니다. GAN이 나오기 전까지, 딥러닝 분야에서 생성 모델은 상대적으로 크게 주목받지 못했습니다. 특별히 Loss(손실)을 계산하고 back propagation(역전파 학습)을 시킬 수도 없었던 데다, likelihood(유사도)를 높이기 위한 정형화된 방법이 없었기 때문입니다.

> [1] On Discriminative vs. Generative classifiers: A comparison of
> logistic regression and naive Bayes – Andrew Ng, Michael Jordan – 2002
> – NIPS

Adversarial
-----------

*Adversarial process*(대립쌍 프로세스)는 <U>두 주체가 충돌하는 과정에서
발전이 일어나는 시스템</U>입니다. 공화당 대 민주당, 남성 대 여성, 노론 대
소론, 분류모델 대 생성모델 등이 그 예시라고 할 수 있습니다. 앞으로 이
글에서 분류모델은 D, 생성모델은 G로 칭합니다. [1]에서는 동일한 일을
하는 모델을 훈련시켜 둘을 비교했지만, 앞서 말한 이유로 G는 기존의
방법으로 훈련이 잘 안 된다는 단점이 있습니다. GAN은 이 문제를 엄청나게
똑똑한 방법으로 해결합니다. 대립쌍이 등장한다고 해서 G와 D가 대립하는
것은 아닙니다. <font color="blue">기존에 갖고 있던 정보(*evidence*)를 E라 하면, G와 E가
대립하고 D는 그 둘을 분류합니다!</font>

[2]에서는 이를 화폐 제조국과 화폐 위조범의 비유로 설명합니다. 화폐
제조국에서 만드는 지폐는 진짜 세상에 존재하는 제대로 된 데이터 E입니다.
한편, 화폐 위조범이 만드는 지폐는 분명 뭔가 떨어지는 짝퉁(counterfeit)인
G입니다. 지폐에 대해 별로 아는 게 없는 경찰 D에게 어떤 때는 G를, 어떤
때는 E를 가져다 주면서 이게 G인지 E인지 맞춰보라고 하는 것입니다. <font color="red">이게
대립쌍인 이유는, 화폐 위조범도 진화하지만 동시에 경찰도 진화하기
때문입니다.</font> 충분한 시간이 지나, 화폐 위조범이 엄청나게 일을 잘 하게 되면
D가 정답을 맞출 확률은 50%에 수렴하게 됩니다. (결국에는 위조범이 이기게
됩니다.) 이제, G는 사실상 E가 하는 일을 다 할 수 있습니다!

![gan-architecture](https://i2.wp.com/khshim.files.wordpress.com/2016/09/gan-architecture.png?resize=493%2C253&ssl=1)

이 게임은 **min-max 문제**입니다. *D는 분류에 성공할 확률을 높이려 하고, G는
분류에 성공할 확률을 낮추려 합니다.* 따라서 훈련을 위해 사용해야 할 손실
값은, D가 분류에 성공할 확률입니다. D는 주어진 데이터가 원본에 가깝다고
판단할 수록 1에 가까운 값을 내보냅니다.  X는 원래 데이터, Z는 아무렇게나
넣어 주는 노이즈입니다.

![L = min_G max_D L(D,G) = E_X[log D(x)] + E_Z[log (1-D(G(z)))]
](http://s0.wp.com/latex.php?latex=L+%3D+min_G+max_D+L%28D%2CG%29+%3D+E_X%5Blog+D%28x%29%5D+%2B+E_Z%5Blog+%281-D%28G%28z%29%29%29%5D+&bg=ffffff&fg=000&s=1 "L = min_G max_D L(D,G) = E_X[log D(x)] + E_Z[log (1-D(G(z)))] ")

![fig1](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig1.png?resize=688%2C233&ssl=1)

(출처: [2]의 Figure 1) 까만 점선은 E, 녹색 실선은 G, 파란 점선은 D를
나타냅니다. [3]에서는 위 예시를 실제로 구현해 놓은 코드와 동영상을
보여줍니다.

> [2] Generative Adversarial Nets – Ian Goodfellow et al. – 2014 –
> NIPS
> [3] An introduction to Generative Adversarial Networks(with code in
> Tensorflow) – John Glove
> – [blog](http://blog.aylien.com/introduction-generative-adversarial-networks-code-tensorflow/)

------------------------------------------------------------------------

GAN Training
------------

위 손실 식을 자세히 보면, 도대체 어떻게 훈련해야 하는지 잘 감이 오지
않습니다. 무작정 손실값을 줄이는 방향으로만 훈련할 수도 없습니다. 비슷한
아이디어는 가끔 있었지만, <U>딥러닝이 없던 때는 어떻게 훈련해도 경찰이
최종적으로 이겼던 것 같습니다.</U> <font color="blue">딥러닝의 놀라운 능력에 힘입어 GAN은
위조범이 최종적으로 이길 수 있도록 훈련시킵니다.</font> 하지만 그렇게 잘
훈련하기 위해서는 몇 가지 테크닉이 필요합니다. [2]의 GAN에서는 G와 D
모두 MLP(multi-layer perceptron)을 사용하고 랜덤 노이즈 Z를 사용합니다.

<font color="blue">첫 번째는 D와 G를 따로 훈련시키는 것입니다.</font> 
D와 G 모두 각각 제 갈길을 찾아 가면 결국 이도저도 아닌 결과가 될 수 있기 때문입니다. 
<U>*GAN에서는 여러 번 D를 훈련시키고 한 번 G를 훈련시키는 식으로 진행합니다.*</U> 
D는 늘 거의 최적점에 가까운 상태로 놓고 G를 천천히 이동시키게 됩니다.

<font color="blue">두 번째는 초기 훈련 때 손실 값을 약간 다르게 사용하는 것입니다.</font>
어느 정도 G와 D의 실력이 팽팽해지면 최적화가 개입할 여지가 있지만, 
랜덤 노이즈 Z를 넣는데 처음부터 G가 어느 정도는 알아볼 수 있는 이미지를 낼 것이라고 생각하기는 어렵습니다. 
처음부터 그렇게 훈련되면 대립쌍이 제 기능을 하지 못해 경찰은 너무 쉽게 정답을 찾고 위조범은 실력이 계속
제자리걸음을 하게 됩니다. 
같은 방향이더라도 처음에는 G의 점수가 엄청 낮기 때문에, 아래와 같이 손실 식을 잡는 것은 빠르게 점수를 높이는 방법이 됩니다.

![L_0 = max_D L(D,G) = E_X[log D(x)] + E_Z[log (1-D(G(z)))] 
L_1 = max_G L(G) = E_Z[log D(G(z))]  L_2 = min_G L(G) =
E_Z[log (1-D(G(z)))]
](http://s0.wp.com/latex.php?latex=L_0+%3D+max_D+L%28D%2CG%29+%3D+E_X%5Blog+D%28x%29%5D+%2B+E_Z%5Blog+%281-D%28G%28z%29%29%29%5D+%5C%5C+L_1+%3D+max_G+L%28G%29+%3D+E_Z%5Blog+D%28G%28z%29%29%5D+%5C%5C+L_2+%3D+min_G+L%28G%29+%3D+E_Z%5Blog+%281-D%28G%28z%29%29%29%5D+&bg=ffffff&fg=000&s=1 "L_0 = max_D L(D,G) = E_X[log D(x)] + E_Z[log (1-D(G(z)))]  L_1 = max_G L(G) = E_Z[log D(G(z))]  L_2 = min_G L(G) = E_Z[log (1-D(G(z)))] ")

훈련 알고리즘은 다음과 같습니다.

```python
for epoch in range(epochs):
for k in range(steps):
Z = m sampled examples
G(Z) = m generated examples
update D to increase L0

Z = m sampled examples
G(Z) = m generated examples
if stage is early:
update G to increase L1
else:
update G to decrease L2
```

놀랍게도, [2]에서 Goodfellow는 위 손실 식에 반드시 global optimum이 존재한다는 것을 증명하고 위 알고리즘을 사용하면 충분한 데이터가 있을 때 반드시 그 점에 수렴하며 도달할 수 있다는 것을 증명했습니다.

![fig2](https://i1.wp.com/khshim.files.wordpress.com/2016/09/fig2.png?resize=686%2C497&ssl=1)

(출처: [2]의 Figure 2) 왼쪽부터 5개 줄은 [2]의 GAN이 만들어낸
이미지들이고, 마지막 노란색 박스가 있는 1개 줄은 실제 데이터셋에서
비슷하다고 생각되는 데이터들을 나타낸 것입니다. 말도 안 되는 데이터도
있고, 그럴듯한 데이터도 있는 것을 확인할 수 있습니다.

Advanced GAN Training
---------------------

최근 나온 논문 [4]에서는 어떻게 하면 GAN을 좀 더 잘 훈련시킬 수
있는지를 다루고 있습니다. 처음 GAN이 나온 2014년과 이 논문 사이의 2년
동안 GAN에도 많은 변화가 있어서, [4]의 경우 최신 논문의 기법들을 일부
사용하고 있기도 합니다. 이 논문은 이렇게 하면 무조건 잘 된다는 방법을
소개하는 것은 아니고 이런저런 방법을 시도해 봤다 정도에 가깝습니다. 이
중 G를 잘 훈련시키는 2가지를 우선 소개합니다.

<font color="red">한 번에 D와 G가 모두 만족하는 방향으로 훈련하는 것은 대단히 어려운 일입니다.</font> 
이는 <font color="blue">*내쉬 균형점(Nash equilibrium)*</font>을 찾는다는 것인데,
아직까지도 이를 제대로 풀어내는 방법은 나와 있지 않다고 합니다. 
그래서 지금까지는 D와 G를 번갈아 훈련하는 방법을 사용했었습니다. 
그럼에도 불구하고 실제로 훈련할 때는 GAN이 훈련이 잘 되는 경우도 있었지만 안 되는
경우가 더 많았다고 합니다. GAN 훈련이 실패하는 경우 대부분은 D의 문제가
되기보다는 G가 늘 똑같은 이미지만을 만들어내는 상태가 되어버리는
것이라고 합니다. 즉, G를 아무리 훈련해도 *변곡점(saddle point)* 근처에서만
움직여서 보기에는 별 차이 없는 이미지만 계속 나오는 것입니다. 이 경우의
문제는 G가 훈련이 잘 되지 않는다는 점에서 당연히 문제가 되지만, G가 다른
입력에 대해 다른 결과를 내야 한다는 것을 학습하지 못한다는 점에서도
문제가 됩니다. 알고리즘에서 보듯이 한 번에 m개 결과를 다루다 보니,
점수의 평균이 얼추 맞는 상황에서는 손실 값도 작을 수 있습니다.

### Feature Matching

첫 번째로 제시하는 방법은 *feature matching*(특징 매칭)입니다. 동일한
방식으로 훈련하지만, G를 훈련할 때 D에서 얻는 점수를 직접 높이도록
훈련하지 않고 D 내부의 각 층에서 원래 데이터와 유사한 신호
값(activations)을 갖도록 훈련시키는 것입니다.

![L_3 = min_G L(D,G) = sum_i | E_X[f_i(x)] -
E_Z[f_i(G(z))] |^2 
](http://s0.wp.com/latex.php?latex=L_3+%3D+min_G+L%28D%2CG%29+%3D+%5Csum_i+%5C%7C+E_X%5Bf_i%28x%29%5D+-+E_Z%5Bf_i%28G%28z%29%29%5D+%5C%7C%5E2+%5C%5C+&bg=ffffff&fg=000&s=1 "L_3 = min_G L(D,G) = sum_i | E_X[f_i(x)] - E_Z[f_i(G(z))] |^2  ")

### Minibatch Discrimination

두 번째 방법은 *minibatch discrimination*(MD, 소배치 분리)입니다. 
분류가 아닌 분리라는 용어를 쓴 이유는, 소배치 내의 데이터들을 다 다르게 하도록
하는 것이 목적이기 때문입니다. 한 번에 여러 개의 이미지로부터 나온
결과를 동시에 보도록 하면 서로 다른 입력에 대해 서로 다른 결과를 내도록
학습이 됩니다. 이미 선례도 있습니다. 
실제로 이와 같은 방법으로 상관도(convariance)를 크게 낮추는 방법이 분류 모델에서의 *batch normalization*(BN, 배치 정규화)라고 할 수 있고, 요즘 GAN의 D에는 전부 BN이 들어 있습니다.

D의 각 레이어마다 MD를 수행하는 별도의 구조를 만들고, 두 결과를 붙여
다음 층으로 넘겨주게 됩니다. 각 레이어에 딸린 MD에서는 별도의
가중치(weight)가 소배치 데이터들이 얼마나 다른지를 검증합니다.

![X in R^{n times A}  W in R^{A times B}  Y = X
times W in R^{n times B}
](http://s0.wp.com/latex.php?latex=X+%5Cin+R%5E%7Bn+%5Ctimes+A%7D+%5C%5C+W+%5Cin+R%5E%7BA+%5Ctimes+B%7D+%5C%5C+Y+%3D+X+%5Ctimes+W+%5Cin+R%5E%7Bn+%5Ctimes+B%7D+&bg=ffffff&fg=000&s=1 "X in R^{n times A}  W in R^{A times B}  Y = X times W in R^{n times B} ")

![T in R^{A times B times C}  hat X = X times T in
R^{n times B times C}
](http://s0.wp.com/latex.php?latex=T+%5Cin+R%5E%7BA+%5Ctimes+B+%5Ctimes+C%7D+%5C%5C+%5Chat+X+%3D+X+%5Ctimes+T+%5Cin+R%5E%7Bn+%5Ctimes+B+%5Ctimes+C%7D+&bg=ffffff&fg=000&s=1 "T in R^{A times B times C}  hat X = X times T in R^{n times B times C} ")

![hat
X](http://s0.wp.com/latex.php?latex=%5Chat+X&bg=ffffff&fg=000&s=0 "hat X")를
해석하면, n개 데이터에 대해 각각이 B개의 C차원 데이터를 만든다고 할 수
있습니다. n=0인 경우만을 예로 들어 새로운 출력이 어떻게 나오는지를
살펴봅니다.

![hat X_0 in R^{B times C}  hat d_0^b =
sum_{j=1}^{n} left( exp(- |X_0^b - X_j^b|) right) in R
 hat Y_0 = [d_0^0, d_0^1, ... d_0^B] in R^B  hat
Y = [hat Y_0, hat Y_1, ... hat Y_n] in R^{n times B}
](http://s0.wp.com/latex.php?latex=%5Chat+X_0+%5Cin+R%5E%7BB+%5Ctimes+C%7D+%5C%5C+%5Chat+d_0%5Eb+%3D+%5Csum_%7Bj%3D1%7D%5E%7Bn%7D+%5Cleft%28+exp%28-+%5C%7CX_0%5Eb+-+X_j%5Eb%5C%7C%29+%5Cright%29+%5Cin+R+%5C%5C+%5Chat+Y_0+%3D+%5Bd_0%5E0%2C+d_0%5E1%2C+...+d_0%5EB%5D+%5Cin+R%5EB+%5C%5C+%5Chat+Y+%3D+%5B%5Chat+Y_0%2C+%5Chat+Y_1%2C+...+%5Chat+Y_n%5D+%5Cin+R%5E%7Bn+%5Ctimes+B%7D+&bg=ffffff&fg=000&s=1 "hat X_0 in R^{B times C}  hat d_0^b = sum_{j=1}^{n} left( exp(- |X_0^b - X_j^b|) right) in R  hat Y_0 = [d_0^0, d_0^1, ... d_0^B] in R^B  hat Y = [hat Y_0, hat Y_1, ... hat Y_n] in R^{n times B} ")

이 경우 ![hat
Y](http://s0.wp.com/latex.php?latex=%5Chat+Y&bg=ffffff&fg=000&s=0 "hat Y")는
소배치 간의 특징 차이를 통해 계산된 값이 됩니다. 소배치들 간에 특징
차이가 클 수록 값이 작아져 전체 네트워크에 미치는 영향은 줄어들고, 특징
차이가 작을수록 값이 커져 전체 네트워크에 영향을 많이 미치게 됩니다.

이 방법을 적용하고 새로 G가 만들어낸 데이터는 다음과 같습니다.

![fig3](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig3.png?resize=688%2C319&ssl=1)

(출처: [4]의 Figure 4) 어느 쪽이 원래 데이터이고 어느 쪽이 새롭게
기법을 적용한 데이터일까요? 왼쪽은 feature matching을, 오른쪽은
minibatch discrimination을 적용한 데이터입니다.

다음에 다루겠지만, GAN을 이용해 *semi-supervised learning*(준 감독학습)을
해 분류 문제를 해결하기도 합니다. 지금은 간단히, GAN의 경찰은 엄청
뛰어난 경찰이 된다는 것 정도로만 생각하고 있으면 되겠습니다. 
<font color="blue">분류를 잘하는 것이 목적인 경우 feature matching이 좋고, 정말로 그럴듯한 이미지를
만들어내는 것이 목적인 경우 minibatch discrimination이 좋다고 합니다.</font>
위에 소개한 두 가지 방법 외에도 몇 가지 방법을 더 소개하고 있습니다.
하지만 중요한 것은, 불안정하던 GAN 훈련 방법을 안정화(stabilize)시키는
데 도움이 되는 방법들이라는 것입니다.

> [4] Improved Techniques for Training GANs – Tim Salimans, Ian
> Goodfellow et al. – 2016 – Arxiv

-   사족(1) – 역사학에서는 세상의 발전을 대립축간의 충돌로
    해석하곤 합니다. 대립축으로는 풍요와 빈곤, 남성과 여성, 귀족과 노예,
    기독교와 이슬람교, 공화당과 민주당, 환경과 개발 등이 있습니다.
    인류는 대립축 사이에서 끊임없이 갈등을 겪으며 발전해 왔고, 꽤 자주
    어느 쪽도 아닌 새롭고 혁신적인 해결책을 찾아내 왔습니다.


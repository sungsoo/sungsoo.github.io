---
layout: post
title: Generative Adversarial Networks - Part II
date: 2017-04-03
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [Generative Adversarial Networks (2)](http://www.khshim.com/archives/249)
* Authors: [khshim](http://www.khshim.com/archives/author/skhu20)

---

Generative Adversarial Networks - Part II
===================================

Laplacian GAN
-------------

라플라시안(Laplacian) GAN, 줄여서 LAPGAN은 이미지의 크기를 다르게 하며
서로 다른 정보를 모아 더 나은 이미지를 생성하는 모델입니다. LAPGAN을
이해하기 위해서는 먼저 라플라시안 피라미드(Laplacian pyramid)에 대해
알아야 합니다. 인간은 32×32이미지를 볼 때와, 이 이미지 크기를 반으로
줄여 16×16을 볼 때 다른 특징에 집중한다는 연구가 있습니다. 16×16이 되면
그만큼 해상도가 떨어지게 되고, 인간이 보는 관점이 달라지게 되는
것입니다. 저 멀리서 보면 네발짐승으로 보였는데, 가까이서 자세히 보니
고양이더라 하는 식입니다. 큰 이미지를 다룰 때 서로 다른 크기의
창(window)을 이용하는 것은 이미 알려져 있는데, 라플라시안 피라미드도
이와 비슷하지만 딱히 슬라이딩을 하지는 않습니다. 한 이미지의 여러 특징을
잡아내기 위한 방법이라고 생각하면 됩니다.

라플라시안 피라미드를 만들기 위해서는, 이미지 크기를 절반으로
줄였다가(downsampling) 다시 확대해야(upsampling) 합니다. 이 과정은
저주파 필터링(low-pass filtering)과 비슷해서, 이미지의 해상도가 낮아지고
뭉개진 이미지를 얻게 됩니다. 원본 이미지를 ![I_0
](http:///s0.wp.com/latex.php?latex=I_0+&bg=ffffff&fg=000&s=1 "I_0 "),
축소한 이미지를 ![I_1 =
down(I_0)](http:///s0.wp.com/latex.php?latex=I_1+%3D+down%28I_0%29&bg=ffffff&fg=000&s=1 "I_1 = down(I_0)")
이라 하면 라플라시안 피라미드의 첫 번째 층은 ![h_0 = up(I_1) - I_0
](http:///s0.wp.com/latex.php?latex=h_0+%3D+up%28I_1%29+-+I_0+&bg=ffffff&fg=000&s=1 "h_0 = up(I_1) - I_0 ")
가 됩니다. 즉, 라플라시안 피라미드는 각 크기에서의 디테일을 저장하게
됩니다. 이와 같은 방법으로 계속 진행합니다. 32×32 – 16×16 – 8×8 -4×4
정도까지 가는데, 제일 마지막 4×4는 더 축소하고 빼지 않고 ![h_3 = I_3
](http:///s0.wp.com/latex.php?latex=h_3+%3D+I_3+&bg=ffffff&fg=000&s=1 "h_3 = I_3 ")으로
삼습니다. 위 예시의 경우 총 4개의 라플라시안 피라미드 층이 있게 됩니다.

이제 원본 이미지를 복구하기 위해서는 ![I_2 = up(I_3) + h_2, I_1 =
up(I_2) + h_1, I_0 = up(I_1) + h_0
](http:///s0.wp.com/latex.php?latex=I_2+%3D+up%28I_3%29+%2B+h_2%2C+I_1+%3D+up%28I_2%29+%2B+h_1%2C+I_0+%3D+up%28I_1%29+%2B+h_0+&bg=ffffff&fg=000&s=1 "I_2 = up(I_3) + h_2, I_1 = up(I_2) + h_1, I_0 = up(I_1) + h_0 ")
를 사용하면 됩니다.

LAPGAN은 라플라시안 피라미드의 위쪽(작은) 층을 입력으로 받아 아래쪽(큰)
층을 생성해 냅니다. 피라미드의 모든 층을 만든 후에는 간단히 위 식처럼
더하기만 하면 됩니다!

![fig1](https://i1.wp.com/khshim.files.wordpress.com/2016/09/fig11.png?resize=688%2C181&ssl=1)

(출처: [1]의 Figure 1) 위 그림은 LAPGAN이 원본 이미지를 만들어내는
과정입니다. 총 4개의 생성기 G가 필요합니다. 마찬가지로 총 4개의 분류기
D가 있어야 훈련할 수 있습니다. 원본 GAN과 달라진 점이 있다면, 최초의
생성을 제외하고는 모두 노이즈 외에 추가로 주는 입력이 있어 좀 더
정확하게, 큰 바탕에서 작은 세부사항으로(coarse to grain) 생성할 수
있다는 점입니다. 한 번에 전체 이미지를 만들던 GAN에 비해 훨씬 나은
방법이라고 할 수 있습니다.

![fig2](https://i1.wp.com/khshim.files.wordpress.com/2016/09/fig21.png?resize=688%2C259&ssl=1)

(출처: [1]의 Figure 2) 위 그림은 LAPGAN의 훈련 과정입니다. 작은 것부터
만드는 생성 과정과는 반대로, 큰 것부터 이미지를 줄여 가며 훈련시킵니다.
처음 나온 GAN처럼 D는 원본을 받거나 생성된 것을 받지만, 다른 점이 두
가지 있습니다. 첫째는 분류기가 저해상도의 이미지를 늘 같이 받아 판단에
활용한다는 점입니다. 둘째는 손실(loss) 값을 계산하는 식이 로그가 아니라
L2 차이를 이용한다는 점입니다. 이는 이미지를 같이 받아 사용하기 때문에
비교 대상이 있으니 가능해집니다. 제일 마지막 층의 훈련은 원래 GAN과
동일합니다. CIFAR-10의 경우 D와 G로 각각 2개 fully-connected(전부
연결된) 층으로 된 구조를 사용했습니다. LSUN의 경우 D는 3개
fully-connected 층, G는 5개 convolution 층을 사용했습니다.  둘 모두 각
종류(class)별 모델을 학습시키기도 했습니다.

훈련 결과는 대단히 놀라운데, 용량과 크기의 문제로 [1] 논문을 직접
참고해 주세요. 처음 GAN 보다 더 가장자리를 잘 그리고 더 선명한 이미지를
얻을 수 있었다고 합니다. 특히, 각 클래스별로 따로 학습한 경우 훨씬 좋은
결과를 얻은 것으로 보입니다.

> [1] Deep Generative Image Models using a Laplacian Pyramid of
> Adversarial Networks – Emily Denton et al. – 2015 – NIPS



Information GAN
---------------

정보이론(Information theoretic) 측면에서 보는 GAN이 있습니다. InfoGAN은
생성기 내부를 좀 더 자세히 들여다보게 해 줍니다. 생성기의 어떤 부분이
어떤 이미지를 만드는 데 도움을 주는지를 구체적으로 쪼개 볼 수 있기
때문에, 좀 더 원하는 이미지를 만드는 것에 가까워졌다고 할 수 있습니다.
그래서 [2]의 논문 제목도 해석 가능한(interpretable) 표현
학습(representation learning) 입니다. 특히, 이 과정이
비지도학습(unsupervised) 스타일로 이루어진다는 점이 포인트입니다.

한 데이터에는 여러 개의 표현이 중복되어 나타납니다. 예를 들어 사람의
얼굴에는 큰 눈, 처진 눈썹, 수염, 흰 피부 등이 동시에 표현되어
나타납니다. 이렇게 얽혀 있는 표현을 하나씩 떼어 분해하는
것(representation disentangling)은 비지도 학습으로 달성하기 위해서는
특별한 훈련 방법이 필요합니다. [2]에서는 이를 위해, 생성기가 학습
과정에서 스스로 유용한 표현들을 분리해 학습하도록 하는 새로운 GAN 구조를
만들었습니다.

처음 나온 GAN과 사용하는 구조는 대단히 비슷하지만, 재료로 넣어 주는
노이즈 Z가 두 가지로 갈라져 들어가게 됩니다. 완전히 무작위적인 Z를
사용하는 경우 Z의 어떤 부분이 어떤 표현에 대응되는지를 알 길이 없기
때문에, Z를 두 가지의 합으로 생각합니다. 첫 번째는 초기값(seed)가 되는
완전히 무작위로 만든 값이고, 두 번째는 잠재 코드(latent code) C에
해당하는 값입니다. 잠재 코드 각각은 원래 이미지의 각 표현에 해당하게
됩니다. MNIST의 예를 들면, ![c_0](http:///s0.wp.com/latex.php?latex=c_0+&bg=ffffff&fg=000&s=1 "c_0 ")
는 숫자의 종류, ![c_1](http:///s0.wp.com/latex.php?latex=c_1+&bg=ffffff&fg=000&s=1 "c_1 ")은
숫자의 기울어진 정도, ![c_2](http:///s0.wp.com/latex.php?latex=c_2+&bg=ffffff&fg=000&s=1 "c_2 ")는
숫자의 굵기라고 생각할 수 있습니다. 첫 번째 코드는 종류가 정해져
있고(categorical), 두 번째와 세 번째 코드는 연속적인(continuous)
값입니다.

![fig3](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig31.png?resize=600%2C375&ssl=1)

(출처: [2]의 Figure 2) InfoGAN을 훈련시킨 결과입니다. ![c_2, c_3](http:///s0.wp.com/latex.php?latex=c_2%2C+c_3+&bg=ffffff&fg=000&s=1 "c_2, c_3 ")은
훈련 과정에서 -1부터 1까지만 들어가도록 학습시켰음에도, 더 넓은 범위의
입력에서도 잘 동작하는 것을 볼 수 있습니다. 하지만, 우리가 잠재 코드를
일일이 알려줄 수도 없고 이 코드가 여기에 해당하도록 훈련하라고 지시할
수도 없습니다. 게다가, 잠재 코드를 노이즈와 같이 넣어 봤자 특별한 조건
없이는 그냥 노이즈에 묻혀 무시당할 가능성이 큽니다.

정보이론에는 두 정보의 연관성을 나타내는 상호 정보량(mutual information)
식이 있습니다. 두 확률변수 X, Y에 대해 상호 정보량 I는 다음과 같이
정의됩니다. H는 엔트로피(entropy) 정보량입니다. 정보량에 관한 것은 정보
이론을 참고해 주세요. 간단히, 정보량이 높다는 것은 나올 수 있는 가능성이
많은 것이라고 생각하면 됩니다. 이 식을 해석하면, 상호 정보량은 X의
정보량에서 Y를 알았을 때의 X의 정보량을 빼는 것이라고 할 수 있습니다.
만약 두 변수가 완전히 독립이라면 상호 정보량은 0이 됩니다.

![I(X;Y) = H(X) - H(X|Y) = H(Y) - H(Y|X)](http:///s0.wp.com/latex.php?latex=I%28X%3BY%29+%3D+H%28X%29+-+H%28X%7CY%29+%3D+H%28Y%29+-+H%28Y%7CX%29+&bg=ffffff&fg=000&s=1 "I(X;Y) = H(X) - H(X|Y) = H(Y) - H(Y|X) ")

InfoGAN은 기존의 손실 식에 상호 정보량 I를 덧붙입니다.

![L = min_G max_D L(D,G) = E_X[logD(x)] + E_{Z,C}
[log(1-D(G(z,c)))]  hat L = L - lambda I(c; G(z,c))
](http:///s0.wp.com/latex.php?latex=L+%3D+min_G+max_D+L%28D%2CG%29+%3D+E_X%5BlogD%28x%29%5D+%2B+E_%7BZ%2CC%7D+%5Blog%281-D%28G%28z%2Cc%29%29%29%5D+%5C%5C+%5Chat+L+%3D+L+-+%5Clambda+I%28c%3B+G%28z%2Cc%29%29+&bg=ffffff&fg=000&s=1 "L = min_G max_D L(D,G) = E_X[logD(x)] + E_{Z,C} [log(1-D(G(z,c)))]  hat L = L - lambda I(c; G(z,c)) ")

G는 손실 값을 줄이고 싶으니 상호 정보량을 늘리는 방향으로 학습시키려고
합니다. 즉, 생성된 이미지와 코드의 연관성이 높아지는 방향입니다. D의
경우 해석이 좀 애매하지만, 어차피 D의 훈련 때는 G는 고정되어 있으니 크게
문제될 것은 없습니다. 실제로, GAN에도 코드를 넣고 훈련해도 I 항이 없다면
상호 정보량은 증가하지 않습니다. 하지만 InfoGAN의 경우 상호 정보량이
꾸준히 증가한다고 합니다.

상호 정보량은 사실 계산하기도 쉽지 않고, 미분해서 최대화하기도 쉽지
않습니다. [2]에서는 그래서 I 대신 I의 최소값을 사용합니다. 즉, I를
직접 최대화하기보다는 I의 최소값을 최대화하는 것입니다. 그리고 I의
최소값은 몬테 카를로(Monte-Carlo) 방식으로 유사 확률(auxiliary
distribution)을 얻어 사용합니다.

![I(c; G(z,c)) &gt;= E_{Z,C} [log Q(c|G(z,c))]
](http:///s0.wp.com/latex.php?latex=I%28c%3B+G%28z%2Cc%29%29+%3E%3D+E_%7BZ%2CC%7D+%5Blog+Q%28c%7CG%28z%2Cc%29%29%5D+&bg=ffffff&fg=000&s=1 "I(c; G(z,c)) >= E_{Z,C} [log Q(c|G(z,c))] ")

Q는 생성된 이미지를 입력으로 받아 각 코드의 확률 혹은 값을 예측하는
인공신경망입니다. 몬테 카를로 방식을 쓴다는 것은 여러 번 이미지를 생성해
예측한 코드의 확률분포를 사용한다는 의미입니다. 즉, 처음에 넣어 준
코드와 생성된 이미지를 별도의 인공신경망에 넣어 예측한 코드가 유사하도록
훈련하는 모듈을 추가하는 것입니다. 그리고 이 인공신경망도 함께
훈련됩니다.

![infogan-architecture](https://i2.wp.com/khshim.files.wordpress.com/2016/09/infogan-architecture.png?resize=573%2C253&ssl=1)

각각의 코드에게 이런 특징 저런 특징을 잡으라고 설명해 주는 것도 아닌데,
코드들이 알아서 서로 다른 정보를 잡아낸다는 점이 정말로 신기한 점입니다.
많이 만들어 보다 보면 어떤 코드가 어떤 정보를 만드는지 저절로 알게 되는
걸까요?

![fig4](https://i2.wp.com/khshim.files.wordpress.com/2016/09/fig4.png?resize=688%2C418&ssl=1)

(출처: [2]의 Figure 3) 얼굴에 대해 4개의 잠재 코드를 사용해 훈련한
결과입니다.

![fig5](https://i2.wp.com/khshim.files.wordpress.com/2016/09/fig5.png?resize=688%2C199&ssl=1)

(출처: [2]의 Figure 4) 의자에 대해 훈련한 결과입니다.

코드를 엄청 늘린다면, 인간이 아직 잡아내지 못하는 어떤 특징을 기반으로
그 특징을 변화시켰을 때의 결과를 볼 수 있을 지도 모릅니다. 분류에
해당하는 코드를 예측하는 모듈은 그 자체로도 분류(classification) 문제에
적용했을 때 괜찮은 성능을 보인다고 합니다. 빅데이터에 적용하면 인간은
찾지 못하는, 데이터에 숨어 있는 패턴을 찾고 패턴을 변화시켜볼 수
있을지도 모릅니다. [3]은 InfoGAN이 아니라 DCGAN을 이용한 것이지만,
이런 일도 가능하다는 것을 보여줍니다.

> [2] InfoGAN: Interpretable Representation Learning by Information
> Maximizing Generative Adversarial Nets – 2016 – Arxiv 
> [3] Chainer-DCGAN – Mattya
> – [example](http://mattya.github.io/chainer-DCGAN/)



Bidirectional GAN
-----------------

앞에서는 잠재 코드를 이용해 이미지를 생성하는 것을 봤습니다. 한편,
이미지에서 잠재 코드를 뽑아내는 것은 어떻게 할 수 있을지를 생각한 논문이
[4] 입니다. [2]와 비슷한 시기에 나와서 어느 정도 겹치는 주제이긴
하지만 구조는 많이 다릅니다. 무엇보다, 직접적으로 잠재 코드를 다루는
논문은 아닙니다.

노이즈에서 이미지를 생성하듯이, 이미지에서 노이즈를 생성하는 구조를
생각할 수 있습니다. 이미지 생성부를 G라고 한다면 노이즈 생성부는
E(encoder)라고 할 수 있습니다. 이렇게 양방향 구조를 사용하기 때문에 이
구조는 BIGAN이라고 이름이 붙었습니다.

![bigan-architecture](https://i2.wp.com/khshim.files.wordpress.com/2016/09/bigan-architecture1.png?resize=623%2C203&ssl=1){.alignnone
.size-full .wp-image-408}

D는 이미지만 받던 것에서 변화해 이미지와 노이즈를 동시에 받게 됩니다.
노이즈에서 잠재적인 특성을 읽어내길 기대하는 구조입니다. [4]에서는
완전히 동일한 결과를 생성하는 이상적인 G와 E를 만든다면 G와 E는 완전히
역함수(inverse)라는 것을 증명해 놓았습니다. 역함수라는 것은 이런
뜻입니다.

![G(E(x)) = x](http:///s0.wp.com/latex.php?latex=G%28E%28x%29%29+%3D+x+&bg=ffffff&fg=000&s=1 "G(E(x)) = x ")

그 외에도 이 논문은 이 구조가 적절히 훈련될 수 있다는 것을 증명하기 위해
여러 가지 증명을 시도하는데, 궁금한 사람은 읽어 보시길 바랍니다. 특별히
E에서 만든 것이 동일해지도록 하는 어떠한 손실 항도 들어 있지 않기 때문에
위와 같은 결과를 낸다는 것을 증명하기 위해서는 노력이 필요한 것
같습니다.

![fig7](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig7.png?resize=688%2C122&ssl=1)

(출처: [4]의 Figure 2) MNIST에 대해 역함수를 검증한 것인데, 꽤 잘
따라합니다. 7과 9, 3과 5를 좀 헷갈려 하는 것을 볼 수 있습니다.

![fig6](https://i0.wp.com/khshim.files.wordpress.com/2016/09/fig6.png?resize=688%2C333&ssl=1)

(출처: [4]의 Figure  4) 원본 이미지와 거의 유사한 이미지가 만들어지는
것을 볼 수 있습니다. 물론 생성기에서 만든 이미지도 꽤 괜찮습니다.

이 논문에서 굳이 노이즈를 만드는 것을 인코딩이라고 표현한 이유는,
인코딩된 벡터 자체가 원본 이미지를 잘 표현하는 특징 벡터가 될 수 있다고
생각하기 때문입니다. 이미지 하나하나가 노이즈 공간(이라고 하긴 했지만
엄청나게 높은 실수차원 벡터)에 해당하도록 만드는 것입니다! 이미지
임베딩이라고 할 수도 있을 것 같습니다.

그래서 이 논문은 인코더에서 학습한 필터를 그대로 가져가 이미 훈련한
이미지 분류기(classifier)의 필터와 교체하고 성능이 어떻게 나오는지를
봅니다. 아쉽게도 생성 모델이 아니라 분류 모델로 처음부터 훈련한 경우에
비교하면 많이 떨어지는 성능을 보여주지만, 자동인코더(autoencoder)의
필터를 가져온 경우나 인공신경망이 아닌 다른 방법으로 만든 필터를 가져온
경우보다는 높은 정확도를 보여줍니다.

GAN에서 노이즈를 쓰는 것만 바꿔 가면서도 이렇게 다양한 방법으로
해석된다니, 몇 년 내로 분명 거의 완벽한 생성 모델이 나오지 않을까
싶습니다. 발전 속도가 놀랍네요.

> [4] Adversarial Feature Learning – Jeff Donahue et al. – 2016 –
> Arxiv



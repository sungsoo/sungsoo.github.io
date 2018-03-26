---
layout: post
title: Karush-Kuhn-Tucker Condition
date: 2018-03-25
categories: [computer science]
tags: [machine learning]

---

* Article Source: [Karush-Kuhn-Tucker Condition](https://ratsgo.github.io/convex%20optimization/2018/01/26/KKT/)
* Authors: [ratsgo's blog for textmining](https://ratsgo.github.io)

---

Karush-Kuhn-Tucker Condition 
========


<iframe width="600" height="400" src="https://www.youtube.com/embed/V6sL3uXNZ3g" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

Concept
-------

*Karush-Kuhn-Tucker* 조건은 *primal, dual solution*과의 관계에서 도출된
조건인데요. 최적화 이론과 실제 구현에서 핵심적인 역할을 합니다.
*duality*와 관련해서는
[이곳](https://ratsgo.github.io/convex%20optimization/2018/01/25/duality/)을
참고하시면 좋을 것 같습니다. 어쨌든 KKT 조건의 구체적인 내용은 다음과
같습니다.

![](https://i.imgur.com/Sq8DddQ.png "source: imgur.com")

Necessity
---------

다음과 같은 명제가 성립합니다. *primal, dual, duality gap, lagrange dual
function* 등 개념과 관련해서는
[이곳](https://ratsgo.github.io/convex%20optimization/2018/01/25/duality/)을
참고하시면 좋을 것 같습니다.

![](https://i.imgur.com/9btM4wy.png "source: imgur.com")

zero duality라면 \$f\^\*=g\$입니다. 그런데 \$x\$-star는 primal problem의
목적함수 \$f\$의 optimal value입니다. 또한 \$u\$-star, \$v\$-star는 dual
problem의 목적함수 \$g\$의 optimal value입니다. 따라서 다음 식처럼 쓸 수
있습니다.

위 식 우변을 라그랑지안 듀얼 함수 \$g\$의 정의대로 쓰면 다음 식과
같습니다.

\$L\$은 우리가 구하려는 미지수 \$x\$로 편미분한 식을 0으로 만드는
지점에서 최소값을 지닙니다. 그런데 전제조건에서 이미 언급했듯 primal
problem의 해는 \$x\$-star이기 때문에 \$L\$을 \$x\$로 편미분한 결과를
0으로 만드는 지점은 바로 \$x\$-star가 될 것입니다. 이는 KKT 조건의
*stationary condition*을 만족한다는 이야기입니다. 이를 식으로 쓰면
다음과 같습니다.

primal problem과 라그랑지 함수 \$L\$, 라그랑지안 듀얼 함수 \$g\$
사이에는 다음 부등식이 성립합니다. (왜 아래 식이 도출되는지는
[이곳](https://ratsgo.github.io/convex%20optimization/2018/01/25/duality/)
참고)
이를 우리가 들여다보던 식에 맞춰서 다시 적으면 다음 식을 유도할 수
있습니다.

결과적으로 처음 항, 즉 \$f(x\^\*)\$가 마지막에 다시 유도된 걸 확인할 수
있습니다. 다시 말해 우리가 논의하고 있는 명제의 전제조건을 만족할 경우
위 모든 부등식이 사실상 등식과 같다는 이야기입니다. 이 경우 다음 식이
모두 0이 되어야 등식을 만족하게 됩니다. 그렇다면 모든 식에 등호가
붙으려면 다음 두 개 항이 모두 0이 되어야 함을 확인할 수 있습니다.

그런데 *primal problem*를 다시 살펴보면 \$l\_j\$는 모두 0이기 때문에
\$B\$에 관련된 항들은 본래 모두 0입니다. 문제는 \$A\$인데요. \$A\$의
경우에도 모두 0이 되어야 등식을 만족합니다. 다시 말해 KKT 조건의
*complementary slackness*를 만족한다는 이야기입니다.

따라서 결과적으로 위 명제의 전제조건이 만족된다면 KKT 조건 또한 만족하게
됩니다.

Sufficiency
-----------

다음과 같은 명제가 성립합니다.

![](https://i.imgur.com/oJOBWNS.png "source: imgur.com")

\$g\$를 정의대로 적으면 아래 식의 첫 줄이 됩니다. 아울러 \$x\$-star,
\$u\$-star, \$v\$-star는 KKT 조건을 만족한다고 했으므로 KKT 조건의
*stationarity condition*에 의해 \$L(x,u\^*,v\^*)\$는 \$x\$-star에서
최소값을 가집니다. 따라서 다음이 성립합니다.

KKT 조건의 *complementary slackness*에 따라 아래 식 좌변의 두번째 항이
모두 0입니다. *primal problem*을 다시 살펴보면 \$l\_j\$ 역시 모두
0입니다. 따라서 아래 식이 성립합니다. 바꿔 말해 \$x\$-star는 *primal
problem*의 해, \$u\$-star, \$v\$-star는 *dual problem*의 해라는
이야기입니다.

정리
----

지금까지 말씀드린 내용을 정리하면 아래 그림과 같습니다.

![](https://i.imgur.com/A5HYngz.png "source: imgur.com")

*strong duality*를 만족하는 경우 위 두 명제가 동치 관계를 갖습니다.
(*strong duality*, *slater’s condition* 등은
[이곳](https://ratsgo.github.io/convex%20optimization/2018/01/25/duality/)
참고)

![](https://i.imgur.com/LW5vHOE.png "source: imgur.com")

SVM에 적용
----------

마진(margin) 내 관측치를 허용하는 C-SVM을 기준으로 설명해 보겠습니다.
C-SVM과 관련해서는
[이곳](https://ratsgo.github.io/machine%20learning/2017/05/29/SVM2/)을
참고하시면 좋을 것 같습니다. 어쨌든 C-SVM의 *primal problem*은 다음과
같습니다. 아래 제약식을 만족하면서 목적함수를 최소화하는 \$w, b, ξ\$을
찾아야 합니다.

위 *primal problem*을 바탕으로 라그랑지안 함수 \$L\$을 만듭니다.
제약식에 라그랑지안 승수를 곱해 목적식에 합치면 됩니다. 여기에서
라그랑지안 승수 \$α, μ\$를 *dual variable*이라고 합니다. 단 여기에서
\$α, μ\$는 0 이상의 부등식에 적용되는 라그랑지안 승수이므로 0 이상의
제약을 갖습니다.

여기에서 우리가 사용할 조건은 KKT의 충분조건입니다. \$w, b, ξ, α, μ\$가
KKT 조건을 만족한다면, \$w, b, ξ\$는 primal problem의 최적해, \$α, μ\$는
dual problem의 최적해가 된다는 이야기입니다. 다시 말해 약간 풀기 어려운
primal problem을 풀기 쉬운 dual problem으로 바꿔 풀어도 최적해를
구한다는 점에선 같은 의미라는 뜻이 되는거죠.
KKT 조건 가운데 *stationarity* 조건은, 최적화하려는 미지수로 편미분한
식이 0이 된다는 조건입니다. 아래 세 개 식을 만족하게끔 \$α, μ\$를 구하면
*stationarity* 조건이 클리어됩니다.

KKT 조건 가운데 *complementary slackness* 조건을 클리어하려면 아래 식을
만족해야 합니다.

*dual problem*의 목적식은 다음과 같습니다. 즉 *stationarity* 조건으로
도출된 식을 라그랑지안 함수 \$L\$에 넣어 정리해준 결과입니다. *dual
problem*의 목적식과 제약식 도출과 관련한 자세한 내용은
[이곳](https://ratsgo.github.io/machine%20learning/2017/05/29/SVM2/)을
참고하면 좋을 것 같습니다.

\$w, b, ξ, α, μ\$가 KKT 조건을 만족하도록 정했기 때문에, dual problem의
최적해인 \$α, μ\$를 구하는 것만으로도 primal problem을 푸는 것과 같은
효과를 낼 수 있습니다.

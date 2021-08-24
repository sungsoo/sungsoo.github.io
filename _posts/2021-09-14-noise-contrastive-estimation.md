---
layout: post
title: What is Noise-Contrastive Estimation?
date: 2021-09-14
categories: [computer science]
tags: [machine learning, graph mining]
use_math: true
comments: true
---

### Article Source

* [What is Noise-Contrastive Estimation?](https://www.youtube.com/watch?v=68dJCDyzB0A)


---

# What is Noise-Contrastive Estimation?

<iframe width="600" height="400" src="https://www.youtube.com/embed/68dJCDyzB0A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

$$\\mathbf{X} = (x_1, x_2, \..., x\_{T_d}$$ 는 random sample vector
$$x \\in \\mathbb{R}\^n$$ 이며, 각각의 $$x_i$$ 는 **unknown
probability density function** $$P_d$$ 을 갖고 있습니다. (예를 들어서
"사과" 라는 단어의 확률이 몇일까? 라는 관점에서 결코 알기 쉽지 않을
것입니다.)

\\$$\\mathbf{X} \\sim P_d\\$$

Noise Constrastive Estimation의 기본적인 아이디어는 noise sample
$$\\mathbf{Y} = (y_1, y_2, \... y\_{T_n})$$ 을 알고있는 확률밀도함수
(known PDF) $$P_n$$ 으로부터 가져온뒤 ratio $$\\frac{P_d}{Pn}$$ 를
추정(estimate)을 하고 궁극적으로 $$P_d$$ 의 분포도를 알 수 있게
됩니다.

## Definition

2개의 데이터셋 $$\\mathbf{X}$$ 와 $$\\mathbf{Y}$$ 를 연결시키기
위하여 합집합으로 연결을 시킵니다.\
( $$\\mathbf{u}$$ 는 실제 샘플 데이터와 가짜 노이즈 데이터를 둘다 갖고
있는 형태라고 보면 됩니다.)

\\$$\\mathbf{U} = \\mathbf{X} \\cup \\mathbf{Y} = \\{ \\mathbf{u}\_1,
\\mathbf{u}\_2, \..., \\mathbf{u}\_{T_d + T_n} \\}\\$$

각각의 datapoint 는 $$\\mathbf{u}\_t \\in \\mathbf{X}$$ 이라면 $$C_t
= 1$$ 그리고 $$\\mathbf{u}\_t \\in \\mathbf{Y}$$ 이라면 $$C_t = 0$$
만약 입니다.

\\$$C_t = \\left\\{ \\begin{array}{l} 1\\ \\ \\text{if}\\ \\mathbf{u}\_t
\\in \\mathbf{X} \\\\ 0\\ \\ \\text{if}\\ \\mathbf{u}\_t \\in
\\mathbf{Y} \\\\ \\end{array} \\right.\\$$

![](/assets/images/nce_class.png){.img-responsive .img-rounded
.img-fluid}

Random vector $$\\mathbf{x} \\in \\mathbb{R}\^n$$ 의 샘플 데이터(진짜
데이터)는 위에서 언급했듯이 **unknown probability density function
(PDF)** $$P_d$$ 를 따릅니다.\
PDF는 알수 없는 상황이기 때문에 $$P_d(.) = P_m(.;\\theta\^\*)$$ 를
가정하는 모델을 만듭니다.\
여기서 $$\\theta\^\*$$ 는 true model vector parameters 이며
$$\\theta\^\*$$ 를 학습시켜서 objective function을 maximize 하도록
만들어야 합니다.

위와같은 정의에서 **Likelihoods**는 다음과 같습니다.

\\$$\\begin{align} P\\big(\\mathbf{u}\\ \\big\|\\ C = 1 \\big) &= P_m
\\bigl( \\mathbf{u} ; \\theta \\bigr) & data \\\\ P\\big(\\mathbf{u}\\
\\big\|\\ C = 0 \\big) &= P_n \\big( \\mathbf{u} \\big) & noise
\\end{align}\\$$

**Priors**는 다음과 같습니다.

\\$$P(C = 1) = \\frac{T_d}{T_d + T_n}\\$$ \\$$P(C = 0) = \\frac{T_n}{T_d
+ T_n}\\$$

따라서 $$\\mathbf{u}$$ 에대한 확률 $$P( \\mathbf{u} )$$ 은 다음과
같습니다.\
[ 공식에 대한 이해가 필요하면 [Bayes
Rules](http://andersonjo.github.io/statistics/2014/03/01/Bayes-Theorem/)을
참고 합니다.\
\
$$\\text{posterior} = \\frac{\\text{likelihood} \\cdot
\\text{prior}}{\\text{evidence}}$$\
]{style="color:#777777"}

\\$$\\begin{align} P(\\mathbf{u}) &= P_m \\big( \\mathbf{u} ; \\theta
\\big) + P_n \\big( \\mathbf{u} \\big) \\\\ &= \\Big$$ P\\big(C=1\\big)
\* P\\big(\\mathbf{u}\\ \\big\|\\ C = 1\\big) \\Big$$ + \\Big$$
P\\big(C=0\\big) \* P\\big(\\mathbf{u}\\ \\big\|\\ C = 0\\big) \\Big$$
\\\\ &= \\left( \\frac{T_d}{T_d + T_n} \* P_m \\big( \\mathbf{u}\\ ;
\\theta \\big) \\right) + \\left( \\frac{T_n}{T_d + T_n} \* P_n \\big(
\\mathbf{u} \\big) \\right) \\end{align}\\$$

**Posterior Probabilities** 는 다음과 같습니다.

\\$$\\begin{align} P\\big(C=1\\ \\big\|\\ \\mathbf{u};\\theta\\big) &=
\\frac{P\\big(\\mathbf{u}\\ \\big\|\\ C = 1; \\theta\\big) \* P\\big(C =
1\\big)}{P\\big(\\mathbf{u}\\big)} \\\\ &= \\frac{ P_m \\big(\\mathbf{u}
; \\theta \\big) \* \\frac{T_d}{T_d + T_n} }{ \\bigg( \\frac{T_d}{T_d +
T_n} \* P_m \\big(\\mathbf{u} ; \\theta \\big) \\bigg) + \\bigg(
\\frac{T_n}{T_d + T_n} \* P_n \\big(\\mathbf{u} \\big) \\bigg) } \\\\ &=
\\frac{ P_m \\big(\\mathbf{u} ; \\theta \\big)}{ \\bigg$$ \\bigg(
\\frac{T_d}{T_d + T_n} \* P_m \\big(\\mathbf{u} ; \\theta \\big) \\bigg)
+ \\bigg( \\frac{T_n}{T_d + T_n} \* P_n \\big(\\mathbf{u} \\big) \\bigg)
\\bigg$$ \* \\frac{T_d + T_n}{T_d}} \\\\ &= \\frac{ P_m
\\big(\\mathbf{u} ; \\theta \\big)}{ P_m \\big( \\mathbf{u}; \\theta
\\big) + \\left( \\frac{T_n}{T_d} \\right) P_n \\big( \\mathbf{u}
\\big)} \\end{align}\\$$

이때 $$v$$ 는 다음과 같이 정의합니다.

\\$$v = \\frac{T_n}{T_d} = \\frac{P(C=0)}{P(C=1)}\\$$

$$v$$ 를 대입하면 **최종적으로 posterior probabilities** 는 다음과
같습니다.

\\$$\\begin{align} P\\big(C=1\\ \\big\|\\ \\mathbf{u}; \\theta \\big) &=
\\frac{P_m \\big( \\mathbf{u}; \\theta \\big) }{ P_m \\big(\\mathbf{u} ;
\\theta \\big) + vP_n \\big( \\mathbf{u} \\big)} &$$1$$ \\\\
P\\big(C=0\\ \\big\|\\ \\mathbf{u}; \\theta \\big) &= \\frac{ vP_n
\\big( \\mathbf{u} \\big) }{ P_m \\big(\\mathbf{u} ; \\theta \\big) +
vP_n \\big( \\mathbf{u} \\big)} &$$2$$ \\end{align}\\$$

이때 $$2$$은 $$1$$과 동일한 방법으로 계산한 결과 값 입니다.\
$$P(C=1 \| \\mathbf{u}; \\theta)$$ 는 다음과 같이 rewritten될 수
있습니다.

\\$$\\begin{align} P \\big( C = 1\\ \\big\|\\ \\mathbf{u};\\theta \\big)
&= \\frac{ P_m \\big( \\mathbf{u} ; \\theta \\big)}{P_m \\big(
\\mathbf{u} ; \\theta \\big) + vP_m \\big( \\mathbf{u} \\big)}
&$$1$$\\\\ &= \\frac{P_m \\big( \\mathbf{u} ; \\theta \\big) \*
\\frac{1}{P_m ( \\mathbf{u};\\theta )} }{ \\big$$ P_m \\big( \\mathbf{u}
; \\theta \\big) + vP_m \\big( \\mathbf{u} \\big) \\big$$ \*
\\frac{1}{P_m ( \\mathbf{u};\\theta )}} &$$2$$\\\\ &= \\frac{1}{1 + v
\\frac{Pn(\\mathbf{u})}{ P_m (\\mathbf{u} ; \\theta)}} &$$3$$\\\\ &=
\\bigg( 1 + v\\frac{P_n \\big( \\mathbf{u} \\big)}{ P_m \\big(
\\mathbf{u}; \\theta \\big)} \\bigg)\^{-1} &$$4$$\\\\ &= \\frac{1}{1 + v
\* exp \\bigg$$ \\ln P_n \\big( \\mathbf{u} \\big) - \\ln P_m \\big(
\\mathbf{u} ; \\theta \\big) \\bigg$$} &$$5$$ \\\\ &= h \\big(
\\mathbf{u} ; \\theta \\big) &$$6$$ \\\\ P \\big( C = 0\\ \\big\|\\
\\mathbf{u};\\theta \\big) &= 1 - h \\big( \\mathbf{u} ; \\theta \\big)
\\end{align}\\$$ \\$$\\$$

$$4$$ 그리고 $$5$$은 모두 $$3$$에서 도출되었습니다.\
$$4$$에서는 앞전에서 찾으려고 했던 estimate ratio $$\\frac{P_n (
\\mathbf{u} )}{ p_m (\\mathbf{u}; \\theta)}$$ 를 볼수 있습니다.\
$$5$$에서는 log ratio로 변환했습니다.\
[ $$\\log_d(a/b) = \\log_d a - \\log_d b$$ ]{style="color:#777777"}
$$6$$ 에서는 $$P(C=1 \| \\mathbf{u}; \\theta)$$ 를
$$h(\\mathbf{u};\\theta)$$ 로 표기합니다.

$$G \\big(.;\\theta \\big)$$ 는 두 분포 $$P_m(\\mathbf{u};\\theta)$$
그리고 $$P_n(\\mathbf{u})$$ 사이의 **log ratio**를 정의합니다.

\\$$\\begin{align} G \\big(\\mathbf{u}; \\theta \\big) &= \\ln
\\frac{P_m \\big( \\mathbf{u}; \\theta \\big)}{P_n \\big( \\mathbf{u}
\\big)} \\\\ &= \\ln P_m \\big( \\mathbf{u} ; \\theta \\big) - \\ln P_n
\\big( \\mathbf{u} \\big) \\end{align}\\$$

따라서 $$5$$의 공식은 다음과 같이 써질수 있습니다.

\\$$h \\big( \\mathbf{u} ; \\theta \\big) = r_v ( G ( \\mathbf{u} ;
\\theta ) )\\$$

여기서 $$r_v$$ 는 다음과 같습니다.

\\$$r_v(\\mathbf{u}) = \\frac{1}{1 + v \\exp(-\\mathbf{u})}\\$$

즉 $$v$$ 를 parameter로 갖는 **Sigmoid/Logistic function**이 되게
됩니다.\
[ Logistic function의 정의는 다음과 같습니다.\
$$\\phi(z) = \\frac{1}{1+e\^{-z}} = \\frac{ e\^{z} }{ 1 + e\^{z} }$$\
]

## Objective Function

Class labels $$C_t$$ 는 Bernoulli and iid 로 가정을 합니다.
Conditional log-likelihood는 다음과 같이 정의 됩니다.

\\$$\\begin{align} L(\\mathbf{\\theta}) &= \\sum\^{T_d + T_n}\_{t=1} C_t
\\ln P\\big(C_t = 1\\ \\big\|\\ \\mathbf{u}\_t ; \\mathbf{\\theta}\\big)
+ \\big(1-C_t\\big) \\ln P\\big(C_t = 0\\ \\big\|\\ \\mathbf{u}\_t ;
\\mathbf{\\theta}\\big) \\\\ &= \\sum\^{T_d}\_{t=1} \\ln \\big$$ h
\\big(\\mathbf{x}\_t; \\mathbf{\\theta} \\big) \\big$$ +
\\sum\^{T_n}\_{t=1} \\ln \\big$$1 - h \\big(\\mathbf{y}\_t; \\theta
\\big) \\big$$ \\end{align}\\$$

저 위에서부터 써놓은 가장 흥미로운 사실들이 여기에 모두 집결이 됩니다.\
$$\\theta$$ 에 관하여 $$L(\\mathbf{\\theta})$$ 를 optimizing하는
것은 결론적으로 log-ratio $$\\ln(P_d/P_n)$$ 인 $$G(.;
\\hat{\\mathbf{\\theta}})$$ 을 추정(estimate)하는 것과 동일합니다.\

Normalization

> $$- L(\\theta)$$ 는 cross-entropy function과 동일 합니다.

결과값은 Logistic Regression (supervised learning)를 연산하여 나온
density estimation (unsupervised learning task)을 보여줍니다.

## NCE Estimator

처음 언급을 했었듯이 $$P_d$$ 는 parameterized model $$p_m(.;
\\theta\^\*)$$ 와 동일합니다. 즉.. $$P_d(.) = P_m(.;\\theta\^\*)$$
이며 normalized pdf $$P_m (. ; \\theta)$$ 는 다음의 제약조건을 받으시
따라야 합니다.

\\$$\\begin{align} \\int P_m\\big( \\mathbf{u} ; \\theta \\big) \\
d\\mathbf{u} = 1 && \\text{\# normalization constraint} \\\\ P_m\\big(
\\mathbf{u} ; \\theta \\big) \\le 0 && \\text{\# positivity constraint}
\\end{align}\\$$

$$\\theta$$ 는 Model parameters 를 가르키고, $$\\hat{\\theta}$$ 는
estimate of the model parameters를 가르킵니다.\
첫번째 조건인 normalization constraint를 만족시키지 못하는 경우, 해당
모델을 unnormalized model이라고 합니다.\
대표적인 unnormalized models은 다음과 같습니다.

-   Image : Markov Random Field
-   Text : Neural probablistic language models
-   Physics : Ising model

Unnormalized model인 경우 partition function을 사용해서 unnormalized
model을 normalized model로 변경시켜줄수 있습니다.\
Partition function $$Z(\\alpha)$$ 를 사용하여 unnormalized model을
normalized model로 변경시켜주며,\
probability density function $$P_m \\big(.; \\alpha \\big)$$ 또한
다음과 같이 변하게 됩니다.

\\$$\\begin{align} p_m\\big(.;\\alpha \\big) &= \\frac{P\^0_m \\big(.;
\\alpha \\big)}{Z(\\alpha)} \\\\ Z(\\alpha) &= \\int P\^0_m(\\mathbf{u};
\\alpha)\\ d\\mathbf{u} \\end{align}\\$$

$$P\^0_m (.; \\alpha )$$ 은 probability density function이지만 1로
integrate될 필요는 없습니다.\
$$Z(\\alpha)$$ 의 경우는 좀 문제가 있습니다. integral자체가 쉽지가
않습니다. (특히 dimension 자체가 커지면 커질수록 numerical integration이
매우 어려워집니다.

이래서.. unnormalized model을 위한 estimation으로 나온것이 **Noise
Constrastive Estimation (NCE)** 입니다.\
기본적으로 normalizing constant $$Z(\\alpha)$$ 를 하나의 parameter
$$c$$ 로 사용하며 정의는 다음과 같습니다.

\\$$c = \\ln \\frac{1}{Z(\\alpha)}\\$$

따라서 normalized model $$P_m (; \\theta)$$ 는 다음과 같이 재정의 될
수 있습니다.

\\$$P_m = P\^0_m(;\\alpha) + c\\$$

여기서 $$\\theta = (\\alpha, c)$$ 입니다. $$\\hat{\\theta} =
(\\hat{\\alpha}, \\hat{c})$$ 를 학습한 이후부터, $$\\hat{c}$$ 는
$$\\ln \\frac{1}{Z(\\hat{\\alpha})}$$ 에 대한 추정치(estimate)을 갖게
됩니다.\
Unnormalized model $$P\^0_m (; \\theta)$$ 대한 estimator는
$$\\theta$$ 를 maximize함으로 정의될 수 있습니다.

\\$$J_T(\\theta) = \\frac{1}{T_d} \\sum\^{T_d}\_{t=1} \\ln \\big$$
h(x_t; \\mathbf{\\theta}) \\big$$ + v \\frac{1}{T_n} \\sum\^{T_n}\_{t=1}
\\ln \\big$$ 1 - h(\\mathbf{y}\_t; \\mathbf{\\theta}) \\big$$\\$$

이때 $$h(.; \\theta) \\in (0, 1)$$ 입니다.

결과적으로 optimal parameter $$\\hat{\\mathbf{\\theta}}\_T$$ 는
$$G(\\mathbf{u}\_T ; \\mathbf{\\hat{\\theta}}\_T)$$ 를
$$\\mathbf{u}\_T \\in X$$ 에 관하여 가능하면 크게만들고,
$$\\mathbf{u}\_T \\in Y$$ 에 대해서는 가능하면 최대한 작게 만듭니다.\
쉽게 이야기하면 $$\\theta$$ 를 학습하는데 기준은 $$P(C=1;
\\mathbf{u};\\mathbf{\\theta})$$ 결과값이 $$x_i$$ 에 대해서는 크게,
$$y_i$$ 에 관해서는 작게 만드는게 목표입니다.\
즉 logistic regression이며, 원래는 unsupervised 문제인데
supervised문제로 만들어서 문제를 해결합니다.

# References

-   [Noise-contrastive
    estimation](http://proceedings.mlr.press/v9/gutmann10a/gutmann10a.pdf)
-   [Notes on Noise Contrastive Estimation
    (NCE)](http://www.1-4-5.net/~dmm/ml/nce.pdf)
-   [Noise Constrastive
    Estimation](https://staff.fnwi.uva.nl/m.k.tran/notes/nce.pdf)
-   [Noise-Contrastive Estimation and its
    Generalizations](https://www2.warwick.ac.uk/fac/sci/statistics/crism/workshops/estimatingconstants/gutmann.pdf)
-   [Conditional Noise-Contrastive
    Estimation](https://kth.diva-portal.org/smash/get/diva2:1139156/FULLTEXT01.pdf)

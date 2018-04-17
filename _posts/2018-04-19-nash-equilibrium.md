---
layout: post
title: Equilibrium points in n-person games 
date: 2018-04-19
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [http://www.pnas.org/content/36/1/48](http://www.pnas.org/content/36/1/48)
* Authors: John F. Nash Jr.
* Publication: PNAS January 1, 1950. 36 (1) 48-49; [https://doi.org/10.1073/pnas.36.1.48](https://doi.org/10.1073/pnas.36.1.48)  Communicated by S. Lefschetz, November 16, 1949

* Title: [게임이론:내쉬균형](https://brunch.co.kr/@naeclee/2)

---


# Equilibrium points in *n*-person games

One may define a concept of an *n*-person game in which each player has a finite set of *pure strategies* and in which a definite set of *payments* to the *n* players corresponds to each *n*-tuple of pure strategies, one strategy being taken for each player. For mixed strategies, which are probability distributions over the pure strategies, the *pay-off functions* are the expectations of the players, thus becoming polylinear forms in the probabilities with which the various players play their various pure strategies.

Any *n*-tuple of strategies, one for each player, may be regarded as a point in the product space obtained by multiplying the n strategy spaces of the players. One such *n*-tuple counters another if the strategy of each player in the countering *n*-tuple yields the highest obtainable expectation for its player against the *n* − 1 strategies of the other players in the countered *n*-tuple. A self-countering *n*-tuple is called an *equilibrium point*.

The correspondence of each *n*-tuple with its set of countering *n*-tuples gives a one-to-many mapping of the product space into itself. From the definition of countering we see that the set of countering points of a point is convex. By using the continuity of the pay-off functions we see that the graph of the mapping is closed. The closedness is equivalent to saying: if \$P_1, P_2, … \$ and \$Q_1, Q_2, …, Q_n, …\$ are sequences of points in the product space where \$Q_n → Q, P_n → P\$ and $Q_n$ counters $P_n$ then *Q* counters *P*.

Since the graph is *closed* and since the image of each point under the mapping is *convex*, we infer from *Kakutani's theorem*[1] that the mapping has a fixed point (i.e., point contained in its image). Hence there is an *equilibrium point*.

In the two-person zero-sum case the "*main theorem*"[2] and the existence of an equilibrium point are equivalent. In this case any two equilibrium points lead to the same expectations for the players, but this need not occur in general.

## Footnotes

*The author is indebted to Dr. David Gale for suggesting the use of Kakutani's theorem to simplify the proof and to the A. E. C. for financial support.

## References

1. Kakutani, S., Duke Math. J., 8, 457– 459 ( 1941). 
2. Von Neumann, J., and Morgenstern, O., *The Theory of Games and Economic Behaviour*, Chap. 3, Princeton University Press, Princeton, 1947.

## Non-Cooperative Games

<iframe width="600" height="400" src="https://www.youtube.com/embed/XwhFq8WwTtA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Nash Equiliburium

게임이론의 수립에 지대한 영향을 미친 두 학자는 폰 노이먼과 존 포브스 내쉬이다. 내쉬가 제안한 해 개념(solution concept)인 내쉬 균형(Nash equilibrium)의 의미는 무엇이고 내쉬는 어떤 공헌을 했기에 1994년 경제학 노벨상을 받은 것일까?   

* [John F. Nash Jr. - Biographical](http://www.nobelprize.org/nobel_prizes/economic-sciences/laureates/1994/nash-bio.html)

내쉬는 노이먼의 미니맥스 정리를 확장하여 내쉬 균형이라는 개념을 정립한다. 노이먼의 정리는 플레이어가 2명이고 서로의 이득의 합이 0이 되는 제로섬이라는 설정을 고려하고 있어 매우 한정적이다. 내쉬는 이를 3명 이상의 보다 많은 플레이어가 게임에 참여하고 이들의 이득이 합도 0이 아닌 비 제로섬의 일반적인 경우로 확장했다. 
 
그의 개념은 n명의 모든 플레이어가 선택하고 있는 전략이 내쉬 균형을 이룬다는 것은 각 플레이어가 다른 플레이어들이 당해 전략을 선택하고 있는 상황 하에서 자신만이 다른 전략으로 변경하여도 이득이 될 것이 없고 다른 플레이어도 마찬가지인 상태를 의미한다. 
 
따라서 플레이어들이 선택하고 있는 전략이 내쉬 균형이 아니라는 것은 다른 플레이어들이 이 전략을 선택하고 있는 상황 하에서 자신은 다른 전략으로 변경하는 것이 이득인 플레이어가 적어도 한 명 이상 존재한다는 것을 의미한다. 즉, 한 마리라도 검은 백조가 있다면 백조가 하얗다는 상태는 존재하지 않는다는 것이다.  

예를 들어 보자. 여러 명의 친구가 중국집에서 식사를 주문하려고 한다. 평소에 안면이 있는 주인은 주문으로 상당히 바쁜 듯하다. 그래서 모두 짜장면으로 통일할 수도 있다. 아니면 뭘 주문할지 고민하다 다른 친구들이 항상 짜장면을 주문했으니 나도 짜장면을 주문하는 것이 문안하겠지 라고 생각하고 다른 친구들도 마찬가지라면 모두가 짜장면을 주문하는 상태가 내쉬 균형이다. 그러나 '나는 그래도 짬뽕'이라고 하는 친구가 가끔 있다. 그러면 모두 짜장면을 먹는다는 내쉬 균형은 성립하지 않는다. 다른 친구가 '야, 아저씨 바쁘시잖아, 그냥, 짜장면 먹어."라고 말하면 이 친구는 마음을 바꿀 수도 있을 것이다.  

우리나라 사람들 여전히 남의 옷 복장을 가지고 ' 그게 옷이 뭐냐?'하는 사람들 있다. 이를 집단주의로부터의 이탈에 대한 견제 기능이라고 한다. 그리고 이 기능이 작동될 때 모두가 교복과 같이 똑같은 옷을 입고 동질화되는 집단주의의 폐해가 발생할 수 있다. 
 

한편, 법의 준수는 안정된 사회를 지키기 위한 황금률이다. 이는 남들 모두 법을 지키니 나도 법을 지키며 모두들 그러한 상태이다. 법은 지위고하를 막론하고 지켜져야 한다. 최순실 국정 농단 사건은 "너희만 지키세요"라는 태도로 사회를 불안정하게 만든 내쉬 균형이 아닌 상태이다. 
 
### Behind Story

내쉬가 대학원 박사 시절을 보낸 프린스턴 대학의 연구소에는 수학, 물리학, 게임이론 및 컴퓨터 원리 등 다양한 분야에서 업적을 남긴 폰 노이먼을 비롯 상대성이론의 아인슈타인 등 당대의 석학들이 모여 있었다.  내쉬는 노이먼을 찾아가 그가 정립한 ‘미니맥스 정리'를 확장하기 위한 자신의 논리를 설명했다. 그러나 그는 내쉬의 아이디어를 폄하하는 발언을 한다. 

> 폰 노이먼은, 내쉬가 몇몇 문장을 말하기가 무섭게 끼어들면서 그가 말하지도 않은 주장의 결론으로 앞서가, 퉁명하게 "당신도 잘 아다 시피 그건 명백한 거잖아. 그냥 부동점 정리네." 라고 말했다.

이와 같은 노이먼의 발언은 내쉬에게 상처가 되었고 그는 이후 노이먼을 찾아가지 않았다고 한다. 실은 1년 전쯤에는 당대의 석학인 물리학자 아인슈타인을 찾아갔지만 그 역시 완곡한 표현으로 그의 아이디어를 크게 평가하지는 않았다고 한다.  

이들이 내쉬의 생각을 높게 평가하지 않은 것은 내쉬가 부동점 정리를 먼저 찾아낸 것이 아니라 기존의 발견을 균형의 존재를 증명하는데 이용했기 때문이다. 실은 내쉬는 이 정리를 석사 과정 때 스스로 증명하여 지도교수에게 보여준 적이 있다. 그는 내쉬에게 유감스럽게 이것은 부동점 정리라는 것으로 이미 다른 수학자가 증명했다고 설명해주었다. 그는 내쉬가 프린스턴 대학의 박사 과정에 입학 시 추천서에 "이 학생은 수학적 천재다"라고 써주었다. 

![](http://sungsoo.github.com/images/nash-letter.png)

부동점 정리는 그의 업적이 되지는 못했지만 결국 노이먼의 미니맥스 정리를 확장하는데 이용했던 것이다. 순수 수학의 입장에서는 내쉬는 단순히 부동점 정리를 응용한 것이기 때문에 업적이라고 볼 수는 없다. 그럼에도 불구하고 후세의 학자들이 분야를 물문하고 그의 균형 개념을 사용하기 시작한 것은 수학적 증명을 넘어서 새로운 시각에서 사회, 물리 현상을 분석할 내쉬를 독려해준 사람은 David Gale과 Tucker 교수였다. 게일 교수는 그가 이 연구에 우선권을 주어야 한다고 강조했다. 왜냐하면 내쉬는 이미 두 석학이 그의 아이디어를 크게 사지 않았고 따라서 내쉬 균형으로 박사 학위를 받는 것은 어렵지 않겠냐고 생각했기 때문이다. 또한, 게일 교수는 이 증명에 대한 저작권을 학계에서 인정받을 수 있도록 해야 한다며 그에게 증명 논리를 받아서 학술지에 게재해주었다. 수 있는 지견을 제공해주었기 때문이다. 


터커는 내쉬에게 일반화된 증명만치 그 의미를 설명해주고 구체적인 예를 보여주는 것도 중요하다고 설명했다. 내쉬는 이와 같은 터커의 제안에 불만을 품고 상당히 오랫동안 터커를 보러 오지 않았다고 한다. 그러나 결국 내쉬는 터커의 제안에 따르게 되었다. 터커는 내쉬 균형의 실제로는 플레이어 모두에게 가장 최선의 전략이 아님에도 불구하고 선택되는 죄수의 딜레마(prisoner's dilemma)를 두 공범이 체포되어 격리된 상태에서 범행 사실을 자백하는 설정으로 설명하여 유명하게 만든 장본인이기도 하다.  

 
 
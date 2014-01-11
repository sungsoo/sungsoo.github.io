---
layout: post
title: Physical Properties and selection of thermodynamic models
date: 2014-01-11
categories: [mathmatical science]
tags: [thermodynamics]

---


Introduction
---

화학공정모사기(**Chemical Process Simulator**)란 
>“화학공정을 열역학을 이용하여 수학적으로 모델화하여 이를 컴퓨터 하드웨어를 이용하여 실제 석유화학공장에서 일어나는 사항을 묘사하는 소프트웨어이다.”   

이러한 화학공정 모사기에 실제 공정에 투입되는 물체의 물성치, 유량 및 운전조건이 주어지면 실제로 공장을 가동하지 않고도 짧은 시간과 비용만으로 실제와 거의 같은 결과를 얻을 수 있다. 그 이외에도 실제 공장에서 쉽게 예측할 수 없거나 실험할 수 없는 변수를 임의로 결정하여 테스트할 수 있으므로 빠르고 또 정확하게 결과를 얻을 수 있다. 

지난 30여 년간 미국이나 일본 및 유럽 선진 외국에서는 이러한 화학공정 모사기를 이용해서 많은 석유화학 공장들을 설계하거나 개조해 왔다. 우리나라에서도 최근 20여 년 사이에 많은 엔지니어링 회사 및 조업회사(정유회사 및 석유화학회사)에서 이러한 화학공정 모사기를 도입하여 설계 및 기존 공장의 운전 조건개선에 이용하려는 시도가 이루어지고 있다. 이러한 화학공정 모사기를 잘 사용하기 위해서는 각 화학공정모사기에 내장되어 있는 **약 60여개의 열역학 모델식**을 주어진 화학공정의 운전조건에 맞도록 잘 선정해야 한다. 그런데 열역학 모델식의 선정에는 아직 Default가 없다. 따라서 모사기를 다루는 설계 엔지니어가 열역학 모델식에 대한 깊은 이해와 지식이 있어야만 실제 운전조건에 맞는 모사결과를 도출할 수 있을 것이다. 

Why is it important to have an accurate estimate of the properties?
--
올바른 열역학 모델식의 선정을 통한 화학공정의 정확한 물성치의 추산이 중요한 이유를 다음의 두가지 사례를 들어서 구체적으로 설명하고자 한다. 

Dryer Column (Methanol Dehydration Column)
--
첫 번째 예로써 *Dryer Column*의 예를 들 수 있다. 여러 분이 약 40% 메탄올을 함유하고 있는 수용액에서 증류를 통해서 탑상으로 메탄올을 회수하고 탑저로 메탄올이 제거된 거의 순수한 물을 환경적 제약조건에 맞추어서 메탄올을 제거하는 공정을 의뢰 받았다고 가정해 보라. 탑상에서 얻어지는 회수된 메탄올의 순도는 96%이상이고 또한 원료에 대한 회수율은 99.9%이다. 또한 메탄올이 제거된 방류수의 물의 순도는 99.9%이상이라고 가정하라. 여러 분이 산출해 내야 하는 결과는 증류탑의 응축기와 재비기의 Heat duty와 증류탑 내의 온도 및 유량 Profile과 증류탑의 Internal을 Sizing하기 위한 전달 물성치들과 탑상과 탑저 제품의 *Stream Summary*등이다. 

![](http://sungsoo.github.com/images/schematic.png)

Methanol Dehydration Column에 대한 모식도는 아래 Fig. 1에 나타내었다. 
응축기의 운전온도는 냉각수로 냉각시킬 수 있는 온도인 45℃로 정하기로 한다. 응축기의 종류는 당연히 과냉각 응축이 될 것이다. 또한 원료에 대한 각 성분의 유량과 온도 압력 조건은 Table 1에 나타내었다. 그리고 물과 메탄올 사이의 분리를 위해서 상압조건하에서 물과 메탄올 사이의 이성분계 온도-조성 도표는 Table 2에 나타내었다. Table 2에 나타낸 실험적인 상평형 데이터를 가장 잘 추산하는 열역학 모델식은 어떤 것을 사용해야 하겠는가? Table 3은 세가지 열역학 모델식을 사용했을 때, 동일한 운전조건에 대하여 Methanol Dryer Column 탑저에서 메탄올의 함량을 나타낸 것이다. Table 3의 세가지 결과 중에서 어느 것이 가장 실제에 근접하겠는가? Fig. 2와 Fig. 4사이에 나타낸 그림은 각각 Ideal Raoult의 법칙과 SRK 상태방정식 및 NRTL 액체 활동도계수 모델식을 이용해서 추산한 결과를 나타낸 것이다.

아래의 Fig. 2를 보면 상압 조건에서 물과 메탄올 사이의 실험적인 기액 평형 조성과 Ideal Raoult의 법칙을 이용해서 추산한 결과를 비교한 것이다. Fig. 2를 자세히 살펴보면 메탄올의 조성이 40% 이상인 영역-즉, 메탄올의 원료 주입 조성이 40%이므로 정류부에 해당되는 영역-에서는 계산된 상대휘발도가 실험적인 상대휘발도 값보다 크다. 따라서, Ideal Raoult의 법칙으로 추산한 정류부의 이론단수는 실제 필요한 이론단수보다 적을 것이다. 또한, 메탄올의 조성이 40% 이하인 영역-즉, 메탄올의 원료 주입 조성이 40%이므로 회수부에 해당되는 영역-에서는 계산된 상대휘발도가 실험적인 상대휘발도 값보다 작다. 따라서, Ideal Raoult의 법칙으로 추산한 정류부의 이론단수는 실제 필요한 이론단수보다 많아질 것이다. 이렇게 되면 정류부에서는 실제 필요한 단수보다 모자라게 되고 반대로 회수부에서는 이론단수가 필요 이상으로 많아지게 된다. 물론, 정류부에서의 편차와 회수부에서의 편차가 서로 상쇄되어 전체적인 이론단수에는 영향을 미치지 않을 수 있으나 이는 결과적으로 Feed Tray Location을 잘못 선정한 결과가 되어 이 오차를 응축기와 재비기에서 Cover하지 못하면, 즉, 응축기와 재비기가 충분히 Over-design되어 있지 않으면 우리가 원하는 탑상 제품과 탑저 제품의 순도 및 회수율을 얻을 수 없게 된다. 반면에 Fig. 3은 SRK 상태방정식(이성분계 상호작용 매개변수를 이용한)을 이용해서 기액 평형을 추산한 예이다. 전반적으로 전 조성범위에 걸쳐서 계산된 상대휘발도가 실험적인 상대휘발도보다 크다. 이 경우에 SRK 상태방정식으로 계산된 Methanol Dryer Column의 이론단수는 실제로 필요한 이론단수보다 적을 것이다. 만일 SRK 상태방정식을 이용해서 Methanol Dryer Column을 설계했다면 응축기와 재비기가 충분히 Over-design되지 않았다면 우리가 원하는 제품을 얻을 수 없을 지도 모른다. 또 설사 응축기와 재비기가 충분히 Over0design되었다 하더라도 과도한 Over-design으로 인하여 초기 장치 투자비가 필요 이상으로 많이 소모될 것은 분명하다. 이에 반하여 Fig. 4에 나타낸 것은 NRTL 액체 활동도계수 모델식을 이용해서 물과 메탄올 사이의 상평형을 추산한 것이다. 전 조성범위에 걸쳐서 계산된 기액 평형 데이터가 실험 데이터를 잘 설명해 준다. 따라서 물-메탄올 사이의 분리탑을 설계하기 위해서 가장 적절한 열역학 모델식은 NRTL식이다. Table 4에는 물과 메탄올 사이의 이성분계 NRTL 매개변수를 나타내었다. 


다음은 Methanol Dryer Column을 NRTL 모델식을 사용하고 PRO/II 공정모사기를 사용한 Keyworkd Input을나타낸 것이다. 

```
TITLE PROJECT=C1, PROBLEM=APPBRIEFS, USER=JHCHO, DATE=05/15/02
PRINT INPUT=ALL, RATE=M, PERCENT=M
  DIMENSION METRIC, PRES=BAR
  SEQUENCE SIMSCI
COMPONENT DATA
  LIBID 1,METHANOL/2,WATER
THERMODYNAMIC DATA
  METHOD KVAL(VLE)=NRTL, PHI=IDEAL, ENTHALPY(L)=IDEAL, &
         ENTHALPY(V)=IDEAL, DENSITY(L)=IDEAL, DENSITY(V)=IDEAL, &
         SET=NRTL01
    KVAL(VLE) POYNTING=OFF
      NRTL 1,2,0,-121.89,0,427.3,0.2835
STREAM DATA
  PROPERTY STREAM=1, PRESSURE=3.5, PHASE=L, RATE(M)=1000,  &
        COMPOSITION(M)=1,400/2,600, NORMALIZE
  NAME 1,FEED/2,METH PROD/3,WATER PROD
UNIT OPERATIONS
  COLUMN UID=N-1, NAME=MEOH DRYER
      PARAMETER TRAY=15,IO
      FEED 1,8
      PRODUCT  OVHD(M)=2,400, BTMS(M)=3, SUPERSEDE=ON
      CONDENSER TYPE=TFIX, PRESSURE=1.1, TEMPERATURE=45
      DUTY 1,1/2,15
      PSPEC PTOP=1.3, DPCOLUMN=0.2
      PRINT PROPTABLE=PART
      ESTIMATE MODEL=CONVENTIONAL
      SPEC STREAM=2, RATE(KGM/H), COMP=1,WET, DIVIDE, STREAM=1, &
                 RATE(KGM/H), COMP=1,WET, VALUE=0.999
      SPEC STREAM=2,FRACTION, COMP=1,WET, VALUE=0.96, ATOLER=0.001
      VARY DUTY=1,2
END
```

Acetic Acid / Water Separation Column
--

두 번째 예로써 Acetic Acid와 Water의 이성분계 증류탑 설계의 예를 들 수 있다. 여러 분이 약 40% Acetic Acid를 함유하고 있는 수용액을 증류를 통해서 탑상으로 물을 회수하고 탑저로 Acetic Acid를 회수하는 증류탑의 설계를 의뢰 받았다고 하자. 그러면 먼저 열역학적 관점에서 이 문제를 해결하기 위해서 증류탑의 운전압력 조건인 상압에서 이성분계의 기액 평형 데이터를 확보해야 할 것이다. Acetic Acid와 Water 사이의 이성분계의 기액 평형 데이터는 다음 Fig. 5에 나타내었다. Fig. 5를 보면 이 시스템은 공비점을 형성하지도 않고 또한 운전 압력도 상압 근처이므로 기상은 이상기체 혼합물로 가정하고 액상의 비이상성을 설명하기 위해서 보통의 활동도계수 모델식을 사용하면 될 것으로 판단된다. 그러면 이제 Fig. 6을 보자. Fig. 6에서 파란색 곡선이 NRTL 모델식을 이용해서 Acetic Acid와 Water 사이의 이성분계 상평형을 추산한 것이다. 기대와는 달리 NRTL 모델식은 이 계의 기액 평형을 잘 추산하지 못한다. 실제로는 공비점을 형성하지 않으나 NRTL 모델식은 물의 조성이 80% 이상에서 공비점을 형성하는 것으로 잘 못 추산한다. 그렇게 되면 실제로는 Acetic Acid와 Water 사이의 효과적인 분리가 가능하나 NRTL 모델식을 사용하면 통상적인 하나의 증류탑을 사용해서는 두 성분 사이의 분리 또는 공비점 이후의 순도를 얻어낼 수 없는 것으로 잘못된 결론을 내리게 될 것이다. 반면에 빨간색 점선으로 표시한 것은 액상은 NRTL 모델식을 기상은 Hayden-O'Connle식을 이용한 것이다. 이 경우에는 주어진 계의 상평형을 잘 추산한다. 그 이유는 다음과 같다. 


아래의 Fig. 7은 액상에서 Acetic Acid의 조성의 함수로 표현한 각 성분의 활동도계수를 NRTL 모델식을 이용해서 나타낸 것이다. 전 조성범위에 걸쳐서 활동도계수가 1이 아니므로 이상용액이 아님은 분명하다. 하지만 활동도계수의 모양이 서로간에 크게 다르지 않고 대칭축도 0.5 근처에 존재하기 때문에 액상은 그다지 비이상적인 혼합물은 아니다. 그런데 Fig. 8은 Acetic Acid의 기상에서의 조성의 함수로 나타낸 각 성분의 퓨개시티 계수를 나타낸 것이다. 여기에서 Acetic Acid의 퓨개시티 계수를 보면 압력이 상압임에도 불구하고 전 조성 범위에 걸쳐서 0.4정도의 값을 나타내는 것을 알 수 있다. 그 이유는 Acetic Acid가 다음 Fig. 9와 같이 기상에서 이량체(Dimer)를 형성하기 때문이다. 즉, 기상에서 이량체를 형성한 이후에는 이량체와 단량체 사이의 물리적 상호작용만 존재하므로 마치 겉보기 몰분율이 반으로 줄어든 것과 같은 효과를 나타내므로 퓨개시티 계수가 0.4 근처의 값을 나타내는 것이다. 

Related Products
---

현재 국내에서 사용되고 있는 공정모사기는 Simulation Science사의 PRO/II with PROVISION, Aspen Technology 사의 ASPENPLUS, Hyprotech사의 HYSYS와Chemstations사의CHEMCAD등을들수있다. 이들 모사기에 따라서 각각 강점을 보이는 분야가 있을 수 있으나 공정모사기의 구조상 순수성분의 물성치 데이터베이스와 열역학 모델식 및 각 열역학 모델식의 이성분계 상호작용 매개변수를 얼마나 많이 내장하고 있는가와 또는 얼마나 많은 단위조작 모 델들을 보유하고 있는가가 모사기의 성능을 좌우할 것이다. 필자는 여기에서 각각의 공정모사기의 성능을 비교할 의도 는 전혀 없다. 다만 열역학을 전공하고 공부하고 있는 입장에서 공정모사기를 바라본다면 이러한 결론을 내릴 수 있 다. 동일한공정을두사람의각기다른엔지니어에게모사를의뢰했을때만일두사람의설계엔지니어가동일한 공정모사기를 사용했다 하더라도 서로 다른 열역학 모델식을 사용했다면 두 사람의 모사 결과는 달라질 것이다. 이 경 우두사람중한사람은잘못된결과를냈거나아니면두사람모두가틀린결과를낼가능성이있다. 각엔지니어 의 모사 결과에 대한 검증은 주어진 공정에 포함되어 있는 성분들이 무엇인가와 공정의 운전 온도와 압력 조건에 어 떻게 되는가에 따라서 선정되는 열역학 모델식의 부류가 달라질 것이고, 올바른 모델식을 선정한 이후에는 주요한 Key binary 성분들 간에 이성분계 상호작용 매개변수가 모사기의 데이터베이스에 내장되어 있는지를 확인해야 할 것 이다. 따라서 열역학적 지식이 충분한 엔지니어라면 중요한 것은 어떠한 공정모사기를 사용해서 주어진 공정을 모사했 나 보다는 어떠한 열역학 모델식을 선정했는가가 더 중요한 인자가 될 것이다. 왜냐하면 올바른 열역학 모델식과 모델 식의 이성분계 상호작용 매개변수를 사용했다면 다른 종류의 모사기를 사용했다 하더라도 거의 동일한 모사결과를 낼 것이기 때문이다.


References
--
[1] Johan Liedman, *Dynamic simulation of a centrifugal compressor system*, Department of Chemical and Biological Engineering, CHALMERS UNIVERSITY OF TECHNOLOGY, 2013

---
layout: post
title: Physical Properties and selection of thermodynamic models
date: 2014-01-11
categories: [mathmatical science]
tags: [thermodynamics]

---


Introduction
---

화학공정모사기(Chemical Process Simulator)란 “화학공정을 열역학을 이용하여 수학적으로 모델화하여 이를 컴퓨터 하드웨어를 이용하여 실제 석유화학공장에서 일어나는 사항을 묘사하는 소프트웨어이다.” 이러한 화학공정 모사기에 실제 공정에 투입되는 물체의 물성치, 유량 및 운전조건이 주어지면 실제로 공장을 가동하지 않고도 짧은 시간과 비용만으로 실제와 거의 같은 결과를 얻을 수 있다. 그 이외에도 실제 공장에서 쉽게 예측할 수 없거나 실험할 수 없는 변수를 임의로 결정하여 테스트할 수 있으므로 빠르고 또 정확하게 결과를 얻을 수 있다. 지난 30여 년간 미국이나 일본 및 유럽 선진 외국에서는 이러한 화학공정 모사기를 이용해서 많은 석유화학 공장들을 설계하거나 개조해 왔다. 우리나라에서도 최근 20여 년 사이에 많은 엔지니어링 회사 및 조업회사(정유회사 및 석유화학회사)에서 이러한 화학공정 모사기를 도입하여 설계 및 기존 공장의 운전 조건개선에 이용하려는 시도가 이루어지고 있다. 이러한 화학공정 모사기를 잘 사용하기 위해서는 각 화학공정모사기에 내장되어 있는 약 60여개의 열역학 모델식을 주어진 화학공정의 운전조건에 맞도록 잘 선정해야 한다. 그런데 열역학 모델식의 선정에는 아직 Default가 없다. 따라서 모사기를 다루는 설계 엔지니어가 열역학 모델식에 대한 깊은 이해와 지식이 있어야만 실제 운전조건에 맞는 모사결과를 도출할 수 있을 것이다. 

Why is it important to have an accurate estimate of the properties?
--
올바른 열역학 모델식의 선정을 통한 화학공정의 정확한 물성치의 추산이 중요한 이유를 다음의 두가지 사례를 들어서 구체적으로 설명하고자 한다. 

Dryer Column (Methanol Dehydration Column)
--
첫 번째 예로써 Dryer Column의 예를 들 수 있다. 여러 분이 약 40% 메탄올을 함유하고 있는 수용액에서 증류를 통해서 탑상으로 메탄올을 회수하고 탑저로 메탄올이 제거된 거의 순수한 물을 환경적 제약조건에 맞추어서 메탄올을 제거하는 공정을 의뢰 받았다고 가정해 보라. 탑상에서 얻어지는 회수된 메탄올의 순도는 96%이상이고 또한 원료에 대한 회수율은 99.9%이다. 또한 메탄올이 제거된 방류수의 물의 순도는 99.9%이상이라고 가정하라. 여러 분이 산출해 내야 하는 결과는 증류탑의 응축기와 재비기의 Heat duty와 증류탑 내의 온도 및 유량 Profile과 증류탑의 Internal을 Sizing하기 위한 전달 물성치들과 탑상과 탑저 제품의 Stream Summary등이다. 
Methanol Dehydration Column에 대한 모식도는 아래 Fig. 1에 나타내었다. 응축기의 운전온도는 냉각수로 냉각시킬 수 있는 온도인 45℃로 정하기로 한다. 응축기의 종류는 당연히 과냉각 응축이 될 것이다. 또한 원료에 대한 각 성분의 유량과 온도 압력 조건은 Table 1에 나타내었다. 그리고 물과 메탄올 사이의 분리를 위해서 상압조건하에서 물과 메탄올 사이의 이성분계 온도-조성 도표는 Table 2에 나타내었다. Table 2에 나타낸 실험적인 상평형 데이터를 가장 잘 추산하는 열역학 모델식은 어떤 것을 사용해야 하겠는가? Table 3은 세가지 열역학 모델식을 사용했을 때, 동일한 운전조건에 대하여 Methanol Dryer Column 탑저에서 메탄올의 함량을 나타낸 것이다. Table 3의 세가지 결과 중에서 어느 것이 가장 실제에 근접하겠는가? Fig. 2와 Fig. 4사이에 나타낸 그림은 각각 Ideal Raoult의 법칙과 SRK 상태방정식 및 NRTL 액체 활동도계수 모델식을 이용해서 추산한 결과를 나타낸 것이다.


References
--
[1] Johan Liedman, *Dynamic simulation of a centrifugal compressor system*, Department of Chemical and Biological Engineering, CHALMERS UNIVERSITY OF TECHNOLOGY, 2013

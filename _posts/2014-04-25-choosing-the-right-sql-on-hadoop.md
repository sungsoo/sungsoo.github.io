---
layout: post
title: Choosing the Right SQL-on-Hadoop
date: 2014-04-25
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [어떤 SQL-on-Hadoop을 선택해야 할까?](http://blrunner.com/67)
* Authors: 정재화

 
   
# Choosing the Right SQL-on-Hadoop


Hadoop에 관심이 있는 사람은 한 번이라도 들어봤을 정도로, SQL-on-Hadoop은
이 분야의 화두로 떠오르고 있습니다. 오늘은 SQL-on-Hadoop이 무엇이고,
 SQL-on-Hadoop을 선택할 때 어떤 점을 고려해야 하는지 설명하고자 합니다.
참고로 이 글은 [테크플래닛 2013](http://techplanet.skplanet.com/)의
“[SQL-on-Hadoop, 그리고
Tajo](http://www.slideshare.net/hyunsikchoi/sqlonhadoop-tajo-tech-planet-2013)”
 발표 자료를 참고해서 작성했습니다.




# ​1. What is SQL-on-Hadoop?




SQL-on-Hadoop이란 HDFS에 저장된 데이터에 대한 SQL 질의 처리를 제공하는
시스템을 의미합니다. 대부분의 SQL-on-Hadoop 시스템들은 기존 Hadoop에서
제공하는 MapReduce 아키텍처를 이용하지 않고, 새로운 분산 처리 모델과
프레임워크를 기반으로 구현되어 있습니다.




Apache Hive, Apache Tajo, Cloudera의 Impala, Facebook의 Presto, Pivotal
HD의 HAWQ, Apache Drill, 이외도 수많은 SQL-on-Hadoop 엔진들이 앞다투어
출시되고 있습니다. 춘추전국시대라는 표현이 과하지 않을 정도로, 치열한
경쟁을 벌이고 있습니다.




![SQLOnHadoop.jpg](https://lh6.googleusercontent.com/aShLRQXekM3NF2VX59MqDFk0TApDaR87KIeh8hKjTh0vLCmHPYdlICKffulVFt-Y9W2s6Fe9re1zn6io71QtPy6969VMLEoOP3UEhQzXIqr03GRqHV20PPamMM0idJli2g)






위와 같은 SQL-On-Hadoop 제품들은 외형적으로 비슷해보이지만, 실제로는
저마다 다양한 설계 목표를 지향하고 있습니다.





# ​2. 분류 기준




올바른 SQL-on-Hadoop 시스템을 선택하기 위해서는, SQL-on-Hadoop 시스템은
어떻게 분류되는지 알고 있어야 합니다. 그래야 실제 업무에 알맞은 시스템을
적용할 수 있기 때문입니다. 그렇다면 어떤 기준으로 SQL-on-Hadoop 시스템을
분류할 수 있을까요?




## 2.1 Long Time Query




여러 요건들이 있지만, 그중 가장 중요한 요건은 “Long Time 질의를
지원하는가? 지원하지 않는가?” 입니다. SQL-on-Hadoop 시스템들의 벤치마크
테스트 결과를 보면, 수 밀리세컨드 혹은 수 초가 소요되는 질의들의 테스트
결과만 제시하는 경우가 많습니다. 이렇게 눈 깜짝할 사이에 끝날 수 있는
질의는 Short Time 질의를 의미하며, 이는 low latency를 지원한다고
말합니다. 하지만 Long Time 질의는 이와는 질의를 수행하는데 많은 시간이
소요되는 질의를 의미합니다. 적게는 수 분에서, 많게는 수 시간까지
소요되는 경우를 말합니다.




Long Time 질의의 지원 여부는 처리하고자 하는 데이터 사이즈에도 영향을
받습니다. 데이터 처리를 빠르게 하는 방법 중 하나는 캐시나 메모리에
데이터를 로딩하는 방법이 있습니다. 이때 원본 데이터의 사이즈가
메모리보다 크다면, 질의를 처리할 수 없거나, 다른 방법으로 질의를
실행해야 할 것입니다.  실제로 low latency를 지향하는 시스템들을
테스트해보면, low latency에 적합한 질의는 매우 빠르게 처리되지만, 특정
질의는 오류가 나거나, low latency 실행 시간과 극도로 차이가 나는 것을
쉽게 확인할 수 있습니다. 하지만 Long Time 질의는 수 TB에서 수 PB 이상의
원본 데이터를 지원한 수 있습니다. 그래서 데이터의 사이즈가 폭발적으로
증가하여도, 시스템이 안정적으로 질의 처리를 지원해줍니다.




이러한 Long Time 질의를 지원하기 위해서는 두 가지 중요한 설계 포인트가
있습니다. 첫째는 Fault Tolerance (내고장성), 둘째는 Dynamic Scheduling
(다이나믹 스케쥴링)입니다.




### 2.1.1 Fault Tolerance




모든 시스템은 언제든지 장애가 발생할 수 있습니다. 어플리케이션에 문제가
있을 수도 있고, CPU, 메모리, 디스크, 네트워크같은 시스템 리소스도
언제든지 문제가 발생할 수 있습니다. SQL-on-Hadoop에서 Fault Tolerance란
“질의 처리 중 발생하는 오류를 처리하여, 질의를 완료하는 기능"을
의미합니다. Long Time 질의 경우 수십분에서 수시간 이상이 소요됩니다.
이러한 질의는 작은 단위의 task(태스크)로 나누어 처리를 하고, 오류의
범위를 해당 태스크로 한정한 후, 태스크를 재시작해야 합니다. 단, Fault
Tolerance를 지원할 경우, 질의 처리 중간에 생성되는 데이터를
materialization해야 하는데, 디스크 부하를 유발할 수 있습니다. 결국 Fault
Tolerance와 시스템의 Throughput(처리량)은 trade-off 관계 (상반관계)라고
볼 수 있습니다.




### 2.1.2 Dynamic Scheduling




스케쥴링 기법에는 Fixed Scheduling (고정 스케쥴링)과 Dynamic Scheduling
(다이나믹 스케쥴링)이 있습니다. 고정 스케쥴링의 경우, 작업을 시작할 때
클러스터 노드들에게 균등하게 분할된 작업을 한번에 할당합니다. 하지만
다이나믹 스케쥴링은 각 노드에 노드가 한 번에 실행할 수 있는 태스크를
우선적으로 분배합니다. 그리고 노드가 할당 받은 태스크가 완료되면, 다시
태스크를 할당합니다.




## 2.2 Data Warehouse Infrastructure VS distributed Query Engine




Long Time 질의의 지원은 해당 시스템이 Data Warehouse
Infrastructure(데이터 웨어하우스 인프라스트럭처)에 적합한 시스템인지,
아니면 빠른 질의 만을 처리하기 위한 distributed Query Engine(분산 질의
엔진)인지를 결정하게 됩니다. 그렇다면 데이터 웨어하우스 인프라스트럭처와
분산 질의 엔진은 어떠한 차이가 있을까요? 두 시스템은 다음과 같은 특성을
가지고 있습니다.




### 2.2.1 Data Warehouse Infrastructure

-   수 시간 이상 걸리는 질의 수행 가능

-   ETL 작업: 데이터 변환 및 데이터 노이즈 제거, 데이터 파티셔닝

-   Data Integration: 다수 데이터 소스에 대한 통합

-   Ad-hoc Query




### 2.2.2 Distributed Query Engine

-   수 초에서 수 분까지 질의 수행에 최적화

-   빠른 응답을 가지는 Ad-hoc Query

-   중간 데이터 크기와 지원에 따라 질의가 다소 제약됨

→ 인메모리 처리 구조와 파이프 라인 방식에 따라 제약 발생




# ​3. 설계 원칙에 따른 분류




아래 표는 앞서 설명한 설계 원칙에 따라 SQL-on-Hadoop 시스템들을 분류한
결과입니다.


<table style="border:none;border-collapse:collapse;width:624px"><colgroup><col width="*"><col width="*"><col width="*"><col width="*"><col width="*"></colgroup><tbody><tr style="height:0px"><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:middle;background-color:#b6d7a8;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">System Name</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:middle;background-color:#b6d7a8;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Fault</span></p><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Tolerance</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:middle;background-color:#b6d7a8;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Dynamic Scheduling</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:middle;background-color:#b6d7a8;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Log Time Query</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:middle;background-color:#b6d7a8;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Low Latency</span></p></td></tr><tr style="height:0px"><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Apache Tajo</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td></tr><tr style="height:0px"><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Impala</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">X</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">X</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">X</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td></tr><tr style="height:0px"><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Stringer (Hive)</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td></tr><tr style="height:0px"><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Presto</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">X</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">X</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">X</span></p></td><td style="border-left:solid #000000 1px;border-right:solid #000000 1px;border-bottom:solid #000000 1px;border-top:solid #000000 1px;vertical-align:top;padding:7px 7px 7px 7px"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:15px;font-family:Arial;color:#000000;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">O</span></p></td></tr></tbody></table>


이번에는 Data Warehouse Infrastructue와 Distributed Query Engine의
기준으로 시스템을 분류해봤습니다.



![SQLonHadoop분류.jpg](https://lh4.googleusercontent.com/SbV34EUPA6iB4reI8wIYyUHzPNdVWLre2pqScFRLAJKi6Cf9Qg3ppapoK4VWeADTdlbkfKATqzazvkkvIp6CLVvV-3VkpWg8kegL_gDRhXEMdnh8-uGzZadmS9cJVV1D9A)




# 결론


지금까지 SQL-on-Hadoop의 정의와 분류 기준에 대해서 알아봤습니다.
SQL-on-Hadoop을 선택할 때는, 반드시 시스템 분류 기준을 이해한 후,
워크로드에 알맞은 시스템을 선택해야 합니다. 만약 이러한 관점들을
고려하지 않고, 특정 벤더 혹은 특정 언론의 벤치마크 수치만을 믿고
시스템을 선택한다면, 역효과를 볼 수 있기 때문입니다.

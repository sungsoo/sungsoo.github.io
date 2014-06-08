---
layout: post
title: What is SQL-on-Hadoop?
date: 2014-06-13
categories: [computer science]
tags: [big data, data management]

---



## Article Source
* Title: [What is SQL-on-Hadoop?](http://www.jaso.co.kr/482)
* Authors:  Hyeong-jun Kim



[![](http://sungsoo.github.com/images/sql-on-hadoop-facts.png)](http://sungsoo.github.com/images/sql-on-hadoop-facts.png)

---

# What is SQL-on-Hadoop?

SQL-On-Hadoop은 다음 그림과 같이  데이터 파일을 Hadoop에 저장하고 이
데이터를 SQL을 이용하여 분산된 환경에서 질의를 실행하여 결과를 반환하는
시스템을 말한다.


![사용자 삽입 이미지](http://sungsoo.github.com/images/1206927860.png)

SQL-On-Hadoop 시스템이 집중 조명 받는 이유는 다음과 같은 이유때문이다.
[Presentation slide](http://www.slideshare.net/gruter/tech-planet-final)

### MapReduce의 한계
  . 데이터 처리 모델상의 한계 (관계형 처리를 위해 고안된 것이 아님)
    Map -> Shuffle -> Reduce
  . Pig, Hive는 MapReduce가 제공하는 기능 이상의 최적화 불가능
  . 느린 속도 (초기화 및 스케쥴링 지연)
    MapReduce가 느린 것이 아님, 하둡 구현이 느린 것

### 높은 learning curve 및 Legacy 시스템들과 호환성 문제
  . MapReduce는 어렵고, 개발 노력이 많이 들고, 성능 보장이 어려움
    MapReduce의 직접 사용은 점차 줄고 있음
  . HiveQL != SQL

### Ad-hoc 질의에 대한 속도 문제로 DBMS 병행 사용 불가피
  . 부담이 큰 ETL의 문제 (HDFS <-> DBMS)
  . 추가적인 스토리지 공간 필요, 비싼 DBMS 라이센스 비용의 벽

즉, 기존 Hadoop MapReduce 플랫폼의 단점과 사용자에게 익숙하면서 기존
시스템과 통합이 쉬운 SQL 기반으로 Hadoop의 데이터를 처리하는 방식인
SQL-On-Hadoop이 각광받고 있는 것이다.

## SQL-on-Hadoop Systems
 
SQL-On-Hadoop 시스템으로는 Tajo, Hive, Impala, Presto 등이 있으며 서로
다른 목표와 시스템 구성이 되어 있어 사용 및 선택에 있어 주의가 필요하다.
각 시스템들의 특징은 다음과 같다.

### Hive
가장 많이 사용하는 SQL-On-Hadoop 시스템, HiveQL이라고 하는 SQL과 거의
비슷한 문법 사용, 메타스토어에 테이블 정보, 컬럼 정보 등 저장. SQL을
MapReduce로 변환하여 실행.
장점은 MapReduce의 확정성, 안정성 등의 특징을 모두 가지고 있으며 많은
기업에서 사용하고 있으며 다양한 도구들과 연동 가능
단점은 MapReduce의 단점이기도 한 map -> reduce task 의 셔플 데이터가
디스크 기반으로 동작하며 job과 job 사이에도 hdfs 파일을 이용하여
동작하기 때문에 성능이 느림

### Stinger Initiative

별도의 솔루션이라기보다는 hive를 개선하는 프로젝트로 hotonworks 주도로
진행되고 있음. 

다음 개선 사항을 중심으로 진행

* **실행계획 개선**: join, order by 등에서 실행 계획을 개선함로써 mapreduce
job의 갯수를 줄이거나 분산 처리 효과를 올려 성능을 개선
* **파일포맷 개선**: ORC라고 하는 좀더 개선된 columnar file formart을
만들고 이를 지원. ORC는 string 타입인 경우 내부에 dictionary 기반 저장
방식을 이용하여, 컬럼별 압축 포맷을 다르게 줄 수 있어 데이터 타입에
최적화된 압축을 할 수 있고, 다양한 메타 정보를 저장함으로써 읽기에
최적화된 파일 포맷. 단점은 쓰기 성능이 좋지 않음
* **실행엔진 tez 적용**: 기존 hive는 mapreduce를 실행엔진으로 사용하고 있어
mapreduce의 장단점을 그대로 가지고 있어 성능 개선하는데 한계가 있음.
tez라고 apache incubation 프로젝트로 진행 중인 DAG 기반의 컴퓨팅 엔진을
적용하여 효율적인 실행계획과 컴퓨팅 작업을 수행하는 것을 목표로 함. 

Hive 질의의 모든 operation을 tez 기반으로 다시 만들어야 하기 때문에
출시까지는 시간이 다소 소요될 것으로 예상  
Hotonworks에서 주도적으로 개발하고 있으며 Hotonworks의 주력 제품으로
만들기 위해 노력중

### Impala

hdfs 또는 hbase에 저장된 데이터 HiveQL을 이용하여 처리,
메타스토어는 Hive의 메타스토어 이용

장점은 MapReduce 방식이 아닌 자체 질의 실행 엔진을 가지고 있어
MapReduce의 셔플 오버헤드가 없으며, 실행계획이 다단계로 구성되는 경우 각
단계를 중간 데이터를 HDFS에 저장하지 않기 때문에 질의 실행 성능이
뛰어나다.

단점은 중간 데이터를 메모리에 모두 가지고 있기 때문에 중간 데이터가
메모리 크기를 넘어서는 질의는 실행할 수 없으며 실제 질의를 실행해야지만
에러 여부를 파악할 수 있다는 것이다. ETL 용도보다는 Interactive Analysis
용도로 적합하다고 할 수 있다.

아파치 라이센스의 오픈소스이기는 하지만 Cloudera에서 코드에 대한
제어권을 가지고 있어 오픈소스 커뮤니티가 형성되어 있지는 않다.

### Apache Drill
빠른 질의 응답성능을 목표로 개발되고 있는 아파치
오픈소스로 진행되고 있다. 현재 1.0이 릴리즈 되었지만 분산 환경에서
실행되지 않으며 한대에서 질의 파서, 질의 실행 계획 수립, 질의 실행 등의
작업이 수행되는 수준

MapR이 주도적으로 개발하고 있으며 질의 계획 및 최적화 계층을 Optiq라는
외부 솔루션에 의존

### Presto
Facebook에서 최근 공개한 오픈 소스로 Approximate Aggregation
이라고 하여 아주 큰 데이터에 대해 정확한 결과 값보다는 통계적 기법을
이용하여 예상치를 제공하는 방식으로 질의 성능을 향상 시킨 솔루션이다.

Facebook에서는 Hive를 주로 사용하고 정확하지는 않지만 빠른 응답성이
필요한 업무에 Presto를 사용하고 있다고 한다.
Presto는 현재 초기 버전으로 지원하는 질의도 많지 않으며 성능도 Impala와
비슷하거나 다소 떨어지는 것으로 테스트 되고 있다.

### [Tajo](http://tajo.incubator.apache.org)

Tajo는 하둡 기반의 대용량
데이터웨어 하우스 시스템을 목표로 하는 솔루션으로 현재 아파치 인큐베이션
프로젝트로 진행 중인 프로젝트이다. 
Tajo는 분산된 저장소에 저장된 데이터를 SQL 질의를 분산 실행 시켜 빠르게
데이터를 처리하는 기능을 제공하는 플랫폼이다. 


![사용자 삽입 이미지](http://sungsoo.github.com/images/1139294735.png)


Tajo의 목표는 다음 두가지 요구사항을 모두 만족시키는 시스템이다.

- Hive와 같이 아주 큰 데이터를 이용하여  1 ~ 2 시간 이상 실행되는
질의에 대한 지원
- 다양한 성능 개선을 통해 Hive 대비 상대적으로 빠른 질의 응답성을
지원함으로써 Interactive Analysis 질의 지원

이 두가지 목표를 위해 Tajo는 다양한 최적화와 데이터베이스에서 사용하는
다양한 기법을 사용하고 있다. 

Tajo의 장점은 다음과 같다.

- Hive 대비 헤비 질의는 3 ~ 5배 정도, 짧은 질의는 수십배 정도의 빠른
질의 성능
- 표준 SQL을 지원하는 것과 동시에 많이 사용하는 Hive 질의도 동시에
지원하며 메타 스토어도 자체 메타 스토어와 Hive 메타 스토어 모두를
지원하여 기존 시스템을 쉽게 Tajo로 전환 가능 
- 하나의 플랫폼으로 Long time query, interactive analysis query 모두
지원
- 활발한 커뮤니티
- 한국어 Q&A 및 기술 지원 가능, 사용 시 적극적인 커뮤니티 지원(한국
커미터가 지원)

Tajo의 단점은 다음과 같다.

- 최근 출시된 프로젝트로 검증이 안되었다.
- 일부 함수, 질의 문법 등 미지원

각 솔루션의 특/장점을 잘 파악하여 자신의 환경, 요구사항에 맞는 솔루션을 선택하는 것이 중요하다.

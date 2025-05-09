---
layout: post
title: Apache Mesos
date: 2018-03-01
categories: [computer science]
tags: [design patterns]

---


# Apache Mesos

## Data Center and Cluster Manager

IT에 종사하지 않는 사람도 '빅데이터'라는 말을 한 번쯤은 들어 봤을 것이다. 많 은 데이터를 저장하고 가공하여 새로운 정보로 활용하는 것이 현대 IT 기업의 일 반적인 모습이 되었다. 데이터는 점점 늘어나는데, 이를 처리하기 위해 더 많은 하 드웨어를 구입한다면 비용과 시간이 많이 들고 자원은 비효율적으로 사용하게 된 다. 그래서 많은 IT 기업에서는 더 많은 하드웨어를 구입하는 대신 기존 데이터 센 터 안의 서버로 손쉽게 자원을 확보하여 안정적으로 서비스를 유지하고 싶어 한다.

우선 전통적인 방식의 데이터 센터 운영을 살펴보자. 전통적인 데이터 센터의 모습은 서버들을 정적으로 나누어 하나의 애플리케이션을 하나의 서버에 설치하여 사용하는 방식이다. 서버 자원을 효율적으로 사용하려고 가상 기술을 이용하여 하나의 물리 머신을 여러 개의 가상 머신 (VM; Virtual Machine)으로 나누어 사용한다. 여러 대의 VM에 필요한 애플리케이션을 설치하고, 더 많은 데이터를 처리해야 하면 또 다른 VM을 생성하여 애플리케이션을 설치한다. 일반적으로 하나의 VM에 하나의 애플리케이션을 설치하는데, 결국 VM을 사용하더라도 자원을 정적으로 나누어 사용하는 방식에는 변함이 없다.

이와 같이 자원을 정적으로 나누어 사용하는 데이터 센터 운영 방식에는 몇 가지 문제점이 있다.

* **복잡한 관리** 애플리케이션을 늘리거나 줄일 경우 서버에 직접 접속하여 작업해야 하고, 사용하는 서버와 여분의 서버를 항상 관리하고 있어야 한다.
* **높은 장애 발생 가능성** 애플리케이션이 설치된 서버 중 한 대의 서버에서 문제가 발생했 을 때 그에 대한 대비가 없다면, 한 대의 서버에서 발생한 문제가 곧 장애로 이어지게 된다. 또한, 정적으로 나누어진 자원을 사용하는 환경에서 이러한 문제에 대비하는 것은 복잡한 면이 있다.
* **낮은 자원 효율성** 일반적으로 애플리케이션은 서버의 모든 자원을 최대치로 활용하지 못하는데, 이 경우 낭비되는 자원으로 인하여 자원 효율성이 떨어진다. 비효율적인 자원 활용은 많은 비용이 발생하게 하므로 기업 측면에서는 굉장히 중요한 문제다.
* **개발자에 비친화적 운영 환경** 서버를 관리하고 운영하는 것이 개발자에게 친화적이지 않다. 최근에는 개발자가 운영까지 하는 DevOps(데브옵스)의 시대이기 때문에 운영도 개발자 친화적으로 변경되어야 한다.

이제 전통적인 운영 방식은 많은 양의 데이터를 안정적으로 다루기에 더는 적합하지 않다. 우리가 익히 알고 있는 Twitter, Airbnb, Netflix, Apple과 같은 기업 뿐 아니라 국내외 다수의 기업이 클러스터 매니저를 활용하여 서버를 운영하는 방식으로 변화하고 있다. 클러스터 매니저는 물리적으로 나누어진 다수의 컴퓨터를 묶어 대규모 자원을 가진 하나의 컴퓨터로 취급하는 방식으로, 클러스터 매니저를 사용하면 다음과 같은 장점이 있다.

* **효율성 증가** 여러 애플리케이션이 자원을 공유하여 사용하므로 전통적인 운영 방식보다 효율적이다.
* **자원 독립성 확보** 자원을 공유하여 사용하기 위해서는 자원 간의 독립성을 확보하여야 한다. 자원 간 독립성을 확보함으로 인하여 동일한 서버에서 여러 개의 애플리케이션을 실행하고 있어도 다른 애플리케이션이 내가 실행하고 있는 애플리케이션에 영향을 미치지 않는다.
* **확장성 용이** 필요할 때 필요한 만큼 손쉽게 자원을 확보할 수 있다.
* **더욱 견고한 시스템** 특정 서버에 발생한 장애가 서비스 장애로 이어지지 않고, 정상적으로 실행되는 다른 서버로 애플리케이션을 이동하여 계속 실행한다.

<iframe width="600" height="400" src="https://www.youtube.com/embed/dyLtK4FhCZE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## What is Mesos?

Mesos는 2009년 버클리 대학에서 시작된 오픈소스 클러스터 매니저 프로젝트 로, 2011년에는 아파치 인큐베이션 프로젝트에 포함되었고 2013년에는 아파치 최상위 Top-level 프로젝트로 승격되었다. 이미 Twitter와 Airbnb, Apple을 포함 한 많은 기업이 실 서비스 환경에서 Mesos를 사용하고 있다.

리눅스 커널이 한 대의 컴퓨터에서 다수의 애플리케이션이 자원을 공유하여 사용할 수 있게 컴퓨터 자원을 관리하는 것과 마찬가지로, Mesos는 다수의 컴퓨터를 묶어 하나의 큰 컴퓨터로 사용할 수 있도록 자원을 관리해 준다. 그래서 보통 Mesos를 '*데이터 센터의 커널*'이라고 한다.

### Mesos Architecture

Mesos는 [그림 1-1]과 같이 마스터(Master), 슬레이브(Slave), 프레임워크(Framework)로 구성되어 있다. 각 구성 요소에 대해 살펴보자.

![](http://sungsoo.github.com/images/mesos-architecture.png)

### Master and Slave

마스터는 슬레이브와 프레임워크를 연결하는 역할을 한다. 마스터는 각 슬레이브에서 보내는 CPU, 메모리, 디스크, 포트와 같은 자원 현황을 프레임워크에 전달하고, 프레임워크는 마스터를 통해 태스크(Task) 실행을 요청한다. 주키퍼(ZooKeeper)를 이용하여 1대의 액티브 마스터(Active Master), 2대 이상의 스탠바이 마스터(Standby Master) 를 두어 마스터 장애에 대비하는 것이 일반적이다.
슬레이브는 Mesos 클러스터에서 실제로 태스크가 실행되는 곳이다. 슬레이브는 각자의 CPU, 메모리, 디스크, 포트 등의 자원을 가지고 있고, 마스터를 통해 자원 정보를 프레임워크에 전달한다.


### Framework

프레임워크는 Mesos 위에서 실행되는 특정 목적을 가진 애플리케이션을 말한다. 프레임워크는 각 슬레이브가 보낸 자원 현황을 바탕으로 태스크의 실행을 제어 하는 스케줄러(Scheduler)와 실제로 슬레이브에서 태스크를 실행하는 실행 프로그램(Executor)으로 구성되어 있다.
Mesos는 리소스 오퍼(Resource Offer)라는 정보를 주고받는데, [그림 1-2]를 참고하여 Mesos가 어떻게 동작하는지 리소스 오퍼를 중심으로 살펴보자.

1. 슬레이브1은 4 CPU와 4GB RAM을 사용할 수 있다고 마스터에게 전달한다. 마스터는 프레임워크1이 태스크를 실행하기 위해 리소스 오퍼를 요청한 사실을 Allocation 모듈에 저장하고 있다.
2. 마스터는 슬레이브1의 리소스 오퍼를 프레임워크1에 전달한다.
3. 프레임워크의 스케줄러는 슬레이브1에 2개(태스크1, 태스크2)의 태스크를 실행하겠다는 정보를 마스터에 응답으로 돌려준다. 태스크1은 2 CPU, 1GB RAM, 태스크2는 1 CPU, 2GB RAM을 사용한다.
4. 최종으로 마스터는 슬레이브1에 2개의 태스크(태스크1, 태스크2)를 전달하고, 슬레이브1에서 실행된다. 이제 슬레이브1에 남은 자원인 1 CPU와 1GB RAM 이 리소스 오퍼로 마스터에 전달된다.


![](http://sungsoo.github.com/images/resource-offer-example.png)

Mesos는 이와 같은 형태로 리소스 오퍼들이 Mesos 클러스터 내에 지속적으로 전달되면서 실행된다.

---
layout: post
title: Mesos Installation
date: 2018-03-08
categories: [computer science]
tags: [big data]

---


Mesos Installation
========

개발 환경의 Mesos 설치하기
-----------------

편의를 위해 사용하고 있는 운영체제가 Mac OS X라고 가정하고 설명한다. 다른 운영체제를 사용 중이라면 VirtualBox와 Vagrant를 운영체제에 맞는 버전으로 설치한다.
VirtualBox와 Vagrant로 Ubuntu 14.04 기반의 VM을 생성하여 Mesos 클러스터 테스트 환경을 구축해 보자. 다음 방법을 따라 하면 Mesos 마스터, 슬레이브 각 1개와 이후에 살펴볼 Marathon 프레임워크와 Chronos 프레임워크가 VM 안에 설치된다.

1. VirtualBox 설치 [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads) 페이지에서 OS X용 VirtualBox를 다운로드한 후 설치한다.
2. Vagrant 설치 [http://www.vagrantup.com/downloads.html](http://www.vagrantup.com/downloads.html) 페이지에서 OS X용 Vagrant를 다운로드한 후 설치한다.
3. playa-mesos 프로젝트를 git clone한다.
```
$ git clone https://github.com/mesosphere/playa-mesos.git
$ cd playa-mesos
```
4. 기본적인 테스트를 진행하여 정상적인 설치가 가능한 상태인지 확인한다.
```
$ bin/test
```
5. 원활한 실행을 위해 VM을 실행하기 전에 VM의 메모리를 4GB로 늘려 주자. config.json 파일 안의 vm_ram 값을 4096으로 설정하면 된다.
```
"vm_ram": "4096",
```
6. VM을 실행한다. VM이 생성되면서 Mesos 마스터, 슬레이브, Marathon 프레임워크, Chronos 프레임워크가 설치된다.
```
$ vagrant up
```
7. Mesos 마스터, Marathon 프레임워크, Chronos 프레임워크를 모두 최신 버전으로 업데이트하기 위해 다음 명령어를 실행한다(이 책을 집필하는 시점에 최 신 버전은 Mesos 0.26.0, Marathon 0.15.2, Chronos 2.4.0다).
```
$ vagrant provision
```
8. VM 실행이 완료된 후 다음 주소로 접속하면 Mesos 마스터, Marathon 프레임워크, Chronos 프레임워크의 웹 화면에 접근할 수 있다.
	* Mesos 마스터 http://10.141.141.10:5050
	* Marathon 프레임워크 http://10.141.141.10:8080
	* Chronos 프레임워크 http://10.141.141.10:4400
9. 복잡한 IP 대신 'mesos'와 'mesos.vm'이라는 간단한 호스트명으로 사용하기 위해 /etc/hosts 파일을 열어 다음과 같은 구문을 추가한다.

```
10.141.141.10 mesos mesos.vm
```
생성된 VM을 조작하는 명령어는 다음과 같다.

 
**VM에 SSH로 접속**

```
$ vagrant ssh
```

**VM 중지**

```
$ vagrant halt
```

**VM 삭제**

```
$ vagrant destroy
```
        
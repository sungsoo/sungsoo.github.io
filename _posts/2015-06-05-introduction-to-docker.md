---
layout: post
title: Introduction to Docker
date: 2015-06-05
categories: [computer science]
tags: [parallel computing]

---

## Article Source
* Title: [Docker 소개](http://bcho.tistory.com/805)
* Authors: 조대협

---


# Introduction to Docker 



## What is Docker?

## 개념 잡기

Docker는 Linux 기반의 Container RunTime 오픈소스이다. 처음 개념을 잡기가
조금 어려운데, Virtual Machine과 상당히 유사한 기능을 가지면서, Virtual
Machine보다 훨씬 가벼운 형태로 배포가 가능하다. 정확한 이해를 돕기
위해서, VM 과 Docker Container의 차이를 살펴보자.

아래는 VM 에 대한 컨셉이다. Host OS가 깔리고, 그 위에 Hypervisor
(VMWare,KVM,Xen etc)가 깔린 후에, 그위에, Virtual Machine이 만들어진다.
Virtual Machine은 일종의 x86 하드웨어를 가상화 한 것이라고 보면된다.
그래서 VM위에 다양한 종류의 Linux나, Windows등의 OS를 설치할 수 있다.



![](http://cfile8.uf.tistory.com/image/213CAE3D52655494054CF8)



Docker의Container 컨셉은 비슷하지만 약간 다르다. Docker도 VM 처럼 Docker
Engine이 Host위에서 수행된다. 그리고, Container는 Linux 기반의 OS만
수행이 가능하다.

Docker는 VM처럼 Hardware를 가상화 해주는 것이 아니라, Guest OS
(Container)를 Isolation해준다.무슨 말인가 하면, Container의 OS는
기본적으로 Linux OS만 지원하는데, Container 자체에는 Kernel등의 OS
이미지가 들어가 있지 않다. Kernel은 Host OS를 그대로 사용하되, Host OS와
Container의 OS의 다른 부분만 Container 내에 같이 Packing된다. 예를 들어
Host OS가 Ubuntu version X이고, Container의 OS가 CentOS version Y라고
했을때, Container에는 CentOS version Y의 full image가 들어가 있는 것이
아니라, Ubuntu version X와 CentOS version Y의 차이가 되는 부분만
패키징이 된다. Container 내에서 명령어를 수행하면 실제로는 Host OS에서
그 명령어가 수행된다. 즉 Host OS의 Process 공간을 공유한다.



![](http://cfile5.uf.tistory.com/image/272F203F5265549F04419F)



실제로 Container에서 App을 수행하고 ps –ef 를 이용하여 process를 보면,
“lxc”라는 이름으로 해당 App이 수행됨을 확인할 수 있다. 아래는 docker를
이용해서 container에서 bash 를 수행했을때는 ps 정보이다. lxc 프로세스로
bash 명령어가 수행되었음을 확인할 수 있다.

root      4641   954  0 15:07 pts/1    00:00:00 lxc-start -n
161c56b9284ffbad0477bd04875c4277be976e2032f3ffa35395950ea05f9bd6 -f
/var/lib/docker/containers/161c56b9284ffbad0477bd04875c4277be976e2032f3ffa35395950ea05f9bd6/config.lxc
-- /.dockerinit -g 172.17.42.1 -e TERM=xterm -e HOME=/ -e
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin -e
container=lxc -e HOSTNAME=161c56b9284f -- /bin/bash

LXC는 (LinuX Container)로, 자세한 정보는
[http://linuxcontainers.org/](http://linuxcontainers.org/) 에서 얻을 수
있다.

lxc는 container를 실행시켜주는 runtime으로, 앞에서 설명한것과 같이 VM과
비슷한 기능을 제공하지만, 실제 수행에 있어서, guest os (container)를
마치 VM처럼 isolate해서 수행해주는 기능을 제공한다.

이와 같이 Docker는 LXC라는 Linux에 특화된 feature를 사용하기 때문에,
제약 사항을 가지고 있는데, 현재까지 Docker는 Ubuntu 12.04 이상(Host
OS)에서만 사용이 가능하다.

Performance에 대해서는 당연히 Host OS에서 직접 application 을 돌리는
것보다 performance 감소가 있는데, 아래 표와 같이 performance 감소가 매우
적은 것을 볼 수 있다.



![](http://cfile27.uf.tistory.com/image/25427940526554AA210568)



출처:
[http://www.slideshare.net/modestjude/dockerat-deview-2013](http://www.slideshare.net/modestjude/dockerat-deview-2013)

Repository 연계
===============

다음으로 Docker의 특징중의 하나는 repository 연계이다.Container Image를
중앙의 Repository에 저장했다가, 다른 환경에서 가져다가 사용할 수 있다.
마치 git와 같은 VCS (Version Control System)과 같은 개념인데, 이를
통해서 Application들을 Container로 패키징해서 다른 환경으로 쉽게 옮길 수
있다는 이야기다.



![](http://cfile1.uf.tistory.com/image/2406E741526554B52C3CD5)



예를 들어 local pc에서 mysql, apache, tomcat등을 각 컨테이너에 넣어서
개발을 한 후에, 테스트 환경등으로 옮길때, Container를 repository에
저장했다가 테스트환경에서 pulling(당겨서) 똑같은 테스트환경을 꾸밀 수
있다는 것이다. Container에는 모든 application과 설치 파일, 환경 설정
정보 등이 들어 있기 때문에, 손쉽게 패키징 및 설치가 가능하다는 장점을
가지고 있다.

여기서 고려해야할점은 Docker는 아쉽게도 아직까지 개발중이고, 정식 릴리즈
버전이 아니다. 그래서, 아직까지는 production(운영환경)에 배포를 권장하고
있지 않다. 단 개발환경에서는 모든 개발자가 동일한 개발환경을 사용할 수
있게 할 수 있고, 또한 VM 보다 가볍기 때문에, 개발환경을 세팅하는데
적절하다고 볼 수 있다.

Base Image vs Dockerfile
========================

Docker의 Container Image를 packing하기 위해서, Docker는 Base Image와
Docker file이라는 두가지 컨셉을 이용한다. 쉽게 설명하면, Base Image는
기본적인 인스톨 이미지, Docker file은 기본적인 인스톨 이미지와 그 위에
추가로 설치되는 스크립트를 정의한다.

예를 들어 Base Image가 Ubuntu OS 이미지라면, Docker File은 Ubuntu OS +
Apache, MySQL을 인스톨하는 스크립트라고 보면 된다. 일반적으로 Docker
Base Image는 기본 OS 인스톨 이미지라고 보면 된다. 만약에 직접 Base
Image를 만들고 싶으면
 [http://docs.docker.io/en/latest/use/baseimages/](http://docs.docker.io/en/latest/use/baseimages/)
를 참고하면 된다. docker에서는 미리 prebuilt in image들을 제공하는데,
[https://index.docker.io/](https://index.docker.io/) 를 보면 public
repository를 통해서 제공되는 이미지들을 확인할 수 있다. 아직까지는
Ubuntu 많이 공식적으로 제공되고, 일반 contributor들이 배포한 centos 등의
이미지들을 검색할 수 있다. (2013.10.22 현재 redhat 등의 이미지는 없다.)

아래는 docker file 샘플이다. (출처 :
[http://docs.docker.io/en/latest/use/builder/](http://docs.docker.io/en/latest/use/builder/))

```
+--------------------------------------------------------------------------+
| *# Nginx*                                                               |
|                                                                          |
| *#*                                                                     |
|                                                                          |
| *# VERSION               0.0.1*                                         |
|                                                                          |
|                                                                          |
|                                                                          |
| FROM      ubuntu                                                         |
|                                                                          |
| MAINTAINER Guillaume J. Charmes <guillaume@dotcloud.com>               |
|                                                                          |
|                                                                          |
|                                                                          |
| *# make sure the package repository is up to date*                      |
|                                                                          |
| RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > |
| /etc/apt/sources.list                                                    |
|                                                                          |
| RUN apt-get update                                                       |
|                                                                          |
|                                                                          |
|                                                                          |
| RUN apt-get install -y inotify-tools nginx apache2 openssh-server        |
+--------------------------------------------------------------------------+
```
위의 이미지는 Ubuntu OS 베이스 이미지에 apt-get을 이용해서,
inotify-tools nginx apache2 openssh-serverf 를 인스톨하는 스크립트이다.

Docker 실행해보기
=================

그럼 간단하게 docker를 테스트해보자, 윈도우즈 환경을 가정한다. 앞서
말한바와 같이 Docker는 Unbuntu 위에서만 작동한다. (참고 :
[http://docs.docker.io/en/latest/installation/windows/](http://docs.docker.io/en/latest/installation/windows/))

그래서, 윈도우즈 위에서 Ubuntu VM을 설치한후, Ubuntu VM에서 Docker를
실행할 것이다. 이를 위해서 VM을 수행하기 위한 환경을 설치한다.

l  Hypervisor인 Virtual Box를 설치한다.
[https://www.virtualbox.org](https://www.virtualbox.org/) 

l  VM을 실행하기 위한 vagrant를 설치한다.
[http://www.vagrantup.com](http://www.vagrantup.com/) 

l  Docker 코드를 다운받기 위해서 git 클라이언트를 설치한다.
[http://git-scm.com/downloads](http://git-scm.com/downloads) 

여기까지 설치했으면, docker를 실행하기 위한 준비가 되었다.

다음 명령어를 수행해서, docker 코드를 git hub에서 다운로드 받은 후에,
vagrant를 이용해서 Ubuntu host os를 구동한다.

```
+--------------------------------------------------------------------------+
| git clone https://github.com/dotcloud/docker.git                         |
|                                                                          |
| cd docker                                                                |
|                                                                          |
| vagrant up                                                               |
+--------------------------------------------------------------------------+
```

Virtual Box를 확인해보면, Docker의 Host OS가 될 Ubuntu OS가 기동되었음을
확인할 수 있다.



![](http://cfile6.uf.tistory.com/image/24084E46526554C42F4737)



그러면, 기동된 Ubuntu OS로 SSH를 이용해서 log in을 해보자. Putty를
이용해서 127.0.0.1:2222 포트로, SSH를 통해서 로그인한다. (기본
id,passwd는 vagrant/vagrant 이다.)

이제 Docker를 이용해서, public repository에서 “busybox”라는 Ubuntu OS를
Container로 설치하고, 그 Container에서 “echo hello world” 명령어를
수행해보자

```
+--------------------------------------------------------------------------+
| sudo su                                                                  |
|                                                                          |
| docker run busybox echo hello world                                      |
+--------------------------------------------------------------------------+
```

Docker가 public repository에서 busybox image를 다운로드 받아서 설치하고,
아래와 같이 명령어를 수행했음을 확인할 수 있다.



![](http://cfile28.uf.tistory.com/image/2366CE43526554D2268277)



※ 참고 : 현재 docker에 설치된 이미지 리스트 docker images, 설치된
이미지를 삭제할려면 docker rmi {image id}. {image id}는 docker
images에서 hexa로 나온 id를 사용하면 된다.


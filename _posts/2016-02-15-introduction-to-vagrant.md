---
layout: post
title: Introduction to Vagrant
date: 2016-02-15
categories: [computer science]
tags: [data management]

---


## Article Source
* Title: [Vagrant를 이용한 개발환경 관리(간단한 VM관리)](http://bcho.tistory.com/806)
* Authors: 조대협

---

# Vagrant를 이용한 개발환경 관리(간단한 VM관리)

## Vagrant 시작하기

Vagrant는 한마디로 이야기 하면, “간소화된, VM 관리 서비스이다”. 이미
Virtual Machine 환경은 보편화 되서 사용되고 있고, VMWare나 Oracle의
Virtual Box등을 이용하면 PC에서도 손쉽게 VM 환경을 구축할 수 있다.
그러나 문제점은, Virtual Box와 같은 Hypervisor가 있다고 해도, VM을
생성하는 것 자체가 번거로운 작업이라는 것이다.

 Hypervisor에서 논리적인 가상 하드웨어 머신을 생성하고 가상머신에 OS를
설치하고, 일일이 설정을 해줘야 한다. 이런 반복적인 작업을 조금더 손쉽게
자동화 할 수 없을까? 하는 아이디어에서 시작한 것이 Vagrant이다.

먼저 이해를 돕기 위해서 예제를 실행해보자.

Vagrant는 VM 관리도구 이기 때문에, 먼저 Hypervisor 부터 인스톨을 해야
한다.

[https://www.virtualbox.org/](https://www.virtualbox.org/) 에서 Virtual
Box를 다운로드 받아서 설치하자.

다음으로 [http://www.vagrantup.com/](http://www.vagrantup.com/) 에서
vagrant를 받아서 인스톨한다. 이제 준비가 끝났다.

아래와 같이 vagrant init precise32
[http://files.vagrantup.com/precise32.box](http://files.vagrantup.com/precise32.box)
를 실행하면, Ubuntu Linux VM의 실행하기 위한 설정들을 자동으로 가지고
온다. 그리고 vagrant up 명령어를 실행하면 해당 설정에 따른 VM 을
자동으로 다운받아서 설치하고 Virtual Box를 통해서 해당 VM을 기동 시킨다.
Putty를 이용하여 SSH localhost:2222 번으로 접속 (id:vagrant,
passwd:vagrant)를 입력하면, 생성된 VM에 로그인할 수 있다. 또는 간단하게
“vagrant ssh”라고 실행하면, 현재 생성된 VM에 자동으로 SSH로 연결된다.

![](http://cfile9.uf.tistory.com/image/21579D335267EF9E36D8DB)

Vagrant 없이 Virtual Box에서 직접 Ubuntu VM을 설치하려면 VM을 만들고,
Ubuntu OS를 설치해야 한다. 그러나 Vagrant가 있으면 이렇게 간단하게
두줄의 명령어로 VM을 만들고 실행시킬 수 있다.

Box 개념 이해하기
=================

앞에서 vagrant init 명령을 실행할때, preceise32.box라는 파일을
지정하였다. 이 box 파일은 VM을 만들기 위한 기본 OS 이미지를 포함한 VM
설정(CPU,메모리 사이즈등)에 대한 기본 템플릿이다. (사이즈가 보통 수백
메가가 나간다.)

[http://www.vagrantbox.es/](http://www.vagrantbox.es/) 에 보면 공개된
box 파일들이 있다. Ubuntu, Debian 등 다양한 Linux OS 버전의 VM 들에 대한
box 파일들이 있다.

Vagrant file
============

Vagrant init을 하면, 해당 디렉토리에 “Vagrantfile” 이라는 이름으로
생성되는 파일인데, Box가 VM 생성을 위한 기본 템플릿이라면, Vagrant
file은 생성될 VM에 대한 세부 설정을 정의한다. VM을 생성할때, 어떤 box
파일을 사용할 것인지, VM에 대한 하드웨어 설정 예를 들어 CPU,메모리
사이즈,네트워크, 네트워크 포트포워딩 설정등을 여기서 재정의 할 수 있다.

아래는 Oracle Virtual Box실행시 preceise32 box 이미지를

[http://files.vagrantup.com/precise32.box](http://files.vagrantup.com/precise32.box)
에서 읽어와서, CPU 2개, 512M를 가진 “Terry_vargrant0”이라는 VM을
생성하는 Vagrantfile이다. 아래와 같이 파일을 생성한후에, vagrant up
명령을 수행시키면 설정한 정보 대로 VM이 생성된다.

```ruby
 VAGRANTFILE_API_VERSION = "2"                                          
                                                                          
 Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|                 
                                                                          
   config.vm.box = "precise32"                                            
                                                                          
   config.vm.box_url = "http://files.vagrantup.com/precise32.box"        
                                                                          
   # config.vm.network :forwarded_port, guest: 80, host: 8080           
                                                                          
   # config.vm.network :private_network, ip: "192.168.33.10"            
                                                                          
   # config.vm.network :public_network                                  
                                                                          
   # config.ssh.forward_agent = true                                    
                                                                          
   config.vm.provider "virtualbox" do |vm|                                
                                                                          
         vm.customize [                                                   
                                                                          
                "modifyvm",:id,                                           
                                                                          
                "--memory","512",                                         
                                                                          
                "--name","Terry_vagrant0",                               
                                                                          
                "--cpus","2",                                             
                                                                          
                        ]                                                 
                                                                          
   end                                                                    
                                                                          
 end                                                                      
```
 

Vagrant + Provisioning
======================

Vagrant를 이용하면, VM을 쉽게 만들 수 있다. 그런데 개발환경을
구축하자면, OS가 인스톨된 VM 뿐만 아니라, 그위에 웹서버,DB등
미들웨어들을 설치해야 하고, 그리고 거기에 맞는 Configuration을 해야
한다. 물론 미리 VM 이미지에 웹서버등을 설치해놓고, 필요에 따라서
vagrant를 이용해서 해당 VM들을 설치해서 사용해야 하지만 그 경우에는
설정마다 매번 다른 VM이미지를 만들어놔야 하기 때문에 번거롭다. 만약에 OS
만 설치된 VM에다가, 설정에 따라서 소프트웨어와 설정을 하는 부분을
분리한다면?

이런 접근을 지원하는 기능이 Vagrant에 provisioning이라는 기능이 있다.
VM을 기동한 후에, vagrantfile에 정의된 provisioning script를 수행해준다.
다음 예제를 보자. 다음 예제는 VM이 기동된 후에, apt-get 명령을 이용해서
apache2 (웹서버)를 자동으로 설치하는 설정이다.

```ruby
 VAGRANTFILE_API_VERSION = "2"                                          
                                                                          
 Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|                 
                                                                          
   config.vm.box = "precise32"                                            
                                                                          
   config.vm.box_url = "http://files.vagrantup.com/precise32.box"        
                                                                          
 config.vm.provision :shell, :inline => "sudo apt-get install -y         
 apache2"                                                                 
                                                                          
 end                                                                      
```

위의 예제는 VM이 기동될때 마다 shell 명령어를 수행하도록 한것인데,
명령어말고도 shell스크립트를 수행하게 할 수 도 있고, puppet이나 chef와
같은 configuration management 도구를 이용해서, 제품을 설치하게 할 수 도
있다.

한 가지 주의할점은 Vagrantfile의 provision 부분에 정의된 명령어는
vagrant up, reload, provision 3개의 명령어가 실행될때 마다 매번
실행된다. up에서도 매번 실행되기 때문에, 스크립트내에, 해당 소프트웨어가
미리 설치되었는지 확인한 후에, 설치가 안되어 있을 경우에만 설치하도록
스크립트를 짜는 것이 좋다.

Provisioning에 대한 자세한 방법은
[http://docs.vagrantup.com/v2/provisioning/index.html](http://docs.vagrantup.com/v2/provisioning/index.html)
를 참고하면 된다.

Vagrant를 이용한 개발 환경 구축
===============================

그러면 Vagrant를 이용해서 개발환경을 어떻게 구축할 수 있는지 살펴보도록
하자

![](http://cfile28.uf.tistory.com/image/2104A43A5267EFB91DBB77)

크게 그림과 같이 2개의 repository가 필요하다. Box image repository에는
기본 이미지가 인스톨된 box image들을 저장해놓는다.

그리고 svn이나 git와 같은 VCS 툴에 vagrantfile을 저장해놓는다. (아니면
간단하게 웹서버에 저장해놔도 된다.) 이 Vagrantfile에는 box 파일들을
저장해놓은 repository를 pointing 하도록 하고, 필요에 따라서

1.  Ubuntu + Apache

2.  Ubuntu + MySQL

3.  Ubuntu + Tomcat

와 같이 다양한 설정을 만들어 놓고, 필요에 따라서 Vagrantfile이 받은
후에, 간단하게 “vagrant up” 명령어만 수행하면 간단하게 개발환경에 필요한
VM을 만들어낼 수 있다.

지금까지 간략하게 Vagrant에 개념과 사용법에 대해서 알아보았다.Vagrant는
그외에도, Vagrant는 단일 VM 뿐만 아니라 multi vm을 단일 vagrantfile에서
설정이 가능하고, Oracle의 Virtual Box뿐만 아니라,VMWare 및 Amazon EC2
클라우드 까지 지원한다. 간단하게는 개발환경에서 부터,응용하면,
QA,스테이징,운영환경 배포용으로도 활용할 수 있다.

자세한 내용들은 [http://docs.vagrantup.com/](http://docs.vagrantup.com/)
를 참고하기 바란다. 

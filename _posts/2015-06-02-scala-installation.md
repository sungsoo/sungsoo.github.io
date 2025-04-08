---
layout: post
title: Scala Installation
date: 2015-06-02
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [꽃보다 Scala!](https://docs.google.com/document/pub?id=1kSNKKKwM8rjGhn9Gnw-6Q0VCImpwSRZ7_QzwNwXgMxM)


----


Scala Installation 
==================

## Install 

Scala는
[http://www.scala-lang.org/downloads](http://www.google.com/url?q=http%3A%2F%2Fwww.scala-lang.org%2Fdownloads&sa=D&sntz=1&usg=AFQjCNHAZUuiCob7GT0zAYr8lmtW0BcDhA) 에서
다운로드 가능하며 간단한 설치 과정을 거친 후

* * * * *

\$ scala

* * * * *

명령으로 바로 Scala Interpreter 를 실행할 수 있으며, 각 platform 별로
package manager 등을 이용해 설치 역시 가능합니다. 맥의 경우 Homebrew를
사용하고 있다면,

* * * * *

\$ brew install scala

* * * * *

명령으로 바로 설치 가능합니다.

참고로, 모든 Scala 구성 요소는 자바로 구현되어 있는 jar 일 뿐입니다.
필요한 경우 런타임에서 컴파일러나 인터프리터 라이브리에도 접근
가능합니다.

현재(2012.09.10) Scala의 최신 release 버전은 2.9.2 이며, 최신 개발
버전은 2.10.0-M7 입니다.

## Compile 

Scala 의 경우 인터프리터를 제공 하며, 실제 개발 환경에서는 대부분의 경우
SBT(Simple Build Tool) 를 이용하기 때문에 직접 컴파일을 할 일은 별로
없습니다.

직접 컴파일이 필요한 경우 다음과 같이 간단히 compile 가능합니다.

* * * * *

\$ scalac A.scala

* * * * *

기본적으로 package 구조에 맞춰 디렉토리를 생성하고 따로 설정값을 주지
않는 경우, 현재 디렉토리를 기준으로 하여 class 파일을 저장합니다.

Scala 컴파일러는 많은 일을하고 여러 jar 를 로딩하기 때문에 상당히
느립니다. 좀 더 빠른 실행을 원할 경우 scalac 대신 compiler daemon을
사용하는  fsc (fast scala compiler)  명령을 사용하는 것이 좋습니다.

fsc 는 처음 실행시 컴파일러 데몬을 실행하고, 다음 실행부터는 이 데몬을
재사용하여 컴파일 속도를 크게 향상 시킵니다. 아래 예제에서 보이듯이,
두번째 컴파일부터는 매우 빠른 속도롤 보여줍니다.

* * * * *

\$ fsc -verbose -d /tmp test.scala\
...\
[Port number: 32834]\
[Starting new Scala compile server instance]\
[Classpath = ...]\
[loaded directory path ... in 692ms]\
...\
[parsing test.scala]\
...\
[total in 943ms]\
\
\$ fsc -verbose -d /tmp test.scala\
...\
[Port number: 32834]\
[parsing test.scala]\
\\&...\
[total in 60ms]\
\
\$ fsc -verbose -shutdown\
[Scala compile server exited]

* * * * *

\
\* 실행한 데몬은 -shutdown 명령으로 중단시킬 수 있습니다.

## Scala Interpreter 

Scala는 대부분의 최신 언어와 마찬가지로 Interpreter 또는
REPL(Read-Eval-Print Loop) 이라 불리는 콘솔을 통해 간단한 실행및
테스트가 가능합니다.

* * * * *

\$ scala

scala\> 1+1

res13: Int = 2

scala\> res13 \* 5

res14: Int = 10

scala\> println(res14)

10

* * * * *

위의 예제처럼 간단한 연산을 바로 실행 가능하며, 자신의 코드 역시 바로
불러와 테스트 가능합니다.

(물론 자신의 클래스가 classpath 상에 존재해야 하며, import 하거나 full
name 을 명시하여 사용 가능합니다.)



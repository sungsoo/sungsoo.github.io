---
layout: post
title: Scala - Tools and Frameworks
date: 2015-06-03
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [꽃보다 Scala!](https://docs.google.com/document/pub?id=1kSNKKKwM8rjGhn9Gnw-6Q0VCImpwSRZ7_QzwNwXgMxM)


----


Tools & Frameworks 
==================

구슬이 서말이어도 꿰어야 보배 라는 말이 있듯이, 아무리 언어가 뛰어나고
훌륭해도 잘 꿰어진 보배가 없다면 별로 쓸모도 없는 언어가 되 버릴
것입니다. 오늘날의 소프트웨어의 규모와 개발 방식을 보면 툴과 프레임웍
같은 도구들 없이는 개발이 힘든 것이 사실 입니다. 또한, 최근 추세를
보더라도 언어 자체를 배우는 경우보다는, 특정 프레임웍을 사용하기 위해
언어를 배우는 경우가 더 많아 보입니다.

스칼라는 출시된지 얼마 안된 언어임에도 불구하고, 이미 다방면에서 널리
쓰이고 있으며 다양한 오픈소스 Tool 들과  Framework 들이 존재 합니다.
 어떤 프레임웍들이 널리 쓰이고 있고 어떤 유용한 것들이 있는지, 또한 이
언어가 배울 가치가 있고 현업에서 쓸모가 있는지 확인 하실 수 있도록
빠르게 살펴보도록 하겠습니다.

참고:

-   [https://wiki.scala-lang.org/display/SW/Tools+and+Libraries\#ToolsandLibraries-DevelopmentTools](https://www.google.com/url?q=https%3A%2F%2Fwiki.scala-lang.org%2Fdisplay%2FSW%2FTools%2Band%2BLibraries%23ToolsandLibraries-DevelopmentTools&sa=D&sntz=1&usg=AFQjCNGiARObwUWcvcVe9b3D_3sV4hD-Jg)

IDE Support 
-----------

Eclipse와 IntelliJ IDEA 모두 Scala 지원 합니다. 하지만, 빌드툴인 SBT 에
대한 지원이 Maven 만큼 강력하지는 않습니다. 대부분의 경우 SBT
프로젝트에서 IDE 프로젝트를 generate 하는 방식으로, 빌드 파일이 변경될때
마다 IDE 프로젝트 파일들을 다시 만들어줘야 하는 불편함이 있습니다.

-   Eclipse

-   [http://scala-ide.org/](http://www.google.com/url?q=http%3A%2F%2Fscala-ide.org%2F&sa=D&sntz=1&usg=AFQjCNE6s-rlaG9OCvdkkwxGM36xD5EwSA)

-   IntelliJ IDEA

-   [http://confluence.jetbrains.net/display/SCA/Scala+Plugin+for+IntelliJ+IDEA](http://www.google.com/url?q=http%3A%2F%2Fconfluence.jetbrains.net%2Fdisplay%2FSCA%2FScala%2BPlugin%2Bfor%2BIntelliJ%2BIDEA&sa=D&sntz=1&usg=AFQjCNEohH-4ItWIhNzXZWhTSPOI_RD4Rw)

-   Emacs

-   [https://github.com/RayRacine/scamacs](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2FRayRacine%2Fscamacs&sa=D&sntz=1&usg=AFQjCNHmbn2L6g_83CCTxo_wKhgqrjSmAg)
-   [http://www.scala-lang.org/node/354](http://www.google.com/url?q=http%3A%2F%2Fwww.scala-lang.org%2Fnode%2F354&sa=D&sntz=1&usg=AFQjCNGrfRJPv20u7-EkgdbEWyZTLB2vkQ)
-   [https://github.com/aemoncannon/ensime](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2Faemoncannon%2Fensime&sa=D&sntz=1&usg=AFQjCNESz72luCm5gDUIAXy2paDHTSmrGA)

-   Netbeans

-   [http://java.net/projects/nbscala](http://www.google.com/url?q=http%3A%2F%2Fjava.net%2Fprojects%2Fnbscala&sa=D&sntz=1&usg=AFQjCNGRwRGPNL1P9x6SSSkOnuPjKDqM4g)

SBT (Simple Build Tool) 
-----------------------

대부분의 Scala 프로젝트는 SBT 라는 툴을 이용해 project 를 관리합니다.
SBT 는 Maven 등과 유사한 툴로서 build definition을 정의하기 위해 코드와
유사한 DSL (Domain Specific Language) 를 제공하며, 필요한 경우(사실
대부분의 경우) scala 코드를 직접 작성하여 프로젝트의 메타를 정의할 수
있습니다.

라이브러리 의존성 관리를 위해 Ant에서 사용하는 Apache Ivy 를 사용하며
대부분의 경우 Maven과 호환성을 가집니다.

\* 사실, Scala의 가장 큰 진입 장벽 중 하나가 SBT 입니다. 너무 유연하고
자유롭게 사용 할 수 있다보니, 어떻게 배우고 써먹어야 할 지 상당히 난감할
수 있습니다. 기본적인 문서를 읽어 보셨다면, 아래 소개하는 여러
프로젝트들의 SBT 스크립트를 살펴 보시기 바랍니다.

참고 :

-   [https://github.com/harrah/xsbt](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2Fharrah%2Fxsbt&sa=D&sntz=1&usg=AFQjCNE81uTM_VXGUICsOqYJTRsIuGXKgw)
-   [http://twitter.github.com/scala\_school/sbt.html](http://www.google.com/url?q=http%3A%2F%2Ftwitter.github.com%2Fscala_school%2Fsbt.html&sa=D&sntz=1&usg=AFQjCNG0KUA_avgyoOp6ybepdsbVcUNysw)


ScalaTest 
---------

Scala Test Framework 으로  자신에 익숙한 테스트 방식을 선택할 수 있도록
다양한 test suite 를 제공하며 기본적으로는 BDD(Behavior-driven
Development) 기반의 test framework 입니다.

다음은 scalatest.org 의 첫 페이지의 소개 예제입니다.

```scala
import collection.mutable.Stack

import org.scalatest.\_

class StackSpec extends FlatSpec with ShouldMatchers {

    "A Stack" should "pop values in last-in-first-out order" in {

        val stack = new Stack[Int]

        stack.push(1)

        stack.push(2)

        stack.pop() should equal (2)

        stack.pop() should equal (1)

    }

    it should "throw NoSuchElementException if an empty stack is
popped" in {

        val emptyStack = new Stack[String]

        evaluating { emptyStack.pop() } should produce
[NoSuchElementException]

    }

}
```

참고:

-   [http://www.scalatest.org/](http://www.google.com/url?q=http%3A%2F%2Fwww.scalatest.org%2F&sa=D&sntz=1&usg=AFQjCNEdwNZTzHiGXuw5UkC4rXPiVV2BDw)
-   [http://en.wikipedia.org/wiki/Behavior-driven\_development](http://www.google.com/url?q=http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBehavior-driven_development&sa=D&sntz=1&usg=AFQjCNG3TljMxGBGUqbwWHIt2aAg2LyPqQ)


Finagle 
-------

최근 Scala 진영에서 가장 왕성한 오픈 소스 활동을 하고 있는 회사는 다름
아닌 Twitter 일 것입니다. Finagle 역시 트위터에 의해 만들어졌으며,
한마디로 말하자면 분산 비동기 RPC 네트웍 스택입니다.

JVM 기반의 클라이언트와 서버 모두 제공 되며 대표적인 주요 기능은 다음과
같습니다.

-   HTTP/Thrift 등 다양한 통신 프로토콜 제공
-   Apache Zookeeper 를 이용한  Service Registration/Discovery
-   Load balancing / Failover 등

수많은 기능을 보유 하고 있지만, 간단히 말하면 원하는 프로토콜로 RPC
통신을 할 수 있도록 Transport layer 에 대한 제반 사항을 Framework 이
제공해 주는 것이며, 개발자는 자신의 로직을 protocol 과 상관없이
독립적으로 구현 하면 됩니다. 현재 트위터 내부적으로 많은 구현들이
Finagle 위에 올려져 있는 것으로 알려져 있습니다.

![](https://lh5.googleusercontent.com/jMMMWuWHAA_fQHLRjr5Cc8CWxNYr0f3gtCtthhUt8GpkhbPP6iZA8xJKbMXQPFVz8PuYtnILv3hDa3aNzI-2kpSQxyKisStkIVMHgvgVtOwzs3Lfw1O9azmPxg)

\<Twitter Service Stack with Finagle\>

참고:

-   [http://twitter.github.com/finagle/](http://www.google.com/url?q=http%3A%2F%2Ftwitter.github.com%2Ffinagle%2F&sa=D&sntz=1&usg=AFQjCNFzGQTyTV3Mv4EDSTvOIbNEy9-B2w)
-   [https://github.com/twitter/finagle](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2Ftwitter%2Ffinagle&sa=D&sntz=1&usg=AFQjCNE9DAi7A0ESelBWTrZPVwbt_IEBkg)
-   [http://engineering.twitter.com/2011/08/finagle-protocol-agnostic-rpc-system.html](http://www.google.com/url?q=http%3A%2F%2Fengineering.twitter.com%2F2011%2F08%2Ffinagle-protocol-agnostic-rpc-system.html&sa=D&sntz=1&usg=AFQjCNGKxu4oGUBcLNZiFqGQnpmwkSM7SQ)


Gizzard 
-------

Gizzard 역시 Twitter 가 공개한 오픈 소스 프로젝트로, backend datastore
(SQL, Lucene 등) 와 Web application 사이를 잇는 데이터 분산을 위한
middleware 입니다.

최근 화두로 떠오르고 있는 빅데이터라는 말 자체의 근원중 하나인 트위터가
자신들의 datastore에 사용하던 데이터 분산 로직(sharding or partitioning)
을 별도의 Framework으로 분리한 프로젝트로 데이터 분산을 데이터 베이스
자체 가 아닌 middleware 로 처리하는 Framework 입니다.

![](https://lh4.googleusercontent.com/w9VlLooZC1ZDMJPT8ZB53xYr100HqJOLFf6OS1OULjec47Zq3XoIfOsT-d9dqxBUKlXB-YhS9-VxBaXkCTVbzJmaBg4pNWEj8ypnWK52y5tKFiXUNFyefwz1Rg)

참고:

-   [https://github.com/twitter/gizzard](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2Ftwitter%2Fgizzard&sa=D&sntz=1&usg=AFQjCNFSDzmO4mWh-t4NBYFVRfYkTREYBg)

Akka 
----

Actor model 이란 concurrent distributed system 을 만들어 내기 위한
수학적인 추상화 모델로, Erikson이 Erlang 이라는 언어를 이용해 telecom
system을 성공적으로 만들면서 널리 알려 졌습니다.

Akka framework은 Actor model 의 Scala 구현입니다. 임의의 역할 담당하는
 Actor 들은 서로 우편을 주고 받듯이 메시지를 주고 받으며 각자 할일을
나누어 동시에 진행 하는 event-driven framework 입니다.

각 Actor 들은 Router 에 의해  묶일 수 도 있으며 Round robin 등의 적절한
strategy를 선택해 일을 할당 받을 수 도 있습니다. 또한 메시지를 주고 받을
때 fire-and-forget 패턴의 tell 방식이나 Promise 패턴을 사용한 ask 방식
모두 지원합니다.

참고로, Scala 자체적으로도 Erlang의 영향을 받은 Actor 모델의 구현을 을
가지고 있지만, 2.10 버전 이후에는 별도의 jar 로 분리되어 deprecate 될
예정이며 Akka 가 그 대체자로 선택되었습니다.

주요 기능:

-   Scala로 쓰여졌지만, 자바로도 쉽게 사용할 수 있도록 별도의 wrapping
    api 를 제공
-   Remote Actor 지원
-   Supervising, 각 Actor 들은 상위 Actor에 의해 관리됨
-   Q3 출시 에정인 2.1 버전을 통해 gossip protocol 기반의 위치 투명성을
    가지는 Cluster 제공

참고:

-   [http://akka.io/](http://www.google.com/url?q=http%3A%2F%2Fakka.io%2F&sa=D&sntz=1&usg=AFQjCNGVVEWf1BCR5ebqKaCnmQ7gY_2s-g)
-   [http://en.wikipedia.org/wiki/Actor\_model](http://www.google.com/url?q=http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FActor_model&sa=D&sntz=1&usg=AFQjCNGmp2Kt4yycsEyl3-FwH77SiNOpKw)

Play Framework 
--------------

최근 가장 떠오르는 자바 진영의 웹 프레임웍입니다. 자세한 설명은 봄날은
간다 세션을 참고하세요.

주요 기능:

-   Akka와 마찬가지로 Java 지원

-   Rails 스타일의 COC (Convention Over Configuration)
-   Netty 기반의 비동기 IO 지원
-   Akka 를 middleware 로 사용할 수 있도록 연동 기능이 제공

참고:

-   [http://www.playframework.org/](http://www.google.com/url?q=http%3A%2F%2Fwww.playframework.org%2F&sa=D&sntz=1&usg=AFQjCNHZgtFjlcKsxJadY02xxsBhIIPodw)

Typesafe Stack 
--------------

Scala의 창시자인 Martin Ordersky 는 2010년 Typesafe 라는 회사를 세우고
Scala 관련 분야에 대해 교육및 컨설팅등의 상업적인 지원을 시작했습니다.
그리고 얼마전 Scala를 기반으로 하고 Akka 2.0 을 event-driven middleware
로 Play 2.0을 web framework으로 하는 상업적인 지원을 포함한 Typesafe
Stack을 발표 했습니다.

참고:

-   [http://typesafe.com/](http://www.google.com/url?q=http%3A%2F%2Ftypesafe.com%2F&sa=D&sntz=1&usg=AFQjCNFSqi1rczv2ekJNrtyIj5dTXmQE5w)

Spray 
-----

Akka 위에 Restful Web Service 를 만들기 위한 framework 으로 Play와 같은
웹프레임웍이라기 보다는 단순히 Akka 위에 REST 스타일 인터페이스를 씌우기
위해 사용됩니다. Play와 Akka 가 Typesafe Stack 으로 묶인지가 얼마 안되서
인지, Play의 Akka 연동 기능보다는 View가 필요없는 REST API 서버라면
현재로서는 Spray 가 훨씬 강력하며 편리해 보입니다.

주요기능:

-   Asynchronous, Non-blocking IO, Actor 기반으로 수많은 동시 접속 처리
    가능
-   자체 DSL 지원
-   REST service에 대한 테스트 용이

참고:

-   [https://github.com/spray/spray/wiki](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2Fspray%2Fspray%2Fwiki&sa=D&sntz=1&usg=AFQjCNFj8cbVamy30du5nTLsuqVpGkxeXg)



# References


-   Programming in Scala 2nd Edition
-   [http://www.scala-lang.org/node/198](http://www.google.com/url?q=http%3A%2F%2Fwww.scala-lang.org%2Fnode%2F198&sa=D&sntz=1&usg=AFQjCNE9b7RPr3adZqkhz3wvQF6bCqLQ2Q)
-   [http://twitter.github.com/scala\_school/](http://www.google.com/url?q=http%3A%2F%2Ftwitter.github.com%2Fscala_school%2F&sa=D&sntz=1&usg=AFQjCNG9hd-93-EgRoK-q2zGGp1QvVKGrw)
-   [http://en.wikipedia.org/wiki/Scala\_(programming\_language)](http://www.google.com/url?q=http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FScala_(programming_language)&sa=D&sntz=1&usg=AFQjCNFdIteSuAbtrDrFRWLOpK1apdRmhA)
-   [http://twitter.github.com/effectivescala/](http://www.google.com/url?q=http%3A%2F%2Ftwitter.github.com%2Feffectivescala%2F&sa=D&sntz=1&usg=AFQjCNE4lhcLM5Sj4vGntnUkdvxfWflqyw)


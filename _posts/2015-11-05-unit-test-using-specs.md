---
layout: post
title: Unit Test using specs
date: 2015-11-05
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [specs로 테스트하기](https://twitter.github.io/scala_school/ko/specs.html)


-----


# Unit Test using specs


이번 강좌에서는 Specs를 사용해 테스트하는 법을 다룬다. 
Specs는 스칼라용 동작 주도 설계(*Behavior-Driven Design*, BDD) 프레임워크이다.

Specification(명세 클래스) 확장하기
----------------------------------

코드부터 살펴보자.

```scala
    import org.specs._

    object ArithmeticSpec extends Specification {
      "Arithmetic" should {
        "add two numbers" in {
          1 + 1 mustEqual 2
        }
        "add three numbers" in {
          1 + 1 + 1 mustEqual 3
        }
      }
    }
```

**Arithmetic** 은 **명세를 지정할 시스템(System under Specification)**
이다.

**add** 는 컨택스트(context)라 한다.

**add two numbers**와 **add three numbers** 는 예제(example)라 한다.

`mustEqual` 은 **예상결과(expectation)** 이다.

`1 mustEqual 1` 은 "예상결과"를 담을 수 있는 틀로 활용할 수 있다. 예제는
반드시 하나 이상의 예상결과를 포함해야 한다.

## 중복

두 테스트의 이름에 `add` 가 같이 포함되어 있는게 보이는가? 이런 중복은
예상결과를 **내포** 시킴으로써 없앨 수 있다.

```scala
    import org.specs._

    object ArithmeticSpec extends Specification {
      "Arithmetic" should {
        "add" in {
          "two numbers" in {
            1 + 1 mustEqual 2
          }
          "three numbers" in {
            1 + 1 + 1 mustEqual 3
          }
        }
      }
    }
```

실행 모델 
---------

```scala
    object ExecSpec extends Specification {
      "Mutations are isolated" should {
        var x = 0
        "x equals 1 if we set it." in {
          x = 1
          x mustEqual 1
        }
        "x is the default value if we don't change it" in {
          x mustEqual 0
        }
      }
    }
```    

Setup(준비작업)과 Teardown(정리작업) 
------------------------------------

## doBefore & doAfter

```scala
    "my system" should {
      doBefore { resetTheSystem() /** user-defined reset function */ }
      "mess up the system" in {...}
      "and again" in {...}
      doAfter { cleanThingsUp() }
    }
```   

**<span class="caps">NOTE</span>** `doBefore` / `doAfter` 는 말단 예제에
대해에서만 실행된다.

## doFirst & doLast

`doFirst` / @doLast@는 일회성 설정을 위한 장치이다. (예제가 필요하다.
나(즉, 원저자)는 이를 사용하지 않는다.)

```scala
    "Foo" should {
      doFirst { openTheCurtains() }
      "test stateless methods" in {...}
      "test other stateless methods" in {...}
      doLast { closeTheCurtains() }
    }
```

Matcher(매처) 
-------------

데이터가 있고, 그 데이터가 올바른지 확인할 때 매처를 사용한다. 가장 흔히
사용되는 것들을 살펴보자. ([매처
가이드](http://code.google.com/p/specs/wiki/MatchersGuide) 를 살펴 보라)

## mustEqual

이미 mustEqual 예제는 여러 개 살펴 보았다.

    1 mustEqual 1

    "a" mustEqual "a"

동일성에는 참조 동일성과 값 동일성이 있다.

## 열의 원소

```scala
    val numbers = List(1, 2, 3)

    numbers must contain(1)
    numbers must not contain(4)

    numbers must containAll(List(1, 2, 3))
    numbers must containInOrder(List(1, 2, 3))

    List(1, List(2, 3, List(4)), 5) must haveTheSameElementsAs(List(5, List(List(4), 2, 3), 1))
```    

## 맵의 원소

```scala
    map must haveKey(k)
    map must notHaveKey(k)

    map must haveValue(v)
    map must notHaveValue(v)
```

## 수

```scala
    a must beGreaterThan(b)
    a must beGreaterThanOrEqualTo(b)

    a must beLessThan(b)
    a must beLessThanOrEqualTo(b)

    a must beCloseTo(b, delta)
```

## 옵션(Option)

```scala
    a must beNone

    a must beSome[Type]

    a must beSomething

    a must beSome(value)
```

## throwA

```scala
    a must throwA[WhateverException]
```

이렇게 쓰는게 테스트 몸체에서 예외를 캐치해서 실패로 만드는 것 보다 더
짧다.

또한 특정 예외 메시지를 명시할 수도 있다.

    a must throwA(WhateverException("message"))

예외의 타입에 대해 매치할 수도 있다.

    a must throwA(new Exception) like {
      case Exception(m) => m.startsWith("bad")
    }

## 필요한 매처 만들어내기


    import org.specs.matcher.Matcher

### val로 정의하기

```scala
    "A matcher" should {
      "be created as a val" in {
        val beEven = new Matcher[Int] {
          def apply(n: => Int) = {
            (n % 2 == 0, "%d is even".format(n), "%d is odd".format(n))
          }
        }
        2 must beEven
      }
    }
```

매처 정의시 지켜야할 계약은 3-튜플을 반환하는 것이다. 첫 원소에는 예상
결과를 만족하는지 여부, 두번째 원소에는 만족시의 메시지, 마지막 원소에는
실패시의 메시지가 들어가야 한다.

### 케이스 클래스로 정의하기

```scala
    case class beEven(b: Int) extends Matcher[Int]() {
      def apply(n: => Int) =  (n % 2 == 0, "%d is even".format(n), "%d is odd".format(n))
    }
```

케이스 클래스로 만들면 더 공유하기 쉬워진다.

목업
----

```
    import org.specs.Specification
    import org.specs.mock.Mockito

    class Foo[T] {
      def get(i: Int): T
    }

    object MockExampleSpec extends Specification with Mockito {
      val m = mock[Foo[String]]

      m.get(0) returns "one"

      m.get(0)

      there was one(m).get(0)

      there was no(m).get(1)
    }
```

**See Also** [Mockito
활용하기](http://code.google.com/p/specs/wiki/UsingMockito)

스파이 
------

스파이를 사용해 실제 객체를 “부분적으로 흉내내기”할 수 있다.

```scala
    val list = new LinkedList[String]
    val spiedList = spy(list)

    // methods can be stubbed on a spy
    spiedList.size returns 100

    // other methods can also be used
    spiedList.add("one")
    spiedList.add("two")

    // and verification can happen on a spy
    there was one(spiedList).add("one")
```

하지만, 스파이를 쓰면 때로 문제가 생길 수 있다.

```scala
    // 리스트가 비어있다면, IndexOutOfBoundsException가 발생할 것이다.
    spiedList.get(0) returns "one"
```

이 경우 `doReturn` 을 사용해야만 한다.

```scala
    doReturn("one").when(spiedList).get(0)
```

개별 specs를 sbt에서 실행하기 
-----------------------------

    > test-only com.twitter.yourservice.UserSpec

라고 하면 해당 spec을 실행할 것이다.

    > ~ test-only com.twitter.yourservice.UserSpec

라고 하면 테스트를 실행하되, 파일이 바뀔 때마다 테스트가 재실행될
것이다.


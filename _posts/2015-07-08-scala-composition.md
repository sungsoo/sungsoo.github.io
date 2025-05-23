---
layout: post
title: Function Composition
date: 2015-07-08
categories: [computer science]
tags: [design patterns]

---




함수 합성 
---------

다음 두 함수가 유용하다고 가정하자.

    scala> def addUmm(x: String) = x + " umm"
    addUmm: (x: String)String

    scala>  def addAhem(x: String) = x + " ahem"
    addAhem: (x: String)String

## compose

`f compose g`를 하면 두 함수를 `f(g(x))`과 같이 합성한다.

    scala> val ummThenAhem = addAhem _ compose addUmm _
    ummThenAhem: (String) => String = <function1>

    scala> ummThenAhem("well")
    res0: String = well umm ahem

## andThen

`andThen`도 `compose`와 비슷하지만, 처음 오는 함수를 먼저 호출한 다음,
두번째 함수를 호출한다. 즉, `f andThen g`는 `g(f(x))`

    scala> val ahemThenUmm = addAhem _ andThen addUmm _
    ahemThenUmm: (String) => String = <function1>

    scala> ahemThenUmm("well")
    res1: String = well ahem umm

커링과 부분 적용의 비교 
-----------------------

## 케이스 문

### 케이스 문은 도데체 무엇인가?

케이스 문은 PartialFunction이라 불리는 함수의 하위 클래스이다.

### 케이스 문을 여러개 사용하는 것은 무엇인가?

여러 PartialFunction들이 서로 compose된 것이다.

PartialFunction 
---------------

함수는 정의된 모든 인자 값에 대해 동작한다. 다른식으로 말하자면, (Int)
=\> String 타입으로 정의된 함수는 모든 Int에 대해 어떤 String을
반환한다. 즉, 어떤 정수이건 그에 대응하는 String이 있기 마련이다.

하지만 부분 함수는 인자 타입의 값 중 일부에 대해서만 정의되어 있다.
(Int) =\> String 타입의 부분함수는 일부 Int는 취급하지 않을 것이다.

`isDefinedAt`은 PartialFunction에 정의되어 있는 메소드로, 해당
PartialFunction이 주어진 인자를 받을 수 있는지를 알려준다.

*Note* `PartialFunction`은 앞에서 본 부분 적용된 함수와는 전혀 관계가
없다.

**See Also** 효율적 스칼라에도
[부분함수](http://twitter.github.com/effectivescala/#Functional%20programming-Partial%20functions)에
대한 내용이 있다.

    scala> val one: PartialFunction[Int, String] = { case 1 => "one" }
    one: PartialFunction[Int,String] = <function1>

    scala> one.isDefinedAt(1)
    res0: Boolean = true

    scala> one.isDefinedAt(2)
    res1: Boolean = false

부분 함수도 함수처럼 적용이 가능하다.

    scala> one(1)
    res2: String = one

PartialFunction들은 orElse라 불리는 다른 함수를 사용해 합성이 가능하다.
orElse는 각 PartialFunction이 인자 값에 대해 정의되어 있는지 여부에 따라
적절한 최종 값을 반환한다.

    scala> val two: PartialFunction[Int, String] = { case 2 => "two" }
    two: PartialFunction[Int,String] = <function1>

    scala> val three: PartialFunction[Int, String] = { case 3 => "three" }
    three: PartialFunction[Int,String] = <function1>

    scala> val wildcard: PartialFunction[Int, String] = { case _ => "something else" }
    wildcard: PartialFunction[Int,String] = <function1>

    scala> val partial = one orElse two orElse three orElse wildcard
    partial: PartialFunction[Int,String] = <function1>

    scala> partial(5)
    res24: String = something else

    scala> partial(3)
    res25: String = three

    scala> partial(2)
    res26: String = two

    scala> partial(1)
    res27: String = one

    scala> partial(0)
    res28: String = something else

## 케이스 문의 신비 

지난 강의에서 무언가 이상한 부분이 있었다. 즉, 케이스 문을 함수가 필요한
위치에 사용하는 것을 보았다.

    scala> case class PhoneExt(name: String, ext: Int)
    defined class PhoneExt

    scala> val extensions = List(PhoneExt("steve", 100), PhoneExt("robey", 200))
    extensions: List[PhoneExt] = List(PhoneExt(steve,100), PhoneExt(robey,200))

    scala> extensions.filter { case PhoneExt(name, extension) => extension < 200 }
    res0: List[PhoneExt] = List(PhoneExt(steve,100))

어떻게 이런 일이 가능할까?

필터는 함수를 받는다. 위 코드에서 필터가 받아야 하는 함수는 (PhoneExt)
=\> Boolean 타입이다.

PartialFunction은 Function의 하위타입이므로 필터는 PartialFunction도
받을 수 있다!


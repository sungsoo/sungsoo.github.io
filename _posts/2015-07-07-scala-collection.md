---
layout: post
title: Scala Collection
date: 2015-07-07
categories: [computer science]
tags: [design patterns]

---



# 컬렉션 (Collection)

기본 데이터 구조
================

스칼라는 유용한 컬렉션을 여러 개 제공한다.

**See Also** 효율적인 스칼라에서도 [컬렉션
사용법](http://twitter.github.com/effectivescala/#Collections)에 대해
다루고 있다.

리스트 
------

    scala> val numbers = List(1, 2, 3, 4)
    numbers: List[Int] = List(1, 2, 3, 4)

집합 
----

집합에는 중복된 원소가 들어갈 수 없다.

    scala> Set(1, 1, 2)
    res0: scala.collection.immutable.Set[Int] = Set(1, 2)

튜플 
----

튜플을 사용하면 클래스를 정의하지 않고도 여러 아이템을 쉽게 한데 묶을 수
있다.

    scala> val hostPort = ("localhost", 80)
    hostPort: (String, Int) = (localhost, 80)

케이스 클래스와 달리 튜플의 억세서(accessor)에는 이름이 없다. 대신
위치에 따라 숫자로 된 억세서가 있다. 첫번째 원소는 0번이 아니고
1번이다(역주: 1번부터 시작한 것은 함수언어의 전통에 따른 것이다).

    scala> hostPort._1
    res0: String = localhost

    scala> hostPort._2
    res1: Int = 80

튜플은 패턴 매칭과 잘 들어맞는다.

    hostPort match {
      case ("localhost", port) => ...
      case (host, port) => ...
    }

두 값을 묶는 튜플을 만드는 특별한 소스로 `->`가 있다.

    scala> 1 -> 2
    res0: (Int, Int) = (1,2)

**See Also** 효율적인 스칼라에서 [구조를 허무는 바인딩(destructuring
binding)](http://twitter.github.com/effectivescala/#Functional%20programming-Destructuring%20bindings)(“튜플
벗기기”)에 대해 다룬다.

## 맵

맵에 기본적인 데이터타입을 담을 수 있다.

    Map(1 -> 2)
    Map("foo" -> "bar")

위 코드에서 `->`는 맵을 위한 특별한 문법처럼 보인다. 하지만, 튜플에서 본
것처럼 `->`는 단지 2-튜플을 만들기 위한 것이다.

또한 위 Map()에는 1강에서 살펴 본 가변 길이 인자 문법이 사용되었다.
따라서 `Map(1 -> "one", 2 -> "two")`은 실제로는
`Map((1, "one"), (2, "two"))`가 되고, 리스트에 있는 각 튜플의 첫번째
원소는 키, 두번째 원소는 값이 된다.

맵이 다른 맵이나 함수를 값으로 보관할 수도 있다.

    Map(1 -> Map("foo" -> "bar"))

    Map("timesTwo" -> { timesTwo(_) })

옵션 
----

어떤 것(객체)가 존재하거나 존재하지 않을 수 있을 때, `Option`을 사용해
처리한다.

옵션의 기본 인터페이스는 다음과 같다.

` trait Option[T] {   def isDefined: Boolean   def get: T   def getOrElse(t: T): T }`

옵션 자체는 일반적 클래스이며, 두 하위클래스 `Some[T]`와 `None`이 있다.

이제 옵션을 어떻게 사용하는지 살펴보자.

`Map.get`은 `Option`를 반환한다. 옵션을 반환한다는 것은 찾는 값이 없을
수도 있다는 의미이다.

    scala> val numbers = Map("one" -> 1, "two" -> 2)
    numbers: scala.collection.immutable.Map[java.lang.String,Int] = Map(one -> 1, two -> 2)

    scala> numbers.get("two")
    res0: Option[Int] = Some(2)

    scala> numbers.get("three")
    res1: Option[Int] = None

이제 데이터가 `Option`에 들어가 있을 것이다. 그럼 그 옵션을 가지고는
무얼 할 수 있을까?

아마도 `isDefined` 메소드를 사용해 조건부 처리를 하는 것이 가장 먼저
반사적으로 떠오를 것이다.

` // 수에 2를 곱하자. 만약 값이 없으면 0을 반환하자. val result = if (res1.isDefined) {   res1.get * 2 } else {   0 }`

하지만 그보다는 `getOrElse`나 패턴 매칭을 사용할 것을 권한다.

`getOrElse`을 사용하면 기본 값을 쉽게 지정할 수 있다.

` val result = res1.getOrElse(0) * 2`

패턴 매칭도 자연스럽게 `Option`과 맞아들어간다.

` val result = res1 match {   case Some(n) => n * 2   case None => 0 }`

**See Also** 효율적인 스칼라를 보면
[옵션](http://twitter.github.com/effectivescala/#Functional%20programming-Options)에
대한 글이 있다.

함수 콤비네이터 (combinators)
===============

(역주: 콤비네이터란 이름에 웬지 모를 위압감을 느낄지도 모르겠는데,
콤비네이터는 함수와 컬렉션 등 다른 식을 받아서 적절한 작업을 해주는 조합
장치(함수) 정도로 생각하면 된다.)

`List(1, 2, 3) map squared`라고 하면 `squared` 함수를 리스트의 모든
원소에 적용한 다음 새 리스트를 반환한다. 결과는 아마도 `List(1, 4, 9)`가
될 것이다. `map`과 같은 함수를 *콤비네이터(combinator)*라 부른다. (더
나은 정의를 보고픈 사람은 스택 오버플로우의 [콤비네이터에 대한
설명](http://stackoverflow.com/questions/7533837/explanation-of-combinators-for-the-working-man)을
참조하라.) 콤비네이터는 보통 표준 데이터 구조에 많이 사용된다.

map
---

리스트의 모든 원소에 함수를 적용한 결과값으로 이루어진 새 리스트를
반환한다. 원소 갯수는 적용 대상이 된 리스트의 원소 갯수과 동일하다.

    scala> numbers.map((i: Int) => i * 2)
    res0: List[Int] = List(2, 4, 6, 8)

또는 부분적용된 함수를 넘길 수도 있다.


    scala> def timesTwo(i: Int): Int = i * 2
    timesTwo: (i: Int)Int

    scala> numbers.map(timesTwo _)
    res0: List[Int] = List(2, 4, 6, 8)

foreach
-------

foreach는 맵과 비슷하지만, 반환하는 것이 없다. 따라서 foreach는
부작용(값을 반환하는 것이 아니고 상태를 변화시키는 것)을 위해 사용한다.

    scala> numbers.foreach((i: Int) => i * 2)

위 코드는 아무것도 반환하지 않는다.

반환되는 값을 변수에 넣을 수도 있다. 하지만, 그 타입은 Unit(즉,
void)이다.

    scala> val doubled = numbers.foreach((i: Int) => i * 2)
    doubled: Unit = ()

filter
------

전달된 함수가 거짓을 반환하는 원소들을 제외한 나머지 원소들로 이루어진
리스트를 반환한다. 참/거짓(즉, Boolean 값)을 반환하는 함수를
술어함수(predicate function)라 부르곤 한다.

    scala> numbers.filter((i: Int) => i % 2 == 0)
    res0: List[Int] = List(2, 4)

    scala> def isEven(i: Int): Boolean = i % 2 == 0
    isEven: (i: Int)Boolean

    scala> numbers.filter(isEven _)
    res2: List[Int] = List(2, 4)

zip
---

zip은 두 리스트의 원소들의 쌍(튜플)으로 이루어진 단일 리스트를 반환한다.

    scala> List(1, 2, 3).zip(List("a", "b", "c"))
    res0: List[(Int, String)] = List((1,a), (2,b), (3,c))

partition
---------

`partition`은 술어 함수가 반환하는 값에 따라 리스트를 둘로 나눈다.\
 (역주. 원래 리스트의 모든 원소는 반환되는 두 리스트 중 어느 하나에 꼭
포함되며, 한 원소가 양쪽에 같이 속하는 일도 없다.)

    scala> val numbers = List(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    scala> numbers.partition(_ % 2 == 0)
    res0: (List[Int], List[Int]) = (List(2, 4, 6, 8, 10),List(1, 3, 5, 7, 9))

find
----

find는 리스트에서 술어함수를 만족하는 가장 첫 원소를 반환한다.

    scala> numbers.find((i: Int) => i > 5)
    res0: Option[Int] = Some(6)

drop과 dropWhile 
----------------

`drop`은 첫 i개의 원소를 떨군다. 따라서 나머지 (원래 리스트 길이-i)개의
원소만 남는다.

    scala> numbers.drop(5)
    res0: List[Int] = List(6, 7, 8, 9, 10)

`dropWhile`은 리스트의 앞에서 술어함수를 만족하는 원소를 없앤다.
술어함수가 최초로 거짓을 반환하면 그 뒤의 원소들은 살아 남는다.\
 예를 들어 numbers 리스트에서 홀수를 `dropWhile`하면 `1`이 떨어져
나간다. (하지만 `3`은 `2`가 "방패막이"가 되기 때문에 결과 리스트에
들어간다).

    scala> numbers.dropWhile(_ % 2 != 0)
    res0: List[Int] = List(2, 3, 4, 5, 6, 7, 8, 9, 10)

foldLeft 
--------

    scala> numbers.foldLeft(0)((m: Int, n: Int) => m + n)
    res0: Int = 55

0은 시작 값이고(numbers가 List[Int]라는 사실을 기억하라), m은 값을
누적하는 변수 역할을 한다.

(역주: 여기서 누적이란 말은 덧셈으로 합산된다는 의미가 아니다. 물론 본
예제에서는 합산이 되고 있지만, 앞의 원소에 함수를 적용한 결과값이
전달되는 위치가 m이라는 의미이다. 풀어쓰자면,
List(a1,a2,…,an).foldLeft(v0)(f)는 f(…f(f(v0,a1),a2),an)이다.)

foldLeft의 작동 과정을 자세히 보면 다음과 같다.

    scala> numbers.foldLeft(0) { (m: Int, n: Int) => println("m: " + m + " n: " + n); m + n }
    m: 0 n: 1
    m: 1 n: 2
    m: 3 n: 3
    m: 6 n: 4
    m: 10 n: 5
    m: 15 n: 6
    m: 21 n: 7
    m: 28 n: 8
    m: 36 n: 9
    m: 45 n: 10
    res0: Int = 55

## foldRight

foldLeft와 마찬가지이지만, 동작 방향이 반대이다. 따라서, n에 값이
누적된다.\
 (역주: foldLeft에서 쓴 것처럼 쓰면,ㅣ List(a1,…an)(v0)(f) = f(a1, f(a2,
f(a3, …. f(an, v0)))) 이다.

    scala> numbers.foldRight(0) { (m: Int, n: Int) => println("m: " + m + " n: " + n); m + n }
    m: 10 n: 0
    m: 9 n: 10
    m: 8 n: 19
    m: 7 n: 27
    m: 6 n: 34
    m: 5 n: 40
    m: 4 n: 45
    m: 3 n: 49
    m: 2 n: 52
    m: 1 n: 54
    res0: Int = 55

flatten
-------

flatten은 내포단계를 하나 줄여서 내포된 리스트의 원소를 상위 리스트로
옮겨준다.

    scala> List(List(1, 2), List(3, 4)).flatten
    res0: List[Int] = List(1, 2, 3, 4)

flatMap 
-------

flatMap은 map과 flatten을 합성한 것이다. 내포 리스트에 적용할 수 있는
함수를 중첩된 리스트 안의 각 리스트에 적용해서 나온 결과를 하나의
리스트로 합쳐준다.

    scala> val nestedNumbers = List(List(1, 2), List(3, 4))
    nestedNumbers: List[List[Int]] = List(List(1, 2), List(3, 4))

    scala> nestedNumbers.flatMap(x => x.map(_ * 2))
    res0: List[Int] = List(2, 4, 6, 8)

이를 map을 한 다음 flatten하는 것을 간략히 표현한 것으로 이해할 수 있다.

    scala> nestedNumbers.map((x: List[Int]) => x.map(_ * 2)).flatten
    res1: List[Int] = List(2, 4, 6, 8)


 위의 예는 map과 flatten을 서로 엮어서 콤비네이터로 활용하는 것을
보여준다.

**See Also** 효율적인 스칼라에
[flatMap](http://twitter.github.com/effectivescala/#Functional%20programming-`flatMap`)에
대해 다룬 글이 있다.

일반적인 함수 콤비네이터 
------------------------

지금까지 컬렉션에 작업을 수행시 골라잡을 수 있는 함수를 몇가지 배웠다.

이제 자신만의 함수 콤비네이터를 만들 수 있다면 더 좋을 것이다.

재미있는 사실은, 앞에서 본 모든 콤비네이터가 fold를 기본으로 작성될 수
있다는 점이다. 몇 가지 예를 보자.

    def ourMap(numbers: List[Int], fn: Int => Int): List[Int] = {
      numbers.foldRight(List[Int]()) { (x: Int, xs: List[Int]) =>
        fn(x) :: xs
      }
    }

    scala> ourMap(numbers, timesTwo(_))
    res0: List[Int] = List(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)

왜 Nil이 아니고 `List[Int]()`를 초기값으로 넣었을까? 이는 스칼라가 빈
Int 리스트에 값을 누적하기를 바란다는 점을 알아낼 정도로 똑똑하지 못하기
때문이다(역주: Nil을 넣으면 스칼라 타입 추론이 실패한다는 의미이다).

Map? 
----

앞에서 본 모든 함수 콤비네이터는 맵에서도 사용 가능하다. 맵을 키와 값을
쌍으로 하는 원소를 가지는 리스트로 생각한다면, 앞의 모든 함수들은 그
위에 동작할 수 있다.
 (역주: 여러 콤비네이터는 스칼라 컬렉션의 대부분의 클래스에서 사용
가능하다. 이에 대해서는 [스칼라 API문서의 컬렉션
부분](http://www.scala-lang.org/api/current/index.html#scala.collection.package)이나
[스칼라 컬렉션
가이드](http://docs.scala-lang.org/overviews/collections/introduction.html)를
참조하라.)

    scala> val extensions = Map(“steve” → 100, “bob” → 101, “joe” → 201)
    extensions: scala.collection.immutable.Map[String,Int] = Map((steve,100), (bob,101), (joe,201))

이제 내선 번호가 200보다 작은 모든 엔트리를 걸러내 보자.

    scala> extensions.filter((namePhone: (String, Int)) => namePhone._2 < 200)
    res0: scala.collection.immutable.Map[String,Int] = Map((steve,100), (bob,101))

filter는 전달된 함수에 투플을 넘긴다. 따라서 키와 값 중 원하는 것을 위치
억세서를 사용해 구분해야 한다. 영 좋지 않다!

다행히도 패턴 매치를 사용해 쉽게 키와 값을 분리할 수 있다.

    scala> extensions.filter({case (name, extension) => extension < 200})
    res0: scala.collection.immutable.Map[String,Int] = Map((steve,100), (bob,101))

어떻게 이런 동작이 가능할까? 부분적인 패턴 매치를 마치 함수처럼 전달할
수 있는 이유가 뭘까?

다음 강좌에서 이에 대해 다룰 것이다.


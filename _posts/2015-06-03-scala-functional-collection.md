---
layout: post
title: Scala - Functional/Collection
date: 2015-06-03
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [꽃보다 Scala!](https://docs.google.com/document/pub?id=1kSNKKKwM8rjGhn9Gnw-6Q0VCImpwSRZ7_QzwNwXgMxM)


----


Functional / Collection 
=======================

List, Set, Map, Tuple 
---------------------

Scala 의 collection library 에 존재하는 List, Set, Map 등의 자료 구조
클래스는 대부분 abstract 이며, 객체를 얻기 위해서는 별도의 표현법을
사용하거나 factory object를 이용해야합니다.

* * * * *

scala\> val hostPort = ("localhost", 80)

hostPort: (String, Int) = (localhost, 80)

scala\> 1 -\> 2

res0: (Int, Int) = (1,2)

scala\> Map(1-\>"a", 2-\>"c")

res4: scala.collection.immutable.Map[Int,java.lang.String] = Map(1 -\>
a, 2 -\> c)

scala\> Set(1,2,3)

res5: scala.collection.immutable.Set[Int] = Set(1, 2, 3)

scala\> Set.apply(1,2,3)

res8: scala.collection.immutable.Set[Int] = Set(1, 2, 3)

scala\> Array("a",1,2)

res6: Array[Any] = Array(a, 1, 2)

scala\> 2 :: 1 :: “bar” :: “foo” :: Nil

res14: List[Any] = List(2, 1, bar, foo)

scala\> Set(Map(1-\>"a"), Array(3,4), List("a","b",10))

res7: scala.collection.immutable.Set[java.lang.Object] = Set(Map(1 -\>
a), Array(3, 4), List(a, b, 10))

scala\> List(1,2,3).getClass

res13: java.lang.Class[\_ \<: List[Int]] = class
scala.collection.immutable.\$colon\$colon

* * * * *

Tuple 의 경우 별도의 객체 없이 () 로 둘러싸서 표현하며, 별도의 class
선언 없이 논리적으로 연관된 값들을 묶어서 리턴하거나 전달하기 위해서
사용됩니다.

Option 
------

Option은 일종의 container 로, 어떤 값을 가지고 있거나 가지고 있지 않은
상태를 표현 하기 위해 쓰입니다.

\* Haksell 이란 언어의 Maybe 타입에 영향을 받은 것으로 알려져 있습니다.

Option 은 추상 클래스와 유사한, trait 으로 선언되어 있으며 다음과 같은
형식을 지닙니다.

```scala
trait Option[T] {

    def isDefined: Boolean

    def get: T

    def getOrElse(t: T): T

}
```

 

보다시피 아주 간단한 container 역할을 하는 추상 클래스로, Some[T] 와
None을 concrete child class 로 가지고 있습니다.

자바나 C 계열 언어들의 함수는 값을 찾을 수 없는 경우 -1 또는 null 을
리턴합니다. 이런 함수 들의 문제점은 -1 이나 null 같은 값의 해석이
documentation 에 의존해야 하며, -1이나 null 자체가 의미 있는 값일 경우
해결이 불가능해집니다. Scala 에서는 이 문제 해결을 위해 Option 타입을
제공하며, 존재하는 값을 의미하는 Some 과, 존재하지 않는 값을 의미하는
None 두가지로 표현을 하는 것입니다. 간단히 기존 언어의 -1, null 리턴하는
경우라면 None 을 나머지 경우 Some 을 리턴하면 된다는 말입니다.

Some 을 생성할 경우 실제 값을 전달해야하며, None은 singleton object로 그
자체가 값입니다.

* * * * *

scala\> Option(3)

res10: Option[Int] = Some(3)

scala\> Option(null)

res11: Option[Null] = None

scala\> Some(null)

res12: Some[Null] = Some(null)

scala\> Option(-1)

res13: Option[Int] = Some(-1)

scala\> None

res14: None.type = None

scala\> val optionalInt: Option[Int] = None

optionalInt: Option[Int] = None

scala\> val optionalInt2: Option[Int] = Some(3)

optionalInt2: Option[Int] = Some(3)

* * * * *

Map.get 함수는 Option을 리턴 타입으로 가집니다. Map 자체에 그 값이 있을
수도 있고 없을 수 도 있기 때문입니다.

* * * * *

scala\> val numbers = Map(1 -\> "one", 2 -\> "two")

numbers: scala.collection.immutable.Map[Int,java.lang.String] = Map(1
-\> one, 2 -\> two)

scala\> numbers.get(2)

res0: Option[java.lang.String] = Some(two)

scala\> val n = if(res0.isDefined) res0.get else "not exists!"

n: java.lang.String = two

scala\> numbers.get(3)

res1: Option[java.lang.String] = None

scala\> res1.getOrElse("Not defined")

res2: java.lang.String = Not defined

* * * * *

리턴 받은 Option 객체에서 값을 꺼내기 위해서는 위의 Option trait의
정의에 있는 isDefined 와 get을 쓰거나 getOrElse 를 이용하면 됩니다.
하지만, 좀 더 일반적인 방법은 사이즈가 1인 collection, 즉 monad 로
Option을 바라보는 방식입니다. Monad 부분에서 자세한 설명을 하도록
하겠습니다.

Functional Combinators 
----------------------

## foreach 

side effects 를 발생시키기 위한 용도로만 사용합니다. 리턴값이 값이
없다는 의미의 Unit을 리턴하기 때문에 리턴값은 의미가 없으며, 대부분의
경우 block expression 중간에 잠시 사용되거나 더 이상 값을 리턴할 필요가
없는 부분에서 사용할 수 있습니다.

* * * * *

val numbers = 1 to 100

val sum = {

    var temp = 0;

    numbers.foreach(n =\> temp += n)

    temp

}

println(sum)

//물론 테스트 코드가 아닌, 실 환경에서는...

//println(numbers.sum)

* * * * *

## map / reduce 

map 은 함수형 언어에서 가장 널리 쓰이는 함수로,  각각의 멤버를 방문하며
전달 받은 함수를 수행 하여 얻은 결과를 동일한 collection에 저장하는
함수입니다.

이에 반해, reduce는 해당 데이터의 개수를 하나로 합치기 위한 함수로 앞
연산의 결과가 다음 연산으로 전달되며 눈뭉치 처럼 점점 커져가는 방식으로
작동합니다.

* * * * *

scala\> (1 to 10).map(\_\*2).map(\_.toString).reduce(\_ + \_)

res16: java.lang.String = 2468101214161820

* * * * *

위 과정은 아래와 같이 설명할 수 있습니다.

1.  1에서 10까지의 collection 생성 (1 to 10)
2.  1에서 10까지 방문하며 각 숫자 \* 2 실행 ( \_ \* 2)
3.  2,4,6,8, …, 20 까지 저장된 10개의 멤버를 모두 문자열로 변경
    (\_.toString)
4.  첫 두개의 문자열을 합하고 그 결과를 3번째 문자열과 합하고 마지막
    멤버까지 합하기 (\_ + \_)

이처럼 대부분의 경우 특별한 제어문 없이도 데이터 프로세싱이 가능하며
원하는 결과를 한줄의 function chaining으로 만들어 낼 수 있습니다.

## 그외의 functional combinators 

map/reduce 외에도  filter / zip / partition / find / drop / dropWhile /
foldLeft / foldRight / flatten / flatMap 등의 다양한 함수들이 제공되며
각 함수를 이해하고 적재적소 잘 활용하고 뒤에 나올 pattern matching 까지
사용하면 필요한 모든 제어구조를 표현 할 수 있습니다.

Monad 
-----

Scala 문서를 보다보면 monad (단세포 생물 등), monadic 등의 표현이 자주
나오는데, 간단히 collection 처럼 다룰 수 있는 사이즈가 1인 대상으로
이해하면 됩니다.

대표적으로 Option 객체가 monad 이며 option 객체에는 collection 객체 들과
동일한 map/foreach 등의 함수가 존재합니다. 만약 Option 객체가 None, 즉
사이즈가 0인 collection 이라면, 인자로 전달된

함수들은 실행 되지 않을 것입니다.

* * * * *

scala\> :paste

// Entering paste mode (ctrl-D to finish)

val idToName = Map(

    1-\>"wangtao",

    2-\>"tao.kim",

    3-\>"sangbeom.kim",

    4-\>"sb.kim"

)

(1 to 10).foreach(id =\>

    idToName.get(id).foreach(

        name =\> println("Hello, "+ name)

    )

)

\^D

// Exiting paste mode, now interpreting.

Hello, wangtao

Hello, tao.kim

Hello, sangbeom.kim

Hello, sb.kim

* * * * *

테스트를 위해 1부터 10까지의 숫자가 담긴 collection 을 만든 후 해당 숫자
값들을 idToName Map을 통해 이름으로 변경하는 코드 입니다.  Map.get
함수가 리턴한 Option을 마치 List 처럼 foreach 함수를 사용하여 담고 있는
값에 접근하고 있으며, 이는 Option 객체를 마치 리스트등의 데이터 구조처럼
다룰 수 있다는 말입니다.

이런 방식의 접근은 데이터를 꺼내와서 값이 있는지 없는지 확인하고 코드를
분기하기 보다는, 값이 있을때 해당 함수가 실행하게 되는 전형적인
functional style로 코드를 작성하게 해줍니다. 실제로도 Option 객체는 List
로 변환 가능하며 Some의 경우 사이즈가 1인 List로 None의 경우 Nil (empty
List) 로 변환됩니다.

Option 외에도 기타 프레임웍들이 사용하는 Future 등의 객체도 monad로 다룰
수 있도록 API가 설계되어 있습니다.


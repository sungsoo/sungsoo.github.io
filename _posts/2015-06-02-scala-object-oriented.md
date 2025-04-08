---
layout: post
title: Scala - Object Oriented Features
date: 2015-06-02
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [꽃보다 Scala!](https://docs.google.com/document/pub?id=1kSNKKKwM8rjGhn9Gnw-6Q0VCImpwSRZ7_QzwNwXgMxM)


----


Object-oriented Features
===============

Class 
-----

Scala의 클래스는 생성자와 접근자를 제외하고는 자바와 거의 유사합니다.

## 접근자 (Access Modifier) 

Scala의 접근자는 자바에서의 불편함과 문제점을 해소하기 위해 다음과 같은
다양한 방법을 제공합니다.

-   public,protected, private 은 inner class 등의 상황을 제외하고는 거의
    동일합니다.
-   private[this] 와 같은 방식으로 this 객체 내부로 접근 제한이
    가능합니다.
-   private[package\_name] 방식으로 package private 을 지원합니다.
-   protected[package\_name] 방식으로 package 접근 제한 역시 가능합니다.

## 생성자 

첫번째 예제에서 보여졌듯이, Scala는 생성자와 클래스를 동시에 선언합니다.
만약 추가 생성자가 필요하다면, this keyword를 이용해 가능합니다.

```scala
class Rational(n: Int, d: Int) {

    require(d != 0) //if failed, IllegalArgumentException will be raised

    val numer: Int = n
    val denom: Int = d

    def this(n: Int) = this(n, 1) // auxiliary constructor

    override def toString = numer +"/"+ denom

    def add(that: Rational): Rational =

        new Rational(
            numer \* that.denom + that.numer \* denom,
            denom \* that.denom
        )
}
```

Object 
------

Scala에는 static class나 member 가 존재하지 않습니다. 대신에, singleton
object 를 지원하며, object 키워드를 통해 선언 합니다. 자바의 static 과
유사하지만, type으로 쓰일 수 없으며 대부분의 경우 val 멤버 변수만을
사용하기 때문에 동시성 문제도 없으며, static 클래스의 초기화 문제도
없습니다.

자바의 singleton object 생성 코드입니다.

```java
class Singleton{

    private static Singleton instance;

    public void greeting(String name) {

        System.out.println("Hello, " + name);

    }

    private Singleton() {} //prevent constructing from outside

    public static Singleton getInstance(){

        if (instance == null) {

            synchronized(Singleton.class) {  //1

                if (instance == null)          //2

                    instance = new Singleton();  //3

            }

        }

        return instance;

    }

}
```

Thread-safe 하게 만들기 위해서 double checked locking 패턴이
이용되었으며 생성자를 private 으로 만들어 외부에서의 생성을 막습니다.

\* J2SE 5.0 이후에서는 volatile 을 이용해야합니다.

동일한 역할의 Scala 코드입니다.

```scala
object Singleton {

    def greeting(name: String) {

        println("Hello, " + name)

    }

}
```

훨씬 간결하며, 복잡한 생성 과정에서의 동시성 문제도 전혀 없습니다.
타입이 아니기 때문에 생성 역시 불가능하며 사용시에는 그냥 객체 이름을
그대로 접근합니다.

* * * * *

scala\> object Singleton{

     | def greeting(name: String) {printf("Hello, %s", name)}

     | }

defined module Singleton

scala\> Singleton.greeting("wangtao")

Hello, wangtao

* * * * *

또한, companion object 라 불리는 class 와 동일한 이름의 object를
선언하여 factory 용도로 사용하기도 합니다. 일반적으로 여러 생성자를
만들기보다는 이런 형태의 Factory pattern 이 선호 됩니다.

```scala
//in Rational.scala

class Rational(n: Int, d: Int) {

    require(d != 0)

   

    val numer: Int = n

    val denom: Int = d

   

    override def toString = numer +"/"+ denom

   

    def add(that: Rational): Rational =

        new Rational(

            numer \* that.denom + that.numer \* denom,

            denom \* that.denom

        )

}

object Rational {

    def apply(n: Int, d: Int) = new Rational(n, d)

    def apply(n: Int) = new Rational(n, 1)

}
```

appy 함수는 해당 객체를 마치 함수처럼 다룰 수 있게 해주는 syntactic
sugar 입니다. 다음과 같이 마치 함수를 부르듯 new 키워드 없이 Rational
객체를 생성하고 사용할 수 있습니다.

* * * * *

scala\> println(Rational(2,3))

2/3

* * * * *

Trait 
-----

Scala 에는 interface나 abstract class 없으며, trait 이 그 역할을
대체합니다. trait 특질, 특성 이라는 의미를 가지는데, 말 그대로 어떤
class 의 부모의 역할을 하기보다는 원하는 특성을 부여하여 기능을
확장시키는 개념으로 이해할 수 있습니다.

OOP의 상속 개념에 대해서 설명할 떄 자주 예로 드는 것이 자동차와 같이
쉽게 분류 가능한 예를 들곤 합니다. 명확한 부모 클래스와 구체적인 자식
클래스로 나뉠 수 있기 때문이죠. 하지만 좀 더 정확히 현실세계를 모델링
하고자 한다면, 다중 상속 개념이 필요 할 수 밖에 없게 되지만 다중 상속의
문제는 너무나 잘 알려져 있고 이를 피하기 위해 많은 프로그래밍 언어들이
선택하는 방법은 바로 mixin 입니다.

Scala 역시 trait 을 이용해 mixin 을 지원하며 클래스 선언시 with 키워드를
이용해 해당 클래스에 원하는 특성을 부여하게 되며, 이런 방식을 통해
코드를 조각 조각 작게 쪼개어 구현할 수 있게 되고 이를 조립하여 원하는
기능의 객체를 만들어 낼 수 있습니다. 바로 Lego style이라 종종 불리는
방식이죠.

```scala
abstract class Person {

    def schedule:Schedule

}

 

trait Student extends Person {

    private var classSchedule:Schedule = ...

    override def schedule = classSchedule

    def learn() = {...}

}

 

trait Worker extends Person {

    private var workSchedule:Schedule = ...

    override def schedule = workSchedule

    def work() = {...}

}

 

class CollegeStudent(school:School, company:Company) extends Student with Worker {

  // ...

}
```

출처:
[http://www.codecommit.com/blog/scala/scala-for-java-refugees-part-5](http://www.google.com/url?q=http%3A%2F%2Fwww.codecommit.com%2Fblog%2Fscala%2Fscala-for-java-refugees-part-5&sa=D&sntz=1&usg=AFQjCNHycxkRk9TG8qxI3y6_9awl63OlYw)

아래 링크의 좀 더 멋진 예제들 역시 살펴 보시기 바랍니다.

-   [http://joelabrahamsson.com/entry/learning-scala-traits](http://www.google.com/url?q=http%3A%2F%2Fjoelabrahamsson.com%2Fentry%2Flearning-scala-traits&sa=D&sntz=1&usg=AFQjCNFH_KTSweLH3UAV_qijiSTyLYDVNQ)
-   [http://gleichmann.wordpress.com/2009/10/21/scala-in-practice-composing-traits-lego-style/](http://www.google.com/url?q=http%3A%2F%2Fgleichmann.wordpress.com%2F2009%2F10%2F21%2Fscala-in-practice-composing-traits-lego-style%2F&sa=D&sntz=1&usg=AFQjCNGO9loEejEhH11Bw3m27QT6LxFeEQ)
-   [http://www.ibm.com/developerworks/java/library/j-scala04298/index.html](http://www.google.com/url?q=http%3A%2F%2Fwww.ibm.com%2Fdeveloperworks%2Fjava%2Flibrary%2Fj-scala04298%2Findex.html&sa=D&sntz=1&usg=AFQjCNGvWcA2HqT5sY_ZIM5vP0lpczCuJQ)

Package 
-------

package 선언 역시 자바에 비해 유연하며, 다양한 방식을 지원합니다.

아래처럼 자바 스타일이 가장 일반적이며,

```scala
package com.kthcorp

class A
```

또는 아래처럼 다양한 방법으로 표현 가능합니다.

```scala
package com.kthcorp

class A

//or

package com.kthcorp {

    class A

}

//or

package com {

    package kthcorp {

        class A

    }

}

//or

package com

package kthcorp

class A
```

class 선언 후에도 하위 package 선언 역시 가능하며, 어떤 형식으로 작성
하던 대부분의 경우 문제 없이 컴파일이 됩니다.

참고로, 디렉토리 구조및 파일명을 강제하는 자바와 달리 Scala는 하나의
코드에 여러 클래스를 선언하기도 하며, 디렉토리 구조 역시 소스코드의 경우
지키지 않아도 무방합니다. 컴파일러가 결과물인 class 파일을 적절한
디렉토리에 저장해줄 것이기 때문이죠.

다시 한번 강조하지만, 모든 것은 컴파일 타임에 이루어집니다 :)

Imports 
-------

Scala의 import 문 역시 자바의 그것에 비해 매우 유연하고 강력하며, 다음과
같은 특징을 가지고 있습니다.

-   어느 장소에서나 import 가 가능하며, 변수의 scope와 동일한 유효
    범위를 가집니다.
-   aliasing이 가능합니다.
-   object(singleton 객체)나 package 자체 import가 가능합니다.
-   “\*” 대신 “\_” 를 사용합니다.

* * * * *

scala\> :paste

// Entering paste mode (ctrl-D to finish)

object Singleton {

    def greeting(name: String) {

        import java.util.{Date =\> UtilDate}

        printf("Hello, %s at %s", name, new UtilDate())

    }

}

\^D        

// Exiting paste mode, now interpreting.

defined module Singleton

scala\> import Singleton.\_

import Singleton.\_

scala\> greeting("wangtao")

Hello, wangtao at Tue Sep 11 14:24:54 KST 2012

* * * * *

Implicit Conversion 
-------------------

대부분의 실제 데이터는 하나의 타입 만 으로 모델링 하는 것은 쉽지
않습니다. 개념적으로는 email 같은 경우 문자열로 표현 할 수도 있지만,
Email 같은 객체에 담고 언제 든지 문자열로써 사용할 수 있는 것이 더
정확하고 편리할 것입니다. 하지만, 과도한 타입과 객체들은 개발자를
피곤하게 합니다. Type hierarchy를 잘 설계해야 하며, 각 type 에대한
적절한 함수 역시 각각 선언하거나 호출 전에 적절히 변환해야 합니다.

가장 많이 쓰이는 간단한 숫자 하나에도 타입 문제는 골치거리 중 하나
입니다. Int, Double 등 많은 상황에 맞는 효율적인 타입을 쓰는 것은
프로그래밍 언어에서는 당연한 것이긴 하지만, 각 타입별로 함수를 별도로
작성을 해야 하거나 명시적으로 변환하는 함수들을 만들어줘야 하니까요.
Dynamic 타입 언어들은 이런 문제를 암묵적인 자동 변환으로 해결합니다.
하지만, 이런 방식은 매우 편리하기도 하지만 디버깅 하기도 쉽지 않은
예상치 못한 문제를 발생시키곤 합니다.

Scala는 이에 대한 해결책으로 하나의 데이터를 여러 데이터로 바라볼 수
있게 (Viewable) 해주는 Implicit conversion 이라는 기능을 제공합니다.
많이 쓰이는 기본적인 숫자간의 변환같은 것을 제외하고는 명시적으로 선언을
해야만 작동하며 변환 룰을 import 해야만 하기때문에 scope 역시 변수와
마찬가지로 해당 block 안에서만 유효합니다.

엄격한 언어답게 기본적으로 Int 는 Double로 자동 변환 되지만, Double은
Int로 자동 변환 되지 않습니다.

* * * * *

scala\> def printInt(n: Int) { println(n)}

printInt: (n: Int)Unit

scala\> printInt(3.0)

\<console\>:9: error: type mismatch;

 found   : Double(3.0)

 required: Int

              printInt(3.0)

                       \^

scala\> def printDouble(n:Double) {println(n)}

printDouble: (n: Double)Unit

scala\> printDouble(3)

3.0

* * * * *

이는 자동 import 되는 scala.Predef object에 해당 변환 룰이 선언되어 있지
않기 때문입니다. 오직 Int 를 Double 로 변환하는 룰만 존재하는 것이죠.
아래는 Predef 객체 일부분인데, 보시다시피 Int 는 Long, Double, Float로
변환 가능하지만 반대의 경우는 정의가 없습니다.

```scala
object Predef extends LowPriorityImplicits {

    implicit def int2long(x: Int): Long = x.toLong

    implicit def int2float(x: Int): Float = x.toFloat

    implicit def int2double(x: Int): Double = x.toDouble

   

}
```

변환룰은 함수로 정의하며, implicit 키워드를 사용하며 인자의 타입과
리턴타입을 이용해 적용 여부를 검사합니다. 또한, 컴파일 타임에 해당
함수가 현재 scope 안에서 직접 보여야 합니다. 즉, 함수가 같은 scope
내에서 먼저 선언되거나 함수 자체가 직접 import 되어야 합니다.

자신이 직접 implicit 를 선언한 경우 범위안에서는 당연히 컴파일 타임에
변환 함수를 호출하는 로직이 끼워질 것이고, 해당 변환이 필요한 경우 변환
함수를 다른 곳에서 import를 하면 됩니다. 실제 사용 예를 살펴보면 많은
경우 여러 implicit 를 하나의 Implicits 라는 객체에 모아두곤 합니다.

참고로, 해당 객체가 변환 가능한 객체의 함수도 직접 사용이 가능합니다.
Int는 Double 로 바라 볼 수 있기 때문에 Double의 모든 함수를 직접 호출 할
수 있으며, 이는 compile time에 conversion을 발생시킵니다.

또한, 아래처럼  “implicit” 키워드는 함수의 인자에도 사용할 수 있습니다.
자동으로 해당 scope 내의 같은 타입의 implicit 로 선언된 변수가 함수
인자로 지정되며, 이는 마치 injection 유사한 개념으로 사용할 수도
있습니다.

* * * * *

scala\> implicit val somethingYouKnowAndIKnow: String = "Java sucks!"

somethingYouKnowAndIKnow: String = Java sucks!

scala\> def sayTheTruth(implicit truth: String){println(truth)}

sayTheTruth: (implicit truth: String)Unit

scala\> sayTheTruth

Java sucks!

* * * * *

Scala 에서 제공되는 대부분의 conversion은 변환 자체가 가벼우며 손실이
발생하지 않는 것들만 제공되며, 필요한 경우 직접 작성해여합니다. 단,
자신이 직접 변환룰을 작성할 때는 정확히 이해하고 사용해야하며, 모든 것은
여러분이 구현한 코드에 달려있습니다.  한마디로, Int를  String 으로
변환하거나 String 을 Int 로 변환하는 룰을 추가하지는 마십시요 :)

\* 아이러니 하게도 implicit 를 explicit 하게 선언해야 합니다.

Type hierarchy 
--------------

![](https://lh6.googleusercontent.com/r4plCOKjDFS2tPRTAGyI2XSeQlOjCZxoLxA1PIkqAdT_UosZqwEQEoBIeuof39U08UjGkj4nYfdw9py0uU6kaH71PLkskUqapgdIJ0o81E9pEpwaBfuqJL5bkA)

그림에서 보이듯이, Scala의 최상위 class 는 Any 이며 값을 나타내는
AnyVal, 참조를 나타내는 AnyRef 가 그 뒤를 잇습니다. Nothing은 bottom
type 이라 불리며 모든 타입의 하위 이며, Null 은 모든 참조 타입의 최하위
타입입니다.


---
layout: post
title: Scala - Pattern Matching
date: 2015-06-03
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [꽃보다 Scala!](https://docs.google.com/document/pub?id=1kSNKKKwM8rjGhn9Gnw-6Q0VCImpwSRZ7_QzwNwXgMxM)


----



# Pattern matching 


Scala의 가장 강력하며 유용한 기능 중에 하나인 pattern matching은 간단히
switch case 와 유사한 case by case 형태의 코드를 작성할 때 매우
유용하며, 다양한 표현법을 이용해 matching 조건을 선언할 수 있습니다.

## Matching on values 

값을 matching 하는 경우는 switch case 와 별반 다를 바 없습니다.

```scala
val times = 1

times match {

    case 1 =\> "one"

    case 2 =\> "two"

    case \_ =\> "some other number"

}
```

## Matching with guards 

조건식을 추가하여 matching 할 수 도 있습니다.

```scala
times match {

    case i if i == 1 =\> "one"

    case i if i == 2 =\> "two"

    case \_ =\> "some other number"

}
```

## Matching on type 

값에 따른 분기 뿐 아니라 타입에 의한 분기 역시 가능합니다.

```scala
def bigger(o: Any): Any = {

    o match {

        case i: Int if i \< 0 =\> i - 1

        case i: Int =\> i + 1

        case d: Double if d \< 0.0 =\> d - 0.1

        case d: Double =\> d + 0.1

        case text: String =\> text + "s"

    }

}
```

## Matching on class members 

객체의 멤버 변수 역시 조건식에서 바로 접근이 가능합니다.

```scala
def calcType(calc: Calculator) = calc match {

    case calc.brand == "hp" && calc.model == "20B" =\> "financial"

    case calc.brand == "hp" && calc.model == "48G" =\> "scientific"

    case calc.brand == "hp" && calc.model == "30B" =\> "business"

    case \_ =\> "unknown"

}
```

사실 들여쓰기가 조금 더 깔끔해 보일 뿐 더 if / else 를 쓴 것과 별차이가
없습니다. 이런 경우에는 바로 다음에 설명할 case class 라는 방식을
이용하는 것이 훨씬 코드를 간결하게 만들 수 있습니다.

## Case Classes 

case class 는 pattern matching 을 지원해주는 class 형태로 일반적으로
자바에서 value object 나 model 이라 불리는 객체들을 주로 case class 로
선언하게 됩니다.

case class 로 선언된 class는 자동으로 factory 함수가 제공되며, equality
와 toString 등의 기능 역시 제공됩니다.

* * * * *

scala\> case class Calculator(brand: String, model: String)

defined class Calculator

scala\> val hp20b = Calculator("hp", "20b")

hp20b: Calculator = Calculator(hp,20b)

scala\> val hp20B = Calculator("hp", "20b")

hp20B: Calculator = Calculator(hp,20b)

scala\> hp20b == hp20B

res39: Boolean = true

* * * * *

하지만, case class 의 강력함은 생성의 편리함이나 toString, equality 등에
있지 않습니다. 바로 아래 예제와 같은 pattern matching 입니다.

* * * * *

def calcType(calc: Calculator) = calc match {

    case Calculator("hp", "20B") =\> "financial"

    case Calculator("hp", "48G") =\> "scientific"

    case Calculator("hp", "30B") =\> "business"

    case Calculator(ourBrand, ourModel) =\> "Calculator: %s %s is of
unknown type".format(ourBrand, ourModel)

}

* * * * *

class를 생성하는 함수를 그대로  조건식의 표현으로 사용하여 matching 이
가능합니다. 이때 생성함수의 인자에 임의의 변수 이름을 지정하여 해당 값을
추출하여 사용할 수 있습니다. 위의 예에서는 마지막 case 의 ourBrand와
ourModel 변수를 타입 등의 거추장스러운 표현 없이 바로 매칭되는 값에
할당하여 사용할 수 있습니다.

## Extracting pattern 

이런 pattern matching 이용해 편하고 깔끔하게 변수 선언을 하는 방법이
있습니다.

* * * * *

scala\> def getLocation = (math.random, math.random)

getLocation: (Double, Double)

scala\> val myLoc = getLocation

myLoc: (Double, Double) = (0.24252881689068828,0.17982331409379104)

scala\> myLoc.\_1

res3: Double = 0.24252881689068828

scala\> myLoc.\_2

res4: Double = 0.17982331409379104

scala\> val (x, y) = getLocation

x: Double = 0.6297894678697743

y: Double = 0.799919442582773

scala\> x

res5: Double = 0.6297894678697743

scala\> y

res6: Double = 0.799919442582773

* * * * *

예제에서 보이듯이 리턴된 tuple을 하나의 값으로 받아 각각 쓰기보다는,
한번에 각 멤버를 extract 할 수 있다는 말입니다. val (x, y) 표현은
오른쪽에 있는 표현이 tuple 이기 때문에 성립되며,  이런 방식은 List 나
case class 등에 적용 할 수 있습니다.

* * * * *

scala\> val List(a,b) = List(1,2)

a: Int = 1

b: Int = 2

scala\> val Calculator(brand, model) = Calculator("myBrand","myModel")

brand: String = myBrand

model: String = myModel

scala\> brand

res7: String = myBrand

scala\> model

res8: String = myModel

* * * * *


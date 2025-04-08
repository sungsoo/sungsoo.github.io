---
layout: post
title: Scala Basics
date: 2015-06-02
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [꽃보다 Scala!](https://docs.google.com/document/pub?id=1kSNKKKwM8rjGhn9Gnw-6Q0VCImpwSRZ7_QzwNwXgMxM)


----




# Scala Basics 


## Defining variables 

Scala에는  “val”과 “var”라는 2가지 타입의 변수가 존재합니다. 전자는
value를 의미하며 말 그대로 값을 선언할 때 쓰이며, 선언 이후에는 변경
불가능 합니다. 후자는 variable을 의미 하며 변경 가능한 변수를
의미합니다. val 로 선언된 변수는 자바의 final 변수와 동일하기 때문에,
 단지 참조가 변경 불가능한 것이며 해당 객체의 멤버 변수가 var 로
선언되어 있다면, 당연히 변경 가능합니다.

* * * * *

scala\> val msg = "Hello, World!"

msg: java.lang.String = Hello, World!

scala\> msg = "Welcome to Scala!"

\<console\>:8: error: reassignment to val

       msg = "Welcome to Scala!"

               \^

* * * * *

위와 같이 val 로 선언된 값에 재할당을 할 경우 컴파일 에러가 발생합니다.

## Block Expression 

하나의 표현으로 원하는 값을 나타낼 수 없을때 중괄호({}) 를 이용해
표현식을 묶을 수 있습니다. 묶여진 표현식의 값은 마지막 표현식이 되며,
중간에 어떤 코드가 들어있고 어떤 side effect가 발생했는지는 전혀 상관이
없습니다. 변수이던 함수 이던 함수의 인자이던 상관없이 block expression은
하나의 값을 나타냅니다.

* * * * *

scala\> val a= {

     |println(1)

     |println("a")

     | 5

     | }

1

a

a: Int = 5

scala\> a

res1: Int = 5

* * * * *

## Defining functions 

함수의 선언은 def keyword로 시작되며 함수 선언부와 구현 부는 “=” 로
구분됩니다. 마치 수학의 f(x,y) = x +y 와 마찬가지로 말입니다.

* * * * *

scala\> def f(x:Int, y:Int) = x + y

f: (x: Int, y: Int)Int

* * * * *

수학에서 함수 표현과 다른 점은 def 로 시작해야하며, 인자의 타입을
명시해야 한다는 점 뿐입니다. 위와 같이 선언된 함수는,

* * * * *

scala\> f(1,2)

res0: Int = 3

* * * * *

이와 같이 사용 가능합니다.

가끔은 Console.println 처럼  “=” 이 사용되지 않고 선언된 함수들이
존재하는데, 이는 리턴값이 Unit(void)인  경우에 해당 함수가 마치
procedure 와 유사하게 보이도록 해주는 문법입니다.

* * * * *

def printGreetings(name: String) {

    printf("Hello, %s", name)

}

* * * * *

\* printf 함수 역시 존재합니다 :)

함수의 구현 부분이 한개의 표현식으로 쓸 수 없는 경우, 앞에서 언급한
block expression 을 이용할 수 있으며, 당연히 리턴값은 묶여진 표현식의
마지막 값입니다.

## Define anonymous function 

Scala에서는 함수 literal 이라 불리는 표현법으로도 함수 선언이
가능합니다.

* * * * *

scala\> (x:Int) =\> x + 1

res0: Int =\> Int = \<function1\>

* * * * *

아래 결과로 나타난 expression은 다음과 같은 의미를 가집니다.

“res0의 타입은 Int 를 주면 Int 를 반환하는 인자가 1개인
함수이다(function1)”

따라서 res0 를 함수로 사용하여 다음과 같은 호출이 가능합니다.

* * * * *

scala\> res0(3)

res2: Int = 4

scala\> res0()

\<console\>:9: error: not enough arguments for method apply: (v1:
Int)Int in trait Function1.

Unspecified value parameter v1.

              res0()

                     \^

* * * * *

위 문법을 활용하여 다음과 같이 함수를 인자로 받는 함수에 inline으로
함수를 정의하여 전달 가능합니다.

* * * * *

scala\> List(1,2,3,4).foreach(x=\>println(x))

1

2

3

4

* * * * *

또는 축약형으로 쓸 수 도 있습니다.

* * * * *

scala\> (1 to 10).filter(\_ % 2 == 0)

res9: scala.collection.immutable.IndexedSeq[Int] = Vector(2, 4, 6, 8,
10)

* * * * *

1 부터 10까지의 수 중에서 짝수만을 filtering 하는 코드로,  “\_ % 2 == 0”
표현식은 “num =\> num % 2 == 0” 의 축약형입니다.

밑줄, “\_” 는 함수의 인자가 들어갈 자리라는 뜻이며, 함수 인자가 순서대로
해당 자리에 채워집니다.

참고로,  List 관련 예제는 마치 dynamic typed language 처럼 보여지지만,
내부적으로 다음과 같은 타입 추론 과정을  컴파일 타임에 거치게 됩니다.

​1. List 함수는 인자로 전달된 4개의 값의 공통 타입을 추론

​2. 멤버들의 타입은 Int로 결정되었으며 전달되는 함수의 인자 역시 Int
여야 함

​3. 전달된 함수 x=\>println(x) 의 인자 x 의 type이 명시되지 않았기
때문에 Int로 추론

​4. 결과 : List[Int](1,2,3,4).foreach( (x:Int) =\> println(x))

* * * * *

scala\> List(1,2,3,4).foreach((x:String)=\>println(x))

\<console\>:8: error: type mismatch;

 found   : String =\> Unit

 required: Int =\> ?

              List(1,2,3,4).foreach((x:String)=\>println(x))

* * * * *

## Type and Generics 

Scala의 generics 는 자바와 달리 \< \> 대신 [ ] 로 표현되며, 객체의
상속관계 등의 상/하 뿐만 아니라 해당 객체가 다른 객체로 변환될 수
있는지, 또는 바라볼 수 있는지 등도 명시가 가능하며 모든 타입 선언은
컴파일타임에 검증 됩니다.

Scala 의 collection library 에는 sum 이라는 함수가 존재합니다. 말 그
대로 collection 안의 데이터를 더하는 함수 인데, 이런 함수가 generic 을
기반으로 하는 collection 에 있을 수 있는 이유는, 간단히 숫자가 아닌 값이
들어 있을 경우 compile 이 되지 않기 때문입니다.

* * * * *

scala\> List(1,2,3,4).sum

res2: Int = 10

scala\> List(1,2,3.0,4).sum

res3: Double = 10.0

scala\> List(1,"a",3).sum

\<console\>:8: error: could not find implicitvalue for parameter num:
Numeric[Any]

              List(1,"a",3).sum

* * * * *

위 예제 처럼 직접 List 를 명시하지 않고 다른 함수로 부터 얻어온 List에
대해서는 어떻게 Compile error 를 발생시킬 수 있는지 의문을 제기할 수도
있습니다. 간단히 설명하자면, 모든 함수는 리턴타입이 명시되어 있고 이를
이용해 판단할 수 가 있습니다. 함수, 변수를 포함한 모든 표현식은 타입을
가지고 있는 값입니다.

심지어는 이런 표현도 가능합니다.

* * * * *

scala\> def getLength[T \<: {def length(): Int}](obj: T): Int =
obj.length

getLength: [T \<: AnyRef{def length(): Int}](obj: T)Int

scala\> println(getLength("aaaaa"));

5

* * * * *

타입 T 는 length() 라는 함수가 있는 클래스의 하위 타입 (\<:) 이어야
하며, 이런 표현을 통해  interface 선언 없이도 컴파일타임에 강력한 타입
체킹을 할 수 있습니다.

위의 getLength 함수 호출에서도 보여지지만, 대부분의 경우 type parameter
는 값으로 부터 추론 할 수 있기 때문에 생략 가능합니다.

\* Scala에서는 Array역시 함수 처럼 ( ) 사용합니다. ex) Array(1,2,3)(0)
 은  1 을 리턴

## Control flow 

### Expression oriented 

Scala 대부분의 코드는 문장(statements)이 아닌 표현식(expressions)
입니다. 명령형 언어처럼 절차적으로 명령을 내리는 것이 아닌 모든 표현식은
값을 나타내며, 제어문 조차 값을 나타냅니다.

### No break 

Scala에는 break 문이 없습니다. 대부분의 제어 구조는 함수를 chaining 을
통해 이뤄지며, map/reduce/filter/collect 등 LISP 등과 유사하게 List
Processing 을 통해 원하는 흐름을 만들어냅니다.

### If / Else 

Scala의 if/else 문은 코드를 분기하기 위한 표현이 아니라 조건에 따라 값을
리턴하는 표현식입니다.

* * * * *

scala\> val a = "a"

a: java.lang.String = a

scala\> val b = if(a == "a") "b" else "c"

b: java.lang.String = b

* * * * *

C 계열 언어의 ? 연산자와 비슷한 역할을 하지만, 함수 체이닝을 통해 제어
구조를 완성 할 수 있습니다.

### For 

Scala의 for 문은 자바와 유사한 방식으로 사용되기도 하지만, 일반적으로는
if/else 와 마찬가지로 값을 얻어내기 위해서 사용되어지며 자바와 달리
다양한 조건및 여러 collection 에 대해 한번에 iterating을 할 수 있는
기능을 제공합니다.

* * * * *

scala\> for(n \<- 1 to 10) yield n.toString

res3: scala.collection.immutable.IndexedSeq[java.lang.String] =
Vector(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

scala\> val a = 1 until 10

a: scala.collection.immutable.Range = Range(1, 2, 3, 4, 5, 6, 7, 8, 9)

scala\> val b = 1 to 10

b: scala.collection.immutable.Range.Inclusive = Range(1, 2, 3, 4, 5, 6,
7, 8, 9, 10)

scala\> for{

     | n1 \<- a

     | n2 \<- b if n2 % 2 == 0

     | } yield (n1, n2)

res5: scala.collection.immutable.IndexedSeq[(Int, Int)] = Vector((1,2),
(1,4), (1,6), (1,8), (1,10), (2,2), (2,4), (2,6), (2,8), (2,10), (3,2),
(3,4), (3,6), (3,8), (3,10), (4,2), (4,4), (4,6), (4,8), (4,10), (5,2),
(5,4), (5,6), (5,8), (5,10), (6,2), (6,4), (6,6), (6,8), (6,10), (7,2),
(7,4), (7,6), (7,8), (7,10), (8,2), (8,4), (8,6), (8,8), (8,10), (9,2),
(9,4), (9,6), (9,8), (9,10))

* * * * *

yield 문을 이용하여 리턴된 값은 전체 iterating 후 적절한 collection에
담겨지며, 위의 예제의 경우 Vector[Tuple[Int, Int]] 타입으로
리턴되었습니다.

If/Else와 For 표현식 만을 가지고 제어 구조를 작성하기에는 부족한 것이
사실입니다. 나머지 부분은 Functional Combinators를 이용해 쉽게 chaining
가능하며 다른 챕터를 통해 자세히 살펴 보겠습니다.

## Scala scripts 

Scala는 컴파일 방식의 언어이지만, 스크립트로서도 사용 가능하며 해당
스크립트는 class 나 main 함수 없이도 바로 작성 할 수 있으며, 전달 인자
역시 args 라는 배열을 통해 바로 접근 가능합니다.

\<Args.scala\>

* * * * *

//java style in scala

println("Java Style")

var i = 0

while(i \< args.length) {

    println(args(i))

    i += 1 // no ++ operater in scala

}

println("Scala style")

args.foreach(arg =\> println(arg))

//or

println("Shorthand form, called a partially applied function")

args.foreach(println)

* * * * *

\$ scala Args.scala a b c

Java Style

a

b

c

Scala style

a

b

c

Shorthand form, called a partially applied function

a

b

c

* * * * *

        

위 예제에서 첫 번째 방식은 자바 스타일로 var 변수를 사용해서 자바 코드를
그대로 옮겨온 것이며, 두번째와 세번째 방식은 좀 더 Scala 스러운 방식으로
작성한 예제입니다.

\* args는 Array 타입으로 Scala에서는 Array 역시 함수이기 때문에 인덱스
값을 함수의 인자처럼 전달하여 해당 인덱스의 값을 얻어옵니다.


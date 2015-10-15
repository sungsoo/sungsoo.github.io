---
layout: post
title: Lambda Expression in C++ 
date: 2015-10-25
categories: [computer science]
tags: [parallel computing]

---

## Article Source
* Title: [C++의 람다 식](https://msdn.microsoft.com/ko-kr/library/dd293608.aspx)

---

# Lambda Expression in C++

C++11에서 람다 식(종종 람다라고 함)은 호출되었거나 인수로서 함수에 전달된 위치에서 바로 익명 함수 개체를 정의하는 편리한 방법입니다. 일반적으로 람다는 알고리즘이나 비동기 메서드에 전달되는 몇 줄의 코드를 캡슐화하는 데 사용됩니다. 이 문서에서는 람다가 무엇인지 정의하고 다른 프로그래밍 기법과 비교하고 그 장점을 설명하며 기본 예제를 제공합니다.

## An Example of Lambda Expression

ISO C++ 표준에서는 std::sort() 함수에 세 번째 인수로 전달되는 간단한 람다를 보여 줍니다.

```c++
#include <algorithm>
#include <cmath>

void abssort(float* x, unsigned n) {
    std::sort(x, x + n,
        // Lambda expression begins
        [](float a, float b) {
            return (std::abs(a) < std::abs(b));
        } // end of lambda expression
    );
}
```

![](http://sungsoo.github.com/images/lambda.png)

이 그림에서는 람다의 부분을 보여 줍니다.

1. 캡처 절(C++ 사양에서는 *lambda-introducer*라고도 함)
2. 매개 변수 목록 선택 사항입니다. (*lambda declarator라*고도 함)
3. *mutable specification* 선택 사항입니다.
4. *exception-specification* 선택 사항입니다.
5. *trailing-return-type* 선택 사항입니다.
6. *lambda body*
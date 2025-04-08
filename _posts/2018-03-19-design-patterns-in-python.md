---
layout: post
title: Design Patterns in Python
date: 2018-03-19
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [파이썬 디자인 패턴](https://cryptosan.github.io/pythondocuments/documents/patterns-in-python/)
* Authors: 던컨 부쓰(Duncan Booth), duncan@rcp.co.uk


---

# Design Patterns in Python

파이썬에는 어떤 디자인 패턴을 적용할 수 있을까? 어떤 패턴은 파이썬에 이미 갖추어져 있으며, 어떤 패턴은 세심하게 코딩해야 최선의 결과를 얻을 수 있다. 파이썬에는 어떤 새로운 패턴이 나타나는가?


## 패턴이란 무엇인가?

절대적인 참조서인 디자인 패턴에서는 객체-지향적 소프트웨어 디자인을 위한 패턴
집합을 설명한다. 이 책은 종종 네 명의 저자(Gamma, Helm, Johnson 그리고
Vlissides)를 따라서 '사인방(Gang of Four)' 책 (이른바 GoF)라고도
불리운다.

디자인 패턴은 반복해서 일어나는 문제를 기술하고 그 문제에 대한
해결책에서 핵심을 뽑아서 다양한 방식으로 사용되게끔 해준다. 마지막
요점이 중요하다. 소프트웨어에서 디자인 패턴이라고 말할 때는 깔끔하게
하나의 클래스나 라이브러리 구현으로 묶을 수 있어서 그냥 사용되는 것들에
관하여 말하는 것이 아니라, 다양한 방식으로 적용이 가능한 테크닉에 관하여
말하는 것이다. 같은 테크닉을 다양한 문맥에서 사용할 수 있다면 우리는
경험을 더 넓은 영역에 걸쳐서 적용할 수 있기 때문이다.

사인방(GoF)은 패턴 어휘를 소프트웨어 공동체에 소개하였다. 각 패턴은
그들에 의하면 다음과 같이 기술된다:

1.  패턴 이름(*pattern name*)은 디자인 문제를 기술하는데
    사용되는 운전대이다. 이름을 사용하면 다른 소프트웨어 개발자와 어휘를
    공유할 수 있다.
2.  문제(*problem*)는 언제 패턴을 적용할 지 기술한다.
3.  해결책(*solution*)은 디자인, 그들 사이의 관계, 책임 그리고 협력을
    구성하는 요소들을 기술한다.
4.  결과(*consequences*)는 그 패턴을 적용한 손익결산이며 결과이다.
    패턴을 일정 상황에 적용한 결과를 인지해야만 그 패턴이 다른 상황에
    얼마나 적절한지 더 잘 평가할 수 있다.

사인방책은 대부분 C++로 패턴을 구현한다 (그리고 부록은 대다수가
Smalltalk으로 번역되었다). 그렇지만, 어떤 패턴은 구현된 언어에 많이
의존하는 반면에 또 어떤 패턴은 다른 언어에 가면 부적절하게 되거나 사실상
사라진다.

이 글은 몇 가지 공통적인 패턴을 구별해 보고, 파이썬으로는 동등한 것이
무엇이 있는지 알아보며, C++ 패턴과 다르게 파이썬만의 패턴이 있는지
연구한다.

어떤 사람들은 디자인 패턴이 파이썬과 어떻게 관련되어 있는지 살펴보았다.
눈에 띠는 분으로는 베스페 사비코(Vespe Savikko)와 알렉스 마르텔리(Alex Martelli)가 있지만, 파이썬이 진화하면서 이런 패턴을 구현하는방법도 변하고 있다.

### 한 마디 경고

론 제프리(Ron Jeffries)가 쓴 글을 읽고 있었다. 최근 그는 이렇게 썼다:

> **패턴 책을 든 어린 소년**
>
> 며칠에 걸쳐서 이런 아이디어들을 한 동안 생각한 후에, 마침내 "패턴 책을
> 잡은 어린 소년"이 무슨 뜻인지 깨닫았다. 팀에서 누가 사인방(Gamma, et
> al., Design Patterns)책을 읽고 있는지 구별할 수 있다. 며칠이 지나면,
> 이 사람은 엄청난 아이디어를 가지고 나타나서 시스템의 한 곳에 합성
> 패턴을 사용해야 한다고 열변을 토한다. 아마도 그가 지난 밤에 읽은
> 것일게다.
>
> 오래된 겪언이 하나 있다: 망치를 든 어린 소년에게는 무엇이든 못처럼
> 보인다. 프로그래머로서 우리도 같은 함정에 너무 자주 빠진다. 새로운
> 테크놀로지나 솔루션을 배우면 즉시 그것을 적용할 곳을 찾기 시작한다.

패턴은 유용하다. 또한 중독성이 있다. 너무 과용하지 않도록 하자.

## 생성 패턴(creational patterns)
GoF는 여러 *생성 패턴*을 식별하였다. 이 패턴들은 객체를 실체화하는 과정을 요약한다.

### 공장(Factory)
GoF가 식별한 가장 근본적인 패턴은 아마도 공장(*Factory*)과 추상
공장(*Abstract Factory*)일 것이다. C++과 같은 한 언어에서 공장 패턴은
보통의 객체 생성 구문인 <span class="interpreted">new
someclass()</span>를 함수나 메쏘드에 싸 넣어 그 생성을 제어할 수 있다.
이런 방식의 장점은 그 클래스를 사용하는 코드가 더 이상 생성의 세부사항에
전혀 알 필요가 없다는 것이다. 심지어 생성된 객체의 정확한 유형조차
몰라도 된다. 다른 말로 하면 모듈 사이의 의존성을 감소시킨다.

더 고급 형태의 공장(*Abstract Factory*)은 생성된 객체의 유형을 바꿀 수
있는 수단도 제공한다.

공장 패턴은 파이썬에서 필수이다: 다른 언어라면 특별한 구문을 사용하여
객체의 생성을 지시하는데, 파이썬은 함수 호출 구문을 (거의) 유일한
방법으로 사용하여 객체를 생성한다: int, str, list, 그리고 dict 같은 내장
유형은 자신만의 특별한 구문이 있지만, 그 모두가 공장 생산도 지원한다.

게다가, 파이썬은 모든 것에 추상 공장을 사용한다. 이 시스템의 동적인
본성은 어떤 공장도 오버라이드 할 수 있다는 뜻이다.

예를 들어, 다음 코드는:

```python
import random

def listOfRandom(n):
        return [random.random() for i in range(n)]
```

언뜻 보면 마치 이 함수가 10개의 의사-무작위수를 리스트에 담아 돌려줄 것
같아 보인다. 그렇지만 모듈 수준에서 <span
class="interpreted">random</span>을 재할당할 수 있으며, 얼마든지 원하는
것을 돌려주도록 만들 수 있다. 처음에는 이것이 말도 안되는 것 같지만,
사실 파이썬이 유닛 테스트를 작성하는데 훌륭한 언어인 이유가 바로 그
때문이다. 의사-무작위 결과를 갖는 함수에 대하여 자동화된 테스트를
작성하기는 쉽지 않다. 그러나 임시로 무작위 수 생성기를 잘 알려진
반복가능한 연속열로 바꿀 수 있다면 반복해 테스트할 수 있다. 파이썬에서는
이런 일을 쉽게 할 수 있다.

이것이 파이썬에서 과연 패턴으로 간주되는지는 말하기가 어렵다. 한
수준에서 언어에 기본이며, 실제 코드와 관련도 없기 때문이다. 반면, 그
패턴은 아주 잘 알려져 있어서 공장 패턴에 상응한다는 것을 이해하는 것이
중요하다.

파이썬 2.2에서 객체 생성을 제어하는 새로운 방법이 도입되었다.(바탕
클래스가 <span class="interpreted">object</span>인) 새-스타일 객체는
\_\_new\_\_ 메쏘드로 객체의 실제 생성을 제어한다. 이는 또다른 공장
패턴의 형태로 보일 수 있으며, 실제 파이썬 코드로 그것을 구현하고 있다.
다음 섹션에서 이를 더 자세하게 살펴보자.

## 싱글턴(Singleton) (그리고 보르그(Borg))
### 의도

> 클래스에 확실하게 오직 하나의 실체만 있으며 그 실체에 전역적으로
> 접근할 지점을 하나 제공한다.

많은 프로그래머가 패턴을 인식하기 위해 제일 처음 배우는 패턴은
'싱글턴'이다. 이는 안타깝게도, 여러모로 보아 오히려 안티-패턴에 가깝다.

싱글턴은 프로세스 안에서 오직 한 번만 실체화될 수 있는 객체이다. 물론
어쩌다가 한 번만 실체화 한 객체가 아니고, 여러 번의 실체화 시도를 모두
거부하는 객체이다.

싱글턴 패턴은 어플리케이션이 데이터베이스에 접근하거나 네트워크 링크가
서버에 접근하거나 또는 컴퓨터의 레지스트리에 접속하려는 시도 등등을
제어하는 클래스에 자주 사용된다. 이는 싱글턴을 좀 허술하게 사용하는
것이다. 어플리케이션이 오직 하나의 데이터베이스를 요구할 수도 있지만,
오직 데이터베이스 접근이 하나만 있을 수 있다고 요구하는 것은 아니다.
언젠가는 데이터베이스가 두 개인 어플리케이션으로 진화할지도 모르는데,
무엇 때문에 그를 막는 코드를 작성할까?

싱글턴의 심각한 결점은 테스트를 망가뜨린다는 것이다. 유닛 테스트는 종종
실제 객체와 비슷하지만 구현은 없는 가짜 객체를 만들어서 작동한다. 코드가
'database' 실체를 막는 담장을 세웠다면, 임시로 가짜 코드를 세우는 것이
점점 어려워질 뿐만 아니라, 심지어 불가능할 수도 있다 (물론 파이썬에서
완전히 불가능한 것은 거의 없다). 테스트 주도적 개발은 거대한 싱글톤을
아주 빨리 포기하게 만든다.

그럼에도 불구하고, 필요하다면 파이썬에서 싱글턴을 쉽게 구현할 수 있다:

```python
>>> class Singleton(object):
        _instance = None
        def __new__(cls, *args, **kwargs):
            if not cls._instance:
                cls._instance = super(Singleton, cls).__new__(
                                   cls, *args, **kwargs)
            return cls._instance


>>> class C(Singleton):
        pass


>>> class D(Singleton):
        pass


>>> c = C()
>>> d = C()
>>> id(c), id(d)
(10049912, 10049912)
>>> e = D()
>>> f = D()
>>> id(e)
10113672
>>> id(f)
10113672
>>> g = C()
>>> id(g)
10049912
>>> 
```

이 예제는 새로운 믹스인 클래스 <span
class="interpreted">Singleton</span>을 생성한다. 새 하위클래스마다 한
개의 실체를 만들고 그 이후로는 그 실체를 돌려준다. C나 D를 계속해서 하위
클래스화하는 것이 혼란스러울 수 있지만, 반환되는 유형을 점검하면 눈에
띠는 에러를 피할 수 있다.

다른 곳에서 지적한 바에 의하면 사람들이 싱글턴을 사용하는 이유는 싱글턴
실체가 필요해서가 아니라는 것이다. 그 보다는 공유 상태가 필요해서이다. 이 때문에
파이썬 프로그래머는 보르그(Borg)라는 이름으로 진짜 파이썬 패턴을
고안하게 되었다.

보르그 패턴은 여러 클래스 실체를 허용하지만, 실체들 사이에 상태를
공유한다. 그래서 최종 사용자는 따로 구별할 수가 없다. 다음은 파이썬
요리책에서 가져온 보르그 예제이다

```python
class Borg:
    __shared_state = {}
    def __init__(self):
        self.__dict__ = self.__shared_state
    # 그리고 클래스에서 원하는 무엇이든 여기에 둔다 -- 이게 다이다!
```

패턴으로서 보르그의 문제점은 '새 스타일'의 클래스를 작성하기 시작하면
드러난다. \_\_dict\_\_ 속성은 언제나 할당가능한 것은 아니지만,
안타깝게도 \_\_slots\_\_ 안에 정의된 속성들은 단순하게 공유가
불가능하다. 보르그는 멋지지만, 여러분의 친구는 아니다.

위에 제시한 것보다 훨씬 쉽게 구현한 싱글턴이 또 있다. 사실, 파이썬
프로그래머라면 누구나 이 방법을 사용한다. 물론 대다수는 그 안에 사용된
싱글턴 패턴을 인지하지 못하겠지만 말이다.

다음 파일을 연구해 보자 (singleton.py):

```python
"""이 모듈은 싱글턴 패턴을 구현한다"""
```

간단하다. 그렇지 않은가? <span class="interpreted">import</span>
서술문을 사용하여 싱글턴 객체에 접근할 수 있다. 이 객체의 속성에
접근하고 설정할 수 있다. 분명한 것은 실제 삶에서 몇 가지 메쏘드가
필요하거나, 최초의 값이 좀 필요할 수도 있다. 그렇다면 그것들을 모듈 안에
넣어두자.

파이썬 모듈은 싱글턴 실체이다: 파이썬이 디자인 패턴을 취하는 사례이며
언어의 핵심적인 부분이다.


## 구조적 패턴(Structural Patterns)

## 초경량(Flyweight)
### 의도
> 수 많은 섬세한 객체들을 효율적으로 지원하기 위해 공유를 사용한다.

이 패턴은 *싱글턴* 패턴에 관련된다. 싱글턴에서는 객체에서 정확하게
하나의 실체만 원했는데, 종종 아주 많은 실체가 필요하지만 그 모든 객체가
구별될 필요는 없는 경우가 있다.

예를 들어, 주식 시장 가격을 처리하는 어플리케이션을 생각해 보자.
포트폴리오가 여러가지 있으며, 각 포트폴리오는 수 많은 주식 투자 내역서가
아래에 깔려 있다. 각 내역서에는 데이터가 들어 있지만 (현재 시세 그리고
최근 시세, 일중 상하한가 등등.), 이 데이터는 어디에서나 사용되는 공통
데이터이다. 각 포트 폴리오는 투자내역서에 보유한 자산과 매수한 날짜
그리고 매수한 가격을 기록한다.

여기에서 한 가지 선택이 있다. 포트폴리오 종속적 데이터는 각 내역서 안에
저장할 수 있지만, 그러면 내역서 실체는 포트폴리오 사이에 공유할 수가
없다. 데이터를 포트폴리오의 일부에 저장하면 공유 내역 클래스를 가질 수
있다:

```python
# 회계 내역서를 모델링한다.
# 내역(instrument) 클래스는 회계 내역서를 대표하며,
# 어떤 네트워크 소스로부터 정보를 갱신한다.
#
# 주의. 일 예로, 이 코드는 쓰레드에 안전하지 않다.
# 실제 코드라면 데이터를 비동기적으로 갱신해야 한다.
#
import weakref

class Instrument(object):
    _InstrumentPool = weakref.WeakValueDictionary()

    def __new__(cls, name):
        '''Instrument(name)
        새로 투자내역서 객체를 만들거나, 기존의 객체를 돌려준다'''
        obj = Instrument._InstrumentPool.get(name, None)

        if not obj:
            print "new",name
            obj = object.__new__(cls)
            Instrument._InstrumentPool[name] = obj

        return obj

    def __init__(self, name):
        '''완전하게 객체를 구성한다'''
        self.name = name
        print "New instrument @%04x, %s" % (id(self), name)

        # ... 내역서를 데이터소스에 접속시킨다 ...

import unittest

class InstrumentTests(unittest.TestCase):
    def testInstrument(self):
        ibm1 = Instrument("IBM")
        ms = Instrument("MS")
        ibm2 = Instrument("IBM")
        self.assertEquals(id(ibm1), id(ibm2))
        self.assertNotEquals(id(ibm1), id(ms))

        self.assertEquals(2, len(Instrument._InstrumentPool),
            "Total instruments allocated")

        # 이 부분은 CPython 메모리 할당이라고 간주한다:
        del(ibm1)
        del(ibm2)
        self.assertEquals(1, len(Instrument._InstrumentPool),
            "Total instruments allocated")

if __name__=='__main__':
    unittest.main()
```

이 코드는 적절한 매개변수로 생성되면 상태를 공유하는 객체를 간단하게
생성하는 방법을 보여준다. 두개의 <span class="interpreted">IBM</span>
객체가 실제로는 하나의 객체이다. 그러나 <span
class="interpreted">MS</span> 객체는 따로 떨어져 있다.

이 코드를 'print' 서술문으로 실행해 보면 오직 두 개의 객체만
만들었음에도 \_\_init\_\_ 구성자가 모두 세 번 호출된다는 사실을 볼 수
있다. 이는 유용할 수 있다. 예를 들어, <span
class="interpreted">Instrument</span> 클래스가 몇 줄 위에 있는 <span
class="interpreted">Portfolio</span> 클래스에 사건을 생성하기를 바란다면
다음과 같이 하면 된다.

```python
D:\accu>instrument.py
new IBM
New instrument @7bd240, IBM
new MS
New instrument @7a80b8, MS
New instrument @7bd240, IBM
.
----------------------------------------------------------------------
Ran 1 tests in 0.020s

OK
```

<span class="interpreted">weakref</span> 사전은 특정한 내역이 더 이상
사용되지 않으면 그 내역이 저장된 곳이 자동으로 해제된다는 것을 보증한다.
실제 행위는 약간 다를 수 있다. 예를 들어 자바로 구현하면 실제로는 쓰레기
수거 주기에 이르기 전까지는 사용되지 않는 내역을 풀어주지 않을 것이다.

## 행위 패턴(Behavioural Patterns)

## 관찰자(Observer)

### 의도

> 객체 사이에 일대다 의존성을 정의한다. 그래서 객체의 상태가 바뀌면
> 관련된 모든 객체에 이 사실이 고지되고 자동으로 갱신된다.

관찰자(Observer)는 본인이 자주 사용하는 패턴이다. 그러나 최근까지도
파이썬 구현에 완전히 만족하지 못하고 있다.

주체(*subject*)와 관찰자(*observer*) 두 개의 클래스가 있다. 관찰자는
자신을 주체에 등록하고 주체에서 데이터가 바뀌면 고지 역호출을 받는다.
GoF에서 이 패턴은 약간 제한이 있다는 사실을 발견하였다. 왜냐하면 그들이
기술하는 시스템에서는 주체 클래스에 일반적인 'notify' 메쏘드가 있어서
모든 것에 사용되기 때문이다 (물론 *aspects*를 이용하여 더 선택적인
이벤트를 만들어내는 메커니즘을 제안한다).

여기에서 기술된 구현은 더 일반적인 더 명료한 형태의 사건 생성을 사용하며
마이크로소프트사의 .Net 작업틀로부터 빌려온 사건 처리 구조에 (느슨하게)
기반한다. 의도적인 사용 사례를 들어서 설명하는게 좋겠다.

실제 예제는 GoF 책에서 발췌하였다. 물론 그 구현은 아니다. <span
class="interpreted">ClockTimer</span>는 일일 시간을 저장하고 유지하는
주체(subject)이다. 그의 관찰자들에게 매 초마다 통보한다. <span
class="interpreted">ClockTimer</span>는 시와 분 그리고 초와 같은 시간
단위를 열람하는 인터페이스를 제공한다:

```python
class ClockTimer:
        def GetHour(self):
                return self._hour
        def GetMinute(self):
                return self._minute
        def GetSecond(self):
                return self._second

        TickEvent = Event()
        def OnTick(self):
                ClockTimer.TickEvent.call(self, self.GetHour(),
                        self.GetMinute(), self.GetSecond())

        def Tick(self):
                # 내부의 시간-유지 상태를 갱신한다.
                # ...
                self.OnTick()
```

<span class="interpreted">Tick</span> 메쏘드는 내부의 타이머에 의해
주기적인 간격으로 호출된다. 내부 상태를 갱신하고 OnTick 메쏘드를
호출해서 그 변화를 관찰자들에게 고지한다.

OnTick 메쏘드는 적절하게 보이는 매개변수를 가지고 사건을 촉발시킨다.
이런 식으로 사건을 간접적으로 촉발시키면 하위클래스들이 사건 처리를
오버라이드할 수 있다.

비록 이 클래스에는 <span class="interpreted">Event</span> 하나만 있지만,
실제 구현에서는 얼마든지 다양하게 많은 사건을 정의해도 된다.

이제, 시간을 보여주는 <span class="interpreted">DigitalClock</span>
클래스를 정의할 수 있다:

```python
class DigitalClock(Widget):
        def __init__(self, clockTimer):
                self.__subject = clockTimer
                clockTimer.TickEvent += self.Update

        def close(self):
                self.__subject.TickEvent -= self.Update

        def Update(self, subject, hour, min, sec):
                self.displayedTime = (hour, min, sec)
                self.Draw()

        def Draw(self):
                # 디지털 시계를 그린다
```

주의: 명시적으로 close 메쏘드를 이 객체에 호출할 필요가 있다. 왜냐하면
순환 참조가 있기 때문이다 (ClockTimer에는 DigitalClock 실체의
UpdateMethod를 가리키는 참조점이 담겨 있고, DigitalClock 실체에는
clockTimer를 가리키는 참조점이 저장되어 있다). 이 때문에 \_\_del\_\_
메쏘드가 절대로 호출되지 않을 것이다. 이게 문제가 되는 상황이라면, 한
가지 해결책이 있다. WeakMethod 클래스를 정의해서 묶인 메쏘드를
흉내내면서도 오직 약한 참조만 보유하는 것이다.

이를 작동시키는 방법은 다음과 같다:

```python
class Delegate:
    '''메쏘드와 함수 리스트를 처리한다.
    사용법:
        d = Delegate()
        d += function    # 함수를 삭제 리스트의 끝에 추가한다.
        d(*args, **kw)   # 모든 함수를 호출하고, 그 결과를 리스트에 담아 돌려준다.
        d -= function    # 마지막으로 일치한 함수를 리스트에서 제거한다.
        d -= object      # 한 객체의 모든 메쏘드를 리스트에서 제거한다.
    '''
    def __init__(self):
        self.__delegates = []

    def __iadd__(self, callback):
        self.__delegates.append(callback)
        return self

    def __isub__(self, callback):
        # 역호출이 클래스 실체라면,
        # 그 실체에 대한 모든 역호출을 제거한다.
        self.__delegates = [ cb
            for cb in self.__delegates
                if getattr(cb, 'im_self', None) != callback]

        # 역호출이 호출가능객체라면, 
        # 가장 마지막에 일치한 역호출을 제거한다.
        if callable(callback):
            for i in range(len(self.__delegates)-1, -1, -1):
                if self.__delegates[i] == callback:
                    del self.__delegates[i]
                    return self
        return self

    def __call__(self, *args, **kw):
        return [ callback(*args, **kw)
            for callback in self.__delegates]
```

위임(delegate) 클래스는 역호출 리스트를 유지한다 (그래서 하나의 주체에
여러 개의 관찰자를 가질 수 있다). 위임 클래스에서 지원하는 유일한 연산은
delegate에 함수를 추가하거나 함수를 제거하거나 또는 모든 함수를 호출하는
것이다. 역호출 함수들은 순서대로 저장되고 (그래서 제일 먼저 추가되면
제일 먼저 호출된다) 나중에 들어온 것이 먼저 제거된다.

Delegate 실체를 \_\_init\_\_에서 만들 수 있지만, 잠재적으로 이렇게 하면
결점이 있다. 많은 사건을 촉발시키는 클래스를 만들었지만, 사건은 거의
대부분 사용되지 않은 채로 흘러간다면, 아무 이유 없이 수 많은 위임
실체들을 만들어야 한다. 아래의 Event 클래스는 오직 필요할 때만 위임
실체들을 만든다. 주체 클래스에 사용된 간접 호출이 이를 지원한다:

```python
class Event(property):
    '''클래스 사건 고지자 
    사용법:
        class C:
            TheEvent = Event()
            def OnTheEvent(self):
                self.TheEvent(self, context)

        instance = C()
        instance.TheEvent += callback
        instance.OnTheEvent()
        instance.TheEvent -= callback
    '''
    def __init__(self):
        self.attrName = attrName = "__Event_" + str(id(self))
        def getEvent(subject):
            if not hasattr(subject, attrName): 
                setattr(subject, attrName, Delegate())
            return getattr(subject, attrName)
        super(Event, self).__init__(getEvent)

    def call(self, subject, *args, **kw):
        if hasattr(subject, self.attrName):
            getattr(subject, self.attrName)(subject, *args, **kw)
```

ClockTimer 클래스 안에서 <span
class="interpreted">instance.TickEvent</span>를 참조하면 Delegate가
생성된다. Delegate는 <span
class="interpreted">self.TickEvent(args)</span>를 사용하여 호출될 수
있지만, 이렇게 하면 언제나 생성될 것이다. <span
class="interpreted">ClockTimer.TickEvent.call(args)</span>를 사용하는
대신에 호출하면 불필요하게 이렇게 하지 않아도 된다.

## 반복자(Iterators)와 발생자(Generators)

### 의도

> 집합 객체의 원소에 그 밑에 깔린 표현을 노출시키지 않고 순차적으로
> 접근할 방법을 제공한다.

반복자 패턴은 파이썬이 완전히 받아들인 패턴이다. 물론 GoF가 제안한
것보다 약간 더 간단한 형태이다. GoF 반복자는 다음의 메쏘드를 가진다:

```python
First()
Next()
IsDone()
CurrentItem()
```

파이썬의 *반복자* 인터페이스는 다음의 메쏘드가 정의되어 있어야 한다:

```python
__iter__()      자신을 돌려준다.
next()          다음 값을 돌려주거나 StopIteration 예외를 던진다.
```

게다가, 어떤 객체든지 반복을 지원하지만 그 자체로는 *iterable*
인터페이스를 지원하는 반복자가 아니라면, 즉 그 객체는 적절한 유형의
반복자 객체를 새로 만드는 <span
class="interpreted">\_\_iter\_\_()</span> 메쏘드가 있다. 다양한 유형의
반복자를 만들기 위하여 추가로 메쏘드가 더 있을 수 있지만, 파이썬에서는
더 이상 요구하지 않는다.

파이썬에서 큰 차이점은 반복자가 재설정이 불가능하다는 것이다. 파이썬에서
연속열을 여러 번 반복하고 싶다면, 그냥 여러 반복자를 만들면 된다.

다음은 파이썬의 반복자를 사용하여 이진 트리 구조를 순회하는 간단한
예이다. 이는 트리를 방문하는 일이 관련된다. 각 값이 순서대로 반환되기
때문에 어느 노드가 처리되었는지 기억해야 한다. 그러고도 그 노드를
주시해야 한다. 반복자가 결과를 돌려주는 것을 지연시킬 필요가 없다면
코드를 재귀적으로 작성할 수도 있다. 그러나 손수 스택을 처리하는 것은
파이썬에서 정말 쉽다:

```python
class Node(object):
    class NodeIterator:
        def __init__(self, node):
            self.stack = [node]

        def __iter__(self):
            return self

        def next(self):
            if not self.stack:
                raise StopIteration

            node = self.stack.pop(-1)
            while isinstance(node, Node):
                self.stack.append(node.right)
                node = node.left
            return node

    def __init__(self, left, right):
        self.left = left
        self.right = right

    def __iter__(self):
        return Node.NodeIterator(self)

import unittest
class NodeTests(unittest.TestCase):
    def testNode(self):
        tree = Node(
                  Node('a', 'b'),
                  Node(
                      Node('c', 'd'),
                      'e'))

        self.assertEquals(['a', 'b', 'c', 'd', 'e'], list(iter(tree)))

if __name__=='__main__':
    unittest.main()
```

이 코드의 핵심 문제는 왜 작동하는지 즉시 드러나지 않는다는 것이다. 각
가지에서 오른쪽 잎을 돌려주기 전에 먼저 왼쪽 잎을 돌려주고 싶은데, 왜
오른쪽 노드를 먼저 처리해야 하는가? 왜 (눈에 보이게) 오른쪽 노드를
돌려주지 않는가?

반복자는 보통 이렇게 거꾸로 생각하는 방식이 관련된다. 먼저 나중에
반복자를 재개할 수 있도록 상태를 유지한다. 그러면 이 반복에서 무엇을
돌려줄지만 걱정하면 된다.

물론, 유닛 테스트 때문에 이 코드는 정상적으로 사용하지 못한다. 반복을
평범한 리스트로 변환하여 모든 잎 노드가 올바른 순서대로 다시 돌아왔는지
검검할 경우, 코드는 보통 다음과 같을 것이다:

```python
for leaf in tree:
        ... 잎 노드로 일을 처리한다 ...
```
### 발생자(Generators)

파이썬 2.2이후로 반복자를 더 쉽게 만들 수 있도록 특별한 구문이
도입되었다. 발생자는 객체를 반복하는 과정을 완전히 다르게 생각하도록
만든다. 반복자 객체는 오직 반복의 상태를 유지하기 위해서 존재한다. 이는
보통 일종의 회돌이 지표이지만, 어떤 경우는 데이터 구조가 훨씬 더
복잡해질 수 있다. 예를 들어 같은 이진 트리 구조로 발생자를 사용하면
다음과 같이 된다:

```python
from __future__ import generators

class Node(object):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def __iter__(self):
        if (isinstance(self.left, Node)):
            for n in self.left:
                yield n
        else:
            yield self.left

        if (isinstance(self.right, Node)):
            for n in self.right:
                yield n
        else:
            yield self.right

import unittest
class NodeTests(unittest.TestCase):
    def testNode(self):
        tree = Node(
                  Node('a', 'b'),
                  Node(
                      Node('c', 'd'),
                      'e'))

        self.assertEquals(['a', 'b', 'c', 'd', 'e'], list(iter(tree)))

if __name__=='__main__':
    unittest.main()
```

코드는 실제로 더 짧지는 않지만, 트리를 거니는 것이 이제 더 확실하게
보인다. 왼쪽이 또다른 노드라면 각 리프 노드를 차례로 양보한다. 그렇지
않으면 그냥 그 리프 노드를 양보한다. 다음으로 오른쪽 노드에서 잎 노드를
차례로 양보하거나 그것이 우리가 가진 모든 것이라면 그 잎을 양보하는 일을
반복한다. 발생자가 없다면 '확실한' 재귀 구현을 포기하지 않을 수 없다.
그러나 발생자는 결과가 만들어질 때까지 실행을 지연시킬 수 있다.

발생자의 다른 혜택은 또다른 객체 유형이 필요없다는 것이다. (놀랍게도)
알고보면 발생자를 사용하는 것이 단순히 파이썬 함수를 반복적으로 호출하는
것보다 실제로 훨씬 더 빠르다.


### itertools 모듈

반복자와 발생자는 조합해서 파이프라인을 형성할 수도 있다. 앞으로 나올
파이썬 2.3에는 다양한 반복자를 가진 새로운 내장 모듈이 포함된다. 이
반복자들은 오직 반환될 경우에만 결과를 생성하기 때문에 잠재적으로 무한
리스트와 작업하는 방법을 제공한다:

> <span class="interpreted">count(\[n\])</span> 
> :   n부터 시작하여 연속적으로 정수를 돌려준다 <span
>     class="interpreted">n</span>
>
> <span class="interpreted">ifilter(predicate, iterable)</span> 
> :   <span class="interpreted">iterable</span>의 원소 <span
>     class="interpreted">x</span>를 <span
>     class="interpreted">predicate(x)</span>이 참으로 평가한 원소를
>     모두 돌려준다.
>
> <span class="interpreted">imap(function, \*iterables)</span> 
> :   <span class="interpreted">map()</span>과 비슷하지만, 리스트가
>     아니라 반복자를 돌려준다.
>
> <span class="interpreted">izip(\*iterables)</span> 
> :   <span class="interpreted">zip()</span>과 비슷하지만, 반복자를
>     돌려준다는 점이 다르다.
>
> <span class="interpreted">repeat(obj)</span> 
> :   <span class="interpreted">obj</span>를 무한대로 양보하는
>     반복자를 돌려준다.
>
> <span class="interpreted">times(n, \[object\])</span> 
> :   <span class="interpreted">object</span>를 총 <span
>     class="interpreted">n</span> 개 돌려준다.
>
그리고 기타 등등 많다.

너무 이르기 때문에 이렇게 새롭게 반복자를 지원하는 것에 대하여 파이썬
공동체가 얼마나 환영할지는 아직 알수 없다. 지금까지 (본인처럼) 거의 모든
문제를 반복자를 사용할 기회로 보는 사람들, 그리고 잘 처리하는 사람들이
있기 때문이다.

## 명령 분배 패턴(Command Dispatch Pattern)

GoF는 명령 패턴을 요청이 객체로 캡슐화되어 있을 경우라고 기술한다. 예전
1997년에 귀도 반 로섬(Guido van Rossum)[\[GvR\]](#gvr){#id9
.citation-reference}은 비슷하게 기능을 수행하지만, 파이썬과 펄 &C와 같은
동적 언어에만 있는 패턴을 식별하였고 거기에 명령어 분배(*Command
Dispatch*) 패턴이라는 이름을 주었다.

슬프게도, 파이썬 프로그램에서 일반적으로 이 패턴을 많이 사용하고
있음에도 불구하고 그 이름은 거의 잊혀졌다. 이를 패턴으로 인지하는
것조차도 망각된 듯하다.

바깥의 소스로부터 전송된 수 많은 다양한 명령어들을 실행할 필요가 있는
클래스가 있다고 해보자. 예를 들어 'get()'과 'put()'같은 명령어들을
말이다. 이를 처리하는 다양한 방법이 있다. 예를 들어:

```python
if command == 'get':
    get()
elif command == 'put':
    put()
else:
    error()
```

또는:

```python
dispatch_table = {
    'get': get,
    'put': put,
}

# 명령 분배:
if dispatch_table.has_key(command):
    func = dispatch_table[command]
    func()
else:
    error()
```

그러나 파이썬 프로그래머가 어느 곳에서나 사용하는 방법은 다음과 같다:

```python
class Dispatcher:

    def do_get(self): ...

    def do_put(self): ...

    def error(self): ...

    def dispatch(self, command):
        mname = 'do_' + command
        if hasattr(self, mname):
            method = getattr(self, mname)
            method()
        else:
            self.error()
```

귀도(Guido)가 언급했듯이: *나는 이 접근법이 아주 우아하다고 생각하며 그
동안 많이 사용했다는 것을 발견하였다.*

이 패턴이 파이썬 라이브러리 전반에 걸쳐서 사용된 것을 볼 수 있다.
여기에는 BaseHTTPServer, cmd, pydoc, repr, sgmllib, SimpleXMLRPCServer,
urllib, distutils 등등이 모두 포함된다.

## 파이썬의 작은 패턴들

파이썬에 다른 많은 공통적인 관용구가 있다. (관점에 따라 다르지만) 확실히
패턴이라고 부를만하다. 물론 디자인 패턴에 포함시키기에는 너무 작지만
말이다. 그렇지만, 완전히 성장한 *디자인 패턴*으로 간주하지 않더라도,
여기에 나열한 작은 패턴들은 파이썬으로 소프트웨어를 작성하면 생각하는
방법이 얼마나 영향을 받는지 보여준다.

**DSU**

> 장식하고, 정렬한 다음, 장식을 걷어낸다. 파이썬에서 가장 어떤 것이든
> 가장 단순하게 *정렬하는 방법*이다. 객체에 비교 함수를 제공하는 대신에,
> 그냥 객체 리스트를 내장 함수를 이용하여 원하는 순서로 정렬된 리스트로
> 교체하면 된다..
>
> 예를 들어, 현재 디렉토리의 파일 리스트를 '최근 수정 시간'을 기준으로
> 정렬하려면:
>
> > ``` {.doctest-block}
> > >>> files = glob.glob('*')
> > >>> decorated = [ (os.stat(file).st_mtime, file) for file in files ]
> > >>> decorated.sort()
> > >>> files = [ file for (time, file) in decorated ]
> > >>> print files
> > ['py.ico', 'pyc.ico', 'pycon.ico', 'default.tag',
> >      ... (long list of files here) ...
> > 'Doc', 'Tools', 'INSTALL.LOG', 'win32', 'win32com', 'Lib']
> > >>> 
> > ```

**지능형 리스트**

> 파이썬 2.0에 도입된 지능형 리스트로 일련의 명령 대신에 기술함으로써
> 새로운 리스트를 구축할 수 있다. 지능형 리스트는 여러분이 작성할 것에
> 관하여 다른 방식으로 생각하게 해 준다. 이는 디자인 패턴의 중요한
> 특징이다. 물론 지능형 리스트 그 자체는 너무 작아서 주요 패턴이 되지
> 못하겠지만 말이다.

**묶인 메쏘드**

> 함수와 메쏘드가 제일 클래스 메쏘드가 아닌 다른 언어로부터 파이썬으로
> 왔다면 확실하게 정신적 구조를 바꿀 필요가 있다. 일반적인 파이썬
> 테크닉은 묶인 메쏘드를 이리저리 건네거나 미세한-최적화에 사용하는
> 것이다. 예를 들어.
>
> ```python
> result = []
> save = result.append
> while somecondition:
>     save(calculateValue())
> ```

**리스트와 터플 그리고 사전**

> 파이썬에서 무엇이든 객체이다. 그러나 무엇이나 사용자-정의 객체는
> 아니다. 파이썬 프로그래머는 내장 유형의 관점에서 생각하는 것이
> 중요하다. 부분적으로 내장 유형이 더 빠르고 메모리를 덜 잡아 먹기
> 때문이지만, 또다른 보너스가 있다. 맞춤재단된 클래스 대신에 어느 곳에나
> 좀 원시적이지만 친숙한 유형을 사용하면 코드를 이해하기가 더 쉽다.

**스크립트로 사용되는 모듈**

> 파이썬에서 모든 모듈은 스크립트로 작성하자 (그리고 그 반대로, 모든
> 스크립트는 모듈로 작성하자). 스크립트의 메인 코드를 <span
> class="interpreted">if \_\_name\_\_=='\_\_main\_\_'</span>로 시작하는
> 블록 안에 넣으면, 그 스크립트 안에 있는 클래스나 함수를 모두 다른
> 프로그램에서 재사용할 수 있다. 마찬가지로 같은 블록을 모듈에 추가하면
> 그 프로그램의 맥락 밖에서 그 모듈의 사용법을 테스트할 수 있다.

## 맺는 말
디자인 패턴은 아주 유용한 도구이다. 디자인에 관하여 생각하게 해주는
언어로서 새로운 맥락에서 친숙한 문제들을 인지할 수 있다. 패턴을 인지하면
즉시 그 패턴을 좋든 나쁘든 이전의 경험에 관련지을 수 있다.

어떤 패턴은 프로그래밍 언어 사이에 거의 범용적이지만 또 어떤 패턴은
특정한 언어의 특징이나 심지어 구문에 종속적이다. 한 프로그래밍 언어에
유창하게 된다는 것은 단순히 그 구문을 이해한다는 의미뿐만 아니라 다른
개발자의 공통적인 사고의 패턴을 채용한다는 뜻이기도 하다.

한 언어 안에서조차 패턴의 구현은 언어가 진화함에 따라 변화한다. 이
논고에서 보여준 예제들은 새 스타일의 클래스와 약함 참조 그리고 특성들을
사용한다. 모두 상대적으로 최근에 파이썬에 추가된 특징이다.

## 참조

* Design Patterns, Elements of Reusable Object-Oriented Software; Erich Gamma, Richard Helm, Ralph Johnson, Jon Vlissides; 1995.
* Five Easy Pieces: Simple Python Non-Patterns; Alex Martelli, AB Strakt. <http://www.aleax.it/Python/5ep.html>
* Design Patterns in Python; Vespe Savikko, Tampere University of Technology. <http://www.python.org/workshops/1997-10/proceedings/savikko.html>
* Command Dispatch Pattern; Guido van Rossum; Python Pattern-SIG mailing list, May 1997
* Adventures in C\#: Some Things We Ought to Do; Ron Jeffries; Jan 2003 <http://www.xprogramming.com/xpmag/acsMusings.htm> 




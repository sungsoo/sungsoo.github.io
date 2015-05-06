---
layout: post
title: Dependency Injection 
date: 2015-05-06
categories: [computer science]
tags: [design patterns]

---

# Dependency Injection

의존성 주입(Dependency Injection, DI)은 프로그래밍에서 구성요소간의 의존 관계가 소스코드 내부가 아닌 외부의 설정파일 등을 통해 정의되게 하는 디자인 패턴 중의 하나이다.

## 의존성 주입의 이점

* 의존 관계 설정이 컴파일시가 아닌 실행시에 이루어져 모듈들간의 결합도 를 낮출 수 있다.
* 코드 재사용을 높여서 작성된 모듈을 여러 곳에서 소스코드의 수정 없이 사용할 수 있다.
* 모의 객체 등을 이용한 단위 테스트의 편의성을 높여준다.


[![](http://sungsoo.github.com/images/injector.gif)](http://sungsoo.github.com/images/injector.gif)

## 적용 유형

마틴 파울러는 다음과 같은 세 가지의 의존성 주입 패턴을 제시하였다. 

* **생성자 주입** : 필요한 의존성을 모두 포함하는 클래스의 생성자를 만들고 그 생성자를 통해 의존성을 주입한다.
* **세터(Setter)를 통한 주입** : 의존성을 입력받는 세터(Setter) 메소드를 만들고 이를 통해 의존성을 주입한다.
* **인터페이스(Interface)를 통한 주입** : 의존성을 주입하는 함수를 포함한 인터페이스를 작성하고 이 인터페이스를 구현하도록 함으로써 실행시에 이를 통하여 의존성을 주입한다.


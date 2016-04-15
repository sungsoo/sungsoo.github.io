---
layout: post
title: Thread Local Storage
date: 2016-04-14
categories: [computer science]
tags: [parallel computing]

---

## Article Source

* Title: [Thread Local Storage](http://sweeper.egloos.com/1985738)

---

# Thread Local Storage (TLS)

## 1. 요약

TLS(Thread Local Storage)는 스레드 별로 고유한 저장공간을 가질 수 있는
방법이다.


## 2. 본문

각각의 스레드는 고유한 스택을 갖기 때문에 스택 변수(지역 변수)는 스레드
별로 고유하다. 예를 들어 각각의 스레드가 같은 함수를 실행한다고 해도 그
함수에서 정의된 지역 변수는 실제로 서로 다른 메모리 공간에 위치한다는
의미이다. 그러나 정적 변수와 전역 변수의 경우에는 프로세스 내의 모든
스레드에 의해서 공유된다.

위의 특성에 의거, **TLS는 정적, 전역 변수를 각각의 스레드에게 독립적으로
만들어 주고 싶을 때 사용**하는 것이다. 다시 말해, 분명히 같은
문장(context)을 실행하고 있지만 실제로는 스레드 별로 다른 주소 공간을
상대로 작업하는 것이다.

TLS를 사용하는 방법은 2가지가 있는데, 한 가지는 API에서 지원해주는
방식을 사용하는 것이고, 다른 하나는 compiler에서 지원하는 방식을
사용하는 것이다.

우선은 간단하면서도 신기한 두 번째 방법부터 살펴보면...

다음과 같이 선언된 전역변수가 있다고 가정해 보면...

```c
int g_nWindows;
```

이 변수는 모든 스레드에 의해서 공유된다. 그게 싫다면, 그게 싫다면 다음과
같이 고쳐주시면 된다.


## 정적 TLS

**__declspec(thread)** int g_nWindows;

이제 이 변수는 모든 스레드에게 고유한(private) 변수가 되었다.

다음으로는 API를 사용한 방법을 알아 보자. 



## 동적 TLS

DWORD dwIamIndex = **::TlsAlloc**();  // 공간 확보 (TlsAlloc은 인덱스를
반환하기 전, 해당 블록을 0으로 초기화시킨다)
**::TlsSetValue**(dwIamIndex, pMyData);  // 데이터 저장
BYTE* pGiveMe = (BYTE*)**::TlsGetValue**(dwIamIndex);  // 데이터 얻기
**::TlsFree**(dwIamIndex);  // 공간 해제

한 눈에 알 수 있지만, storage-class modifier(__declspec(thread))를
사용하는 방식이 훨씬 사용하기 쉽다. 

하지만, 정적 TLS가 동작하려면 다소 비용을 물어야 한다.

애플리케이션이 로드되고 시스템이 실행 파일에서 .tls 섹션을 발견하면,
모든 정적 TLS 변수를 저장할 수 있을만큼의 충분한 메모리 블록을 할당한다.

애플리케이션 내에서 이러한 변수 중 하나를 참조하게 되면 앞서 할당하였던
메모리 블록 내의 특정 위치로 참조 위치가 변경된다.

결국 컴파일러는 정적 TLS 변수를 참조하기 위한 추가적인 코드를 생성해야
한다.

이로 인해 애플리케이션 크기가 조금 더 커지고, 속도는 조금 더 느려진다.

x86 CPU에서는 하나의 정적 TLS 변수를 참조할 때마다 세 개의 기계어
명렁어가 추가된다.

(디스어셈 디버깅을 해보면 확실히 어셈 명령어가 많다)


Storage-class modifier를 사용하는 방식에는 약간의 제약이 있는데,
동적으로 로드되는 DLL에서는 사용될 수 없다. 

동적으로 로드되는 DLL 에서는 API 타입을 사용하는 수 밖에 없는데, 왜
그런지는 아래 3. 참고 챕터를 보자.

(이거 Windows VISTA 이후 문제가 되지 않는다)





## 3. 참고-1


### ​1) What is TLS?
[http://msdn.microsoft.com/en-us/library/ms686749(v=vs.85).aspx](http://msdn.microsoft.com/en-us/library/ms686749(v=vs.85).aspx)



### ​2) How to use TLS?
[http://msdn.microsoft.com/en-us/library/ms686991(v=vs.85).aspx](http://msdn.microsoft.com/en-us/library/ms686991(v=vs.85).aspx)



### ​3) How to use TLS in a DLL?
[http://msdn.microsoft.com/en-us/library/ms686997(v=vs.85).aspx](http://msdn.microsoft.com/en-us/library/ms686997(v=vs.85).aspx)


## 3. 참고-2 (예전 방식, 지금은 문제없다)

Win32 Network Programming – Addison Wesley

위의 내용중에 Dynamic Loaded DLL 에서 Static TLS technic 을 사용하면
안된다고 했는데 그에 대한 설명이 부족한것 같아서 몇 자 보충해본다.

우선 API를 사용하는 방식이 dynamic 한 방법이고, __declspec(thread)를
사용하는 방법이 static 한 방법이라고 생각할 수
있는데, __declspec(thread)를 사용하여 선언한 변수는 어디에서 관리 되는
것일까?

우선 static TLS 방식을 사용하면 컴파일러는 자신만의 '.tls' 라는 메모리
section 에 선언된 변수를 등록시킨다. 물론 이런 각각의 '.tls' section을
다루는 최상위 '.tls' section 이 따로 있지. 또한 하나의 프로그램이 또
다른 thread를 생성할 경우, 자신이 가지고 있는 '.tls' section 을 자식
thread 에 복사하는 방법을 사용하고 있다. 바로 이점 때문에 문제가
발생하는 것 같다. 겉에서 보기에는 여러가지 thread 가 '.tls' section 을
공유하는 것처럼 보이지만, 실제로는 내부에서 복사하는 방식을 사용하고
있기 때문이다.

1. A 라는 프로그램이 있고 자신만의 '.tls' section을 가지고 있다.
2. A가 5개의 thread를 생성하면, A에서 사용하던 '.tls' section은 모두
6개가 된다. (A + 5 threads)
3. A가 static TLS를 가지고 있는 DLL을 LoadLibrary() 하여 load 한다.
4. 그러면 A는 자신의 '.tls' section을 늘려서 새로운 DLL이 가지고 있는
static TLS를 추가해 주어야 한다.
5. 물론 A는 자신의 '.tls' section 뿐 아니라, 5개의 자식 thread의  '.tls'
section 까지 늘려주어야 한다.
6. 그리고 A가 DLL을 FreeLibrary() 시켜 메모리로부터 제거하였다.

위의 1~6까지 진행이 되면 A는 자신의 '.tls' section 에서 필요없는 DLL의
'.tls' section 을 제거해야겠지? Section 영역도 줄여야겠지? 물론 이와
같은 작업을 5개의 자식 thread의 '.tls' section 에도 해주어야 한다. 이
모든 작업을 system에서 하게 되면, 여러 가지 문제가 발생하게 된다.
(초기화가 제대로 이루어 지지 않는 문제 혹은 access violation 등등...)

결국 이런 이유로 동적으로 DLL 을 load 하기 위해서 만들어진 DLL은 static
TLS 를 사용하는 대신, DLL 스스로가 자신의 TLS section 을 관리할 수 있는
dynamic TLS 방식을 사용하는 것이 좋다.


## 4. 참고-3


위 참고-2의 Win32 Network Programming는 1996년에 씌여진 책이다.

Windows Vista 이후 정적 TLS를 DLL과 사용하여도 아무런 문제가 없어졌다.

정적 TLS + DLL 암시적 링킹이든, 명시적 링킹이든 정적 TLS를 사용하는데
아무런 제약이 없다.



시스템이 애플리케이션을 로드하면 가장 먼저 애플리케이션의 .tls 섹션의
크기를 확인하고,

그 값에 애플리케이션이 링크하는 DLL의 .tls 섹션내의 크기만큼을 더해준다.

이제 프로세스 내의 새로운 쓰레드가 생성되면 시스템은 자동적으로
애플리케이션과 암시적으로 링크된 DLL 파일이 필요로 하는 모든 TLS 변수를
수용할 수 있을 만큼의 충분한 메모리 블록을 할당한다.



LoadLibrary를 이용하여 정적 TLS  변수를 포함하는 DLL을 로그하는 경우엔,

시스템은 프로세스 내 이미 수행 중인 쓰레드를 찾아 새롭게 로드된 DLL이
필요하는 크기만큼 TLS 메모리 블록의 크기를 넓혀줘야 한다.

또한, FreeLibrary가 호출되면 DLL이 가지고 있는 정적 TLS 변수를 삭제해야
하고, 각각의 쓰레드와 연계된 메모리 블록을 축소해줘야 한다.



이 모든 것들이 Windows VISTA 이후 완벽하게 지원되고 있다.


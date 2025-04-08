---
layout: post
title: Macport Commands Summary
date: 2014-03-10 
categories: [information technology]
tags: [design patterns]

---

Macport Commands Summary
---

파일 검색
---

port search [검색하고자 하는 패키지]

예제) port search oracle



파일 정보확인
---

1) 단순 파일 정보 확인

port info [확인하고자 하는 패키지]

예제) port info TOra

2) 설치 옵션 정보 확인

Variants는 패키지를 설치할 때 사용할 수 있는 설치 옵션을 의미

port variants [확인하고자 하는 패키지]

3) 설치하고자 하는 의존성을 갖는 패키지 정보를 확인

port deps [확인하고자 하는 패키지]

4) 설치된 패키지의 의존성을 확인

port dependents [확인하고자 하는 패키지]




설치 방법
---

sudo port install [설치하고자 하는 패키지]



업데이트 방법
---

1) 설치 가능한 목록 업데이트

sudo port selfupdate

2) 설치된 패키지의 업데이트가 있는지 확인

port outdated

3) 설치된 패키지의 업데이트

sudo port -u upgrade outdated

4) 설치된 패키지의 의존성 업데이트

sudo port upgrade makedepend



설치되어 있는 패키지 확인 방법
---

port installed

옵션 '-v'를 사용하면 플랫폼과 CPU 정보를 확인 할 수 있다.



삭제 방법
---

1) 패키지 삭제

sudo port uninstall [삭제하고자 하는 패키지]

옵션 '-f'를 사용하면 강제로 삭제할 수 있다.

2) 강제 삭제하기

sudo port -f uninstall [삭제하고자 하는 패키지]

3) 의존성이 존재하는 파일 삭제하기

sudo port uninstall makedepend [삭제하고자 하는 패키지]
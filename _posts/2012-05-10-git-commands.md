---
layout: post
title: Git Commands
date: 2012-05-10
categories: [information technology]
tags: [design patterns]

---
### Git 사용
* branch를 만들고, 코드를 commit하고 merge하는 등 모든 버전관리 기능을 사용할 수 있다.
* 자신의 컴퓨터 repository를 활용하여 로그를 확인하며 코딩하는데 사용 가능 (local)
* 하지만 이것은 DVCS(Distributed Version Control System)인 Git을 활용하는 것이 아니다.
* 외부의 repository와 연결하여 동시에 다같이 코딩을 해야 DVCS를 제대로 활용하는 것이다.
	* 사용자 - 사용자간의 repository 공유도 좋지만 방법이 어렵다.
	* 주로 open source의 경우, github.com에 repository를 등록하여 사용한다.

### Git 명령어

```
> git init							
: 현재 디렉토리에 git repository 초기화 및 생성

> git clone name			
: name이라는 repository를 가져온다.

> git status					
: 현재 repository의 상태

> git add test					
: 파일 test 를 git이 추적하도록 추가

> git add -A					
: 모든 변경파일을 repository에 추가

> git commit -m "msg"	
: 변경을 repository에 저장하며 msg를 남김

> git log							
: commit 로그 확인

> git remote -v					
: 외부 저장소 확인

> git branch name			
: name 이라는 branch 생성

> git checkout name			
: branch 변경

> git push						
: 현재 repository내용을 외부 repository로 전송

> git pull							
: 외부 repository fetch & merge

```

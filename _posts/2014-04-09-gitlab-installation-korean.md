---
layout: post
title: Using Gitlab on Mac OS X
date: 2014-04-09
categories: [information technology]
tags: [design patterns]

---

## Summary

* Article Source: [[원문](http://lambert.tistory.com/497)]    


## Using gitLab

Mac에 GitLab를 설치하기 위해서는 몇 가지 전제 조건이 필요한데, 본인은 한
가지 조건을 더 부가했다. 뭐 거창한 것은 아니고, 실제 서버(하드웨어)에
설치하는 것이 아닌 개인용 맥북프로에 설치하는 것이어서 git이라는 운영용
계정을 따로 만들지 않고 개인 계정을 그대로 활용했다. 이 점에 주의하면,
호스팅용 세팅도 별반 다르지 않다. 또한 Mac이 아니라면 GitLab의 설치
문서만으로도 간단히 설치가 된다(Gitosis는 조금 신경을 써야 겠지만…).

## 참고

* GitLab을 설치하지 않고 단순히 Mac에 gitosis를 설치하여 Git 서버를
관리하는 목적이라면 다음 두 포스트 만으로도 충분할 것이다.
 - [Installing gitosis on Mac OS X](http://lukhnos.org/blog/en/archives/162)
 - [Hosting Git repositories, The Easy (and Secure)
Way](http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way)

## 필수 조건

* [Ruby 1.9.2-p290](http://www.ruby-lang.org/en/downloads/)와 [Ruby on
Rails 3.1](http://rubyonrails.org/download)
* sqlite(Mac에는 /usr/bin/sqlite3에 설치 되어 있을 것이다.)
* git
* giosis
* GitLab

## Ruby 1.9.2-p290 설치하기

```ruby
$ brew install ruby
```
 
 * [brew](http://mxcl.github.com/homebrew/)가 설치되어 있지 않을 경우
설치를 해주자. ([open
source](https://github.com/mxcl/homebrew/wiki/installation))

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
```

버전을 확인 후 다음으로 진행한다. 만약 이전 버전이 나온다면 이전버전에
대한 처리를 해주자.

## Ruby on Rails 3.1 설치하기

```
sudo gem update rails
```

## git 설치되었나 확인하기

아마 설치되어있을 것이다.

## gitosis 설치하기

git이 설치되어 있으므로 다음과 같이 저장소를 복사한다. (설치한 소스는
모두 홈 디렉토리를 이용했다.)

``` 
 git clone git://eagain.net/gitosis.git
 cd gitosis
 sudo python setup.py install
```

gitosis를 설치하면 아래와 같은 메시지를 확인 할 수 있다.

```
 .....
 Finished processing dependencies for gitosis==0.2
``` 

## SSH를 이용하기 위한 공개 키 생성하기

만약 기존에 GitHub를 사용하고 있다면 기존 키를 사용해도 무방하다.
 SSH 키 생성과 관련하여 자세한 내용은
[링크를](http://help.github.com/mac-set-up-git/) 참고하라.
 (키 생성위치 예: /Users//.ssh)
 
	// 현재 홈 디렉토리 이므로(/Users/<user>) 없다면 디렉토리를 생성해주자.
	cd .ssh

	// 그리고, 메일주소를 추가하여 공개 키 생성
	ssh-keygen -t rsa -C “@gmail.com”

공개 키까지 생성하였으면 gitosis를 위해 다음 두 가지 추가 작업을 해야
하는데, 한 가지 주의할 점이 있다. 위에서 미리 언급했듯이 서버 관리를
위해 git이라는 계정을 따로 만들지 않고 사용자 계정을 그대로 사용한다고
했으니 다음 볼드 글자(사용자 계정) 부분만 신경쓰면 된다.
 
	// 현재 위치: /Users//.ssh
	sudo -H -u **ezcocoa** gitosis-init < ./id_rsa.pub

생성시 아래와 같은 메세지를 확인 할 수 있다.
 
	Initialized empty Git repository in /Users/hojunbaek/repositories/gitosis-admin.git/
	Reinitialized existing Git repository in /Users/hojunbaek/repositories/gitosis-admin.git/
 

	// 마지막으로...
	chmod 755 ~/repositories/gitosis-admin.git/hooks/post-update

## GitLab 설치하기

GitLab의 [설치 문서](https://github.com/gitlabhq/gitlabhq)를 그대로
따라하기만 하면된다.

	// 현재 홈 디렉토리이다.
	git clone git://github.com/gitlabhq/gitlabhq.git
	cd gitlabhq/

	// 다음 라이브러리들 부터 설치한다.
	sudo easy_install pygments

	// 위 라이브러리 설치가 끝난 후...
	sudo gem install bundler

	// 다시... 약간 시간이 걸린다.
	bundle

	// 위 작업까지 이상이 없다면...
	RAILS_ENV=production rake db:setup

	// 마지막으로... 다음과 같은 기본정보로 관리자 계정이 생성된다.
	// ID: admin@local.host
	// PW: 5iveL!fe
	RAILS_ENV=production rake db:seed_fu

자 이제 서버를 실행시킬 차례인데, 위에서 미리 언급했듯이 git 계정을
사용하지 않고 사용자 계정(예: )을 사용할 것이므로… GitLab의
gitosis.yml의 설정을 변경해야 한다.

	// 바로 전 작업했던 위치가, /User/<user>/gitlabhq 이였으므로...
	cd config
	vi gitosis.yml
 

파일 내용은 다음과 같을 것이다.

	admin_uri: git@localhost:gitosis-admin.git
	base_path: /home/git/repositories/
	host: localhost
	git_user: git 

다음과 같이 수정한다.
 
	admin_uri: <user>@localhost:gitosis-admin.git
	base_path: /Users/<user>/repositories/
	host: localhost
	git_user: <user>

다 수정하였으면 다음과 같이 서버를 실행해 보자.
 
	// 당연히 실행 위치는 gitlabhq 이다.
	cd ..

	// 서버 실행
	rails s -e production

서버가 실행된 후, http://localhost:3000/ 주소로 브라우저에서 접속하면
로그인 화면이 뜰 것이다. 위에서 미리 생성된 관리자 계정으로 접속 된다면
 기본 설치는 끝났다.

* bundle 입력 중 아래와 같은 문제가 발생할 수 있다.
  `bin_path': can't find executable rake for rake-0.8.7
(Gem::Exception)
 

이 문제는 1.9.2문제로 아래와 같이 해결할 수 있다.

	sudo ln -s /usr/local/bin/ruby /opt/local/bin/ruby

버전 확인
	
	ruby -v
	gem list -d
	rake --version
 

다시 설치.
 
	gem install rake
 

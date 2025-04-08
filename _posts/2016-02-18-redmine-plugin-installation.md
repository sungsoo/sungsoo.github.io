---
layout: post
title: Redmine Plugin Installation
date: 2016-02-18
categories: [computer science]
tags: [design patterns]

---

# Redmine Plugin Installation


## 1. 다운로드

플러그인 다운로드는 공식사이트인 아래 링크를 이용하시면 됩니다. 500여개의 다양한 플러그인이 있습니다.

[http://www.redmine.org/plugins?page=1](http://www.redmine.org/plugins?page=1)


## 2. 설치

레드마인(Redmine)에 설치된 경로에서 Plugins 폴더로 다운로드 받은 플러그인을 압축 해제하여 복사합니다.
아래 명령어를 수행하여 플러그인을 설치합니다.

```ruby
rake redmine:plugins:migrate RAILS_ENV=production
```

만약 문제가 생긴다면, 아래와 같이 실행합니다.

```ruby
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
```

Redmine의 Administration 메뉴의 설치된 Plugins을 확인할 수 있습니다.

## 3. 삭제

플러그인 삭제는 아래와 같이 명령어를 수행하면 됩니다.

```ruby
rake redmine:plugins:migrate NAME=plugin_name VERSION=0 RAILS_ENV=production
```

여기서 VERSION=0은 삭제를 의미합니다. 그리고 NAME은 설치한 플러그인 이름을 입력하면 됩니다.
---
layout: post
title: "Adding a post to github page"
date: 2012-03-08
categories: [information technology]
tags: [design patterns]

---

###Adding a post to github page

####Front-matter  
프론트매터는 지킬에게 이 화일을 처리해야할 방법을 알려주는 일종의 메타데이타이다. 화일의 제일 앞에 위치해야 한다. 지킬은 front matter 블록으로 시작되는 파일만 처리한다.

`
layout: post  
title: Blogging Like a Hacker
`

각 블로그 포스트의 front matter에는 “title”과 “layout” 필드는 반드시 들어가야 한다. date는 화일 이름에 들어가니 필수는 아니다.

####마크다운으로 포스트 작성하기
_posts 폴더에 모든 블로그 포스트 컨텐츠와 메타데이타가 있다. 지킬은 매우 스마트해서 이 폴더에 Markdown, HTML 과 다른 포맷을 섞어 넣을 수도 있다.

블로그를 포스트하려면 마크다운 화일을 _posts 폴더에 떨어뜨리면 된다. 그러나, 포스트와 화일의 이름은 다음과 같은 이름 구조를 가져야한다:

`YYYY-MM-DD-[POST SLUG].[FORMAT]`

예로, 2013년 9월 14일에 마크다운 포맷으로 “best-blog-platforms”(한글은 피해야 한다.)에 대한 포스트를 썼다면 다음과 같이 이름붙인다.

`2013-10-15-best-blog-platforms.md`

post slug는 포스트 이름의 URL 친화적인 형식을 말한다. 스페이스나 이상한 문자와 URL에서 보통 허용되지 않는 것을 쓰지말라는 것이다. 표준 관례는 모든 문자는 소문자, 스페이스 대신 -를, 비교적 짧은 slug를 사용하는 것을 포함한다.

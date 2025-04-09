---
layout: post
title: LaTeX Fonts on Mac OS X
date: 2015-12-08
categories: [computer science]
tags: [liberal arts]

---

# LaTeX Fonts on Mac OS X


LaTeX에서 한글을 쓸 수 있도록 하는 ko.tex은 기본적으로 은글꼴을 지원한다. 
그런데 만약 은글꼴 이외의 한글 폰트를 사용하고 싶을 경우 아래와 같은 방법으로 임의의 한글 트루타입 폰트로부터 tfm(Tex font metric)을 추출하고 설정을 해주면 된다.

우선 kotex이 당연히 깔려있어야 하고 다음과 같이 font.conf 라는 파일을 만든다.

```
FOUNDRY: b
FONTmj: m=m=malgun.ttf b=malgunbd.ttf
```

`FOUNDRY: b`의 `b`는 새로 생기는 폰트명의 제일 앞에 붙는다.
둘째 줄의 의미는 `m=malgun.ttf` 라는 폰트를 `bmg`라는 이름으로 만들겠다는 것인데 `FONTmj`의 `mj`는 명조체를 의미하는 것으로 `f=bnewname`을 지정해주지 않으면 자동으로 `mj`가 폰트 이름이 된다. 
`mj`가 포함된 이 첫 줄은 꼭 있어야 하고, 폰트 이름을 `mj`가 아닌 다른 것으로 정하고 싶다면 `f=name`하고 따로 지정해주면 된다. 폰트 파일이 기본 모양 뿐 아니라 볼드체 파일도 있다면 첫 줄 제일 뒤에 `b=malgunbd.ttf`하고 추가해준다.

그래서 이 파일과 ttf 파일들을 같은 폴더에 넣고 터미널에서 다음을 입력하면,
(같은 디렉토리에 UCS2.sfd도 필요한데 Unicode.sfd를 이름 바꿔서 사용하면 잘 된다.)

```
ttf2kotexfont -c font.conf
```

obmj****.tfm 라는 tfm이 붙은 파일이 완전 많이 생성되고 myttf.sty, ttf2pk.cfg, ****.fd 등등의 파일이 생긴다. 

myttf.sty은 tex 문서 내에서 새로 만든 이 폰트들을 사용을 지정하기 위한 파일이고 ttf2pk.cfg는 (아마도) tex문서 내에서 지정한 폰트 사이즈에 맞는 ****pk파일들을 만들어내기 위한 파일, ****.fd는 새로 생긴 폰트들을 정의해주는 파일이다.

이렇게 만든 폰트를 이용하기 위해 tex문서의 앞부분에 넣어줘야 하는 명령들은 다음과 같다.

```
\documentclass[10pt,a4paper]{book}
\usepackage[hangul]{kotex}
\usepackage{myttf}
\SetHangulFonts{bmj}{utgt}{uttz} % 한글 기본폰트 윤명조120
\begin{document}
.............
```

위에서 만든 *.tfm파일들과 myttf.sty 등 새로 만들어진 파일과 이 tex문서는 같은 디렉토리 안에 있어야 하고 `\SetHangulFonts`에서 한글 기본폰트로 맑은고딕을 설정하였다.

`\SetHangulFonts`가 필요로 하는 인자는 `\SetHangulFonts{명조폰트}{고딕폰트}{타자폰트}`인데 이 폰트에 대해서 고딕체과 타자체에 대응하는 폰트가 따로 없으므로, 그것들은 그냥 은글꼴을 사용한다는 의미에서 {utgt}{uttz}를 써준것이다.

이렇게 문서를 만들고 컴파일을 하면 ******pk 가 붙은 파일들이 또 마구마구 만들어지면서 원하는 한글 폰트가 들어간 문서가 만들어진다.

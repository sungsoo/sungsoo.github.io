---
layout: post
title: PageRank Algorithm
date: 2014-04-29
categories: [computer science]
tags: [design patterns]

---

# Article Source
* Title: [‘쉽게 설명한’ 구글의 페이지 랭크 알고리즘](http://sungmooncho.com/2012/08/26/pagerank/)

[![](http://sungsoo.github.com/images/pagerank.png)](http://sungsoo.github.com/images/pagerank.png)

# PageRank Algorithm

“Google”이라는 [230조원짜리 회사](http://www.google.com/finance?q=goog)가 처음 시작된
곳이 바로 이 세르게이 브린과 래리 페이지가 쓴 [논문(*The Anatomy of a
Large-Scale Hypertextual Web Search
Engine*)](http://infolab.stanford.edu/~backrub/google.html)이었다는 것을
생각하면 한 번 시간을 들여 배워볼 만한 의미가 있지 않을까? 이 논문은
1998년에 쓰여졌으나, 논문에서 소개된 PageRank 알고리즘은 14년이 지난
지금에도 구글 검색 엔진의 핵심을 이루고 있다.

[![](http://sungmoon.files.wordpress.com/2012/08/screen-shot-2012-08-25-at-4-04-12-am.png?w=700 "Screen Shot 2012-08-25 at 4.04.12 AM")](http://sungmoon.files.wordpress.com/2012/08/screen-shot-2012-08-25-at-4-04-12-am.png)

오늘날의 구글을 만든, [페이지랭크(PageRank) 알고리즘을 소개한
논문](http://infolab.stanford.edu/~backrub/google.html)에 포함되어 있던
세르게이 브린과 래리 페이지의 사진. 참 앳된 두 대학원생의 모습이다.

논문은 이렇게 시작한다.

> Our main goal is to improve the quality of web search engines. In
> 1994, some people believed that a complete search index would make it
> possible to find anything easily. (우리의 주요 목표는 검색 엔진의
> 품질을 향상시키는 것입니다. 1994년 당시, 사람들은 검색 인덱스를
> 완성하고 나면 무엇이든 쉽게 찾을 수 있을 것이라고 생각했습니다.)
>
> However, the Web of 1997 is quite different. Anyone who has used a
> search engine recently, can readily testify that the completeness of
> the index is not the only factor in the quality of search results.
> “Junk results” often wash out any results that a user is interested
> in. (하지만, 1997년의 웹은 사뭇 다릅니다. 최근에 검색 엔진을 사용해 본
> 사람이라면 누구나 인덱스를 완성하는 것만으로는 좋은 품질의 검색 결과를
> 얻을 수 없다는 것을 압니다. **‘쓰레기 정보’가 종종 사용자들이 진정
> 관심있어하는 정보를 가려버립니다.**)
>
> One of the main causes of this problem is that the number of documents
> in the indices has been increasing by many orders of magnitude, but
> the user’s ability to look at documents has not. People are still only
> willing to look at the first few tens of results. (그러한 이유 중
> 하나는, 인덱스되는 문서의 숫자는 엄청난 속도로 성장하고 있지만,
> 사람들이 그 문서들을 볼 수 있는 능력은 같은 속도로 성장하지 않기
> 때문입니다. 사람들은 여전히 검색 결과중 처음 몇십 개 정도만 살펴볼
> 뿐입니다.)
>
> Because of this, as the collection size grows, we need tools that have
> very high precision. Indeed, we want our notion of “relevant” to only
> include the very best documents since there may be tens of thousands
> of slightly relevant documents. (그렇기 때문에, **인터넷이 성장할수록,
> 우리에게 더 정밀한 도구가 필요합니다.** 사실, 우리는 ‘관련 있는
> 페이지’가 수만 개라도, 그 중 최고의 웹 페이지만을 정확하게 찾아주기를
> 원합니다.)
>
> There is quite a bit of recent optimism that the use of more
> hypertextual information can help improve search and other
> applications. In particular, link structure and link text provide a
> lot of information for making relevance judgments and quality
> filtering. Google makes use of both link structure and anchor text.
> (하이퍼텍스트 정보를 이용하면 검색 결과를 많이 향상할 수 있다는 최근의
> 연구 결과가 있습니다. **특히, 웹 페이지 사이의 연결 관계가 상당히
> 유용한 정보를 제공해줄 수 있습니다**. **구글은 바로 이러한 링크 구조와
> 링크 달린 텍스트를 이용합니다.**)

그리고, 페이지랭크 알고리즘을 다음과 같이 소개한다.

Academic citation literature has been applied to the web, largely by
counting citations or backlinks to a given page. This gives some
approximation of a page’s importance or quality. PageRank extends this
idea by not counting links from all pages equally, and by normalizing by
the number of links on a page. (학술지 인용 방식은 그동안 웹에 적용되어
왔습니다. 특히, 특정 페이지를 인용하는 다른 페이지가 얼마나 많이
있느냐를 세는 방식으로요. 이렇게 하면 특정 페이지가 얼마나 중요한 지 알
수 있스니다. PageRank는 이러한 아이디어를 연장하는데, 즉, **다른
페이지에서 오는 링크를 같은 비중으로 세는 대신에, 그 페이지에 걸린 링크
숫자를 ‘정규화(normalize)’하는 방식을 사용합니다**.)

말이 좀 어려운데, 아래 수식을 한 번 보자.

***PR(A) = (1-d) + d (PR(T1)/C(T1) + … + PR(Tn)/C(Tn))***

**PR**은 PageRank의 줄임말이고, **PR(A)**는 ‘A’라는 웹페이지의 페이지
랭크를 의미한다. **T1, T2, … Tn**은 그 페이지를 가리키는 다른 페이지들을
의미한다. 그리고  **PR(T1)**는 당연히 T1이라는 페이지의 페이지
랭크값이다. **d**는 ‘Damping Factor’라고 하는데, 설명이 길어질 수 있으니
조금 후 설명하겠다. **C(T1)**는 T1이라는 페이지가 가지고 있는 링크의 총
갯수를 의미한다.

d에 연연하지 않고(즉 d=1이라고 가정하고) 위 수식을 가만히 보면 사실 매우
간단하다. ‘**어떤 페이지 A의 페이지 랭크는 그 페이지를 인용하고 있는
다른 페이지 T1, T2, T3, .. 가 가진 페이지 랭크를 정규화시킨 값의
합**‘이다. 다시 말해 페이지 A의 페이지 랭크는 A라는 페이지를 가리키고
있는 다른 페이지의 페이지 랭크값이 높을수록 (즉, 더 중요할수록) 더
높아진다. 여기서 ‘**정규화시킨 값의 합**‘이라는 말을 굳이 쓴 이유는,
페이지 랭크의 단순 합산이 아니기 때문이다. 예를 들어, T1의 페이지 랭크가
높다고 하더라도, 그 페이지에서 링크를 수천 개 달아놓았다면(즉, C(T1)값이
높다면) 그 페이지가 기여하는 비중은 낮아진다.

이 수식을 그림으로 한 번 표현해보겠다.

[![](http://sungmoon.files.wordpress.com/2012/08/screen-shot-2012-08-25-at-4-46-19-am.png?w=700&h=334 "Screen Shot 2012-08-25 at 4.46.19 AM")](http://sungmoon.files.wordpress.com/2012/08/screen-shot-2012-08-25-at-4-46-19-am.png)

PageRank 알고리즘을 그림으로 표현한 것. Dampen Factor가 있기 때문에
이것과 똑같지는 않지만, 간단하게 표현하면 위와 같다.

위 그림에서 웹 페이지 A를 가리키는 페이지는 T1, T2, T3, T4, T5의 다섯
개가 있고, 이들을 정규화해서 합한 값이 0.34이므로, A의 ‘페이지 랭크’는
0.34가 된다. 이 페이지랭크 값은 A가 가리키는 또 다른 페이지의 PageRank를
계산하는 데 쓰일 것이다. 그럼 T1의 페이지 랭크는 어떻게 구했나?
마찬가지로 T1을 가리키는 다른 페이지들의 PageRank값으로부터 구한다.
이렇게 해서 파고 내려가면 무한히 가게 될 것 같은데, ‘제한 조건’을 걸면
언젠가는 계산이 끝이 난다. 이러한 방법으로 계산하는 것을 컴퓨터
과학에서는 ‘**recursive(재귀적)**‘이라고 한다. 즉, PageRank는 재귀 호출
알고리즘이다.

이제 **d, 즉 Damping Factor**에 대해 생각해 보자. 위 수식을 다시 한 번
보자.

***PR(A) = (1-d) + d (PR(T1)/C(T1) + … + PR(Tn)/C(Tn))***

d 값은 0과 1 사이에서 정해지는데, d값이 커져서 1이 되면 앞의 (1-d)는 0이
되고, 뒤 수식의 합이 그대로 A의 PageRank가 된다. 이것이 바로 위 그림에서
가정한 상황이다. 반대로 d값이 작아져서 0이 되면, 뒤 수식의 합은 0이
되고, A의 PageRank는 1이 된다. d가 0이면 모든 페이지의 PageRank는 1이
되므로 아무 의미가 없어진다. 그래서 d는 실험을 통해 0과 1 사이의 어떤
값에서 정해지는데, [논문에서는 보통 0.85로 설정해놓았다고 되어
있다](http://infolab.stanford.edu/~backrub/google.html). 논문에 따르면
**damping factor란 ‘어떤 마구잡이로 웹서핑을 하는 사람이 그 페이지에
만족을 못하고 다른 페이지로 가는 링크를 클릭할 확률**‘이다. 즉, damping
factor가 1이면, 무한히 링크를 클릭한다는 뜻이고, 0이면 처음 방문한
페이지에서 무조건 멈추고 더 이상 클릭하지 않는다는 뜻이다. 0.85이면,
85%의 확률로 다른 페이지를 클릭해볼 것이라는 뜻이다. 이 경우 15%의
확률에 걸리는 순간 클릭을 멈추고 그 페이지를 살펴본다.

논문에 따르면, 모든 웹페이지의 페이지랭크 값을 합산한 값은 1이 된다고
한다. 그러나 이 수식을 보면 그렇게 되어 있지 않다. 예를 들어 d가 0이면
PR(A)는 1이 되고, 모든 웹페이지의 PageRank가 1이 되기 때문에 PageRank의
합산은 모든 페이지의 숫자(N)이 된다.

[위키피디아에 따르면](http://en.wikipedia.org/wiki/Pagerank), 세르게이와
래리가 논문을 쓸 때 실수한 것 같다며, 올바른 수식은 아래와 같다고 한다.

***PR(A) = (1-d)/N + d (PR(T1)/C(T1) + … + PR(Tn)/C(Tn))***

이렇게 하면 전체 페이지의 PageRank를 합산한 값이 1이 된다.

[![](http://sungmoon.files.wordpress.com/2012/08/744px-pageranks-example-svg.png?w=420&h=338 "744px-PageRanks-Example.svg")](http://sungmoon.files.wordpress.com/2012/08/744px-pageranks-example-svg.png)

페이지랭크와 그 관계를 도식화한 그림. A, B, C 등은 페이지를 나타내고,
숫자는 PageRank를 의미한다. **C**의 경우 B에서 링크를 걸었다는
것만으로도 PageRank값이 높게 책정됨을 볼 수 있다. (출처:
[Wikipedia](http://en.wikipedia.org/wiki/Pagerank))

**이게 다이다.** 이렇게 해서 온 세상의 모든 페이지를 PageRank 등수에
따라서 미리 정렬을 해 두면, 누군가가 검색어를 입력하는 순간, 그 검색어가
포함된 페이지들을 순위별로 나열하기만 하면 끝이다. 구글의 검색 엔진팀에
있는 지인의 말에 따르면, 지금의 구글 검색 알고리즘은 엄청나게 많은 다른
요소를 고려하고, 튜닝을 했기 때문에 이것보다 훨씬 복잡하다고 한다.
그러나 앞에서 말했듯, ‘**영향력 있는 페이지가 인용할수록 페이지랭크가
올라간다**‘는 근본적인 알고리즘은 그대로 남아 있다.

구체적 예를 들면 이와 같다. 내 블로그를 인용한 다른 블로그들이 있다. 그
중 아마 가장 사람들에게 신뢰를 얻고 인기 있는 블로그 중 하나가
‘[에스티마의 인터넷 이야기](http://estima.wordpress.com/)‘일 것이다.
또한 그 블로그를 상당수의 사람들이 인용했을 것이므로 구글 검색 순위가
높을 것이다. 이런 상황이라면, ‘에스티마의 인터넷 이야기’에서 내
블로그로의 링크를 거는 순간 내 블로그의 PageRank는 많이 올라갈 수 있다.
마찬가지 이유로 인기가 있는 다른 웹사이트에서 내 블로그로 링크를 걸면
PageRank가 올라간다. 그러나 만약 그 사이트에서 나 뿐만 아니라 엄청나게
많은 블로그로 링크를 걸고 있다면 (예를 들어, 단순히 수만개의 블로그
주소를 나열한 경우), 그 사이트가 아무리 인기 있다 해도 내 블로그의 검색
순위는 크게 상승되지 않는다.

또 한가지 예로, [Stanford.edu](http://stanford.edu)와 같은 사이트의 경우
조회수가 엄청나게 높다. 따라서 이 사이트에서 누군가에게 링크를 걸어주면,
구글 검색 순위가 바로 상승할 수 있다. 예전에 Stanford.edu를 관리하는
사람이 돈을 받고 특정 사이트에 링크를 걸어주는 사업을 한 적이 있다고 MBA
수업 시간에 교수님이 이야기한 적이 있다. 물론, 구글이 이를 가만히 놔두지
않았기 때문에 그런 방식은 더 이상 통하지 않는다.

여기에서 덧붙일 말이 있다. 이렇게 훌륭한 알고리즘이지만, **소위 ‘불펌’이
만연하는 곳에서는 이 알고리즘은 바보가 된다는 사실**이다. 글을 ‘퍼가기’
하면서 원문의 링크를 걸지 않는다면, 이 알고리즘에 따르면 아무리 많은
사람들이 퍼가도 웹사이트의 순위는 올라가지 않는다. 한국 인터넷에서는
싸이월드, 또는 그 이전 시절부터 출처 없이 ‘퍼가기’가 참 유행했다. 네이버
블로그가 생기고, 이렇게 글을 퍼가기 해서 많이 쌓아둘수록 블로그 순위가
올라가자 사람들은 더욱 정신없이 ‘퍼가기’를 했다. 그 결과 인터넷은
지저분해지고, ‘[내리와 인성의 IT
이야기](http://minix.tistory.com/218)‘라는 인기 웹툰에서 밝혔듯 원본
문서는 찾기가 힘들어졌다. 이런 상황에서 구글이 한국 시장에 진입했으니,
처음에 구글 검색 결과가 네이버에 비해 훨씬 뒤쳐져 있었던 것은
당연하다. 다행히 요즈음엔 이런식의 ‘펌 문화’가 많이 잦아들었고, 원본의
링크를 다는 ‘건전한 문화’가 많이 정착되면서 원글을 찾기도 쉬워졌고, 구글
검색의 품질도 좋아졌다.

**PageRank**, 구글이 야후보다 월등히 좋은 검색 결과를 낼 수 있었던
비결이었고, 결국 야후를 꺾고 검색 엔진의 대명사로 등극한 출발점이었다.

# References

1.  ["Google Press Center: Fun
    Facts"](http://web.archive.org/web/20090424093934/http://www.google.com/press/funfacts.html).
    www.google.com. Archived from [the
    original](http://www.google.com/press/funfacts.html) on 2009-04-24. 
2.  [http://www.google.com/competition/howgooglesearchworks.html](http://www.google.com/competition/howgooglesearchworks.html). 
    Missing or empty 
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#citation_missing_title "Help:CS1 errors"))
3.  Sullivan, Danny. ["What Is Google PageRank? A
    Guide For Searchers &
    Webmasters"](http://searchengineland.com/what-is-google-pagerank-a-guide-for-searchers-webmasters-11068).
    Search Engine Land. 
4.  [Brin,
    S.](http://en.wikipedia.org/wiki/Sergey_Brin "Sergey Brin"); [Page,
    L.](http://en.wikipedia.org/wiki/Larry_Page "Larry Page") (1998). ["The anatomy of a
    large-scale hypertextual Web search
    engine"](http://infolab.stanford.edu/pub/papers/google.pdf).
    Computer Networks and ISDN Systems 30: 107–117.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1016/S0169-7552(98)00110-X](http://dx.doi.org/10.1016%2FS0169-7552%2898%2900110-X).
    [ISSN](http://en.wikipedia.org/wiki/International_Standard_Serial_Number "International Standard Serial Number") [0169-7552](//www.worldcat.org/issn/0169-7552). 
    [edit](//en.wikipedia.org/w/index.php?title=Template:Cite_doi/10.1016.2FS0169-7552.2898.2900110-X&action=edit&editintro=Template:Cite_doi/editintro2)
5.  Gyöngyi, Zoltán; Berkhin, Pavel;
    Garcia-Molina, Hector; Pedersen, Jan (2006), ["Link spam detection
    based on mass
    estimation"](http://ilpubs.stanford.edu:8090/697/1/2005-33.pdf),
    Proceedings of the 32nd International Conference on Very Large Data
    Bases (VLDB '06, Seoul, Korea), pp. 439–450 .
6.  Gabriel Pinski and Francis Narin. ["Citation
    influence for journal aggregates of scientific publications: Theory,
    with application to the literature of
    physics"](http://www.sciencedirect.com/science/article/pii/0306457376900480#).
    Information Processing & Management 12 (5): 297–312.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1016/0306-4573(76)90048-0](http://dx.doi.org/10.1016%2F0306-4573%2876%2990048-0). 
7.  Raphael Phan Chung Wei (2002-05-16).
    "Resources". [New Straits
    Times](http://en.wikipedia.org/wiki/New_Straits_Times "New Straits Times") (Computimes; 2
    ed.). 
8.  Page, Larry, ["PageRank: Bringing Order to the
    Web"](https://web.archive.org/web/20020506051802/www-diglib.stanford.edu/cgi-bin/WP/get/SIDL-WP-1997-0072?1)
    at the [Wayback Machine](http://en.wikipedia.org/wiki/Wayback_Machine "Wayback Machine")
    (archived May 6, 2002), Stanford Digital Library Project, talk.
    August 18, 1997 (archived 2002)
9.  [187-page study from Graz
    University,
    Austria](http://www.iicm.tugraz.at/Ressourcen/Papers/dangers_google.pdf),
    includes the note that also human brains are used when determining
    the page rank in Google
10. ["Google
    Technology"](http://www.google.com/technology/). Google.com.
    Retrieved 2011-05-27. 
11. David Vise and Mark Malseed (2005). [The
    Google Story](http://www.thegooglestory.com/). p. 37.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-553-80457-X](http://en.wikipedia.org/wiki/Special:BookSources/0-553-80457-X "Special:BookSources/0-553-80457-X"). 
12. Lisa M. Krieger (1 December 2005). ["Stanford
    Earns \$336 Million Off Google
    Stock"](http://www.redorbit.com/news/education/318480/stanford_earns_336_million_off_google_stock/).
    San Jose Mercury News, cited by redOrbit. Retrieved 2009-02-25. 
13. Richard Brandt. ["Starting Up. How Google got
    its
    groove"](http://www.stanfordalumni.org/news/magazine/2004/novdec/features/startingup.html).
    Stanford magazine. Retrieved 2009-02-25. 
14. Page,
    Lawrence](http://en.wikipedia.org/wiki/Larry_Page "Larry Page"); [Brin,
    Sergey](http://en.wikipedia.org/wiki/Sergey_Brin "Sergey Brin"); [Motwani,
    Rajeev](http://en.wikipedia.org/wiki/Rajeev_Motwani "Rajeev Motwani") and [Winograd,
    Terry](http://en.wikipedia.org/wiki/Terry_Winograd "Terry Winograd") (1999). [The PageRank
    citation ranking: Bringing order to the
    Web](http://dbpubs.stanford.edu:8090/pub/showDoc.Fulltext?lang=en&doc=1999-66&format=pdf&compression=). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors")),
    published as a technical report on January 29, 1998
    [PDF](http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf)
15. Li, Yanhong (August 6, 2002). "Toward a
    qualitative search engine". Internet Computing, IEEE (IEEE
    Computer Society) 2 (4): 24–29.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/4236.707687](http://dx.doi.org/10.1109%2F4236.707687). 
16. USPTO, ["Hypertext Document Retrieval System
    and
    Method"](http://www.google.com/patents?hl=en&lr=&vid=USPAT5920859&id=x04ZAAAAEBAJ&oi=fnd&dq=yanhong+li&printsec=abstract#v=onepage&q=yanhong%20li&f=false),
    U.S. Patent number: 5920859, Inventor: Yanhong Li, Filing date: Feb
    5, 1997, Issue date: Jul 6, 1999
17. Greenberg, Andy, ["The Man Who's Beating
    Google"](http://www.forbes.com/forbes/2009/1005/technology-baidu-robin-li-man-whos-beating-google_2.html),
    Forbes magazine, October 05, 2009
18. ["About:
    RankDex"](http://www.rankdex.com/about.html), rankdex.com
19. Cf. especially Lawrence Page, U.S. patents
    6,799,176 (2004) "Method for scoring documents in a linked
    database", 7,058,628 (2006) "Method for node ranking in a linked
    database", and 7,269,587 (2007) "Scoring documents in a linked
    database"2011
20. [Matt Cutts](http://en.wikipedia.org/wiki/Matt_Cutts "Matt Cutts")'s
    blog: [Straight from Google: What You Need to
    Know](http://www.mattcutts.com/blog/seo-for-bloggers/), see page 15
    of his slides.
21. Taher Haveliwala and Sepandar Kamvar. (March
    2003). ["The Second Eigenvalue of the Google
    Matrix"](http://www-cs-students.stanford.edu/~taherh/papers/secondeigenvalue.pdf)
    (PDF). Stanford University Technical Report: 7056.
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[math/0307056](//arxiv.org/abs/math/0307056).
    [Bibcode](http://en.wikipedia.org/wiki/Bibcode "Bibcode"):[2003math......7056N](http://adsabs.harvard.edu/abs/2003math......7056N). 
22. Gianna M. Del Corso, Antonio Gullí, Francesco
    Romani (2005). ["Fast PageRank Computation via a Sparse Linear
    System"](http://projecteuclid.org/euclid.im/1150474883). Internet
    Mathematics. Lecture Notes in Computer Science 2 (3): 118.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1007/978-3-540-30216-2\_10](http://dx.doi.org/10.1007%2F978-3-540-30216-2_10).
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [978-3-540-23427-2](http://en.wikipedia.org/wiki/Special:BookSources/978-3-540-23427-2 "Special:BookSources/978-3-540-23427-2"). 
23. Arasu, A. and Novak, J. and Tomkins, A. and
    Tomlin, J. (2002). ["PageRank computation and the structure of the
    web: Experiments and
    algorithms"](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.18.5264).
    Proceedings of the Eleventh International World Wide Web
    Conference, Poster Track. Brisbane, Australia. pp. 107–117. 
24. Massimo Franceschet (2010). "PageRank:
    Standing on the shoulders of giants".
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[1002.2858](http://arxiv.org/abs/1002.2858) [[cs.IR](http://arxiv.org/archive/cs.IR)].
25. Nicola Perra and Santo Fortunato.; Fortunato
    (September 2008). "Spectral centrality measures in complex
    networks". Phys. Rev. E, 78 (3): 36107.
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[0805.3322](//arxiv.org/abs/0805.3322).
    [Bibcode](http://en.wikipedia.org/wiki/Bibcode "Bibcode"):[2008PhRvE..78c6107P](http://adsabs.harvard.edu/abs/2008PhRvE..78c6107P).
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1103/PhysRevE.78.036107](http://dx.doi.org/10.1103%2FPhysRevE.78.036107). 
26. Vince Grolmusz (2012). "A Note on the
    PageRank of Undirected Graphs". ArXiv 1205 (1960): 1960.
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[1205.1960](//arxiv.org/abs/1205.1960).
    [Bibcode](http://en.wikipedia.org/wiki/Bibcode "Bibcode"):[2012arXiv1205.1960G](http://adsabs.harvard.edu/abs/2012arXiv1205.1960G). 
27. Atish Das Sarma, Anisur Rahaman Molla, Gopal
    Pandurangan, Eli Upfal (2012). "Fast Distributed PageRank
    Computation".
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[1208.3071](http://arxiv.org/abs/1208.3071) [[cs.DC,cs.DS](http://arxiv.org/archive/cs.DC,cs.DS)].
28. [Google Webmaster
    central](http://www.google.com/support/forum/p/Webmasters/thread?tid=4aeb4d5fce33350b&hl=en)
    discussion on PR
29. [Fishkin,
    Rand](/w/index.php?title=Rand_Fishkin&action=edit&redlink=1 "Rand Fishkin (page does not exist)");
    Jeff Pollard (April 2, 2007). ["Search Engine Ranking Factors -
    Version 2"](http://www.seomoz.org/article/search-ranking-factors).
    [seomoz.org](http://en.wikipedia.org/wiki/Seomoz.org "Seomoz.org"). Retrieved May 11,
    2009.  Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))[[unreliable\\ source?](http://en.wikipedia.org/wiki/Wikipedia:Identifying_reliable_sources "Wikipedia:Identifying reliable sources")]
30. Dover, D. Search Engine Optimization
    Secrets Indianapolis. Wiley. 2011.
31. Viniker, D. The Importance of Keyword
    Difficulty Screening for SEO. Ed. Schwartz, M. Digital Guidebook
    Volume 5. News Press. p 160–164.
32. ["Ranking of listings : Ranking - Google
    Places
    Help"](http://support.google.com/places/bin/answer.py?hl=en&answer=7091).
    Google.com. Retrieved 2011-05-27. 
33. [https://en.wikipedia.orghttp://en.wikipedia.org/wiki/Google\_Directory\#Google\_Directory](https://en.wikipedia.orghttp://en.wikipedia.org/wiki/Google_Directory#Google_Directory)
34. ["How to report paid
    links"](http://www.mattcutts.com/blog/how-to-report-paid-links/).
    mattcutts.com/blog. April 14, 2007. Retrieved 2007-05-28. 
35. Jøsang, A. (2007). ["Trust and
    Reputation
    Systems"](http://www.unik.no/people/josang/papers/Jos2007-FOSAD.pdf)
    (PDF). In Aldini, A. Foundations of Security Analysis and Design
    IV, FOSAD 2006/2007 Tutorial Lectures. 4677. Springer LNCS
    4677. pp. 209–245.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1007/978-3-540-74810-6](http://dx.doi.org/10.1007%2F978-3-540-74810-6). 
36. SEOnotepad09_36-0) SEOnotepad. ["Myth of the
    Google Toolbar
    Ranking"](http://www.seonotepad.com/search-engines/google-seo/myth-of-the-google-toolbar-ranking/). 
37. Pankaj Gupta, Ashish Goel, Jimmy
    Lin, Aneesh Sharma, Dong Wang, and Reza Bosagh Zadeh [WTF: The
    who-to-follow system at
    Twitter](http://dl.acm.org/citation.cfm?id=2488433), Proceedings of
    the 22nd international conference on World Wide Web
38. Johan Bollen, Marko A. Rodriguez, and Herbert
    Van de Sompel.; Rodriguez; Van De Sompel (December 2006). "Journal
    Status". Scientometrics 69 (3): 1030.
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[cs.GL/0601030](//arxiv.org/abs/cs.GL/0601030).
    [Bibcode](http://en.wikipedia.org/wiki/Bibcode "Bibcode"):[2006cs........1030B](http://adsabs.harvard.edu/abs/2006cs........1030B). 
39. 39) Benjamin M. Schmidt and Matthew M. Chingos
    (2007). ["Ranking Doctoral Programs by Placement: A New
    Method"](http://www.people.fas.harvard.edu/~gillum/rankings_paper.pdf)
    (PDF). PS: Political Science and Politics 40 (July): 523–529. 
40. B Jiang (2006). "Ranking spaces for
    predicting human movement in an urban environment". International
    Journal of Geographical Information Science 23 (7): 823–837.
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[physics/0612011](//arxiv.org/abs/physics/0612011).
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1080/13658810802022822](http://dx.doi.org/10.1080%2F13658810802022822). 
41. Jiang B., Zhao S., and Yin J. (2008).
    "Self-organized natural roads for predicting traffic flow: a
    sensitivity study". Journal of Statistical Mechanics: Theory and
    Experiment. P07008 (7): 008.
    [arXiv](http://en.wikipedia.org/wiki/ArXiv "ArXiv"):[0804.1630](//arxiv.org/abs/0804.1630).
    [Bibcode](http://en.wikipedia.org/wiki/Bibcode "Bibcode"):[2008JSMTE..07..008J](http://adsabs.harvard.edu/abs/2008JSMTE..07..008J).
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1088/1742-5468/2008/07/P07008](http://dx.doi.org/10.1088%2F1742-5468%2F2008%2F07%2FP07008). 
42. Roberto Navigli, Mirella Lapata. ["An
    Experimental Study of Graph Connectivity for Unsupervised Word Sense
    Disambiguation"](http://www.dsi.uniroma1.it/~navigli/pubs/PAMI_2010_Navigli_Lapata.pdf).
    IEEE Transactions on Pattern Analysis and Machine Intelligence
    (TPAMI), 32(4), IEEE Press, 2010, pp. 678–692.
43. Andrea Esuli and Fabrizio Sebastiani.
    ["PageRanking WordNet synsets: An Application to Opinion-Related
    Properties"](http://nmis.isti.cnr.it/sebastiani/Publications/ACL07.pdf)
    (PDF). In Proceedings of the 35th Meeting of the Association for
    Computational Linguistics, Prague, CZ, 2007, pp. 424–431. Retrieved
    June 30, 2007. 
44. ["Working Papers Concerning the Creation of
    Google"](http://dbpubs.stanford.edu:8091/diglib/pub/projectdir/google.html).
    Google. Retrieved November 29, 2006. 
45. Cho, J., Garcia-Molina, H., and Page, L.
    (1998). ["Efficient crawling through URL
    ordering"](http://dbpubs.stanford.edu:8090/pub/1998-51).
    Proceedings of the seventh conference on World Wide Web (Brisbane,
    Australia). 
46. Burns, Judith (2009-09-04). ["Google trick
    tracks
    extinctions"](http://news.bbc.co.uk/2/hi/science/nature/8238462.stm).
    BBC News. Retrieved 2011-05-27. 
47. G Ivan and V. Grolmusz (2011). ["When the
    Web meets the cell: using personalized PageRank for analyzing
    protein interaction
    networks"](http://bioinformatics.oxfordjournals.org/content/27/3/405).
    Bioinformatics (Vol. 27, No. 3. pp. 405-407) 27 (3): 405–7.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1093/bioinformatics/btq680](http://dx.doi.org/10.1093%2Fbioinformatics%2Fbtq680).
    [PMID](http://en.wikipedia.org/wiki/PubMed_Identifier "PubMed Identifier") [21149343](//www.ncbi.nlm.nih.gov/pubmed/21149343). 
48. D Banky and G. Ivan and V. Grolmusz (2013).
    ["Equal opportunity for low-degree network nodes: a PageRank-based
    method for protein target identification in metabolic
    graphs"](http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0054204).
    PLoS One (Vol. 8, No. 1. e54204) 8 (1): 405–7.
    [Bibcode](http://en.wikipedia.org/wiki/Bibcode "Bibcode"):[2013PLoSO...854204B](http://adsabs.harvard.edu/abs/2013PLoSO...854204B).
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1371/journal.pone.0054204](http://dx.doi.org/10.1371%2Fjournal.pone.0054204).
    [PMID](http://en.wikipedia.org/wiki/PubMed_Identifier "PubMed Identifier") [23382878](//www.ncbi.nlm.nih.gov/pubmed/23382878). 
49. ["Preventing Comment
    Spam"](http://googleblog.blogspot.com/2005/01/preventing-comment-spam.html).
    Google. Retrieved January 1, 2005. 
50. ["PageRank Sculpting: Parsing the Value and
    Potential Benefits of Sculpting PR with
    Nofollow"](http://www.seomoz.org/blog/pagerank-sculpting-parsing-the-value-and-potential-benefits-of-sculpting-pr-with-nofollow).
    SEOmoz. Retrieved 2011-05-27. 
51. ["PageRank
    sculpting"](http://www.mattcutts.com/blog/pagerank-sculpting/).
    Mattcutts.com. 2009-06-15. Retrieved 2011-05-27. 
52. ["PageRank
    Distribution Removed From
    WMT"](http://www.google.com/support/forum/p/Webmasters/thread?tid=6a1d6250e26e9e48&hl=en).
    PageRank Distribution Removed From WMT. Retrieved October 16,
    2009 
53. WhatCulture!. 6 October 2011
    [http://whatculture.com/technology/google-pagerank-is-not-dead.php](http://whatculture.com/technology/google-pagerank-is-not-dead.php)
     missing title
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#bare_url_missing_title "Help:CS1 errors")).
    Retrieved 7 October 2011. 
54. [Google Panda Update: Say Goodbye to
    Low-Quality Link
    Building](http://searchenginewatch.com/article/2067687/Google-Panda-Update-Say-Goodbye-to-Low-Quality-Link-Building).
    Search Engine Watch. 08.02.11  Check date values in: 
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#bad_date "Help:CS1 errors"))
55. [So...You Think SEO Has
    Changed](http://searchenginewatch.com/article/2334934/So...-You-Think-SEO-Has-Changed).
    19.03.14.  Check date values in: 
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#bad_date "Help:CS1 errors"))

---
layout: post
title: My Top 10 Assertions about Data Warehouses
date: 2015-07-11
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: [My Top 10 Assertions about Data Warehouses](http://cacm.acm.org/blogs/blog-cacm/98136-my-top-10-assertions-about-data-warehouses/fulltext)

---


# My Top 10 Assertions about Data Warehouses
﻿
Michael Stonebraker는 Jim Gray와 함께 존경받는 DB 계의 두 guru 중의 한분입니다. 
이제는 71세의 고령 임에도 아직도 현역으로 왕성한 활동을 하는 분이죠. 
과거 버클리 교수로 재직시 Ingres/Postgres와 같은 DBMS 개발에
앞장섰고 퇴직 후 지금은 MIT 겸임교수로, 여러 벤처기업의 투자와 자문을
통해 Vertica나 VoltDB, SciDB같은 여러 DBMS들의 개발에도 참여해 왔습니다.

실무자들에게는 MapReduce를 초기에 D. DeWitt과 함께 신랄하게 깐 양반으로도 유명하지요.
어찌되었던 이 분의 기본적인 생각은  기존 DBMS 벤더들의  One Size Fits All 정책, 
즉 모든 기능들을 DBMS가 제공하는 것은 더이상 효과적이지 못하다라는 것이고, 이러한 생각을 3편의 논문으로 연달아 발표하기도
했습니다.

대표적인 시장이 데이터 웨어하우징 마켓인데요. 데이터 웨어하우스에서는
분석 업무가 주가 되기 때문에 쓰기보다는 읽기가 상대적으로 훨씬 많은 작업
패턴을 보이고 이에 따라 읽기 I/O를 줄이는 것이 중요 이슈입니다. 이를
위해서 기존의 행 단위의 레코드 기록을 하던 DBMS를 열 단위 레코드로
변환하는 컬럼 DB가 웨어하우스 시장에 많이 보급되었지요.  


이 분이 DW 시장에 대한 자신의 10가지 주장(assertion)에 대한 얘기를 했는데, 여기에서는 그에 대한 간단한 요약을 해볼까
합니다.
 
1. **Assertion 1: Star and snowflake schemas are a good idea in the data warehouse world.**
	- Star 또는 snowflake schema는 DW에서 좋은 아이디어.
 	- 스키마가 이런 모습이 아니라면 뭔가 이상한것임.
  
2. **Assertion 2: Column stores will dominate the data warehouse market over time, replacing row stores.**
	- column store 들이 DW 시장을 row store를 점진적으로 대체할 것임.
	- 가령 200 개의 컬럼을 갖는 행 기반 스토어에서는 1컬럼 값을 읽으려 해도 한행을 load 해야 하므로 199개의 낭비. 본질적으로 읽기 연산에서는 row store가 column store보다 우수할 수가 없다.
		
3. **Assertion 3: The vast majority of data warehouses are not candidates for main memory or flash memory.**
	- 데이터 웨어하우스는 메인 메모리나 플래시 메모리에 기록할 대상이 아니다. 
	- 데이터의 증가 속도는 스토리지의 비용 감소속도보다 더 빠르다.
 
4. **Assertion 4: Massively parallel processor (MPP) systems will be omnipresent in this market.**
	- 대용량 병렬 처리(MPP) 시스템은 DW 시장에서 매우 대중적이 될 것이다.(omnipresent)
	- "Don't bet on anything that is not in the MPP camp."
 
5. **Assertion 5: "No knobs" is the only thing that makes any sense.**
	- 자동화된 튜닝이 중요하다.
	- DW 시장에서는 인건비가 최대 비중. 이 인건비란 시스템과 DBMS 관리에 필요한 인력의 인건비를 의미.
	- 자동화된 튜닝 시스템을 만드는 것이 결과적으로 중요.
 
6. **Assertion 6: Appliances should be "software only."**
	- 어플라이언스는 단지 SW 만이어야 한다.
	- 본인의 40년 DBMS 경험에 비추어 특화된 DB 머신이 이기는 경우를 아직 보지 못했다.
	- 범용 머신을 제작하는 벤더들은 DB 머신을 제작하는 곳보다 훨씬 많고, 그만큼 가격도 훨씬 저렴하다. 
	- 본인 경험으로는 DB 어플라이언스란 HW + 패키징 사례로 생각된다. 미리 설정된 범용의 HW와 거기에 미리 잘 조직화되어 적재된 DBMS
	 
7. **Assertion 7: Hybrid workloads are not optimized by "one-size fits all."**
	- One size fits all DBMS은 복합적인 작업들을 지원하지 못한다. 
	- OLTP와 OLAP를 한 DBMS에서 모두 잘 지원한다는 것은 어려운 일이다.
 
8. **Assertion 8: Essentially all data warehouse installations want high availability (HA).**
	- 필수적으로 DW는 고가용성을 지원해야 한다.
 
9. **Assertion 9: DBMSs should support online reprovisioning.**
	- DBMS는 온라인 프로비저닝 기능을 제공해야 한다.
	- 운영 중에 노드 추가/삭제가 가능해져야 한다.
 
10. **Assertion 10: Virtualization often has performance problems in a DBMS world.**
	- 가상화는 DBMS 세계에서는 성능 문제를 야기한다.
	- CPU 자원은 약간의 오버헤드를 가지고 가상화한다 하더라도, DW는 디스크 I/O가 중요하다. 따라서 물리적인 데이터 배치 정보 등이 디스크 I/O를 향상시키기 위해 중요한데 가상화는 이를 가린다. 
	- 가상화의 이점 또한 많지만, 가상화된 I/O는 싸지 않다.
 
몇 개(2, 6, 10)는 논쟁 거리가 될 소지가 좀 보이기도 하는군요. 
언제나 CACM에서 M. Stonebraker의 글을 소개할때마다 열띤 논쟁이 벌어지는데요.
에디터가 실을때 마다 하는 얘기 중에 이사람의 글을 오래된 경험자의 글로써 존중 또는 생각되어야 한다는 글귀가 있습니다. 
물론, 여러 벤처기업들과의 금전적인 관계가 있기는 하지만..
 
## References 

1.  One size fits all: An idea whose time has come and gone, M
    Stonebraker… - Data Engineering, 2005. ICDE
2.  One size fits all? Part 2: Benchmarking results, M Stonebraker, C
    Bear, U Çetinteme, CIDR 2005
3.  The end of an architectural era:(it's time for a complete rewrite),
    M Stonebraker, S Madden, DJ Abadi,... VLDB 2007


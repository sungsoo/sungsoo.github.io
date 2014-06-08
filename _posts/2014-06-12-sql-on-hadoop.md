---
layout: post
title: What does “100 times faster than Hive” actually mean?
date: 2014-06-12
categories: [computer science]
tags: [big data, data management]

---



## Article Source
* Title: [SQL-on-Hadoop: What does “100 times faster than Hive” actually mean?](http://www.gruter.com/blog/?p=391)
* Authors:  Hyeong-jun Kim



[![](http://sungsoo.github.com/images/sql-on-hadoop-facts.png)](http://sungsoo.github.com/images/sql-on-hadoop-facts.png)

---

# SQL-on-Hadoop: What does “100 times faster than Hive” actually mean?

SQL-on-Hadoop technologies have been drawing considerable attention in
the big data analytics area of late. These solutions enable
developers—that is, users and data analysts—to process big data stored
on Hadoop via a familiar SQL interface rather than through complex
programming languages. As they are based on the well-established SQL
standard, these platforms can be easily integrated with existing data
analysis solutions used in the BI area; thus, it’s little surprise they
are generating so much interest.

Hive, developed at Facebook four years ago and now an Apache project,
has been the most popular SQL-on-Hadoop solution to date. Over the last
couple of years, however, alternative solutions have laid claim to being
faster than Hive by several times or even several hundred times. In this
post, I would like to examine a few of the key factors which affect the
performance of SQL-on-Hadoop, and explain how to distinguish the claims
being made about this new generation of products from the marketing
bluster.

## The main features of SQL-on-Hadoop

In order to assess the performance claims of the various new
SQL-on-Hadoop technologies, we first need to understand the general
features of these solutions.

In most cases, data files are stored on the Hadoop Distributed File
System (HDFS). As a general rule, these are in flat file format without
indexes. For read performance, data files can be stored in structured
format—for instance, RC, ORC or Parquet.

Another important component of such solutions is the use of SQL. Used in
data processing, SQL is executed in a distributed environment, with the
results then stored on HDFS or other file systems.

## SQL-on-Hadoop solutions

There are many different SQL-on-Hadoop solutions on the market. The most
prominent, Hive, converts SQL queries to MapReduce jobs, which means
that it inherits the strengths as well as weaknesses of the latter
model, such as M/R’s well-known stability and shuffling overheads.

Stinger seeks to correct some of those deficiencies by shifting Hive’s
platform from MapReduce to the distributed execution framework Tez; as
such, it does not function as a standalone solution, but is rather an
addendum to Hive which fixes some of Hive’s prior problems.

Apache Tajo, in contrast, runs queries using its own distributed
processing engine atop HDFS. Cloudera Impala also runs queries on its
own distributed computing platform, though it has a different challenge
to overcome: By keeping all data in memory at the shuffling stage,
Impala can avoid related shuffling overheads, but as a consequence it
cannot handle data which exceeds memory size.

Meanwhile, Apache Drill is in its early stages of development and has
not yet implemented its core distributed processing module. Other
options such as IBM’s Big SQL and Pivotal HAWQ, are also available,
though these are proprietary rather than open-source solutions.

## Key SQL-on-Hadoop performance factors

To gain a better grasp of the costs and benefits of each of these new
solutions, it is important to understand the key elements which underlie
the performance of SQL-on-Hadoop.

Since data files are usually stored on HDFS and full-scanned in most
cases, scanning speed affects processing speed more than any other
performance factor. Nevertheless, intermediate data transfer is also a
crucial cog in the wheel. Given that operations such as GROUP BY and
ORDER BY are executed in multiple processing steps, the efficiency (or
inefficiency as the case may be) of data transfer from each step to the
next affects performance significantly.

Furthermore, the efficiency of the execution plan of such query
operations also plays a major role in overall performance. For instance,
because Hive lacks native support for multiple reducers, it is unable to
exploit the power of the distributed processing platform when running
ORDER BY operations, thus severely limiting its effectiveness in such
instances.

Query execution initialization time—the period required for a query plan
to be built and a job initialized in a distributed environment—is yet
another important part of the SQL-on-Hadoop machinery. In cases of short
query execution times, initialization accounts for a significant portion
of the overall processing duration. However, in cases of relatively
longer query execution times (say, 100 sec plus), initialization
constitutes only a small fraction of the processing duration.

Another important consideration affecting SQL-on-Hadoop performance is
file format. Recently, a range of newer columnar file formats—such as
RCFile, ORCFile and Parquet—have been developed, joining
traditionally-used file formats such as textfile and seqfile. As these
file types have quite different properties, it is important to choose
the appropriate file format for the specific data and query types under
consideration.

Notably, in instances where queries generate large output data, the
performance of data file format and file writing can have a significant
impact on overall processing. For instance, the ORC file format has
strong read performance, but comparatively weak write performance. The
judicious use of compression as part of overall resource management is
therefore another important aspect of SQL-on-Hadoop systems.

## The absolute performance limits of SQL-on-Hadoop

Beyond the factors outlined above, it is also important to keep in mind
that SQL-on-Hadoop systems cannot presently exceed the following hard
performance constraint: Performance will be less than or equal to the
total size of disk bandwidth made available to the HDFS.

For example, ten servers having eight SATA 7200rpm disks each would have
a total performance capacity as follows:

  *10 servers * 8 disks * 100 MB/sec = 8 GB/sec*

In practice, performance comparisons between Hive, Tajo and Impala on
over 1.5TB data do not demonstrate much difference on queries such as
the following:

```sql
	select count(*) from T_TEST
```

This is because there are no shuffling overheads in this query, with the
main performance factors being file scanning speed, query execution
initialization time, and file format. Given the same file format and a
sufficiently large volume of data, file scanning speed becomes the
differentiating factor, and therefore the performance of each solution
is unlikely to vary much.

Consequently, across a range of natural field queries, if Hive were to
be rated a “1.0”, under present constraints new generation solutions
such as Stinger, Impala and Tajo are likely to be 1.5–3 times that at
most. As such, claims that a product is or aims to be “100 (or even
200!) times” faster than Hive are futuristic and are not rooted in
current practicable technology and methods. The design goal is of course
always to beat yesterday by 100-fold, but the relevant information here
concerns the known technical capabilities of the architecture and
methods which comprise the SQL-on-Hadoop solution being assessed.

## Frequently-used performance comparison queries

Due to the high query initialization costs of Hive—a problem not shared
by Stinger as it does not use MapReduce—its query execution time can be
dozens or even hundreds of times that of other solutions. Given this, if
hypothetical Solution A takes 0.1 sec to process a short-duration query,
and Hive takes 20 sec to perform the same task, it might be tempting to
conclude that Solution A outperforms Hive by 200x. However, this speed
advantage does not apply uniformly across all query types and query
sets. Thus, whereas Hive may take 200 seconds to resolve a query on a
very large data set, it is extremely unlikely that Solution A can also
process the same query in just one second (i.e., 200x faster). In other
words, the advantages that certain solutions have when dealing with
short-duration queries often preclude them from holding such an
advantage when dealing with relatively long-duration queries. This
asymmetry is the cause of much confusion in the market.

One way of starkly illustrating this asymmetry is to run comparative
tests which contain an ORDER BY operation. On Hive, ORDER BY is executed
on only one server, regardless of the cluster size. This means that in a
test environment of 100 servers, each running 10 concurrent tasks, a
solution that supports distributed ORDER BY can already theoretically
achieve results in the magnitude of 1000x times faster than Hive. The
fact that Hive does not yet support the use of multiple reducers means
that it is not entirely false to make a “1000x faster claim” right now;
nonetheless, it would be quite misleading for such a claim to be framed
as a meaningful general insight into the performance of SQL-on-Hadoop
solutions relative to Hive. And we could demonstrate much the same again
if we looked at JOIN, a query function heavily dependent upon the query
execution plan capabilities of each particular solution.

## Conclusion

As is the natural human wont, advocates of particular SQL-on-Hadoop
solutions tend to emphasize favorable performance results derived from
advantageous test settings, failing to explain the whole picture,
including results across the full set of ordinary queries. According to
our lab experiments, the average performance advantage over Hive tends
to be in the order of 3-5 times (with that multiple varying according to
the weights placed upon different query types).

As such, it is crucial that prospective users choose the platform which
best aligns with their specific data and query specs, and that they
investigate each SQL-on-Hadoop solution accordingly. Taking test claims
at face value—even in a field inhabited by sharp minds, reputable
vendors, passionate bloggers and an enthusiastic media—can be unwise.
After all, even the world of open source software is not immune to a
little exaggeration.

---

최근 SQL-On-Hadoop이라고 하여 Hadoop에 저장된 데이터를 MapReudce라는
프로그램을 이용하지 않고 개발자(또는 사용자, 데이터 분석가)에게 친근한
인터페이스인 SQL을 이용하여 데이터를 처리하는 솔루션이 많은 관심을 받고
있다.

SQL-On-Hadoop의 현재의 Hadoop기반 데이터 처리 플랫폼에서 중요한 이유는
SQL이라는 표준 기반이기 때문에 기존의 데이터 분석 솔루션(BI 도구) 등과
쉽게 연동될 수 있는 가능성을 보여주기 때문이다.
페이스북에서 개발하여 지금은 아파치 프로젝트인 Hive는 개발된지 5년
정도되었으며 가장 많이 사용하면 SQL-On-Hadoop 계열의 솔루션이라 할 수
있다. 최근 Hive와 유사한 개념으로 새로운 솔루션이 많이 등장하는데
하나같이 Hive 대비 몇배라는 슬로건을 걸고 있는데 몇배 수준이 아니라
몇십배, 심지어는 몇백배 이상 성능이 빠르다는 문구로 유혹하고 있다.
 
이번 글에서는 SQL-On-Hadoop의 성능 factor와 각 솔루션에서 제시하는 성능
수치가 타당한 내용인지를 밝혀보고자 한다.

## SQL-On-Hadoop 솔루션의 특징

* 대부분의 데이터 파일은 Hadoop 파일 시스템에 저장
* 데이터 파일은 인덱스가 없는 flat한 파일 형태가 대부분
* 데이터 파일은 읽기 성능 향상을 위해 일부 구조화된 형태로 저장(RC, ORC Parquet 등)
* SQL 문을 이용하여 데이터 처리
* SQL 문 실행은 분산된 환경에서 실행
* 처리 결과가 많은 경우 결과를 다시 Hadoop 또는 다른 파일 시스템으로 저장하는 기능 제공

## SQL-On-Hadoop 솔루션 종류

* [Hive](http://hive.apache.org): SQL을 MapReduce로 전환하여 실행, MapReduce의 장/단점을 그래도 가지고 있음(안정성, 셔플 오버헤드 등)
* [Stinger](http://hortonworks.com/labs/stinger/): 별도 제품이 아닌 Hive 개선 프로젝트 이름으로 Hive를 MapReduce 기반이 아닌 Tez 기반의 컴퓨팅 플랫폼 기반으로 전환하는 등 다양한 개선 목표를 가지고 진행 중인 프로젝트
* [Apache Tajo](http://tajo.incubator.apache.org/): hdfs에 저장된 파일을 별도의 컴퓨팅 플랫폼을 이용하여 질의 실행
* [Cloudera Impala](http://blog.cloudera.com/blog/2012/10/cloudera-impala-real-time-queries-in-apache-hadoop-for-real/): hdfs에 저장된 파일을 별도의 컴퓨팅 플랫폼을 이용하여 질의 실행. 셔플 단계의 데이터는 모두 메모리에 존재. 셔플 부하는 없지만 메모리 크기 이상의 셔플 데이터는 처리하지 못함
* Pivotal HAWQ: EMC의 소프트웨어 계열사인 Pivotal에서 만든 SQL-On-Hadoop 솔루션으로 오픈소스는 아님.
* [Apache Drill](http://incubator.apache.org/drill/):  Tajo와 유사한 프로젝트.
* 기타 등등: 많이 있음

## SQL-On-Hadoop 솔루션의 성능 factor
* Hadoop 파일 스캔 속도  
	데이터가 Hadoop에 저장되어 있고 특별한 경우를 제외하고는 대부분 full
scan으로 데이터 파일을 읽기 때문에 처리 속도에 가장 중요한 영향을
미친다.
* 중간 데이터 처리  
	group by, order by 등의 연산을 처리할 때에는 여러 단계의 실행 계획을
거쳐야 하는데 이때 앞 단계의 결과 데이터가 다음 단계의 입력 데이터로
전달되어야 한다. 이 데이터 전달을 어떻게 효과적으로 처리하느냐도 성능에
많은 영향을 준다.
* 실행계획  
	SQL을 얼마나 효과적인 실행계획으로 처리하느냐도 성능에 많은 영향을
준다. 예를 들어 order by의 경우 hive에서는 특별한 처리를 하지 않으면
무조건 하나의 reduce에서 처리하게 되어 분산의 효과가 거의 없다.
* 파일 포맷  
	과거에는 textfile이나 seqfile 정도만 사용하였는데 최근에는 컬럼
기반의 파일 포맷인 RCFile이나 이를 확장한 ORCFile과 parquet등 다양한
파일들이 나타나고 있으며 각 파일에 따라 특성이 조금 달라서 테이터의
특성, 질의의 특성에 따라 적절한 파일을 선택해야 한다.
* 결과 저장  
	처리 결과가 많은 경우 저장되는 데이터 파일의 포맷, 파일 저장 처리
성능 등도 많은 영향을 준다. ORC 파일의 경우 읽기 성능은 좋지만 쓰기
성능이 나쁜 대표적인 파일 포맷이다.
* 압축  
	적절한 압축을 잘 사용할 경우 읽기, 쓰기 모두 성능 향상을 가져 올 수
있다.
* 질의 실행 초기화 시간  
	실행계획 수립, 분산된 환경으로 질의 작업 요청 등에 걸리는 시간으로
짧은 질의인 경우 이 시간이 많은 영향을 주지만 100초 이상되는 질의에서는
많은 영향을 주지는 않는다.

## SQL-On-Hadoop의 절대 성능 수치

* SQL-On-Hadoop은 당분간은 절대 이 수치를 넘을 수는 없다.  
	성능 <= HDFS 전체의 디스크 갯수 * 디스크 bandwidth  
예를 들어 10대 서버, 서버 하나에 디스크 8개, SATA 7200 rpm인 경우  
     10대 * 8개 * 100MB/sec = 8GB/sec
* 실제로 1.5TB의 데이터를 Hive, Tajo, Impala를 이용하여 다음 질의를
수행하면 성능 차이는 크지 않다.  
    select count(*) from T_TEST  
	이 질의의 경우 셔플에 대한 부하는 거의 없으며 성능에 관련된 factor는
"파일 스캔 속도", "질의 실행 초기화 시간", "파일 포맷" 정도이다.  파일
포맷이 동일하다고 가정하고 데이터가 충분히 크기때문에 파일 스캔 속도가
가장 큰 영향을 주는 factor이다. 따라서 이 질의 경우 성능 차이가 각
솔루션별로 크지 않다. 성능 수치는 Hive를 1로 하면  Tajo, Impala는 1.5 ~
3배 정도이다. 100배, 200배와는 너무나 차이가 많이 나는 수치이다.

- 성능 비교에 자주 사용하는 질의
   . 질의 실행 시간이 짧은 질의
     Hive(Stinger가 아닌)의 경우 MapReduce 작업을 실행시켜야 하는 초기
비용이 많이 들기 때문에 질의 실행 시간이 10초 이상인 경우 수십배, 수백배
정도 성능 차이가 날수 있다. 성능 결과에  Hive는 20초 였는데 A 솔루션은
0.1초 라고 나오는 경우 200배 성능 향상이 있다고 주장하지만 이 수치를
200초로 확대했을 때 1초만 A 솔루션이 1초만 걸릴지는 의문이다. 200초로
확대했다는 의미는 입력 데이터가 더 커졌다는 의미이다.
 
   . 특정 솔루션에 최적화된 실행 계획
     Hive와 성능 비교를 할때 비교 대상 솔루션의 성능을 가장 돋보이게
하는 질의는 order by가 있는 질이이다. 여기에 order by 대상 데이터가 많고
테스트 클러스터가 크면 클수록 성능 차이는 크다.
     Hive의 경우 order by는 아무리 서버가 많아도 하나의 서버에서만
실행된다. 100대의 장비에 1대당 동시에 10개의 task를 실행시킬 수 있는
환경이고 경쟁 솔루션은 분산 order by를 지원할 경우 1000배의 성능 향상을
가져올 수 있다. 물론 Hive가 이런 기능을 제공하지 않기 떄문에 1000배라고
말하는 것이 맞기는 하지만 이 수치만으로 대부분의 질의에 평균 1000배의
성능 향상이 있다고 믿게끔 문서를 만들면 안된다.

    또 다른 실행계획 중 하나는 join인데 큰 테이블과 작은 테이블 여러개
join 처리를 하는 경우 어떻게 처리하느냐에 따라 성능 차이가 많이 나기
떄문에 이 부분도 솔루션의 특징에 따라 천차만별이다.

- 결론
현재 SQL-On-Hadoop 진영에서 제시하는 대부분의 성능 수치는 일반적인
질의나 전체 질의에 대해서 평균 몇배 빠르다가 아닌 자신들이 유리한
조건에서 테스트한 결과만을 언급하는 경우가 많다. 필자의 테스트 결과를
보면 대략 평균 3 ~ 5배 정도이고 질의의 종류에 따라 수십배 정도 빠를
수도 있고, 더 느릴 수도 있다. 
따라서 자신의 데이터 속성과 질의 속성에 맞는 플랫폼을 선택하는 안목이
필요할 때이다. 미국산 벤더, 블로그, 언론에서 제시한 수치라고 맹신하는
것은 금물이다. 요즘 추세가 오픈소스에도 구라를 무지하게 치는 추세로 가고
있는 것 같다.

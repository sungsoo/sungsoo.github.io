---
layout: post
title: Integration Tajo with Hive
date: 2014-04-26
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Tajo와 Hive의 통합 (Integration Tajo with Hive)](http://blrunner.com/61)
* Authors: [정재화](http://blrunner.com/)

 
# Tajo와 Hive의 통합 (Integration Tajo with Hive)



Tajo는 Hadoop 기반의 **데이터 웨어하우스(DW)**이며, MapReduce 기반의
Hive와는 다르게 *자체적인 SQL 엔진*으로 SQL을 처리합니다. 질의는 수초부터
수분까지 소요되는 *short-term-query*와 수시간 이상까지 소요될 수 있는
*long-term-query*까지 모두 지원합니다. 그 결과 ETL 작업과 *Add-hoc 질의*
처리 작업이 모두 가능합니다.




오늘은 Tajo의 여러 특징 중 하나인  Hive와의 통합 방법에 대해서
설명하고자 합니다. 우선 Tajo는 Hive와 통합을 위해 두 가지 방법으로
접근하고 있습니다.첫 번째는 **Hive에서 실행되는 질의인 HiveQL과의 통합**,
두번째는 **Hive의 모든 메타 정보를 저장하는 저장소인 HiveMetaStore 와
통합**입니다.




​1. HiveQL과 통합
---

Tajo는 질의를 처리하기 위해 자체적인 자료구조를 사용합니다. *Relational algebra*는
**JSON 형식**으로 데이터를 처리하며, 질의에서 사용하는 필드, 테이블, 조건 등
모든 속성들을 수용하도록 설계되어 있습니다. 사용자가 Tajo 클라이언트에서
SQL을 입력할 경우, Tajo는 SQL을 algebra로 변경하고, 이렇게 생성된
algebra를 이용해 질의 수행 계획(explan)을 수립하고, 질의 수행도
algebra를 이용해서 수행하게 됩니다.

예를 들어 사용자가 다음과 같은 질의 실행을 요청할 경우,

```sql
  select id, name, age, gender from people
```

Tajo는 다음과 같은 algebra를 생성합니다.

```json 
  {

   "all": false,

   "distinct": false,

   "targets": [

     {

       "expr": {

         "name": "id",

         "opType": "Column"

       },

       "opType": "Target"

     },

  ~~~~~~~~~~~~~~~~ 중략 ~~~~~~~~~~~~~~~~~~~~~~~~

   ],

   "child": {

     "relations": [

       {

         "tableName": "people",

         "opType": "Relation"

       }

     ],

     "opType": "RelationList"

   },

   "opType": "Projection"

  }
```


위와 같은 작업을 위해서 ANSI SQL 문법을 해석하고, 해석된 문법을 적절한
algebra로 변환해주는 Parser가 구현되어 있습니다. 이제 HiveQL을 어떤
식으로 접근했는지 감이 오실 것 같은데요. Tajo의 이러한 자료 구조는 SQL
뿐만 아니라 다른 질의 처리 언어도 수용이 가능합니다. *HiveQL도 Tajo
입장해서는 algebra 형태로 인식될 수 있다면, 얼마든지 처리가 가능합니다.*
그래서 HiveQL을 위한 Parser를 개발했습니다. 이 Parser는 Hive 의 문법을
인식하고, 이를 algebra로 변환합니다. 물론 모든 HiveQL 문법을 수용하지는
않으며, Tajo가 수용 가능한 범위 내에서만 허용하고 있습니다.



Tajo는 기본 문법을 ANSI SQL로 쓰고 있기 때문에, HiveQL을 사용하기
위해서는 다음과 같은 명령어를  실행해주면 됩니다.


```
  set tajo.hive.query.mode=true;
```



위 옵션이 활성화 된 상태에서는 HiveQL을 계속 사용할 수 있으며, 다시 ANSI
SQL 모드로 돌아가고 싶을 경우에는 <tt class="literal">set tajo.hive.query.mode=false</tt> 를
실행해주면 됩니다.




현재 Tajo는 ANSI SQL과 HiveQL만을 지원하지만, algebra라는 유연한
아키텍처에서는 PigLatin과 같은 절차적 스크립트 언어나 다른 언어들도
수용할 수 있습니다. 앞으로 얼마나 많은 언어들을 수용해갈 지, 기대되는
부분이기도 합니다.




![](http://cfile2.uf.tistory.com/image/2324F24152E5C09A30654C)



**그림 1. Tajo algebra 파싱 흐름도**






​2. HiveMetaStore와 통합
---



Tajo는 모든 메타 데이터를 **CatalogServer**에 저장하며, CatalogServer는
Catalog 인터페이스의 API를 호출하도록 설계되어 있습니다. Catalog
인터페이스는 테이블 생성, 테이블 조회, 함수 생성, 함수 조회 메타 데이터
처리를 위한 기본적은 API를 제공합니다. CatalogServer 입장에서는 Catalog
인터페이스만 정확하게 구현되어 있다면, 어떠한 DB라도 사용이 가능합니다.
참고로 Tajo 0.2 버전에서는 DerbyDB와 MySQL을 대상으로 Catalog
인터페이스가 구현되어 있습니다.









![](http://cfile23.uf.tistory.com/image/213F1F4252E75A4114ACD8)





**그림 2. CatalogStore 인터페이스 구조**






그렇다면 **TajoCatalog**와 **HiveMetaStore**와는 어떻게 통합 해야 할까요? Tajo
입장에서는 HiveMetaStore도 하나의 Catalog 서버 일뿐입니다.
HiveMetaStore가 어떤 DB에 저장되어 있든, Catalog 인터페이스만 구현되어
있다면 수용할 수 있습니다. 그래서 저희가 도입한 방법은 **HCatalog**를
이용하는 것입니다. HCatalog는 Hadoop 기반의 데이터 처리 시스템(Hive,
Pig, MapReduce)를 위한 메타 데이터 레이어로, Hadoop 기반의 데이터 처리
시스템들이 서로 메타 데이터를 서로 공유할 수 있도록 API를 제공합니다.




Tajo는 Catalog 인터페이스의 API를 HCatalog를 이용해 구현 했으며, Tajo
에서 HiveMetaStore에 저장된 테이블을 조회할 수 있습니다. Hive 사용자들은
Hive로 구현된 테이블들이 많기 때문에, 이를 쉽게 수정하거나, 삭제할 수는
없을 것입니다. 하지만 Tajo의 HCatalog 통합 기능을 이용한다면, 기존의
Hive 테이블들을 Tajo에서 조회하고, 또한 **Tajo에서 INSERT 질의도 실행할 수
있기 때문에 HiveMetaStore에 대한 부담을 줄일 수 있습니다.**




Tajo에서 HiveMetaStore를 이용하기 위해서는 우선 다음과 같이 tajo를
빌드해야 합니다. 빌드할때 Phcatalog-0.1x.0 옵션을 사용하는데,
hive-0.11.0 을 사용중이라면, Phcatalog-0.11.0을, hive-0.12.0을
사용중이라면 Phcatalog-0.12.0을 사용하면 됩니다.



```  
$ git clone [https://git-wip-us.apache.org/repos/asf/incubator-tajo.git](https://www.google.com/url?q=https%3A%2F%2Fgit-wip-us.apache.org%2Frepos%2Fasf%2Fincubator-tajo.git&sa=D&sntz=1&usg=AFQjCNEysEPV3dYv_cUfsfHXRBQz68hemw) tajo
$ mvn clean package -DskipTests -Pdist -Dtar -Phcatalog-0.1x.0
$ ls tajo-dist/target/tajo-0.8.0-SNAPSHOT.tar.gz
```




빌드가 완료되면 환경설정 변수에 hive 관련 설정을 추가해주면 됩니다. 우선
tajo-env.sh에 다음과 같이 Hive가 설치된 경로를 <tt class="literal">HIVE_HOME</tt>으로 설정하고,
HiveMetaStore를 위해 사용하는 JDBC 드라이버 경로를
<tt class="literal">HIVE_JDBC_DRIVER_DIR</tt> 로 설정하면 됩니다.




```  
export HIVE_HOME=하이브 설치 경로
export HIVE_JDBC_DRIVER_DIR=JDBC 드라이버 경로/드라이버 파일명
```



마지막으로 catalog-site.xml에 다음과 같이 HCatalog를 CatalogServer로
사용하겠다는 설정을 하면 됩니다.




```xml
  <?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

  <configuration>

   <property>

     <name>tajo.catalog.store.class</name>

     <value>org.apache.tajo.catalog.store.HCatalogStore</value>

   </property>

  </configuration>
```



HiveMetaStore 서버 주소와 JDBC 접속 설정이 없는데, 어떻게 Tajo 가
HiveMetaStore를 접속하는지 궁금하실 것 같은데요. HIVE_HOME의 conf
디렉토리에 있는 <tt class="literal">hive-site.xml</tt>을 이용해 HiveMetaStore를 이용할 수
있습니다.




![](http://cfile27.uf.tistory.com/image/24089D4352D347A12C3209)





**그림 3. HCatalogStore와 HiveMetaStore 연동 구조도**
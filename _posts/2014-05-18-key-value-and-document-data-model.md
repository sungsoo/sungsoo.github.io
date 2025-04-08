---
layout: post
title: Key-Value and Document Data Models
date: 2014-05-18
categories: [computer science]
tags: [big data]

---


## Article Source
* Title: *NoSQL Distilled; A Brief Guide to the Emerging World of Polyglot Persistence*, 2013.
* Authors: Pramod J. Sadalage, Martin Fowler



[![](http://sungsoo.github.com/images/key-value-document-data-model.png)](http://sungsoo.github.com/images/key-value-document-data-model.png)

# Key-Value Model and Document Data Model

키-값 데이터베이스와 문서 데이터베이스는 강력하게 집합 지향적이다. 이런 데이터베이스는 주로 집합을 통해 구축됨을 뜻한다. 이 두 형태의 데이터베이스는 모두 많은 집합으로 구성되어 있고 각 집합은 데이터를 얻는 데 사용하는 키나 아이디를 가지고 있다.

두 모델은 차이가 있다. 키-값 데이터베이스에서는 집합 구조가 불투명하다. 즉 대부분 의미 없는 바이너리 데이터처럼 취급된다. 이와 반대로 문서 데이터베이스는 집합의 구조를 볼 수 있다. 불투명성의 장점은 집합 안에 무엇이든 저장할 수 있다는 점이다. 데이터베이스에 일반적인 크기 제한 같은 것은 있을 수 있지만, 그 외에는 완전 자유다. 문서 데이터베이스는 집합에 허용되는 구조와 타입을 정의해 그 안에 들어갈 수 있는 것을 제한한다. 그러나 데이터에 접근할 때 융통성이 더 많다.

키-값 저장소에서는 키를 통해서만 집합에 접근할 수 있다. 문서 데이터베이스에서는 집합의 필드를 이용해 데이터베이스에 질의를 보낼 수 있고, 집합의 전체 대신 일부를 조회할 수 있으며, 집합의 내용을 이용해 인덱스를 만들 수도 있다.

실제로는 키-값 저장소와 문서 데이터베이스 간 구분이 조금 모호해졌다. 사람들은 키-값 형식으로 검색하려고 문서 데이터베이스에 ID 필드를 넣기도 한다. 키-값 데이터베이스로 분류된 데이터베이스는 불투명한 집합 이상의 데이터 구조 정의를 허용한다. 예를 들어 리악은 인덱스 생성이나 집합 간 연결을 위한 메타데이터 추가를 허용하고, 레디스(Redis)는 집합을 리스트나 집합(set)으로 분해하는 것을 허용한다. 솔라(Solr) 같은 검색 도구를 통합해 쿼리를 지원할 수도 있다. 예로 리악에는 JSON이나 XML 구조로 저장된 집합에 솔라와 비슷한 방식으로 검색을 실행할 수 있는 기능이 포함되어 있다.

모호한 면이 있기는 하지만 일반적인 구분은 여전히 유효하다. 키-값 데이터베이스에서는 키를 통해 집합을 찾는다. 문서 데이터베이스에서는 문서 내부 구조를 기초로 어떤 형태의 쿼리를 실행한다. 키를 사용할 수도 있지만 대부분의 경우는 다른 것을 사용한다.

---

We said earlier on that key-value and document databases were strongly *aggregate-oriented*. What we meant by this was that we think of these databases as primarily constructed through aggregates. Both of these types of databases consist of lots of aggregates with each aggregate having a key or ID that’s used to get at the data.

The two models differ in that in a key-value database, the aggregate is opaque to the database—just some big blob of mostly meaningless bits. In contrast, a document database is able to see a structure in the aggregate. The advantage of opacity is that we can store whatever we like in the aggregate. The database may impose some general size limit, but other than that we have complete freedom. A document database imposes limits on what we can place in it, defining allowable structures and types. In return, however, we get more flexibility in access.

With a key-value store, we can only access an aggregate by lookup based on its key. With a document database, we can submit queries to the database based on the fields in the aggregate, we can retrieve part of the aggregate rather than the whole thing, and database can create indexes based on the contents of the aggregate.

In practice, the line between key-value and document gets a bit blurry. People often put an ID field in a document database to do a key-value style lookup. Databases classified as key-value databases may allow you structures for data be “yond just an opaque aggregate. For example, Riak allows you to add metadata to aggregates for indexing and interaggregate links, Redis allows you to break down the aggregate into lists or sets. You can support querying by integrating search tools such as Solr. As an example, Riak includes a search facility that uses Solr-like searching on any aggregates that are stored as JSON or XML structures.

Despite this blurriness, the general distinction still holds. With key-value databases, we expect to mostly look up aggregates using a key. With document databases, we mostly expect to submit some form of query based on the internal structure of the document; this might be a key, but it’s more likely to be something else.
---
layout: post
title: Key Points from NoSQL Distilled
date: 2014-02-15 
categories: [computer science]
tags: [big data]

---

Why NoSQL?
---

This book [1] seeks to give you enough information to answer the question of whether NoSQL databases are worth serious consideration for your future projects. Every project is different, and there's no way we can write a simple decision tree to choose the right data store. Instead, what we are attempting here is to provide you with enough background on how NoSQL databases work, so that you can make those judgments yourself without having to trawl the whole web. We've deliberately made this a small book (just 152 pages), so you can get this overview pretty quickly. It won't answer your questions definitively, but it should narrow down the range of options you have to consider and help you understand what questions you need to ask.

* Relational databases have been a successful technology for twenty years, providing persistence, concurrency control, and an integration mechanism.

* Application developers have been frustrated with the impedance mismatch between the relational model and the in-memory data structures.

* There is a movement away from using databases as integration points towards encapsulating databases within applications and integrating through services.

* The vital factor for a change in data storage was the need to support large volumes of data by running on clusters. Relational databases are not designed to run efficiently on clusters.

* NoSQL is an accidental neologism. There is no prescriptive definition—all you can make is an observation of common characteristics.

* The common characteristics of NoSQL databases are
	* Not using the relational model
	* Running well on clusters
	* Open-source
	* Built for the 21st century web estates
	* Schemaless

* The most important result of the rise of NoSQL is Polyglot Persistence.


* 관계형 데이터베이스 20년 이상 성공적인 기술이고 지속성, 동시성 제어, 통합 메커니즘을 제공한다.
* 애플리케이션 개발자는 관계형 모델과 메모리 내 데이터 구조 간의 객체-관계 불일치로 불만이 많다.
* 데이터베이스를 통합점으로 사용하는 방식에서 데이터베이스를 애플리케이션 안에 캡슐화하고 서비스를 통해 통합하는 방식으로 이동하려는 움직임이 있다.
* 데이터 저장소 변화의 중요 요인은 클러스터에서 실행되는 엄청난 양의 데이 터를 지원해야 한다는 점이었다. 관계형 데이터베이스는 클러스터에서 효율적으로 동작하도록 설계되지 않았다.
* NoSQL은 우연한 신조어다. 규정된 정의도 없다. 공통 특징을 살펴볼 수밖에 없다.
* NoSQL의 공통 특징은 다음과 같다.
	- 관계형 모델을 사용하지 않는다.
	- 클러스터에서 잘 동작한다.
	- 오픈 소스다.
	- 21세기 웹 환경을 위해 구축되었다. 
	- 스키마가 없다.
* NoSQL 등장의 가장 중요한 결과는 다중 저장소 지속성이다.


Aggregate Data Models
---

* An aggregate is a collection of data that we interact with as a unit. Aggregates form the boundaries for ACID operations with the database.

* Key-value, document, and column-family databases can all be seen as forms of aggregate-oriented database.

* Aggregates make it easier for the database to manage data storage over clusters.

* Aggregate-oriented databases work best when most data interaction is done with the same aggregate; aggregate-ignorant databases are better when interactions use data organized in many different formations.

More Details on Data Models
---

* Aggregate-oriented databases make inter-aggregate relationships more difficult to handle than intra-aggregate relationships.

* Graph databases organize data into node and edge graphs; they work best for data that has complex relationship structures.

* Schemaless databases allow you to freely add fields to records, but there is usually an implicit schema expected by users of the data.

* Aggregate-oriented databases often compute materialized views to provide data organized differently from their primary aggregates. This is often done with map-reduce computations.

Distribution Models
---

* There are two styles of distributing data:
	* *Sharding* distributes different data across multiple servers, so each server acts as the single source for a subset of data.
![](http://sungsoo.github.com/images/sharding.png)
	* *Replication* copies data across multiple servers, so each bit of data can be found in multiple places.
	
	A system may use either or both techniques.

* **Replication** comes in two forms:
	* *Master-slave replication* makes one node the authoritative copy that handles writes while slaves synchronize with the master and may handle reads.
![](http://sungsoo.github.com/images/master-to-slaves.png)  
	* *Peer-to-peer replication* allows writes to any node; the nodes coordinate to synchronize their copies of the data.  
![](http://sungsoo.github.com/images/peer-to-peer-replication.png)  

	Master-slave replication *reduces* the chance of *update conflicts* but peer-to-peer replication avoids loading *all* writes onto a single point of failure.  
![](http://sungsoo.github.com/images/master-slave-replication-with-sharding.png)

![](http://sungsoo.github.com/images/peer-to-peer-replication-with-sharding.png)	
Consistency
---

* Write-write conflicts occur when two clients try to write the same data at the same time. Read-write conflicts occur when one client reads inconsistent data in the middle of another client's write.

* Pessimistic approaches lock data records to prevent conflicts. Optimistic approaches detect conflicts and fix them.

![](http://sungsoo.github.com/images/read-write-conflict.png)

* Distributed systems see read-write conflicts due to some nodes having received updates while other nodes have not. Eventual consistency means that at some point the system will become consistent once all the writes have propagated to all the nodes.

* Clients usually want read-your-writes consistency, which means a client can write and then immediately read the new value. This can be difficult if the read and the write happen on different nodes.

* To get good consistency, you need to involve many nodes in data operations, but this increases latency. So you often have to trade off consistency versus latency.

![](http://sungsoo.github.com/images/replication-inconsistency.png)

* The CAP theorem states that if you get a network partition, you have to trade off availability of data versus consistency.

* Durability can also be traded off against latency, particularly if you want to survive failures with replicated data.

* You do not need to contact all replicants to preserve strong consistency with replication; you just need a large enough quorum.


![](http://sungsoo.github.com/images/network-partition.png)


Version Stamps
---
* Version stamps help you detect concurrency conflicts. When you read data, then update it, you can check the version stamp to ensure nobody updated the data between your read and write.

* Version stamps can be implemented using counters, GUIDs, content hashes, timestamps, or a combination of these.

* With distributed systems, a vector of version stamps allows you to detect when different nodes have conflicting updates.

Map-Reduce
---

* Map-reduce is a pattern to allow computations to be parallelized over a cluster.

* The map task reads data from an aggregate and boils it down to relevant key-value pairs. Maps only read a single record at a time and can thus be parallelized and run on the node that stores the record.

* Reduce tasks take many values for a single key output from map tasks and summarize them into a single output. Each reducer operates on the result of a single key, so it can be parallelized by key.

* Reducers that have the same form for input and output can be combined into pipelines. This improves parallelism and reduces the amount of data to be transferred.

* Map-reduce operations can be composed into pipelines where the output of one reduce is the input to another operation's map.

* If the result of a map-reduce computation is widely used, it can be stored as a materialized view.

* Materialized views can be updated through incremental map-reduce operations that only compute changes to the view instead of recomputing everything from scratch.

Schema Migrations
---

* Databases with strong schemas, such as relational databases, can be migrated by saving each schema change, plus its data migration, in a version-controlled sequence.

* Schemaless databases still need careful migration due to the implicit schema in any code that accesses the data.

* Schemaless databases can use the same migration techniques as databases with strong schemas.

* Schemaless databases can also read data in a way that's tolerant to changes in the data's implicit schema and use incremental migration to update data.

Polyglot Persistence
---

* Polyglot persistence is about using different data storage technologies to handle varying data storage needs.

* Polyglot persistence can apply across an enterprise or within a single application.

* Encapsulating data access into services reduces the impact of data storage choices on other parts of a system.

* Adding more data storage technologies increases complexity in programming and operations, so the advantages of a good data storage fit need to be weighed against this complexity.

Beyond NoSQL
---

* NoSQL is just one set of data storage technologies. As they increase comfort with polyglot persistence, we should consider other data storage technologies whether or not they bear the NoSQL label.


Choosing Your Database
---

* The two main reasons to use NoSQL technology are:
	* To improve programmer productivity by using a database that better matches an application's needs.
	* To improve data access performance via some combination of handling larger data volumes, reducing latency, and improving throughput.

* It's essential to test your expectations about programmer productivity and/or performance before committing to using a NoSQL technology.

* Service encapsulation supports changing data storage technologies as needs and technology evolve. Separating parts of applications into services also allows you to introduce NoSQL into an existing application.

* Most applications, particularly nonstrategic ones, should stick with relational technology—at least until the NoSQL ecosystem becomes more mature.

References
---
[1] Pramod J. Sadalage and Martin Fowler, *NoSQL Distilled*, 2013.
















































































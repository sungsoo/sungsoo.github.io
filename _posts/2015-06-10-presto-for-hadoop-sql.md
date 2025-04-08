---
layout: post
title: Teradata Bets Big on Presto for Hadoop SQL
date: 2015-06-10
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Teradata Bets Big on Presto for Hadoop SQL](http://www.datanami.com/2015/06/08/teradata-bets-big-on-presto-for-hadoop-sql/?__scoop_post=616b18b0-0ebb-11e5-b6d5-001018304b75&__scoop_topic=2632326#__scoop_post=616b18b0-0ebb-11e5-b6d5-001018304b75&__scoop_topic=2632326)
* Authors: Alex Woodie


---

# Teradata Bets Big on Presto for Hadoop SQL

Teradata today revealed it’s making a major investment in Presto, the SQL-on-Hadoop framework originally developed at Facebook to power interactive queries against its massive data warehouse. Not only is Teradata stepping up to provide technical services and support for the open source SQL engine, but it’s committing engineering resources to improve Presto over time.

As more companies get their feet wet with Hadoop, they’re gravitating toward the familiar functionality that SQL offers. While Structured Query Language can’t be used to analyze everything going into Hadoop—the unstructured and semi-structure data in particular—SQL is proving to be a critical element in many Hadoop clusters.

Demand for SQL-on-Hadoop solutions is high, but the existing solutions haven’t been fulfilling those expectations, according to Teradata‘s Ron Bodkin.

“We’re seeing that customers have been disappointed by the options that have been available today, that are incomplete, that don’t work well, that are not a good fit for what they’d like to have out of a SQL engine on Hadoop,” Bodkin tells Datanami. “A lot of times [the SQL engines] will crash when they throw real-world queries at the them, or they don’t support the complete set of SQL.”

There’s no shortage of contenders in the battle for SQL-on-Hadoop supremacy. All of the Hadoop distributors are working feverishly to ensure that customers can SQL runs well on Hadoop. Hortonworks backs Hive, the first SQL-on-Hadoop offering that originally used MapReduce. Cloudera set its SQL sites high with Impala, which seeks to make SQL-on-Hadoop  run more like it does on relational systems. MapR Technologies includes Imapala and is also a big believer in Apache Drill, which excels against semi-structured JSON documents. And IBM has its own flavor called BigSQL.

Rounding out the SQL sweepstakes from the wider software community are the HAWQ engine from Pivotal (which now backs Hortonworks’ distribution); Vortex, which is a parallelized version of the Vector relational SQL engine from Actian; Spark SQL (formerly Shark); and Big Data SQL from Oracle.

And finally there’s Presto, a Java-based SQL engine developed by Facebook and released as open source software in November 2013. Facebook was an early Hadoop adopter, and developed Hive to provide SQL capabilities against its Hadoop-based data warehouse, which now stands at a whopping 400 PB. But eventually Facebook sought a faster alternative to Hive and its MapReduce underpinnings, which could take hours to return queries.

![](http://sungsoo.github.com/images/Presto_1.png)
**Presto's in-memory architecture processes SQL queries 10 times faster than Hive, according to Facebook**


When Facebook released Presto, the in-memory SQL framework was eight to 10 times faster than Hive, and four to seven times more CPU efficient. While Hive has sped up under Hortonworks’ Stinger initiative, Presto still maintains performance advantages over its older Facebook cousin, thanks largely to the fact that Presto features a purpose-built query execution engine “that uses high-level operators and is aware of the semantics of SQL,” Facebook engineer Martin Traverso said in a presentation.  “That gives us a bit more freedom on the kinds of optimizations we can do, and allows us to [make] better decision in terms of when and where to execute things.”

Teradata sees Presto filling a specific niche, primarily running interactive queries against large sets of data with low latency and a lot of users, Bodkin says. The fact that Presto can push queries outside of Hadoop into other data repositories, including NoSQL, relational databases, and proprietary data stores, also provides a degree of flexibility that can’t be found in other Hadoop engines. Teradata will position Presto as a preferred solution when quick answers are needed, and leave Hive to power long-running batch queries.

Getting the resources of a company like Teradata behind Presto will undoubtedly improve the project’s position in the marketplace. The technical support program that Teradata launched for Presto is the first-ever for on-premise deployments, Bodkin says. What’s more, Teradata has committed 15 engineers to work on Presto and to help shape the future of the open source project. Those engineers largely come from Hadapt, the SQL-on-Hadoop software company that it acquired last year, Bodkin says.

“We think Presto is well-positioned to be the leading technology as it matures,” says Bodkin, founder of Think Big Analytics, which Teradata also bought last year. “We’re putting a lot of effort into making Presto…work well in the enterprise and offering commercial support, so companies can feel good that there’s a technology provider who’s going to stand behind the technology and make it work and respond to defects.”

![](http://sungsoo.github.com/images/Presto_2.png)

Teradata also unveiled a three-step roadmap for Presto with the aim of making it a trusted part of the emerging Hadoop software stack. Integration with Hadoop’s YARN core and the Ambari management interface will be instrumental in achieving that goal. Training, custom-development, and Presto “jumpstart” services were also unveiled.

Presto also figures into Teradata’s plans for a Unified Data Architecture (UDA) that unite its traditional Teradata Database and Aster environments with Hadoop. “The ability to have high quality SQL on Hadoop is extremely important for Teradata UDA,” Bodkind says. “Nobody has more expertise in building advanced SQL engines than Teradata. So having the ability to step in and make Presto successful is a big deal.”

Teradata made two other Hadoop-related announcements today, which is the eve of the Hadoop Summit taking place in San Jose this week.

First it unveiled a new version of RainStor, which is an advanced archive solution for Hadoop that Teradata bought earlier this year. With Rainstor version 7, the Rainstor engine is now a full member of the UDA club, which means that Teradata customers can use the company’s QueryGrid functionality to push queries down from Teradata Database and Aster environments into Rainstor.

Second, Teradata unveiled a new release of Loom, a Hadoop software product acquired last year from Revelytix that provides data management, transformation, and cleansing capabilities. With Loom 2.5, the company is providing more fine-grained authentication of users. It’s also touting “faster data discovery through personalization” and a new “measurement model” aimed at making it easier to see how different files compare within Hadoop.


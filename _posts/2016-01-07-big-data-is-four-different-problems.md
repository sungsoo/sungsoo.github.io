---
layout: post
title: Big Data is (at least) Four Different Problems
date: 2016-01-07
categories: [computer science]
tags: [big data]

---


# Big Data is (at least) Four Different Problems

Michael Stonebraker, Co-Director, Intel Science & Technology Center, MIT

Special Lecture Series: William Gould Dow Distinguished Lectureship  
Sponsoring Department: EECS  
[https://www.eecs.umich.edu/](https://www.eecs.umich.edu/)

"Big Data" means different things to different people. 
To me, it means one of four totally different problems:

*Big volumes* of data, but "*small*" analytics. The traditional data warehouse vendors support SQL analytics on very large volumes of data. 
In this talk, I make a few comments on where I see this market going.
Big analytics on big volumes of data. By big analytics, I mean data clustering, regressions, machine learning, and other much more complex analytics on very large amounts of data. I will explain the various approaches to integrating complex analytics into DBMSs, and discuss which ones seem more promising. In addition, I will explore why Hadoop, in its current form, will not be a player in this market.

*Big velocity*. By this I mean being able to absorb and process a firehose of incoming data for applications like electronic trading. In this market, the traditional SQL vendors are a non-starter. I will discuss alternatives including complex event processing (CEP), NoSQL and NewSQL systems. I will also make a few comments about the "Internet of Things."

*Big Diversity*. Many enterprises are faced with integrating a larger and larger number of data sources with diverse data (spreadsheets, web sources, XML, traditional DBMSs). The traditional ETL products do not appear up to the challenges of this new world, and I talk about an alternate way to go.

<iframe width="600" height="400" src="https://www.youtube.com/embed/KRcecxdGxvQ" frameborder="0" allowfullscreen></iframe>

## About the Speaker:

**Michael Stonebraker** (MS 1966, PhD 1971) has been a pioneer of database research and technology for more than a quarter of a century. He was the main architect of the INGRES relational DBMS, and the object-relational DBMS, POSTGRES. These prototypes were developed at the University of California at Berkeley where Stonebraker was a Professor of Computer Science for twenty five years. More recently at MIT, he was a co-architect of the Aurora/Borealis stream processing engine, the C-Store column-oriented DBMS, the H-Store transaction processing engine, the SciDB array DBMS, and the Data Tamer data curation system. He presently serves as Chief Technology Officer of Paradigm4 and Tamr, Inc.
Stonebraker was awarded the ACM System Software Award in 1992 for his work on INGRES. Additionally, he was awarded the first annual SIGMOD Innovation award in 1994, and was elected to the National Academy of Engineering in 1997. He was awarded the IEEE John Von Neumann award in 2005, and the ACM AM Turing Award - the "Nobel Prize of computing" in 2014. He is presently an Adjunct Professor of Computer Science at MIT, where he is co-director of the Intel Science and Technology Center focused on big data.

Speaker Website: [https://www.csail.mit.edu/user/1547](https://www.csail.mit.edu/user/1547)
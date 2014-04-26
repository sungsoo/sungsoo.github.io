---
layout: post
title: Introducing the case study - Google
date: 2014-04-26
categories: [computer science]
tags: [hadoop & mapreduce, nosql]

---

## Article Source
* Title: [Tajo와 Hive의 통합 (Integration Tajo with Hive)](http://blrunner.com/61)
* Authors: [정재화](http://blrunner.com/)

![](http://sungsoo.github.com/images/case-study-google.png)
 
# Introducing the case study: Google
Google [www.google.com III] is a US-based corporation with its headquarters in Mountain View, California (the Googleplex), offering Internet search and broader web applications and earning revenue largely from advertising associated with such services. The name is a play on the word googol, the number 10100 (or 1 followed by a hundred zeros), emphasizing the sheer scale of information available in the Internet today. Google’s mission is to tame this huge body of information: ‘to organize the world’s information and make it universally accessible and useful’ [www.google.com III].Google was born out of a research project at Stanford University, with the company launched in 1998. Since then, it has grown to have a dominant share of the Internet search market, largely due to the effectiveness of the underlying ranking algorithm used in its search engine (discussed further below). Significantly, Google has diversified, and as well as providing a search engine is now a major player in cloud computing.From a distributed systems perspective, Google provides a fascinating case study with extremely demanding requirements, particularly in terms of scalability, reliability, performance and openness (see the discussion of these challenges in Section 1.5). For example, in terms of search, it is noteworthy that the underlying system has successfully scaled with the growth of the company from its initial production system in 1998 to dealing with over 88 billion queries a month by the end of 2010, that the main search engine has never experienced an outage in all that time and that users can expect query results in around 0.2 seconds [googleblog.blogspot.com I]. The case study we present here will examine the strategies and design decisions behind that success, and provide insight into design of complex distributed systems.Before proceeding to the case study, though, it is instructive to look in more detail at the search engine and also at Google as a cloud provider.
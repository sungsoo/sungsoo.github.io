---
layout: post
title: Advanced Metasearch Engine Technology
date: 2014-02-21
categories: [computer science]
tags: [data management]

---

Advanced Metasearch Engine Technology
---
### Introduction

The World Wide Web (simply referred to as the Web) has emerged as the largest information source in recent years. People all over the world use the Web to find needed information on a regular basis. Indeed, the Web has already become an important part in many people’s daily lives.

The Web has been expanding very rapidly since its emergence in 1990. It can be divided into the *surface Web* and the *deep Web* (or *hidden Web*). The former refers to the collection of Web pages that are publicly and directly accessible without the need to go through a registration, login, or the interface of a search engine. Usually, each such page has a static logical address called Uniform Resource Locator or URL. Web pages in the surface Web are usually hyperlinked and can be accessed by ordinary Web crawlers1 via hyperlinks. The exact size of the surface Web is unknown but the size of the indexed Web, which is a subset of the surface Web, was estimated to be as much as 55 billion Web pages in August 2010 according to [http://www.worldwidewebsize.com/](http://www.worldwidewebsize.com/). The deep Web contains Web pages that cannot be crawled by ordinary Web crawlers. They include Web contents that are not publicly accessible or are dynamically generated. As an example, consider the case where a publisher has accumulated many articles in digital format, but these articles are not placed on the surface Web (i.e., there are no static URLs for them), and they are only accessible by Web users through the publisher’s search engine, then these articles belong to the deep Web. Web pages that are dynamically generated using data stored in database systems also belong to the deep Web. The deep Web contained approximately 1 trillion pages of information by the end of 2009. Both the surface Web and the deep Web are expanding rapidly.

How to help ordinary users find desired information from the Web has been one of the central issues in the Web technology area since early 1990s. Over these years, many search engines have been created by researchers and developers, and they have become the most popular tools for people to find desired information on the Web. Search engines are generally easy-to-use tools with a simple query interface. A user types in his/her query – usually a few words that reflect the user’s information needs – to the query interface of a search engine, and the search engine finds the best matches from its repository. Based on what type of data is searched, there are document-driven search engines and database-driven search engines. The former searches documents (Web pages) while the latter searches data items from database systems through Web-based search interfaces. Database-driven search engines are mostly employed for e-commerce applications such as buying cars or books. This book focuses on searching text documents only.

Due to the huge size and the fast expansion of the Web, each search engine can only cover a small portion of the Web. One of the largest search engines on the Web, Google ([http://www.google.com/](http://www.google.com/)), for example, can search as many as 35 billion pages ([http://www. worldwidewebsize.com/](http://www. worldwidewebsize.com/)), which is still a small fraction of the entire Web. It is widely observed that different search engines cover different, albeit overlapping, portions of the Web. One effective way to increase the search coverage of the Web is to combine the coverage of multiple search engines. Systems that perform such combination are called metasearch engines. A metasearch engine can be considered as a system that supports unified access to multiple existing search engines. In a typical session, using a metasearch engine, the user submits a query to the metasearch engine, which passes the query to its component search engines; when the metasearch engine receives the search results returned from its component search engines, it merges these results into a single ranked list and displays them to the user.



References
---
[1] Weiyi Meng and Clement T. Yu, *Advanced Metasearch Engine Technology*, Morgan & Claypool, 2011.
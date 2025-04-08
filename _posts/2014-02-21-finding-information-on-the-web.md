---
layout: post
title: FINDING INFORMATION ON THE WEB
date: 2014-02-21
categories: [computer science]
tags: [data management]

---

Abstract
---
There are two basic paradigms for finding information on the Web: *browsing* and *searching*. Most, if not all, Web users have used both methods to find the information they need from the Web.

BROWSING
---

Browsing consists of two steps: finding a starting page and following the links in the current page. If a user already knows the URL of the starting page, the user can type in the URL of the page directly in the address bar of the Web browser. Many users save the URLs of the pages they frequently visit in the bookmarks or favorites list of their browsers. In this case, a user can also launch the starting page from the bookmarked list. The number of URLs that a user can remember or save in the bookmark list is very limited. Another widely used technique to find a starting page is *searching*, where a search is conducted using a set of terms, and one of the result pages returned from a search engine is used as the starting page. Thus, searching and browsing are often used together by Web users in their pursuit to find desired information. After the starting page is determined, it becomes the current page and the user can click on any clickable text in the current page to display the page whose URL is encoded in the clickable text. The clickable text is also known as anchor text as the text is enclosed between the HTML anchor tags as in `<a href=”URL”>` *anchor text* `</a>`. Anchor text may provide a clue on the contents of the page whose URL is the value of the “href ” attribute of the anchor tag.


To facilitate browsing, the developers of Web portals, Web sites and Web pages have the responsibility to make browsing-based information finding as easy as possible. Yahoo! is probably the most popular Web portal, and it places millions of Web pages and Web sites into many categories and organizes these categories in a hierarchical structure. As a category hierarchy can narrow down the information scope from one level to the next level quickly, it reduces the information finding effort. Many Web sites also provide a *sitemap*, which shows the accessible pages in hierarchical fashion to make browsing easier. In specific Web pages, the anchor text for each link should be sufficiently informative about the contents of the linked page.

SEARCHING
---

Searching is the second most popular activity on the Internet behind only activities related to sending and receiving emails. Searching is composed of three steps: identify a search engine to use, compose a query, and go through the list of results to identify relevant ones. The third step is fairly straightforward as the results returned by most search engines contain adequate information for users to determine whether the full pages are worth further examination. In the following, we discuss how to determine the appropriate search engine to use and how to compose appropriate queries.


Determine Appropriate Search Engines
---

Most users are familiar with one or more major search engines on the Web. According to a comScore ([http://www.comscore.com/](http://www.comscore.com/)) report released in August 2010, the following are the most popular search engines in the United States: Google ([http://www.google. com/](http://www.google. com/)), Yahoo! ([http://www.yahoo.com/](http://www.yahoo.com/)), Bing ([http://www.bing.com/](http://www.bing.com/)), Ask ([http://www. ask.com/](http://www. ask.com/)), and AOL ([http://www.aol.com/](http://www.aol.com/)). They occupy 65.4%, 17.4%, 11.1%, 3.8% and 2.3% of the search market, respectively. However, there are actually millions of search engines on the Web and only a small number of them are general-purpose search engines that aim to provide com- plete search coverage of the Web. Most search engines are small with a confined search scope. For example, most organizations such as universities, newspapers and book publishers have their own search engines covering only Web contents they produce. As another example, there are also many domain-specific or vertical search engines that cover Web pages in a specific domain or subdomain such as medicine, news, movies, and sports. Furthermore, there are also search engines that cover contents in the deep Web. Small and domain-specific search engines can often return more relevant and more up-to-date results than the major search engines because their search domains are more focused and it is easier to keep smaller datasets fresh. Moreover, deep Web search engines can return results that are often not available from major search engines because major search engines search mostly the surface Web.

From the above analysis about search engines, we can see that identifying an appropriate search engine to use for a given information need is not an easy task. First, most users are not even aware of the vast majority of the available search engines. There is currently no complete directory of all search engines on the Web. The current most complete directory at CompletePlanet ([http://aip.completeplanet.com/](http://aip.completeplanet.com/)) lists about 70,000 search engines, a small fraction of what is believed to be available. Second, there is no systematic quality evaluation of all the search engines on the Web. Therefore, it is hard for ordinary users to know which search engines are most appropriate for his or her information need. Because of these difficulties, most users just settle with using some of the popular search engines for their search needs. More experienced users can often find more appropriate search engines through personal experience and recommendation from others. Nevertheless, it is highly desirable to have a complete directory of all search engines accompanied with information about their quality as part of the Web infrastructure. It would even be better to have a search engine recommendation system that is as easy to use as a regular search engine.


Form Appropriate Search Queries
---

**Document-driven search engines** usually have a simple query interface – a textbox that allows users to enter their queries and a submit button. Analyses of user queries submitted to search engines have revealed that most users just submit simple and short queries – an indication that most users have little or no training about writing good queries. For example, an analysis of approximately 1 billion queries submitted to the AltaVista search engine ([http://www.altavista.com/](http://www.altavista.com/)) in 1998 revealed the following interesting characteristics about Web search queries:

* Queries were usually short: The average number of terms in a query was 2.35, about 26% of the queries had a single term, and less than 13% of the queries had more than three terms.

* Most queries used no operators: About 80% of the queries did not use any operators.


Some of the operators that are widely supported by search engines include: Boolean AND – a Web page must contain all the query terms in order to satisfy the query; Boolean OR – a Web page is required to contain at least one of the query terms; and Boolean NOT – a Web page must not contain the query terms qualified by NOT. Some search engines also support certain form of proximity query that requires specified query terms to appear close to each other in a Web page for it to be qualified.

Users can improve the quality of their queries by following the suggestions below:  

1. Avoid submitting ambiguous queries. A query is ambiguous if it has multiple very different interpretations. For example, the query “windows” may be interpreted as Microsoft Windows operating system or windows of a building. An effective way to avoid ambiguous queries is to avoid overly short queries. With longer queries, each term has more terms from the same query as context in helping determine the correct meaning of the term. There is evidence that users are increasingly submitting longer queries. By the end of 2007, queries submitted to Google had averaged 4 terms for the first time.
2. Use the appropriate operators. If a user plans to use a search engine frequently, then it is worth making an effort to find out what operators are supported by the search engine. These operators often have different formats in different search engines. Furthermore, many search engines apply a default operator to user queries if no operator is specified. For example, Google uses Boolean AND as the default operator.

In another study, Broder, A. (2002) analyzed users’ needs behind their queries based on a user survey and found that users often have different needs when submitting their queries to a search engine. Based on this study, Broder classified Web queries into the following three classes according to the search needs.


1. *Navigational queries*. This type of queries aims to find a particular Web page or Web site the user has in mind. For example, the purpose of query “Binghamton University” is to find the homepage of Binghamton University, i.e., http://www.binghamton.edu/. Any page other than this homepage won’t be considered as correct. Usually, users who submit such queries are aware of the Web pages they seek, perhaps because they had visited the pages before.
2. *Informational queries*. This class of queries aims to find certain information from the Web, which may be spread over multiple pages. Users who submit this type of queries are usually satisfied as far as one of the pages that contain the desired information is retrieved.
3. *Transactional queries*.The purpose of this class of queries is to find a Web site to perform certain transactions interactively. Examples of transactions include shopping, downloading music and movies, and signing up for certain services.

According to the analysis of 1,000 queries, 48% are informational queries, 30% are transactional queries and 20% are navigational queries.
The purpose of analyzing user queries is to devise better query evaluation techniques.


References
---
[1] Weiyi Meng and Clement T. Yu, *Advanced Metasearch Engine Technology*, Morgan & Claypool, 2011.
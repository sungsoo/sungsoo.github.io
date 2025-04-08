---
layout: post
title: What is Graph Analytics?
date: 2017-05-03
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [What is graph analytics?](http://www.ibmbigdatahub.com/blog/what-graph-analytics)
* Authors: [Mike Ferguson ](http://www.ibmbigdatahub.com/blog/author/mike-ferguson)

---

What is Graph Analytics?
========================

*Graph analytics*, also known as *network analysis*, is an exciting new area for analytics workloads. 
To some extent, the business driver that has shone a spotlight on graph analysis is the ability to use it for social network influencer analysis. Marketing managers in particular are interested in identifying social network influencers because they are potential targets for marketing campaigns trying to trigger chain reactions among social network communities to buy products and services. However, many more potential use cases for graph analysis exist, including several widely used business use cases: 

- *Detecting financial crimes* such as money laundering
- Spotting *fraud*, which applies to fraudulent transactions and applications in banking, benefits fraud in government, applications and claims fraud in insurance and fraudulent activities in telecommunications
- Preventing crime and performing counterterrorism
- Applying influencer analysis in social network communities
- Performing grid and network quality of service such as identifying weaknesses in power grids, water grids and transportation networks as well as helping prevent cybercrime attacks on computer networks
- Optimizing routes in the airlines and retail and manufacturing industries as well as for supply distribution chains and logistics
- Conducting research in life sciences (bioinformatics) including medical research, disease pathologies and so on

[![](http://www.ibmbigdatahub.com/sites/default/files/graphanalytics_embed.jpg)](http://www.ibm.com/analytics/us/en/technology/cloud-data-services/graph/?S_TACT=M1610MMW&iio=panalytics&cmp=m1610&ct=m1610mmw&cr=newsroom&cm=h&csot=-&ccy=-&cpb=-&cd=-)

<iframe width="600" height="400" src="https://www.youtube.com/embed/qMitNJ5zzow" frameborder="0" allowfullscreen></iframe>

Different Kinds of Graph Analysis
-----

Four widely used types of graph analytics include path analysis, connectivity analysis, community analysis and centrality analysis: 

- **Path analysis:** This type of analysis can be used to determine the shortest distance between two nodes in a graph, for example. An obvious use case is route optimization that is particularly applicable to logistics, supply and distribution chains and traffic optimization for smart cities.

- **Connectivity analysis:** This type of graph analysis can be applied tor determining weaknesses in networks such as a utility power grid. It also enables comparing connectivity across networks.

- **Community analysis:** Distance and density–based analysis is used to find groups of interacting people in a social network, for example, and identifying whether they are transient and predicting if the network will grow.

- **Centrality analysis:** This analysis type enables identifying relevancy to find the most influential people in a social network, for example, or to find most highly accessed web pages—such as by using the PageRank algorithm. 

Graph analytics algorithms exist to help perform these kinds of analyses. 
Graph algorithms include *PageRank*, *Betweenness Centrality*, *Eigen Centrality* and *Closeness*.

Anatomy of Graphs in Graph Analysis
-----------------------------------

In this discussion of graph analytics, we are not talking about visualizations. Graphs are made up of nodes and edges. The mathematical term for nodes is *vertices*. You may see articles or hear mathematically oriented people talking about a *vertex* or *vertices* and *edges*:

![](http://www.ibmbigdatahub.com/sites/default/files/mf_fig_1.png)

Bringing this concept back to the real world, nodes or vertices can be people, such as customers and employees; affinity groups such as LinkedIn or meet-up groups; and companies and institutions. They can
also be places such as airports, buildings, cities and towns, distribution centers, houses, landmarks, retail stores, shipping ports and so on. Vertices can also be *things* such as assets, bank accounts,
computer servers, customer accounts, devices, grids, molecules, policies, products, twitter handles, URLs, web pages and so on.

Edges can be elements that represent relationships such as emails, likes and dislikes, payment transactions, phone calls, social networking and so on. Edges can be directed, that is, they have a one-way direction arrow to represent a relationship from one node to another—for example, Mike made a *payment* to Bill; Mike *follows* Corinne on Twitter. They can also be non-directed—for example, M1 links London and Leeds—and weighted—for example, the number of payments between these two accounts is high. The time between two locations is also an example of a weighted relationship.

Graph analysis may highlight dominant edges. For example, a large number of payments between bank accounts may indicate money laundering activity. Consider a social network analysis example: you may begin by identifying communities within a social network and then for one or more specific communities you may want to identify the influencer(s) within that community and the people linking multiple communities. Graph analytics using centrality analysis can be applied in this scenario.

Doing graph analysis in NoSQL of graph databases, for example, is also possible, such as using IBM Graph on the IBM Bluemix platform. In big data environments, graph analysis can be done at scale using Apache
Spark GraphX by loading data into memory and running graph analysis in parallel. And connecting Spark to graph databases using the Tinkerpop interface is also possible. In this way, you can take data out of graph databases and put it into memory to accelerate graph analytical processing.

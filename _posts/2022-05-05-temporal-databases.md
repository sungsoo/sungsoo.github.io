---
layout: post
title: What are Temporal Databases?
date: 2022-05-05
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [What are Temporal Databases? How databases automatically retain history (temporal data)](https://www.youtube.com/watch?v=_TiB61Fq3js)


---

# What are Temporal Databases?



## Abstract

A temporal database is one that includes special support for the time dimension, allowing it to store data with history and time as an inherent dimension of the data.  It supports facilities for storing, querying and updating historical and/or future data.  Using libraries like 4DFLib, an open source proof of concept we can easily create and manage time sensitive data stores.  This video focuses on temporal databases conceptually, the next video in this series shows how a library like 4DFLib can be created to manage time sensitive data in any database system.  You can see that video here: [https://youtu.be/AzwVJLV9EWo](https://youtu.be/AzwVJLV9EWo) 

I personally believe that the reason we do not have full temporal databases as standard today where are all tables / entities automatically retain historical information is because there has not been a good implementation found at the database layer.  I believe this implementation can exist as a lower level software layer above or part of the object relational mapping (ORM) layer.  My open source library, 4DFLib is intended to be a proof of concept of how such an implementation might happen.

You can find the 4DFLib library here: [https://github.com/briangormanly/4dflib](https://github.com/briangormanly/4dflib)


<iframe width="600" height="400" src="https://www.youtube.com/embed/_TiB61Fq3js" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
---
layout: post
title: Probabilistic Ranking Problem
date: 2016-11-29
categories: [computer science]
tags: [data management]

---

## Probabilistic Ranking Problem

*Ranking queries* are widely used in data exploration, data analysis and decision making scenarios. The objective of ranking queries (also referred to as top-*k* queries) is to report the top ranked query results, based on scores computed by a given scoring function (e.g., a function defined on one or more database columns). A scoring function induces a unique total order on query results, where score ties are usually resolved using a deterministic tie-breaking criterion.

While most of the currently proposed ranking techniques focus on deterministic data, several emerging applications (e.g., Web mashups, location-based services, and sensor data management) involve data that are imprecise or uncertain. Dealing with data uncertainty by removing uncertain values is not desirable in many settings. For example, there could be too many uncertain values in the database (e.g., readings of sensing devices that become frequently unreliable under high temperature). Alternatively, there could be only few uncertain values in the database, but they are involved in data entities that closely match query requirements. Dropping such uncertain values may lead to inaccurate or incomplete query answers. For these reasons, modeling and processing uncertain data have been the focus of many recent studies.

With *data uncertainty*, the semantics of ranking queries become unclear. For example, reporting a top ranked query result may not depend only on its computed score, but also on the potential uncertainty of that result as well as the scores and uncertainty of other query results. Ranking and uncertainty models interplay to determine meaningful interpretation of ranking queries in this context. We refer to this problem as the *Probabilistic Ranking Problem*.

In this lecture, we discuss the implications of two different types of data uncertainty on the semantics and processing techniques of ranking queries:

* **Tuple level uncertainty.** Tuples may belong to the database with less than absolute confidence. A widely-used model to capture this type of uncertainty is representing tuples as probabilistic events, and they model the database as a joint distribution defined on these events.


* **Attribute level uncertainty.** Tuple attributes may have uncertain values. A widely-used model to capture this type of uncertainty is representing tuple attributes as probability distributions defined on discrete or continuous domains.
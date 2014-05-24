---
layout: post
title: Query Processing
date: 2014-05-27
categories: [computer science]
tags: [data management]

---


# Query Processing

**Query processing** refers to the range of activities involved in extracting data from a database. The activities include translation of queries in high-level database languages into expressions that can be used at the physical level of the file system, a variety of query-optimizing transformations, and actual evaluation of queries.## Overview
The steps involved in processing a query appear in Figure 12.1. The basic stepsare:
1. Parsing and translation. 
2. Optimization.3. Evaluation.
### Figure 12.1 Steps in query processing.

![](http://sungsoo.github.com/images/steps-in-query-processing.png)Before query processing can begin, the system must translate the query into a usable form. A language such as SQL is suitable for human use, but is ill suited to be the system’s internal representation of a query. A more useful internal representation is one based on the *extended relational algebra*.
Thus, the first action the system must take in query processing is to translate a given query into its internal form. This translation process is similar to the work performed by the parser of a compiler. In generating the internal form of the query, the parser checks the syntax of the user’s query, verifies that the relation names appearing in the query are names of the relations in the database, and so on. The system constructs a *parse-tree representation* of the query, which it then translates into a *relational-algebra expression*. If the query was expressed in terms of a view, the translation phase also replaces all uses of the view by the relational-algebra expression that defines the view. Most compiler texts cover parsing in detail.
# References
[1] Abraham Silberschatz, Henry F. Korth, S. Sudarshan, *DATABASE SYSTEM CONCEPTS*, Sixth Edition, McGraw Hill, 2011.

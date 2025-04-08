---
layout: post
title: Self-Curating Databases 
date: 2016-03-18
categories: [computer science]
tags: [data management, data curation]

---

# Self-Curating Databases

## Abstract

The success of relational databases is due in part to the simplicity of the tabular representation of data, the clear separation of the physical and logical view of data, and the simple representation of the logical view (meta-data) as a flat schema. But we are now witnessing a paradigm shift owing to the explosion of data volume, variety and veracity, and as a result, there is a real need to knit together data that is naturally heterogeneous, but deeply interconnected. To be useful in this world, we argue that today’s tabular data model must evolve into a holistic data model that views meta-data as a new semantically rich source of data and unifies data and meta-data such that the data becomes descriptive. Furthermore, given the dynamicity of data, we argue that fundamental changes are needed in how data is consolidated continuously under uncertainty to make the data model naturally more adaptive. We further envision that the entire query model must evolve into a context-aware model in order to automatically discover, explore, and correlate data across many independent sources in real-time within the context of each query. We argue that enriching data with semantics and exploiting the context of the query are the two key prerequisites for building self-curating databases in order to achieve a real-time exploration and fusion of enriched data at web scale. These needs highlight a series of interesting challenges for database research and alter some of the tenets of Codd’s rules for how we think about data.

## Holistic Data Model


[![](http://sungsoo.github.com/images/holistic-data-model.png)](http://sungsoo.github.com/images/holistic-data-model.png)

## Enriched Data Model

[![](http://sungsoo.github.com/images/enriched-data-model.png)](http://sungsoo.github.com/images/enriched-data-model.png)


## References


* Mohammad Sadoghi et. al, Self-Curating Databases, *19th International Conference on Extending Database Technology (EDBT)*

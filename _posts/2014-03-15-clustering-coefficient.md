---
layout: post
title: Community Detection - Clustering Coefficient
date: 2014-03-15
categories: [computer science]
tags: [big data]

---

<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

# Introduction

Intuitively, a community is a set of nodes where each node has more connections within the community than outside it. This effect has been found (or is believed to exist) in many real-world graphs, especially social networks: Moody finds groupings based on race and age in a network of friendships in one American school;, Schwartz and Wood group people with shared interests from email logs; Borgs et al. find communities from “cross-posts” on Usenet; and Flake et al. discover communities of webpages in the WWW.

We divide the discussion into two parts. First, we will describe the *clustering coefficient*, which is one particular measure of community structure that has been widely used in the literature. Next, we will describe methods for *extracting* community structure from large graphs.


# Clustering Coefficient

**Informal description:** The clustering coefficient measures the “*clumpiness*” of a graph, and has relatively high values in many graphs.


**Detailed description:** We will first define the clustering coefficient for one node, following: 

![](http://sungsoo.github.com/images/clustering-coefficient.png)

Defintion 
---

Suppose a node *i* has *k*<sub>*i*</sub> neighbors, and there are *n*<sub>*i*</sub> edges between the neighbors. Then the clustering coefficient of node *i* is defined as

![](http://sungsoo.github.com/images/transitivity.png)


Thus, it measures the degree of “*transitivity*” of a graph; higher values imply that “friends of friends” are themselves likely to be friends, leading to a “*clumpy*” structure of the graph. See Figure 16.1 for an example.


For the clustering coefficient of a *graph* (the *global* clustering coefficient), there are two definitions:


1. **Transitivity** occurs iff *triangles* exist in the graph. This can be used to measure the global clustering coefficient as  
![](http://sungsoo.github.com/images/global-clustering.png)  
	where a “*connected triple*” is a triple of nodes consisting of a central node connected to the other two; the flanking nodes are unordered. The equation counts the fraction of connected triples which actually form triangles; the factor of three is due to the fact that each triangle corresponds to three triples.

2. Alternatively, Watts and Strogatz use equation 16.1 to define to a *global clustering* coefficient for the graph as  
![](http://sungsoo.github.com/images/global-clustering-coefficient.png)  

The second definition leads to very *high variance* in the clustering coefficients of low-degree nodes (for example, a degree 2 node can only have *C*<sub>*i*</sub> = 0 or 1). The results given by the definitions can actually be quite different. The first definition is usually easier to handle analytically, while the second one has been used extensively in numerical studies.


# References

[1] Deepayan Chakrabarti, Christos Faloutsos, *Graph Mining: Laws, Tools, and Case Studies*, Sythesis Lectures on Data Mining and Knowlege Discovery, 2012.





---
layout: post
title: Influence Analytics in Graphs
date: 2020-08-02
categories: [computer science]
tags: [machine learning]

---

### Related Article
* [Graph Analytics in 2020: Gain business insights from networks](https://research.aimultiple.com/graph-analytics/)

----

# Influence Analytics in Graphs

## Definitions
"**Influence analytics in graphs**" is the study of the dynamics of influence propagation over a network. Influence includes anything that can be transferred or shaped through network interactions, such as pieces of information, actions, behavior, or opinions. *Influence analytics* includes modeling of the process of influence propagation and addressing algorithmic challenges that arise in solving optimization problems related to the dynamic propagation process.

## Overview
*Diffusion process* on networks is one of the most important dynamics studied in network analysis, which can represent social influence such as the *word-of-mouth effect* of a rumor in a social network, the spread of an infectious disease, opinion formation through social interaction, and many other phenomena that could happen online or offline. Although diffusion process on networks has been studied from the 1960s, in various research areas including sociology and economy, its importance has grown considerably because of the rapid growth of the web graph and online social networks. Socially, it has become more important because more and more influence is exerted on people through those networks. Academically, it has become more important because the massive scale of the networks raises new algorithmic challenges.

   Among the various problems defined on the *network diffusion process*, this article focuses on an *optimization perspective*, that is, finding a small seed set of nodes in a given network that maximizes the total spread of influence in the final or the convergent state of the diffusion process. In particular, as notable examples, *influence maximization* arising in *viral marketing* and *opinion maximization* arising in opinion formation are discussed.

## Influence Propagation
A social network acts as a medium for the spread of information, ideas, and innovations among its members. The idea of the *influence maximization problem*, which arose in the context of viral marketing, is controlling the spread so that an idea or product is widely adopted through word-of-mouth effects. More specifically, by targeting a small number of influential individuals, say, giving them free samples of the product, the goal is to trigger a cascade of influence by which friends will recommend the product to other friends, and many individuals will ultimately try it. One can rephrase this problem using graph terminology, that is, the goal is to find a set of small number of nodes, called a seed set, in a given network that maximizes the number of influenced nodes in the end of an influence propagation process.


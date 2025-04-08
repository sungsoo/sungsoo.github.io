---
layout: post
title: Designing Graph-Based Applications
date: 2014-03-28
categories: [computer science]
tags: [big data]

---

Designing Graph-Based Applications
---
Building graph-based applications is understandably different from developing against relational databases, or from other non-relational data models, such as document or column family stores. The graph model is unique with its ability to accommodate highly connected, partially structured datasets that can evolve over time in terms of complexity and structure. Additionally, graphs are naturally capable of providing a wide range of ad-hoc queries on top of such datasets.

To fully harness the power of graphs, it is germane to reexamine traditional design and implementation practices and to consider the impact the specific nature of graphs can have on them. In the common context of object-oriented languages and multi-tier architecture, some of the intriguing questions are about how to design data access and business logic to handle graph data effectively. For instance, should an object mapping framework be used or should we try to stick to a graph representation as long as possible?

The graph model has been thus far successfully applied to a wide variety of different domains and problems, and therefore trying to come up with one unique approach to describing the architecture of graph-based applications might be too simplistic and restrictive. So instead I will discuss in the next sections two high-level approaches I have discerned from my personal experiences.

There are two broad types of applications in which graph databases are typically used: *data-centric* and *domain-centric*. In both cases the data model warrants the use of a graph database but the main difference lies in the variety, the complexity and the origin of the data involved.

Domain-Centric Applications
---
These applications usually possess a well defined domain model where direct user interaction causes changes to the data. Batch jobs that integrate external data sources can also be present but those are equally governed by the same application domain logic. The main point is that the resulting data model can be rich and flexible but it is mostly orderly and predictable.

Examples of this type of applications include social networks and recommendation services. Those are clearly “graphy” problems and a graph database will be able to support a flexible model in a performant way and to provide expressive and easily evolvable query capabilities, even if the model and requirements change over time.

![](http://sungsoo.github.com/images/domain-centric.png)

In terms of architecture, this category can be approached in a similar fashion to applications developed against relational databases. The data tier loads the data from the graph database and maps it immediately to a domain object representation that the logic tier uses to perform application logic. The approach has a number of advantages including simplicity, familiarity and a clear separation of concerns.

The object-graph mapping step is essential: it needs to create a domain-friendly representation of the data that positively captures the essence of the graph model. A sloppy mapping logic can result in a domain that is difficult to work with or to extend as the requirements of the application evolve. For example, in a graph query, nodes are traversed in a specific order and a node can potentially appear in the result more than once. This information, which might be important to the application, can be inadvertently altered in different ways when the result of the query is mapped to different collection implementations.

My recommendation is to apply extra care when implementing object-graph mapping, or alternatively to use a mapping framework - such as Spring Neo4J Data - if available on your platform.

Data-Centric Applications
---
Those applications integrate high volumes of complex and connected data from a variety of different sources. Applications of this category typically model networks from the real world, such as telco, water or oil networks. User interaction is much less a direct source for data changes and modifications in this case.

The premier challenge for those applications is to adroitly and efficiently handle data that can change or vary unexpectedly, or data that contains irregular segments, deviating from the ideal model anticipated by the application. Those variations stem from the fact that real-world data is always messier and more complex than we can expect it to be.

![](http://sungsoo.github.com/images/graph-centric.png)

On the surface, the same architectural approach described in the previous section can still be applied but to actually tackle the underlying complexity it is sensible to stay as close as possible to the natural model of the data. Practically, the graph can is a recursive data structure, on top of which pattern-matching queries or optimisation algorithms can be performed. Mapping to an object model should be deferred in this case to when results need to be rendered to the end user. This view of recursive data and algorithms is particularly suitable for a functional programming style. There are a number of advantages for this approach:

**Performance** - As we are dealing with larger volumes of data, intermediary object-mapping steps can result in more garbage and increase memory and cpu consumption.

**Flexibility** - We need to anticipate some degree of variation in the structure of the graph due to the way data is sourced for this type of applications. Mapping to domain objects effectively marks a transition to a different paradigm - and this transition can result in a rigid and brittle model that fails to handle future changes gracefully.

**Incremental Discovery** - Requirements for data-centric applications are often complex, resulting in solutions that require sophisticated algorithms to be implemented. Gaining proper understanding of those requirements takes time. Furthermore, graphs continuously reveal new ways the model can be extended and exploited.

For those reasons, solutions tend to emerge over a number of development iterations. A graph representation guarantees that we are able to react and evolve the model accordingly. Conversely, a mapping step would result in inevitable simplification and divergence from the underlying graph model, which might impede future evolution.

Incremental discovery is in my opinion the prime motivation to favour a graph representation as the core model for those applications.

Only Two Models?
---
Do all graph applications then clearly belong to the domain-centric type or the data-centric type? Obviously not; those two models should be seen as conceptual watermarks rather than ready-to-apply technical recipes. Depending on a number of factors including the complexity of the domain and the data, and the existence of a prestablished domain model, applications will fall into different positions on the scale.

The domain-centric and data-centric models actually exhibit two strong commonalities: the existence of an underlying graph model and the need for a domain representation to manipulate the data. From the viewpoint of building the domain model, the two approaches can be characterised as top-down and bottom-up respectively. 

In the case of domain-centric design, we are following a top-down approach where a well-defined domain is applied to the data, and that shapes interactions that we can have with it. For data-driven applications, the domain is built in a bottom-up fashion - from the data up to a suitable domain representation - which means that the domain is always aware of the quirkiness of the data and is able to exploit it flexibly.

There are cases where a meet-in-the-middle approach would be more practical or where an existing codebase forces us to adapt what would have been a strongly data-centric model. We can also envision a hybrid approach based on the CQRS principle, where Command and Query models are split. Deep understanding of the domain, the data and the model is paramount to making the right decision, but again, this level of knowledge and familiarity is never acquired overnight and building insightful solutions requires a model and a technology that enable and support incremental discovery.


References
---
[1] Tareq Abedrabbo, [*Designing Graph-Based Applications*](http://www.terminalstate.net/2013/08/designing-graph-based-applications.html), 2014.


---
layout: post
title: Implementing Graph-Based Applications
date: 2014-03-28
categories: [computer science]
tags: [big data]

---

Implementing Graph-Based Applications
---

Graphs have proven to be widely applicable to model a range of business problems and domains. Yet, the flexibility that graphs bring requires an additional level of attention to implementation and an adaptation of familiar programming idioms to increase the benefits while avoiding common pitfalls.

The following topics summarise patterns and strategy I used across a number of Neo4j projects. In my case I used the native Java API, Cypher and even some JavaScript for custom graph rendering. To make the ideas more generally useful, I tried to extract what seems to be reusable concepts and avoid focusing exclusively on any one programming model in particular.

Choosing an Implementation Strategy
---

One of the primary considerations when developing a graph-based application is the choice of an implementation strategy and the frameworks and tools that will support it. 

On some platforms, **Object Graph Mapping** (OGM) frameworks are available, such as Spring Data Neo4j (SDN). In a nutshell, OMG frameworks provide a simple and consistent means of mapping between graph resources and application objects within a programming model that is familiar to most developers. Given these benefits, a fair question to ask is whether we should routinely pick up an OGM framework every time we implement an application backed by a graph database. The answer is, as usual, it depends. The most important factor that should guide this choice is the nature of the domain and the available data. Broadly speaking, applications can be domain-centric or data-centric. For more background about this concept please refer to the previous part: [Designing Graph-Based applications](http://sungsoo.github.io/2014/03/28/Designing-graph-based-applications.html).

If the application is domain-centric, it is sensible to consider using an OGM framework. In domain centric-applications, the domain and the data that compose it are clearly defined and are under the control of the application. Therefore we are able to predict the quality and the structure of the data that the application is going to manipulate, and to design upfront the basis of a stable object domain model that is able to graceful evolve when new requirements arise.

In such cases, using an OGM framework offers a number of advantages over a manual mapping approach. Firstly, an OGM framework guarantees that mapping between graph resources and the application’s objects and data types is always consistent. This is an essential quality given that graph resources are typically more malleable than their object counterparts. As an example, the order of nodes in a traversal operation can differ from their natural order in the domain model. Moreover, the same node can appear a number of times on a given path depending on the query. Sloppy mapping can potentially introduce inconsistencies in the data model in this case, by making use of inadequate collection types, furthering the gap between the graph and the object model in a way that is hard to reconcile. The primary challenge though is keeping the two models constantly in sync as more and more functionality is built on top of the object model. OGM frameworks alleviate the issue significantly, provided that the domain and the data lend themselves to this approach. Therefore, using an OGM framework sensibly can result in a powerful and productive programming model.

There are naturally situations where this approach doesn’t work as well, primarily when an application is data-centric e.g. when an application relies on multiple external data sources that are not under the control of the developer. In these cases, it is desirable to preserve the graph representation as long as possible. Application logic can be implemented on top of a lightweight representation that matches the underlying graph model to improve the flexibility and durability of the application’s design. [In such cases, algorithms are implemented directly on top of graph entities and the object model is typically used for presentation purposes only.]

Conversely, a rigid object model founded on inaccurate or premature assumptions about the data will break as soon as these assumptions are challenged; this is most likely to happen as we build a better understanding of the domain or when new requirements arise.

The Graph as a Fundamental Data Structure
---
The fundamental assumption behind the OGM programming model is that the object model serves as the main representation of the domain. Accordingly, the underlying graph is abstracted away as much as practically possible.

A contrasting but equally compelling perspective is to consider the graph as the principal application domain. Essentially, graphs are simple data structures for which a vast range of well-understood and widely-applicable algorithms are readily available.

Pushing this idea further, there becomes no need to wrap the graph with custom domain APIs and data structures; application logic and behaviour can simply be defined through functions that are evaluated immediately on the domain’s graph. This conception is aligned with a functional programming mindset. It is equally much closer to the data-driven nature of graphs; it encourages simplicity and reuse of existing general-purpose graph algorithms.

Cypher is an excellent example of this approach. Cypher already provides a number of functional programming idioms and graph algorithms, and I would anticipate that it will continue to evolve to become eventually a more complete functional DSL that is capable of describing a wider range of complex graph operations.

Querying the Graph
---
First-class support of high-level query languages is much more prevalent today for non-relational databases. Neo4J has Cypher, in addition to the REST interface and the native Java API (available in embedded mode and for plugins). 
For most use cases, I would privilege Cypher over the other APIs available, mainly because it is overall a better all-round tool to get the job done.

From my perspective, Cypher operates at a right level of abstraction for designing and implementing graph queries. it enables an exploratory and iterative approach to problem-solving as well as rapid prototyping in collaboration with domain-experts, who often don’t possess the technical skills to comprehend lower level APIs. This is often key to building solutions that are both valuable and lasting.

From a performance perspective, while the native API is presumably faster, Cypher offers more transparent optimisation opportunities due to its declarative nature.

Programming for Semi-Structure
---
As a container for semi-structured data, the graph is not immune to changes and variations over time. These can be predictable, due to unfolding requirements, or potentially unpredictable, resulting from potential discrepancies between the application’s expected domain model and the real data.

This flexibility is not necessarily a bad thing; it is partly why graphs are so potent at modelling real-world data. It is however crucial to adopt a programming style that can handle semi-structured data effectively. There are a number of well-established software development notions and principles that are worth reexamining in the context of semi-structured data. The ones we will examine next are: decomposition, contract-based programming and the robustness principle.

Decomposition
---

When implementing a graph algorithm or a query, it is often tempting to try to do as much work as possible in a single pass. Intuitively, a single query has less overhead than running multiple queries. However, a single query can quickly become more complex and therefore harder to comprehend, maintain and evolve. In certain cases it might not be convenient or even possible to do everything in a single traversal. 

Therefore, it is preferable to approach graph algorithms by decomposing them into a series of simple composable steps. Decomposition greatly simplifies the development process, but also opens the door to a number of interesting composition patterns. For example:

*Multi-pass processing*: broadly the same nodes are traversed in successive passes, limiting focus to one part of the job at each pass. The main advantage of this approach is that each pass is simplified while maintaining the overall computational complexity of the algorithm constant. This technique is very common in compilers operating on tree or graph representations of computer programmes but it is also suitable for a number of business problems.

*Pipelined processing*: in this style, the output of each step provides the input of the next one; the overall algorithm is expressed as a chain of simple steps across a number of potentially overlapping paths.

As an example of decomposition, let’s consider an impact analysis system that endeavours to predict the impact of different forms of failure in a network of software and hardware components.

![](http://sungsoo.github.com/images/decomposition.jpg)

For this example, we are using the node ‘Data Centre 1’ as the starting point for the analysis operation. The first traversal (red arrows) identifies the impact path by traversing all the nodes all the way up to the application layer (‘App1’, ‘App2’ and ‘App3’). Given that ‘User Store’ is found on impact path and that it relies on a number of redundant database services, the next step is to test for the existence of a backup path that would lead to a different data centre node - this is what the second traversal does (green arrows).

There are a number of possible implementation strategies, such as nesting a query of the second type in the example, in the main traversal algorithm. But if we decompose the two queries rather than coupling them, each individual query becomes much simpler to write and to evolve separately. Moreover, it gives us the flexibility to decide when and how to run each query individually. For instance, the second query can be run asynchronously on all nodes of a similar type to detect single points of failure proactively. 

This example is clearly oversimplified, as in a real world model, every deployable component will be associated with a deployment location and the notion of service availability can be harder to determine.

In terms of performance overhead, Neo4j employs a number of mechanisms, such as caching and indexing, that work really well in this case as well as similar use cases (as we are starting from a known point and progressively exploring its neighbourhood).

One technique I found useful to implement in multi-step graph processing is for each step to return a collection of full graph resources, such as nodes (or ids of those), that can be consecutively injected into the next processing step, to enable quick and efficient look up by id.

Finally, it is worth mentioning that Cypher supports chaining queries natively through the ‘with’ statement. Nevertheless, whatever the programming style may be, decomposition is definitely worth considering for its benefits discussed above.

Contract-based programming
---
Asserting key properties about the structure and the attributes of the graph at chosen points in the program is a useful technique when working with flexible data.

Continuing with the previous example, when exploring backup paths for an impacted service, it is sensible to verify that any node representing a database on a candidate path is effectively linked to a data centre node. If the data model requires the presence of such a relationship for each database node, its absence can indicate that the dataset is incomplete or corrupted. Adding appropriate assertions allows to detect this type of situation when they happen.

![](http://sungsoo.github.com/images/preconditions.jpg)

Assertions should be designed to allow the program to fail fast if the data diverges from expectations in such way that can yield a wrong result. Decomposition provides a number of natural points to add assertions at the beginning of key functions. Assertions are also a great way to document the intent of each function, especially if they carry a clear error message. 

Assertions closely relate to the concept of local graph constraints, which has already made its way into Cypher and which is likely to be extended in the future to express more sophisticated graph data semantics.

Applying the robustness principle
---
The robustness principle states that you should "be conservative in what you send, be liberal in what you accept". Again, this notion becomes essential in the context of flexible or imperfect data.

Variation in the structure of a graph can arise quite commonly in some applications that depend heavily on dynamic data integrated from external sources, and where the quality of the data is hard to enforce. Writing robust algorithms that tolerate reasonable variation in data structure can also contribute to the stability of the application’s data model, which may then evolve flexibly - to a certain degree - without the need to adjust business logic constantly with each modification in the dataset.

![](http://sungsoo.github.com/images/robustness.jpg)

Going back to the previous example, let’s consider the impact of a corrupt data node that sneaks into our dataset, perhaps due to a data integration issue. If this foreign node does not have any impact on the outcome of the query we are running, it can safely be ignored.

Let’s also consider the effect of extending the dataset with data about users who perform actions on the system. The addition of a node indicating the deployer of a component should not require any modification to the impact analysis algorithm and therefore it should be ignored in this context.

Decomposition, assertions and variation-tolerant logic, if combined judiciously, enable a programming style that is particularly well-suited for semi-structured data. 

References
---
[1] Tareq Abedrabbo, [*Implementing Graph-Based Applications*](http://www.terminalstate.net/2014/03/implementing-graph-based-applications.html?utm_source=NoSQL+Weekly+Newsletter&utm_campaign=c8dcc08d7c-NoSQL_Weekly_Issue_174_March_27_2014&utm_medium=email&utm_term=0_2f0470315b-c8dcc08d7c-328631045), 2014.


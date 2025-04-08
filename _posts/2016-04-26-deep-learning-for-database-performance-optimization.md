---
layout: post
title: Deep Learning for Database Performance Optimization
date: 2016-04-26
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Deep learning for database performance optimization](https://jeremylehman.svbtle.com/deep-learning-for-database-performance-optimization)
* Authors: Jeremy Lehman
* Jeremy Lehman is a Principal with Third Derivative advising companies
creating analytic software. Previously, he lead global product
development and operations for Experian Marketing Services, and sales
and CRM technology for Barclays.

---

# Deep Learning for Database Performance Optimization

*Concept: diagnose, optimize, and anticipate performance in analytic
platforms such as databases through deep learning models.*

The complexity of database and NoSQL systems can exceed even talented
engineers’ abilities to mentally model and understand entire platforms.
Reacting to performance incidents begins to involve trial and error,
while predicting the impact of changes relies on intuitive estimates.

Consider a prestigious new client starting to use a cross-channel
digital marketing platform. Their high volume campaigns analyze hundreds
of millions of data points to segment, target, and reach consumers
across display ads, email, and app notifications. This imposes new
pressures on databases supporting the system. On a Friday before a
holiday weekend, a critical query begins to perform slowly. A DBA
analyzes the situation, creates new indices, and goes home. The
situation should be solved. Instead, performance slows down for many
clients across the whole platform. This is counter-intuitive; indices
require some compute power to generate, but should not negatively affect
the whole platform. After two days of analysis, a senior engineer
discovers that implementing new indices caused the database to generate
sub-optimal new query plans for many queries unrelated to the initial
issue.

A solution will show how changes to an analytic platform will affect
performance. If a solution can show cause and effect as changes are
made, than it can also predict performance issues by extrapolating
trends or performing sensitivity analyses to understand which patterns
constrain performance.

*Deep learning* is a sub-set of machine learning that creates high level
models and representations of complex structures. The techniques are
often associated with image, text, and video processing. Deep learning
techniques can symbolically represent the data models, queries, indices,
constraints, views and other elements that form a database (as well as
modelling storage and CPU performance, and other workloads like
replication or mirroring for disaster recovery). Deep learning
techniques typically involve training some form of neural network. Data
is fed through the network, adjusting how many layers of cells each
perform actions on the data, and then pass it along to adjacent cells
until the output begins to match test data.

NoSQL systems and databases generate logs that can be used to constantly
train the neural network. Higher level abstractions of cause and effect
for a given database, such as SQL Server or MySQL, could also be
analyzed through a cloud services across many instances and users (which
would involve few privacy concerns since the system is only analyzing
performance metadata).

Part of the process of generating product ideas should be to look at the
state of the market, and study competitors. I have not found any
credible solutions. Many products show what is happening within a
database, but none show why and how a change has or will affect
performance.

A product should perhaps first target Oracle Exadata because it is used
for larger databases and the nature of big, monolithic devices makes
testing and staging environments expensive. Sure, Exadata devices can be
carved into multiple logical databases, and one of these could be used
for testing, but in my experience this can introduce other issues (even
when using “caging” to limit resources used by testing), contends for
i/o accessing the data, and defeats the point of using a comparatively
inexpensive model to predict performance.

The product’s value to a customer should roughly follow data volumes
multiplied by query complexity times data model complexity. This is hard
to translate to licensing terms. Pricing could simply follow data size.

What are your thoughts? Would you buy this?


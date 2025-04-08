---
layout: post
title: Compensating Transaction 
date: 2016-02-02
categories: [computer science]
tags: [big data]

---


Compensating Transaction
=====

The execution of a business process consists of one or more transactions. Each transaction may consist of several individual operations yet, as a whole, it moves the system between consistent states.

There are two groups of systems where *compensating transaction* may be applied:

1. In the context of a database this is often easily achieved using *transactions* and the *commit/rollback mechanism*. Compensating transaction logic could be implemented as additional on top of database supporting commit/rollback. In that case we can decrease business transaction granularity.

2. For systems without a commit/rollback mechanism available, one can undo a failed transaction with a *compensating transaction*, which will bring the system back to its initial state. Typically, this is only a *workaround* which has to be implemented manually and cannot guarantee that the system always ends in a consistent state. The system designer may need to consider what happens if the compensating transaction also fails.

**Compensating transactions** are also used in case where a transaction is long lived (commonly called *Saga Transactions*), for instance in a business process requiring user input. In such cases data will be committed to permanent storage, but may subsequently need to be rolled back, perhaps due to the user opting to cancel the operation. Unlike conventional rollbacks, specific business logic will typically be required to roll back a long lived transaction and restore the system to its original state. This type of transaction differs from [distributed transactions](https://en.wikipedia.org/wiki/Distributed_transaction) (often implemented using the [two-phase-commit protocol](https://en.wikipedia.org/wiki/Two-phase-commit_protocol)), because although both types of transactions can result in multiple data stores being updated, compensating transactions allows for the updates to span a long period of time.

*Compensating transactions* are often designed into Web services that participate in the execution of business processes that are part of a service-oriented architecture solution.

## References

* Gray, Jim (June 1981). "The transaction concept: Virtues and limitations". *Proceedings of the Very Large Database Conference*.
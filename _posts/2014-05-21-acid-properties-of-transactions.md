---
layout: post
title: ACID Properties of Transactions
date: 2014-05-21
categories: [computer science]
tags: [data management]

---

# ACID properties of Transactions

* **Atomicity**: Refers to the "*all or nothing*" property.
* **Consistency**: Database consistency may be defined as a set of *rules* or *constraints*. If the execution of a transaction causes the consistency constraints to be violated, the transaction is not accepted (and thus aborted) by the system.
* **Isolation**: A system which maintains transaction isolation is also said to be enforcing *serializability*.
* **Durability**: Durability is usually enforced by first writing modified data to some *non-volatile memory* (usually disk) before a transaction is allowed to commit.

**Database recovery** is about preserving the *atomicity* and the *durability* properties. It is primarily concerned about handling transaction failures and system failures, in other words, about fault tolerance:

- If a transaction should fail after it has been started, which may be caused by it violating database integrity constraints, or by the software program implementing the transaction encountering a fatal error, none of its operations already executed (i.e., the partial effects) should be allowed in the database. This is required to preserve the atomicity property.

- If a system should fail and lost the contents of its memory after it has successfully executed a number of transactions, the effects of those successfully executed transactions must not be lost, and must be reflected in the database when the system recovers. This is required to preserves the atomicity and the durability property.

**Database concurrency control**, on the other hand, is about preserving the *isolation* property, which is also referred to as *serializabilty*.

While concurrency control and database recovery have orthogonal goals, they are intertwined in implementation.

**Scenarios:** Dirty Read and Lost update

## Principles of Database Recovery
The database recovery manager of a DBMS is responsible for ensuring consistency of the database under various failure scenarios: transaction failures, system failures where the contents of the main memory of the system is lost, and hard crash, where the storage media fails due to events such as a disk crash.

The atomicity and the durability properties of a transaction imply that each transaction must implement a unique, atomic commit point.

**Definition:** The *commit point* of a transaction marks the successful execution of a transaction. The unit of work executed between the start of a transaction and the commit point of the transaction defines a unit of consistency. The *atomic* nature of a commit point says to the fact that at any point in time in the system state, a transaction that has started is either committed or not committed, and is never in an undetermined or ambiguous state with respect to its commit.

**Definition:** A *consistent database* state is a database state in which all changes made by committed transactions are installed while none of the changes made by uncommitted transactions are installed.

**Definition:** A *resilient database* state is a system database state from which a consistent database state can be constructed.

The main goal of the recovery manager is to ensure that the database is constantly in a resilient state in face of all potential failures, and upon a failure (transaction failure or system failure), is always capable of restoring the database state to the consistent state defined as of the time of failure.

## The Principles:

1. Before a transaction T reaches its commit point, the system must ensure that it maintains enough information to allow T to be backed out, or aborted.
2. After a transaction T reaches its commit point, its updates are captured in such a way that, despite subsequent system failures, these updates are not lost and will in any case be restored in the database state.

The above strategy is essentially implemented through maintaining redundant information and implementing the logic for restoring the database state. The basic mechanism for implementation consists of the following:

- Logging
- Redo and undo
- Checkpoint and database dump

## Methods for Writing Updates to a Database
### In-place update
When a transaction *T* executes a write operation on a data item *d*, the before image of *d*, *bef(d)*, in the databse is immediately overwritten with the after image of *d*, *aft(d)*. This is also referred to as dirty write, since the change to d is not yet committed at the time it is reflected in the database.

To guard against failures, *bef(d)* must be written to the log when *d* is overwritten. In case *T* commits later, this value in the log is not used. In case *T* is aborted later, or in case the system fails before *T* commits such that upon system recovery *T* is aborted, the before image *bef(d)* in the log is used to back out the update, by replacing the value of *d* in the database with its before image.

The in-place update method makes it easier to commit a transaction; however, aborting a transaction involves more work.

### Update in private work space
When a transaction *T* executes a write operation on a data item *d*, the before image of *d*, *bef(d)*, in the database is not overwritten. Instead, the after image *aft(d)* is written to a private work space. If *T* or the system subsequently fails before *T* reaches its commit point, its private work space are installed into the database. This way, the database always contains only committed updates.

The private work space method makes it easier to abort a transaction; however, committing a transaction involves more work.

### Shadow-page
this approach can be used when the database consists of logical pages as data items, and the pages are managed through a page map which maps a logical page to a physical page.

These basic methods may also be combined to form hybrid methods.
Most DBMS's today uses methods that are primarily based on the in-place update method.


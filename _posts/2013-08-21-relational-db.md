---
layout: post
title: The Value of Relational Databases
date: 2013-08-21
categories: [computer science]
tags: [big data]

---
## The Value of Relational Databases
Relational databases have become such an embedded part of our computing culture that it’s easy to take them for granted. It’s therefore useful to revisit the benefits they provide.

### Getting at Persistent Data
Probably the most obvious value of a database is keeping large amounts of persistent data. Most computer architectures have the notion of two areas of memory: a fast volatile “main memory” and a larger but slower “backing store.” Main memory is both limited in space and loses all data when you lose power or something bad happens to the operating system. Therefore, to keep data around, we write it to a backing store, commonly seen a disk (although these days that disk can be persistent memory).

The backing store can be organized in all sorts of ways. For many productivity applications (such as word processors), it’s a file in the file system of the operating system. For most enterprise applications, however, the backing store is a database. The data “base allows more flexibility than a file system in storing large amounts of data in a way that allows an application program to get at small bits of that information quickly and easily.

### Concurrency
Enterprise applications tend to have many people looking at the same body of data at once, possibly modifying that data. Most of the time they are working on different areas of that data, but occasionally they operate on the same bit of data. As a result, we have to worry about coordinating these interactions to avoid such things as double booking of hotel rooms.
Concurrency is notoriously difficult to get right, with all sorts of errors that can trap even the most careful programmers. Since enterprise applications can have lots of users and other systems all working concurrently, there’s a lot of room for bad things to happen. Relational databases help handle this by controlling all access to their data through transactions. While this isn’t a cure-all (you still have to handle a transactional error when you try to book a room that’s just gone), the transactional mechanism has worked well to contain the complexity of concurrency.

Transactions also play a role in error handling. With transactions, you can make a change, and if an error occurs during the processing of the change you can roll back the transaction to clean things up.


### Integration
Enterprise applications live in a rich ecosystem that requires multiple applications, written by different teams, to collaborate in order to get things done. This kind of inter-application collaboration is awkward because it means pushing the human organizational boundaries. Applications often need to use the same data and updates made through one application have to be visible to others.

A common way to do this is **shared database integration** where multiple applications store their data in a single database. 
Using a single database allows all the applications to use “each others’ data easily, while the database’s concurrency control handles multiple applications in the same way as it handles multiple users in a single application.


### (Mostly) Standard Model
Relational databases have succeeded because they provide the core benefits we outlined earlier in a (mostly) standard way. As a result, developers and database professionals can learn the basic relational model and apply it in many projects. Although there are differences between different relational databases, the core mechanisms remain the same: Different vendors’ SQL dialects are similar, transactions operate in mostly the same way.


### References
[1] Pramod J. Sadalage, Martin Fowler, NoSQL Distilled, A Brief Guide to the Emerging World of Polyglot Persistence, Pearson Education, Inc, 2012.
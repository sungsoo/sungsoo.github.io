---
layout: post
title: MVCC Overview
date: 2016-01-19
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [MVCC Part 1: An Overview]()
* Authors: Trek Palmer

---


MVCC Part 1: An Overview 
------------------------

Databases are simple souls. They want to ingest your data, cherish it,
and return it to you (the programmer) in whatever form you demand. For
practicalities’ sake, any database worth its salt should allow as many
requests to be processed simultaneously as possible. SQL is a
declarative language. What that means is that your average SQL statement
doesn’t dictate how to perform the statement, it just lays out the
parameters that the database should operate within when executing the
statement. This means that a programmer that interacts with a database
is ceding control over the specifics to the database itself. This is a
good thing. Truly. It means that the application logic is decoupled from
the specifics of data storage. The consequence of this is that the
database itself needs to be able to manage multiple concurrent clients.
Specifically, the database needs to handle situations where multiple
transactions (from multiple clients) are reading and writing the same
piece of data at the same time.

Those readers who’ve delved into conventional concurrent code will
probably look at this and say ‘why not use a read/write lock?’. This is
a reasonable request, and one that was adopted (in some form or another)
by many databases over the years. However, there is a serious problem
with this approach. Namely, that readers block writers and writers block
readers. These are, of course, the semantics of a read/write lock and
are not too shocking. However, those semantics can have seriously bad
performance implications for any transactional database.

Consider a system where there’s two kinds of transactions. One is a big
long-running read transaction that’s building up some kind of report (or
doing some new-fangled analytics). There’s only one of these guys
running at a time. The other kind of transaction is a short running user
action. A couple of reads and a write or two. Say it’s an order request
or something. There can be thousands of these guys. The problem with
read/write locks is that if there is any overlap at all between the
long-running transaction’s set of read data and any short-running
transaction’s set of written data the short transaction may have to
block until the long-running transaction completes. In today’s frenetic
world of interwebs and such, even if the long-running transaction is
really only running for a few seconds such a delay in order processing
can be unacceptable. So, the problem is still to have the highest
concurrency possible with some reasonable latency guarantee. Ideally, a
transaction should only have to block if it is, in fact, truly
contesting another transaction for the ‘right’ to update a particular
row (in fact, blocking is just one approach that the databases
concurrency control mechanisms can employ). In the back-of-the-envelope
example above, the long-running transaction shouldn’t ever cause a
short-running transaction to block. And no two short-running
transactions should interfere/block one another unless they’re actually
updating the same row. How do we accomplish such a feat when read/write
locks have failed us? The answer, at least for nuodb and many modern
databases, is Multi-Version Concurrency Control.

 

**What is MVCC?**
-----------------

**‘**Great’, you may say, now I know what problem MVCC is meant to
solve. ‘How does it solve it?’ The answer is in the name. Rather than
simply having a predetermined storage spot for a given record and doing
a bunch of fancy locking around that, the DB allows a given record to
have multiple simultaneous versions. Updates are now installing a new
version of a row. Therefore, writers are contesting over the rights to
add a new version to the top version of the row, and readers can read
any visible version. In the example above, this means that the
long-running read transaction won’t ever lock anything. Therefore, it
can’t cause any of the short-running transactions to block. And, only
when two (or more) transactions are vying for update rights to a
particular row version, can they interfere with one another. If one
maintains visibility information so that for a given transaction, one
can find out which versions of a row are visible, then MVCC can be used
to implement snapshots of the database. In effect, when a transaction
starts, it ‘freezes’ a collection of record versions as its visible set.
Updates to those versions are now logically after that transaction has
read them (even if the thread(s) executing that transaction haven’t
physically read that row version). All you need to support MVCC
semantics are: a record storage system that allows you to store
different versions of the same record, a system that allows some kind of
locking whereby other transactions know that a record is being
concurrently updated, and a mechanism that allows one to translate
record version number into transaction Ids so that visibility
calculations can be made.

 

**SQL and MVCC**
----------------

 Given an MVCC system, it can be used to implement SQL semantics. SQL
provides various ‘isolation levels’ which are basically a knob that
allows the programmer to dial in the level of consistency they need (the
assumption is that the less consistency, the more performance). In the
context of MVCC, this means that when a transaction hits a record that’s
being updated by another transaction the action taken depends on the
isolation level. At the lowest level of consistency, one could allow the
transaction to read the update before the updating transaction has
committed (a ‘dirty read’). Ugly, but fast. The next level of
consistency would  prevent dirty reads, and would just read the version
calculated from the transaction’s visibility. This is known as
‘consistent reading’. Updates are more complicated. An update attempt
that hits a record version undergoing an uncommitted update has two
options, it can freak out and fail straight away, or it can wait for the
updating transaction to complete and make a decision based on committed
state. Low isolation levels will fail fast, because logically they’re
seeing a transaction’s updates as they happen. High
isolation/consistency levels will need to block (or retry depending on
your tastes), until the final state of the record is known.

 

Hope this got you readers interested in MVCC. When the wordpress media
stuff is online, I’ll do a post with pictures that will illustrate MVCC
more concretely.

Take a look at [Part
2](http://dev.nuodb.com/techblog/2013/03/13/mvcc-part-2-pretty-pictures-and-some-examples),
[Part
3](http://dev.nuodb.com/techblog/mvcc-part-3-subtleties-consistency-and-visibility),
and [Part 4](http://dev.nuodb.com/techblog/mvcc-part-4-distributed-mvcc)
in this MVCC series.
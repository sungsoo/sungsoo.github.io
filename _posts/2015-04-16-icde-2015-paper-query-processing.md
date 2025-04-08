---
layout: post
title: Transaction Processing on Confidential Data using Cipherbase
date: 2015-04-16
categories: [computer science]
tags: [big data]

---

## Transaction Processing on Confidential Data using Cipherbase

## Abstract

Cipherbase is a comprehensive database system that
provides strong end-to-end data confidentiality through encryption.
Cipherbase is based on a novel architecture that combines an
industrial strength database engine (SQL Server) with lightweight
processing over encrypted data that is performed in secure
hardware. The overall architecture provides significant benefits
over the state-of-the-art in terms of security, performance, and
functionality.


This paper presents a prototype of Cipherbase that uses
FPGAs to provide secure processing and describes the system engineering
details implemented to achieve competitive performance
for transactional workloads. This includes hardware-software codesign
issues (e.g. how to best offer parallelism), optimizations
to hide the latency between the secure hardware and the main
system, and techniques to cope with space inefficiencies. All these
optimizations were carefully designed not to affect end-to-end
data confidentiality. Our experiments with the TPC-C benchmark
show that in the worst case when all data are strongly encrypted,
Cipherbase achieves 40% of the throughput of plaintext SQL
Server. In more realistic cases, if only critical data such as
customer names are encrypted, the Cipherbase throughput is
more than 90% of plaintext SQL Server.


## Design Philosophy

A large part of database processing does not deal with data
value semantics. This includes moving data, query setup/result
communication, and almost all of concurrency control and
recovery. Almost all of this processing is unaffected whether
we are handling plaintext or encrypted data. Cipherbase exploits
this observation and uses a regular database system (SQL
Server) to implement this functionality.


At the same time, a core part of database processing does
depend on data value semantics, including query expression
evaluation over tuples and comparisons during index traversals.
In general, these operations cannot be performed directly over
encrypted data. In Cipherbase, we factor out such processing
and run it in a *trusted module (TM)*. The trusted module is
designed to be inaccessible to the adversary, allowing us to
securely decrypt data and perform operations on plaintext.

## References

[1] Arvind Arasu, Ken Eguro, Manas Joglekar, Raghav Kaushik, Donald Kossmann, Ravi Ramamurthy, Transaction Processing on Confidential Data using Cipherbase, *IEEE International Conference on Data Engineering 2015 (ICDE 2015)*.
---
layout: post
title: Underlying Communication Paradigms
date: 2014-04-28
categories: [computer science]
tags: [design patterns, hadoop & mapreduce]

---

## Article Source
* Title: *DISTRIBUTED SYSTEMS Concepts and Design* Fifth Edition
* Authors: George Coulouris, Jean Dollimore, Tim Kindberg and Gordon Blair

![](http://sungsoo.github.com/images/communication-paradigms.png)
# Underlying communication paradigms
It is clear that the choice of underlying communication paradigm(s) is crucial to the success of an overall system design. Options include:
* using an underlying *interprocess communication* service directly, such as that offered by socket abstractions
* using a *remote invocation* service (such as a request-reply protocol, remote procedure calls or remote method invocation) offering support for client-server interactions
* using an indirect communication paradigm such as group communication, distributed event-based approaches, tuple spaces or distributed shared memory approaches.
In keeping with the design principles identified in [the previous post](http://sungsoo.github.io/2014/04/28/overall-architecture-and-design-philosophy.html), Google adopts a simple, minimal and efficient remote invocation service that is a variant of a *remote procedure call approach*.
Readers will recall that remote procedure call communication requires a serialization component to convert the procedure invocation data (procedure name and parameters, possibly structured) from their internal binary representation to a *flattened* or *serialized* processor-neutral format ready for transmission to the remote partner. Serialization for Java RPC is described in Section 4.3.2 [1]. XML has emerged more recently as a ‘**universal**’ serialized data format, but its generality brings substantial *overheads*. Google has therefore developed a *simplified* and *high-performance serialization* component known as **protocol buffers** that is used for a substantial majority of interactions within the infrastructure. This can be used over any underlying communication mechanism to provide an RPC capability. An open source version of protocol buffers is available [code.google.com](http://code.google.com/).
A separate *publish-subscribe service* is also used, recognizing the key role that this paradigm can offer in many areas of distributed system design, including the *efficient* and *real-time dissemination* of events to multiple participants. In common with many other distributed system platforms, the Google infrastructure therefore offers a *hybrid* solution allowing developers to select the best communication paradigm for their requirements. Publish-susbcribe is not an alternative to protocol buffers in the Google infrastructure, but rather an augmentation offering an added-value service for where it is most appropriate.
We examine the design of these two approaches below, with emphasis on protocol buffers (full details of the publish-subscribe protocol are not yet publicly available).
Remote invocation
---Protocol buffers place emphasis on the description and subsequent serialization of data, and hence the concept is best compared to direct alternatives such as XML. The goal is to provide a *language- and platform-neutral* way to specify and serialize data in a manner that is simple, highly efficient and extensible; the serialized data can then be used for subsequent storage of data or transmission using an underlying communications protocol, or indeed for any other purpose that demands a serialization format for structured data. We will see later how this can be used as the basis for RPC- style exchange.
In protocol buffers, a language is provide for the specification of *messages*. We introduce the key features of this (simple) language by example, with Figure 21.7 showing how a book message might be specified.
As can be seen, the overall *Book* message consists of a series of uniquely numbered fields, each represented by a field name and the type of the associated value.   

The type can be one of:
* *a primitive data type* (including integer, floating-point, boolean, string or raw bytes);![](http://sungsoo.github.com/images/protocol-buffers-example.png)
# References
[1] George Coulouris, Jean Dollimore, Tim Kindberg and Gordon Blair, *DISTRIBUTED SYSTEMS Concepts and Design* Fifth Edition, Pearson Education, Inc., 2012.

---
layout: post
title: Synchronization among Heterogeneous Distributed Objects
date: 2014-01-17
categories: [computer science]
tags: [papers, research]

---

What is a Distributed System?
--

A distributed system is a collection of *autonomous hosts* that that are connected through a computer network. Each host executes components and operates a distribution middleware, which enables the components to coordinate their activities in such a way that users perceive the system as a single, integrated computing facility.

Principles of Object-Oriented Middleware
--

Network Operating System
Facilitate physical interchange of electrical or optical signals as packets of information
Detect and correct transmission errors
Implement routing of packets between hosts
Compose packets into messages
Application 
Requesting operations from remote objects
Middleware
Shield lower level details from applications


Synchronization
--

What should client do while server executes
Wait?
Not care?
Proceed concurrently and re-synchronise later?
What should server do if clients request operations concurrently
Process them sequentially?
Process them concurrently?
Each of these reasonable
Most supported by middleware primitives


References
--
[1] Wolfgang Emmerich and Nima Kaveh, *Validating Distributed Object & Component Designs*, 2003. 
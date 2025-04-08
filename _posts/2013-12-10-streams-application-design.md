---
layout: post
title: Streams Application Design
date: 2013-12-10
categories: [computer science]
tags: [stream computing, design patterns]

---

Let us assume that you have been tasked with producing a business requirement using the **IBM InfoSphere Streams** platform. The first thing you need to do is develop a high level system design that identifies the main components of the system.
As shown in Figure 3-1, there are two main components to this design: 

 
* A *logical* design identifying the application components to be produced.  
* A *physical* component design identifying the runtime components and hardware platform required to support your application and deliver the level of performance that is required.

 
At run time, the *Streams Scheduler* determines how to efficiently segment the application across the hardware hosts. The application should be segmented to produce suitably sized deployable *Processing Elements* for the Streams Scheduler to deploy. 

![http://sungsoo.github.io/images/application-design.png](http://sungsoo.github.io/images/application-design.png)


###References

[1] Chuck Ballard et. al, IBM InfoSphere Streams: Harnessing Data in Motion, IBM Redbooks, September 2010.
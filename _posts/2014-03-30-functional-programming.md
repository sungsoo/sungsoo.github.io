---
layout: post
title: Functional Programming
date: 2014-03-30
categories: [computer science]
tags: [big data]

---

Introduction
---

The transition to functional programming requires a paradigm shift away from software designed to control state and toward software that has a focus on *independent data transformation*. Most popular programming languages used today, such as C, C++, Java, Ruby, and Python, were written with the needs of a single node as a target platform in mind. Although the compilers and libraries for these languages do support multiple threads on multicore CPUs, the languages and their libraries were created before NoSQL and *horizontal scalability* on multiple node clusters became a business requirement. In this chapter, we’ll look at how organizations are using languages that focus on *isolated data transformations* to make working with distributed systems easier.

In order to meet the needs of modern distributed systems, you must ask yourself how well a programming language will allow you to write applications that can exponentially scale to serve millions of users connected on the web. It’s no longer sufficient to design a system that will scale to 2, 4, or 8 core processors. You need to ask if your architecture will scale to 100, 1,000, or even 10,000 processors.
As we’ve discussed throughout this book, most NoSQL solutions have been specifically designed to work on many computers. It’s the hallmark of horizontal scalability to keep all processors in your cluster working together and adapting to changes in the cluster automatically. Adding these features after the fact is usually not possible. It must be part of the initial design, in the lowest levels of your application stack. The *inability of SQL joins* to scale out is an excellent example of how retrofits don’t work.

Some software architects feel that to make the shift to true *horizontal scale-out*, you need to make a paradigm shift at the language and runtime library level. This is the shift from a traditional world of *object* and *procedural* programming to *functional* programming. Today most NoSQL systems are embracing the concepts of functional programming, even if they’re using some traditional languages to implement the lower-level algorithms. In this chapter, we’ll look into the benefits of the functional programming paradigm and show how it’s a significant departure from the way things are taught in most colleges and universities today.


What is functional programming?
---

To understand what functional programming is and how it’s different from other programming methods, let’s look at how *software paradigms* are classified. A high-level taxonomy of software paradigms is shown in figure 10.1.

![](http://sungsoo.github.com/images/taxonomy-of-software-paradigms.png)

We’ll first look at how most popular languages today are based on managing program state and memory values. We’ll contrast this with functional programming, which has a focus on data transformation. We’ll also look at how functional programming systems are closely matched with the requirements of distributed systems.

You’ll be able to visualize functional programming as isolated transformations of data flowing through a series of pipes. If you can keep this model in mind, you’ll understand how these transforms can be distributed over multiple processors and promote horizontal scalability. You’ll also see how side effects prevent systems from achieving these goals.

Imperative programming is managing program state
---

The programming paradigm of most computer systems created in the past 40 years centers around state management, or what’s called *imperative programming systems*. Procedural and object languages are both examples of imperative programming systems.


Figure 10.2 is an illustration of this state-management-focused system.

![](http://sungsoo.github.com/images/object-architecture.png)


Using program counters and memory to manage state was the goal of John von Neumann and others in the 1940s when they developed the first computer architecture. It specified that both data and programs were stored in the same type of core memory and a program counter stepped through a series of instructions and updated memory values. High-level programming languages divided memory into two regions: *data* and *program* memory. After a computer program was compiled, a *loader* loaded the program code into program memory and the data region of memory was allocated to store programming variables.


This architecture worked well for single-processor systems as long as it was clear which programs were updating specific memory locations. But as programs became more complex, there was a need to control which programs could update various regions of memory. In the late 1950s, a new trend emerged that required the ability to protect data by allowing specific access methods to update regions of data memory. The data and the methods, when used together, formed new programming constructs called objects.

An example of the object state is shown in figure 10.3.
Objects are ideal for simulating real-world objects on a single processor. You model the real world in a series of programming objects that represent the state of the objects you’re simulating. For example, a bank account might have an account ID, an account holder name, and a current balance. A single bank location might be simulated as an object that contains all the accounts at that bank, and an entire financial institution might be simulated by many bank *objects*.

![](http://sungsoo.github.com/images/imperative-programs.png) 


But the initial object model using methods to guard object state didn’t have any inherent functions to manage concurrency. Objects themselves didn’t take into account that there might be hundreds of concurrent threads all trying to update the state of the objects. When it came to “undoing” a series of updates that failed halfway through a transaction, the simple object model became complex to manage. Keeping track of the state of many objects in an imperative world can become complex.

Let’s take a look at a single operation on an object. In this example, the objective is to increment a single variable. The code might read `x=x+1`, meaning “x is assigned a new value of itself plus one.” What if one computer or part of a network crashes right around this line of code? Does that code get executed? Does the current state represent the correct value or do you need to rerun that line of code?

Keeping track of the state of an ever-changing world is easy on a single system, but becomes more complex when you move to distributed computing. Functional programming offers a different way of approaching computation by recasting computation as a series of independent data transformations. After you make this transition, you don’t need to worry about the details of state management. You move into a new paradigm where all variables are immutable and you can restart transforms again without worrying about what external variables you’ve changed in the process.

References
---
[1] DAN MCCREARY and ANN KELLY, *Making Sense of NoSQL; A GUIDE FOR MANAGERS AND THE REST OF US*, Manning Publications Co., 2014.


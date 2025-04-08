---
layout: post
title: Why Functional Programming?
date: 2014-03-29
categories: [computer science]
tags: [big data, developments, parallel computing]

---
### Summary

* Article Source: Dean Wampler, *Functional Programming for Java Developers*, O’Reilly Media, Inc., 2011.


A few years ago, when many developers started talking about functional programming (FP) as the best way to approach *concurrency*, I decided it was time to learn more and judge for myself. I expected to learn some new ideas, but I assumed I would still use **object-oriented programming (OOP)** as my primary approach to software development. I was wrong.

As I learned about *functional programming*, I found good ideas for implementing *concurrency*, as I expected, but I also found that it brought new *clarity* to my thinking about the design of types and functions. It also allowed me to write more *concise* code. Functional programming made me rethink where module boundaries should go and how to make those modules better for *reuse*. I found that the functional programming community was building innovative and more powerful type systems that help enforce correctness. I also concluded that functional programming is a better fit for many of the unique challenges of our time, like working with *massive data sets* and remaining *agile* as requirements change ever more rapidly and schedules grow ever shorter.

Instead of remaining an OOP developer who tosses in some FP for seasoning, today I write functional programs that use objects judiciously. You could say that I came to FP for the concurrency, but I stayed for the “**paradigm shift.**”

The funny thing is, we’ve been here before. A very similar phenomenon occurred in the 80s when OOP began to go mainstream. Objects are an ideal way of representing graphical widgets, so OOP was a natural fit for developing Graphical User Interfaces (GUIs). However, once people started using objects, they found them to be an intuitive way to represent many “domains.” You could model the problem domain in objects, then put the *same object model* in the code! Even implementation details, like various forms of input and output, seemed ideal for object modeling.

But let’s be clear, both FP and OOP are tools, not panaceas. Each has advantages and disadvantages. It’s easy to stick with the tried and true, even when there might be a better way available. Even so, it’s hard to believe that objects, which have worked so
well in the past, could be any less valuable today, isn’t it? For me, my growing interest in functional programming isn’t a repudiation of objects, which have proven benefits. Rather, it’s a recognition that the drawbacks of objects are harder to ignore when faced with the programming challenges of today. The times are different than they were when objects were ascendant several decades ago.


Here, in brief, is why I became a functional programmer and why I believe you should learn about it, too. For me, functional programming offers the best approach to meet the following challenges, which I face every day.


I Have to Be Good at Writing Concurrent Programs
---

It used to be that a few of the “smart guys” on the team wrote most of the *concurrent* code, using *multithreaded concurrency*, which requires carefully synchronized access to shared, mutable state. Occasionally everyone would get a midnight call to debug some nasty concurrency bug that appeared in production. But most of the time, most of the developers could ignore concurrency.

Today, even your phone has several CPU cores (or your next one will). Learning how to write *robust* concurrent software is no longer optional. Fortunately, functional programming gives you the right principles to think about concurrency and it has spawned several *higher-level concurrency abstractions* that make the job far easier.

> Multithreaded programming, requiring synchronized access to shared, mutable state, is the assembly language of concurrency.

Most Programs Are Just Data Management Problems
---

I work a lot with *big data* these days, mostly using the **Apache Hadoop ecosystem** of tools, built around *MapReduce*. When you are ingesting *terabytes* of new data *each* day, when you need to cleanse and store that data, then do analysis on the *petabytes* of accumulated data, you simply can’t afford the overhead of objects. You want very efficient data structures and operations on that data, with minimal overhead. The old *agile* catch phrase, *What’s the simplest thing that could possibly work?*, takes on new meaning.

I started thinking about how we manage smaller data sets, say in a typical IT application backed by a database. If objects add overhead for big data problems, what about the overhead for smaller data problems? Performance and storage size are less likely to be issues in this case, but team agility is a pervasive issue. How does a small team remain nimble when enhancing an IT application, year after year? How does the team keep the code base as concise as possible?

I’ve come to believe that faithfully representing the domain object model in code should be questioned. *Object-relational mapping* (**ORM** ) and similar forms of object middleware add overhead for transforming relational data into objects, moving those objects around the application, then ultimately transforming them back to relational data for updates. Of course, all this extra code has to be tested and maintained.

I know this practice arose in part because we love objects and we often hate relational data, or maybe we just hate working with relational databases. (I speak from personal experience.) However, relational data, such as the result sets for queries, are really just collections that can be manipulated in a functional way. Would it be better to work directly with that data?

I’ll show you how working directly with more fundamental collections of data minimizes the overhead of working with object models, while still avoiding duplication and promoting reuse.


Functional Programming Is More Modular
---

Years ago, I had a large client that struggled to get work done with their bloated code base. Their competition was running circles around them. One day I saw something that captured their problems in a nutshell. I walked by a five-foot partition wall with a UML diagram that covered the wall. I remember one class in particular, a **Customer** class. It stretched the whole five feet. This was a failure of modularity, specifically in finding the correct levels of abstraction and decomposition. The **Customer** class had become a grab bag of everything anyone might associate with one of their customers.

In the late 1980s, when object-oriented programming was on the rise, many people hoped that objects would finally solve the problem of building reusable components that you plug together to build applications, greatly reducing costs and development times. This vision seems so reasonable that it is easy to overlook the fact that it didn’t turn out as well as we hoped. Most of the successful examples of reusable libraries are platforms that defined their own standards that everyone had to follow. Examples include the JDK, the Spring Framework, and the Eclipse plugin API. Even most of the third-party “component libraries” we might use (for example, Apache Commons) have their own custom APIs that we must conform to. For the rest of the code we need, we still rewrite a lot of it project after project. Hence, object-oriented software development isn’t the “component assembly” we hoped would emerge.

The nearly limitless flexibility of objects actually undermines the potential for reuse, because there are few standards for how objects should interconnect and we can’t agree on even basic names of things! Systems with greater constraints are actually more modular, which is a paradox. The book *Design Rules: The Power of Modularity* [2] demonstrates that the explosive growth of the PC industry was made possible when IBM created a de facto standard for the personal computer hardware architecture. Because of standardized buses for peripherals and connectors, it enabled innovators to create new, better, and cheaper drives, mice, monitors, motherboards, etc. Digital electronics is itself a great example of a modular system. Each wire carries only a 0 or 1 signal, yet when you join them together in groups of 8, 16, 32, and 64, you can build up protocol layers that make possible all the wonderful things that we’ve come to do with computers.

*There are no similar standards for object-based components.* Various attempts like CORBA and COM had modest success, but ultimately failed for the same basic reasons, that objects are at the wrong level of abstraction. Concepts like “customer” are rarely new, yet we can’t find a way to stop inventing a new representation for them in every new project, because each project brings its own context and requirements.

However, if we notice that an object is fundamentally just an aggregation of data, then we can see a way to define better standardized abstractions at lower levels than objects, analogous to digit circuits. These standards are the fundamental collections like *list*, *map*, and *set*, along with “primitive” types like numbers and few well-defined domain concepts (e.g., Money in a financial application).

A further aid to modularity is the nature of *functions* in functional programming, which avoid side effects, making them free of dependencies on other objects and therefore easier to reuse in many contexts.

The net result is that a functional program defines abstractions where they are more useful, easier to reuse, compose, and also test.

> Any arbitrarily complex object can be decomposed into “atomic” values (like primitives) and collections containing those values and other collections.

I Have to Work Faster and Faster
---

Development cycles are going asymptotically to zero length. That sounds crazy, especially if you started professional programming when I did, when projects typically lasted months, even years. However, today there are plenty of Internet sites that deploy new code *several times a day* and all of us are feeling the pressure to get work done more quickly, without sacrificing quality, of course.

When schedules were longer, it made more sense to model your domain carefully and to *implement* that domain in code. If you made a mistake, it would take months to correct with a new release. Today, for most projects, *understanding the domain precisely* is less important than delivering some value quickly. Our understanding of the domain will change rapidly anyway, as we and our customers discover new insights with each deployment. If we misunderstand some aspect of the domain, we can fix those mistakes quickly when we do frequent deployments.

If careful modeling seems less important, faithfully *implementing* the object model is even more suspect today than before. While **Agile Software Development **has greatly improved our quality and our ability to respond to change, we need to rethink ways to keep our code “minimally sufficient” for the requirements today, yet flexible for change. Functional programming helps us do just that.


Functional Programming Is a Return to Simplicity
---

Finally, building on the previous points, I see functional programming as a reaction against accidental *complexity*, the kind we add ourselves by our implementation choices, as opposed to the inherent complexity of the problem domain. So, for example, much of the *object-oriented middleware* in our applications today is unnecessary and wasteful, in my opinion.

I know that some of these claims are provocative. I’m not trying to convince you to abandon objects altogether or to become an FP zealot. I’m trying to give you a bigger toolbox and a broadened perspective, so you can make more informed design choices and maybe refresh your enthusiasm for the art and science of software development. I hope this short introduction will show you why my thinking changed. Maybe your thinking will change, too.

Let’s begin!


References
---
[1] Dean Wampler, *Functional Programming for Java Developers*, O’Reilly Media, Inc., 2011.  
[2] Carliss Baldwin and Kim B. Clark, *Design Rules: The Power of Modularity*, Vol. 1, MIT Press, 2000


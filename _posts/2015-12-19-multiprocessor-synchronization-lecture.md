---
layout: post
title: Multiprocessor Synchronization
date: 2015-12-19
categories: [computer science]
tags: [parallel computing]

---

# Course: Multiprocessor Synchronization

## Why Multiprocessor Programming?

The Art of Multiprocessor Programming Textbook Cover
The computer industry is undergoing a paradigm shift. Chip manufacturers are shifting development resources away from single-processor chips to a new generation of multi-processor chips known as multicores.

This fundamental change in our core computing architecture will require a fundamental change in how we program. The art of multiprocessor programming, currently mastered by few, is more complex than programming uniprocessor machines, and requires an understanding of new computational principles, algorithms, and programming tools.

Concurrent computation on uniprocessor and multiprocessor architectures have many aspects in common. The key issue that distinguishes multiprocessor programming from concurrent uniprocessor programming is the need to understand how concurrent computations on separate processors coordinate with one another, a broad and intricate problem area we call multiprocessor synchronization.

![](http://cs.brown.edu/courses/cs176/imgs/textbook.jpg)

Our textbook is [The Art of Multiprocesor Programming, Revised Print](http://www.amazon.com/Art-Multiprocessor-Programming-Revised-Reprint/dp/0123973376/ref=sr_1_3?s=books&ie=UTF8&qid=1344803864&sr=1-3), by Maurice Herlihy and Nir Shavit. Students will be able to provide comments and feedback on it using MIT's NB. The textbook is also available to students through the Brown University Library website.


## Course Information

The course will approach multiprocessor programming from two complementary directions. In the first part of the course, we focus on foundations: what do our programs and machines need to provide in order to ensure that concurrent programs do what we expect. We use an idealized model of computation in which multiple concurrent threads manipulate a set of shared objects. This model is essentially the model presented by standard Java™ or C++ threads packages.

The foundations section is intended to build up the reader's intuition and confidence in understanding and reasoning about concurrency. We approach this goal using examples, counter-examples, models, and exercises. These elements are laid out in a structured and progressive manner, from simple machine instructions to powerful universal constructions, the equivalent of Turing machines for multiprocessors.

The second part of the course will be concerned with performance. Reasoning about the performance of concurrent programs and data structures is very different in flavor from reasoning about their sequential counterparts. Sequential programming is based on a well-established and well-understood set of abstractions. There is little or no need to understand the specifics of the underlying architecture. In multiprocessor programming, by contrast, there are no such well-established abstractions. It is impossible to reason effectively about the performance of a concurrent data structure without understanding the fundamentals of the underlying architecture.

The performance part of the course will revisit many of the issues first raised in the foundations section, but in a more realistic model that exposes those aspects of the underlying architecture that most influence performance. The course then goes through a sequence of fundamental data structures, the concurrent analogs of the data structures found in any undergraduate data structures course, and a few coordination structures that are unique to the world of multithreaded computation. These data structures are introduced in an incremental way, each one extending the techniques developed for its predecessors. Each of these data structures is useful in and of itself as a reference. Moreover, by the end, the student will have built up a solid understanding of the fundamentals of concurrent data structure design, and should be well-prepared to design and implement his or her own concurrent data structures.

Our hope is that at the end of the course students will have a basic understanding of both the foundations and the practice of multiprocessor and multicore programming.


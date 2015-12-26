---
layout: post
title: Clang MapReduce
date: 2015-12-28
categories: [computer science]
tags: [parallel computing]

---


Clang MapReduce -- Automatic C++ Refactoring at Google Scale
===

Google has over 100 million lines of code, and our biggest programming language is C++. We have a single, shared codebase developed primarily on mainline. We build every binary and all of its libraries from scratch every time, allowing us to incrementally evolve APIs and libraries over time. The entire development process is extremely incremental in nature, and even API-breaking changes are a regular occurrence. However, for core libraries used throughout the codebase, this development model is a huge challenge: *how do we incrementally evolve an API in use by tens of thousands of other libraries?* The answer is to use *Clang* to automatically refactor APIs and their users across the codebase. *How do we scale Clang up to possibly the single largest unified codebase in the world?* The same way Google scales anything else: MapReduce. By coupling Clang's library design and architecture to existing Google infrastructure we can automatically compile, analyze, and refactor the entire Google codebase in minutes. In this talk, I will dive into the challenges of refactoring C++ code, how we're using Clang and making it even better at solving them, and how we scale these solutions to the size of our codebase.

<iframe width="600" height="400" src="https://www.youtube.com/embed/mVbDzTM21BQ" frameborder="0" allowfullscreen></iframe>
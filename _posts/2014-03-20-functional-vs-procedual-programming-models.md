---
layout: post
title: Functional versus Procedural Programming Models
date: 2014-03-20
categories: [computer science]
tags: [parallel computing]

---

# Functional versus procedural programming models

When we talk of map and reduce, we do so as operations within a functional programming model. Functional programming is one of the two ways that software developers create programs to address business problems. The other model is procedural programming. We take a quick look to understand the differences and to see when it’s best to use one or the other model.


Procedural programs are highly structured and provide step-by-step instructions on what to do with input data. The order of the execution is important, and the input data is changed as it progresses through each step of the program. Examples of procedural languages include FORTRAN, COBOL, C, and C++. The best uses for procedural programs are those where it is okay to change the values of the input data or where you need to compare computed values in one of the steps to determine whether you
need to continue processing or exit the pro- gram and deliver the result.

In contrast, functional programs do not change the input data. They look at all the data for spe- cific patterns and then apply rules to identify the important elements and then assemble them into lists. The order of the processing is not impor- tant because each operation is independent of another. Examples of functional languages include LISP, Scheme, Prolog, and R. Functional programs do not change the input data and are most often used when it is necessary to look at the data again and again for different patterns. For example, you could look through a list of all the counties in the United States that voted Republican in the last election and then go through the list for all Democratic counties. This will produce two distinct output lists.

# What is Functional Programming?

The deep roots of functional programming
---

A person who’s grown up in the imperative world might be thinking, *These people must be crazy!* How could people ever write software without changing variables? The concepts behind functional programming aren’t new. They go back to the founda- tions of computer science in the 1940s. The focus on transformation is a core theme of lambda calculus, first introduced by Alonzo Church. It’s also the basis of many LISP-based programming languages popular in the 1950s. These languages were used in many artificial intelligence systems because they’re ideal for managing symbolic logic.

Despite their popularity in AI research, LISP languages, and their kin (Schema, Clojure, and other languages), functional languages aren’t typically found in business applications. Fortran dominated scientific programming because it could be vector- ized with specialized compilers. COBOL became popular for accounting systems because it tried to represent business rules in a more natural language structure. In the 1960s, procedural systems such as PASCAL also became popular, followed by object-oriented systems such as C++ and Java in the 1980s and 1990s. As horizon- tal scalability becomes more relevant, it’s important to review the consequences of the programming language choices you’ve made. Functional programming has many advantages as processor counts increase.

*Concurrent programming* has been around for a long time. It's now becoming popular because there are these systems with multiple CPUs in them. As a result, other things are also becoming popular that have been around for some time, and that is functional programming.

*Functional programming* turns out to be a good way to do concurrent programming. Functional programming is the idea that, well, you might maybe imagine how a traditional procedural program would work where it calls one thing, then it calls another, and then it calls another. Along the way it's modifying some data structure, something in the cloud, some files, some piece of memory, When it's done, you take a look at that data structure or that file in the cloud and you say, hey it's complete.

*Functional programming* is different. It keeps a copy of everything that it's working on, it always returns the results. So it takes an input, which is this data structure you are going to run, and it returns the data structure. So that it never, ever, has to touch something else in the cloud. You can see how this would work well, right? Because if you don't have to touch anything out there, then everybody can act independently. They don't care what's going out elsewhere in the cloud. And there's some languages that are very good for this. One of the classic ones is Erlang, which is getting a lot of play these days, and there are new ones like Scala. However, one of the bigger points that I think, for the developers out there, if there are any developers out there out there, hi! For the developers out there, it's important to not just jump on the latest bandwagon. Hey, lets write everything in Scala, or Erlang, or whatever. Functional programming and concurrent programming is really just a paradigm for how to program, right? You can program in any language; you can program in Python, in Java, in Erlang. Those other languages are very good and, historically, very interesting. The reason they are, is because they kind of force you to do things right. But if you just have some discipline, you can do it correctly.

<iframe width="600" height="400" src="//www.youtube.com/embed/TNYKNJlKY-c" frameborder="0" allowfullscreen></iframe>

# References
[1] Judith Hurwitz, Alan Nugent, Dr. Fern Halper, and Marcia Kaufman, *Big Data For Dummies*, John Wiley & Sons, Inc., 2013.

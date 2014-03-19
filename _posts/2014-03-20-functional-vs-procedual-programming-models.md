---
layout: post
title: Functional versus Procedural Programming Models
date: 2014-03-20
categories: [computer science]
tags: [parallel programming]

---

# Functional versus procedural programming models
When we talk of map and reduce, we do so as operations within a functional programming model. Functional programming is one of the two ways that software developers create programs to address business problems. The other model is procedural programming. We take a quick look to understand the differences and to see when it’s best to use one or the other model.
Procedural programs are highly structured and provide step-by-step instructions on what to do with input data. The order of the execution is important, and the input data is changed as it progresses through each step of the program. Examples of procedural languages include FORTRAN, COBOL, C, and C++. The best uses for procedural programs are those where it is okay to change the values of the input data or where you need to compare computed values in one of the steps to determine whether youneed to continue processing or exit the pro- gram and deliver the result.In contrast, functional programs do not change the input data. They look at all the data for spe- cific patterns and then apply rules to identify the important elements and then assemble them into lists. The order of the processing is not impor- tant because each operation is independent of another. Examples of functional languages include LISP, Scheme, Prolog, and R. Functional programs do not change the input data and are most often used when it is necessary to look at the data again and again for different patterns. For example, you could look through a list of all the counties in the United States that voted Republican in the last election and then go through the list for all Democratic counties. This will produce two distinct output lists.
What is Functional Programming?
---

<iframe width="600" height="400" src="//www.youtube.com/embed/TNYKNJlKY-c" frameborder="0" allowfullscreen></iframe>
# References
[1] Judith Hurwitz, Alan Nugent, Dr. Fern Halper, and Marcia Kaufman, *Big Data For Dummies*, John Wiley & Sons, Inc., 2013.

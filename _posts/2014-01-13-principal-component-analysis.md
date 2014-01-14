---
layout: post
title: Principal Component Analysis
date: 2014-01-13
categories: [mathmatical science]
tags: [graph mining]

---

Having been in the social sciences for a couple of weeks it seems like a large amount of quantitative analysis relies on Principal Component Analysis (PCA). This is usually referred to in tandem with eigenvalues, eigenvectors and lots of numbers. So what’s going on? Is this just mathematical jargon to get the non-maths scholars to stop asking questions? Maybe, but it’s also a useful tool to use when you have to look at data. This post will give a very broad overview of PCA, describing eigenvectors and eigenvalues (which you need to know about to understand it) and showing how you can reduce the dimensions of data using PCA. As I said it’s a neat tool to use in information theory, and even though the maths is a bit complicated, you only need to get a broad idea of what’s going on to be able to use it effectively.

There’s quite a bit of stuff to process in this post, but i’ve got rid of as much maths as possible and put in lots of pictures.

What is Principal Component Analysis?
--

First of all Principal Component Analysis is a good name. It does what it says on the tin. PCA finds the principal components of data.

It is often useful to measure data in terms of its principal components rather than on a normal x-y axis. So what are principal components then? They’re the underlying structure in the data. They are the directions where there is the most variance, the directions where the data is most spread out. This is easiest to explain by way of example. Here’s some triangles in the shape of an oval:





References
--
[1] [Principal Component Analysis 4 Dummies: Eigenvectors, Eigenvalues and Dimension Reduction](http://georgemdallas.wordpress.com/2013/10/30/principal-component-analysis-4-dummies-eigenvectors-eigenvalues-and-dimension-reduction/)
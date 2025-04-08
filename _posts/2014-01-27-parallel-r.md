---
layout: post
title: Parallel R
date: 2014-01-27
categories: [computer science]
tags: [big data]

---

Why R?
---

It’s tough to argue with R. Who could dislike a high-quality, cross-platform, open-source statistical software product? It has an interactive console for exploratory work. It can run as a scripting language to repeat a process you’ve captured. It has a lot of statistical calculations built-in so you don’t have to reinvent the wheel. Did we mention that R is *free*?  

When the base toolset isn’t enough, R users have access to a rich ecosystem of add-on packages and a gaggle of GUIs to make their lives even easier. No wonder R has become a favorite in the age of Big Data.

Since R is perfect, then, we can end this book. Right?

Not quite. It’s precisely the Big Data age that has exposed R’s blemishes.


Why Not R?
---

These imperfections stem not from defects in the software itself, but from the passage of time: quite simply, R was not built in anticipation of the Big Data revolution.

R was born in 1995. Disk space was expensive, RAM even more so, and this thing called The Internet was just getting its legs. Notions of “large-scale data analysis” and “high- performance computing” were reasonably rare. Outside of Wall Street firms and uni- versity research labs, there just wasn’t that much data to crunch.

Fast-forward to the present day and hardware costs just a fraction of what it used to. Computing power is available online for pennies. Everyone is suddenly interested in collecting and analyzing data, and the necessary resources are well within reach.

This surge in data analysis has brought two of R’s limitations to the forefront: it’s *single- threaded* and *memory-bound*. Allow us to explain:

* *It’s single-threaded*  
	The R language has no explicit constructs for parallelism, such as threads or mu- texes. An out-of-the-box R install cannot take advantage of multiple CPUs.
* *It’s memory-bound*  
	R requires that your entire dataset* fit in memory (RAM). Four gigabytes of RAM will not hold eight gigabytes of data, no matter how much you smile when you ask.
	
While these are certainly inconvenient, they’re hardly insurmountable.


The Solution: Parallel Execution
---

People have created a series of workarounds over the years. Doing a lot of matrix math? You can build R against a multithreaded **basic linear algebra subprogram (BLAS)**. Churning through large datasets? Use a relational database or another manual method to retrieve your data in smaller, more manageable pieces. And so on, and so forth.

Some big winners involve *parallelism*. Spreading work across multiple CPUs overcomes R’s single-threaded nature. Offloading work to multiple machines reaps the multi- process benefit and also addresses R’s memory barrier. In this book we’ll cover a few strategies to give R that parallel boost, specifically those which take advantage of mod- ern multicore hardware and cheap distributed computing.

In a Hurry?
---
The list below is a quick look at the various strategies.

snow
---
**Overview**: Good for use on traditional clusters, especially if MPI is available. It sup- ports MPI, PVM, nws, and sockets for communication, and is quite portable, running on Linux, Mac OS X, and Windows.

**Solves**: Single-threaded, memory-bound.

**Pros**: Mature, popular package; leverages MPI’s speed without its complexity. 

**Cons**: Can be difficult to configure.


multicore
---

**Overview**: Good for big-CPU problems when setting up a Hadoop cluster is too much of a hassle. Lets you parallelize your R code without ever leaving the R interpreter.


**Solves**: Single-threaded.


**Pros**: Simple and efficient; easy to install; no configuration needed.


**Cons**: Can only use one machine; doesn’t support Windows; no built-in support for parallel random number generation (RNG).

parallel
---

**Overview**: A merger of snow and multicore that comes built into R as of R 2.14.0. 

**Solves**: Single-threaded, memory-bound.


**Pros**: No installation necessary; has great support for parallel random number generation.


**Cons**: Can only use one machine on Windows; can be difficult to configure on multiple Linux machines.


R+Hadoop
---

**Overview**: Run your R code on a Hadoop cluster.

**Solves**: Single-threaded, memory-bound.

**Pros**: You get Hadoop’s scalability.

**Cons**: Requires a Hadoop cluster (internal or cloud-based); breaks up a single logical process into multiple scripts and steps (can be a hassle for exploratory work).


RHIPE
---

**Overview**: Talk Hadoop without ever leaving the R interpreter. 

**Solves**: Single-threaded, memory-bound.

**Pros**: Closer to a native R experience than R+Hadoop; use pure R code for your Map- Reduce operations.

**Cons**: Requires a Hadoop cluster; requires extra setup on the cluster; cannot process standard SequenceFiles (for binary data).

Segue
---

**Overview**: Seamlessly send R apply-like calculations to a remote Hadoop cluster.

**Solves**: Single-threaded, memory-bound.

**Pros**: Abstracts you from Elastic MapReduce management.

**Cons**: Cannot use with an internal Hadoop cluster (you’re tied to Amazon’s Elastic MapReduce).



References
---
[1] Q. Ethan McCallum and Stephen Weston, *Parallel R*, O’Reilly Media, Inc., 2012.
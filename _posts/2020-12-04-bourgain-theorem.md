---
layout: post
title: Bourgain's Embedding
date: 2020-12-04
categories: [computer science]
tags: [machine learning]

---

### Article Source
* [Bourgain's Embedding](https://lucatrevisan.wordpress.com/2011/02/07/cs359g-lecture-9-bourgains-embedding/)

----

Bourgain's Embedding
===

*In which we prove that every metric can be embedded into L1 with
logarithmic distortion.*

Today we prove the following theorem.

> **Theorem 1 (Bourgain)** Let ![{d: V\\times V \\rightarrow {\\mathbb
> R}}](https://s0.wp.com/latex.php?latex=%7Bd%3A+V%5Ctimes+V+%5Crightarrow+%7B%5Cmathbb+R%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d: V\times V \rightarrow {\mathbb R}}")
> be a semimetric defined over a finite set
> ![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}").
> Then there exists a mapping ![{F: V \\rightarrow {\\mathbb
> R}\^m}](https://s0.wp.com/latex.php?latex=%7BF%3A+V+%5Crightarrow+%7B%5Cmathbb+R%7D%5Em%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F: V \rightarrow {\mathbb R}^m}")
> such that, for every two elements ![{u,v \\in
> R}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv+%5Cin+R%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v \in R}"),
>
> ![\\displaystyle \|\| F(u) - F(v)\|\|\_1 \\leq d(u,v) \\leq
> \|\|F(u)-F(v)\|\|\_1 \\cdot c\\cdot \\log \|V\|
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%7C%7C+F%28u%29+-+F%28v%29%7C%7C_1+%5Cleq+d%28u%2Cv%29+%5Cleq+%7C%7CF%28u%29-F%28v%29%7C%7C_1+%5Ccdot+c%5Ccdot+%5Clog+%7CV%7C+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  || F(u) - F(v)||_1 \leq d(u,v) \leq ||F(u)-F(v)||_1 \cdot c\cdot \log |V| ")
>
> where
> ![{c}](https://s0.wp.com/latex.php?latex=%7Bc%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{c}")
> is an absolute constant. Given
> ![{d}](https://s0.wp.com/latex.php?latex=%7Bd%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d}"),
> the mapping
> ![{F}](https://s0.wp.com/latex.php?latex=%7BF%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F}")
> can be found with high probability in randomized polynomial time in
> ![{\|V\|}](https://s0.wp.com/latex.php?latex=%7B%7CV%7C%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{|V|}").

Together with the results that we proved in the last lecture, this
implies that an optimal solution to the Leighton-Rao relaxation can be
rounded to an ![{O(\\log
n)}](https://s0.wp.com/latex.php?latex=%7BO%28%5Clog+n%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{O(\log n)}")-approximate
solution to the sparsest cut problem. This was the best known
approximation algorithm for sparsest cut for 15 years, until the
Arora-Rao-Vazirani algorithm, which will be our next topic.


The theorem has a rather short proof, but there is an element of "magic"
to it. We will discuss several examples and we will see what approaches
are suggested by the examples. At the end of the discussion, we will see
the final proof as, hopefully, the "natural" outcome of the study of
such examples and failed attempts.

## 1. Preliminary and Motivating Examples

A first observation is that embeddings of finite sets of points into L1
can be equivalently characterized as probabilistic embeddings into the
real line.

> **Fact 2** []{#factlone} For every finite set
> ![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}"),
> dimension
> ![{m}](https://s0.wp.com/latex.php?latex=%7Bm%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{m}"),
> and mapping ![{F: V\\rightarrow {\\mathbb
> R}\^m}](https://s0.wp.com/latex.php?latex=%7BF%3A+V%5Crightarrow+%7B%5Cmathbb+R%7D%5Em%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F: V\rightarrow {\mathbb R}^m}"),
> there is a finitely-supported probability distribution
> ![{D}](https://s0.wp.com/latex.php?latex=%7BD%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D}")
> over functions ![{f:V\\rightarrow {\\mathbb
> R}}](https://s0.wp.com/latex.php?latex=%7Bf%3AV%5Crightarrow+%7B%5Cmathbb+R%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f:V\rightarrow {\mathbb R}}")
> such that for every two points ![{u,v\\in
> V}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%5Cin+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v\in V}"):
>
> ![\\displaystyle \\mathop{\\mathbb E}\_{f\\sim D} \| f(u)-f(v) \| =
> \|\|F(u)-F(v)\|\|\_1](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D_%7Bf%5Csim+D%7D+%7C+f%28u%29-f%28v%29+%7C+%3D+%7C%7CF%28u%29-F%28v%29%7C%7C_1&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}_{f\sim D} | f(u)-f(v) | = ||F(u)-F(v)||_1")
>
> Conversely, for every finite set
> ![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}")
> and finitely supported distribution
> ![{D}](https://s0.wp.com/latex.php?latex=%7BD%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D}")
> over functions ![{f:V\\rightarrow {\\mathbb
> R}}](https://s0.wp.com/latex.php?latex=%7Bf%3AV%5Crightarrow+%7B%5Cmathbb+R%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f:V\rightarrow {\mathbb R}}"),
> there is a dimension
> ![{m}](https://s0.wp.com/latex.php?latex=%7Bm%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{m}")
> and a mapping ![{F:V\\rightarrow {\\mathbb
> R}\^m}](https://s0.wp.com/latex.php?latex=%7BF%3AV%5Crightarrow+%7B%5Cmathbb+R%7D%5Em%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F:V\rightarrow {\mathbb R}^m}")
> such that
>
> ![\\displaystyle \\mathop{\\mathbb E}\_{f\\sim D} \| f(u)-f(v) \| =
> \|\|F(u)-F(v)\|\|\_1](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D_%7Bf%5Csim+D%7D+%7C+f%28u%29-f%28v%29+%7C+%3D+%7C%7CF%28u%29-F%28v%29%7C%7C_1&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}_{f\sim D} | f(u)-f(v) | = ||F(u)-F(v)||_1")

*Proof:* For the first claim, we write
![{F_i(v)}](https://s0.wp.com/latex.php?latex=%7BF_i%28v%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F_i(v)}")
for the
![{i}](https://s0.wp.com/latex.php?latex=%7Bi%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{i}")-th
coordinate of
![{F(v)}](https://s0.wp.com/latex.php?latex=%7BF%28v%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F(v)}"),
that is ![{F(v) =
(F_1(v),\\ldots,F_m(v))}](https://s0.wp.com/latex.php?latex=%7BF%28v%29+%3D+%28F_1%28v%29%2C%5Cldots%2CF_m%28v%29%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F(v) = (F_1(v),\ldots,F_m(v))}"),
and we define
![{D}](https://s0.wp.com/latex.php?latex=%7BD%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D}")
to be the uniform distribution over the
![{m}](https://s0.wp.com/latex.php?latex=%7Bm%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{m}")
functions of the form ![{x\\rightarrow m\\cdot
F_i(x)}](https://s0.wp.com/latex.php?latex=%7Bx%5Crightarrow+m%5Ccdot+F_i%28x%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{x\rightarrow m\cdot F_i(x)}").

For the second claim, if the support of
![{D}](https://s0.wp.com/latex.php?latex=%7BD%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D}")
is the set of functions ![{\\{
f_1,\\ldots,f_m\\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7B+f_1%2C%5Cldots%2Cf_m%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{ f_1,\ldots,f_m\}}"),
where function
![{f_i}](https://s0.wp.com/latex.php?latex=%7Bf_i%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_i}")
has probability
![{p_i}](https://s0.wp.com/latex.php?latex=%7Bp_i%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{p_i}"),
then we define ![{F(v) := (p_1 f_1(v),\\ldots,p_m
f_m(v))}](https://s0.wp.com/latex.php?latex=%7BF%28v%29+%3A%3D+%28p_1+f_1%28v%29%2C%5Cldots%2Cp_m+f_m%28v%29%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{F(v) := (p_1 f_1(v),\ldots,p_m f_m(v))}").
![\\Box](https://s0.wp.com/latex.php?latex=%5CBox&bg=ffffff&fg=000000&s=0&c=20201002 "\Box")

It will be easier to reason about probabilistic mappings into the line,
so we will switch to the latter setting from now on.

Our task is to associate a number to every point
![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}"),
and the information that we have about
![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}")
is the list of distances ![{\\{ d(u,v)
\\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7B+d%28u%2Cv%29+%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{ d(u,v) \}}").
Probably the first idea that comes to mind is to pick a random reference
vertex ![{r\\in
V}](https://s0.wp.com/latex.php?latex=%7Br%5Cin+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{r\in V}"),
and work with the mapping ![{v \\rightarrow
d(r,v)}](https://s0.wp.com/latex.php?latex=%7Bv+%5Crightarrow+d%28r%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v \rightarrow d(r,v)}"),
possibly scaled by a multiplicative constant. (Equivalently, we can
think about the deterministic mapping ![{V \\rightarrow {\\mathbb
R}\^{\|V\|}}](https://s0.wp.com/latex.php?latex=%7BV+%5Crightarrow+%7B%5Cmathbb+R%7D%5E%7B%7CV%7C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V \rightarrow {\mathbb R}^{|V|}}"),
in which the vertex
![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}")
is mapped to the sequence ![{(d(u_1,v),\\ldots,
d(u_n,v)}](https://s0.wp.com/latex.php?latex=%7B%28d%28u_1%2Cv%29%2C%5Cldots%2C+d%28u_n%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{(d(u_1,v),\ldots, d(u_n,v)}"),
for some enumeration
![{u_1,\\ldots,u_n}](https://s0.wp.com/latex.php?latex=%7Bu_1%2C%5Cldots%2Cu_n%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u_1,\ldots,u_n}")
of the elements of
![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}").)

This works in certain simple cases.

> **Example 1 (Cycle)** *Suppose that
> ![{d(\\cdot,\\cdot)}](https://s0.wp.com/latex.php?latex=%7Bd%28%5Ccdot%2C%5Ccdot%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(\cdot,\cdot)}")
> is the shortest-path metric on a cycle, we can see that, for every two
> points on the cycle, ![{\\mathop{\\mathbb E}\_{r\\in V} \| d(r,u) -
> d(r,v)\|}](https://s0.wp.com/latex.php?latex=%7B%5Cmathop%7B%5Cmathbb+E%7D_%7Br%5Cin+V%7D+%7C+d%28r%2Cu%29+-+d%28r%2Cv%29%7C%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\mathop{\mathbb E}_{r\in V} | d(r,u) - d(r,v)|}")
> is within a constant factor of their distance
> ![{d(u,v)}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)}").
> (Try proving it rigorously!)*

> **Example 2 (Simplex)** *Suppose that
> ![{d(u,v)=1}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%3D1%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)=1}")
> for every ![{u\\neq
> v}](https://s0.wp.com/latex.php?latex=%7Bu%5Cneq+v%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u\neq v}"),
> and
> ![{d(u,u)=0}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cu%29%3D0%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,u)=0}").
> Then, for every ![{u\\neq
> v}](https://s0.wp.com/latex.php?latex=%7Bu%5Cneq+v%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u\neq v}"),
> we have ![{\\mathop{\\mathbb E}\_{r\\in V} \|d(r,u)-d(r,v)\| =
> \\mathop{\\mathbb P} \[ r=u \\vee r=v\] =
> 2/n}](https://s0.wp.com/latex.php?latex=%7B%5Cmathop%7B%5Cmathbb+E%7D_%7Br%5Cin+V%7D+%7Cd%28r%2Cu%29-d%28r%2Cv%29%7C+%3D+%5Cmathop%7B%5Cmathbb+P%7D+%5B+r%3Du+%5Cvee+r%3Dv%5D+%3D+2%2Fn%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\mathop{\mathbb E}_{r\in V} |d(r,u)-d(r,v)| = \mathop{\mathbb P} [ r=u \vee r=v] = 2/n}"),
> so, up to scaling, the mapping incurs no error at all.*

But there are also simple examples in which this works very badly.

> **Example 3 (1-2 Metric)** Suppose that for every ![{u\\neq
> v}](https://s0.wp.com/latex.php?latex=%7Bu%5Cneq+v%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u\neq v}")
> we have ![{d(u,v) \\in
> \\{1,2\\}}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29+%5Cin+%5C%7B1%2C2%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v) \in \{1,2\}}")
> (any distance function satisfying this property is always a metric)
> and that, in particular, there is a special vertex
> ![{z}](https://s0.wp.com/latex.php?latex=%7Bz%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{z}")
> at distance 2 from all other vertices, while all other vertices are at
> distance 1 from each other. Then, for vertices
> ![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}")
> both different from
> ![{z}](https://s0.wp.com/latex.php?latex=%7Bz%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{z}")
> we have, as before
>
> ![\\displaystyle \\mathop{\\mathbb E}\[ \| d(r,u) - d(r,v) \| \] =
> \\frac 2n
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D%5B+%7C+d%28r%2Cu%29+-+d%28r%2Cv%29+%7C+%5D+%3D+%5Cfrac+2n+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}[ | d(r,u) - d(r,v) | ] = \frac 2n ")
>
> but for every
> ![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}")
> different from
> ![{z}](https://s0.wp.com/latex.php?latex=%7Bz%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{z}")
> we have
>
> ![\\displaystyle \\mathop{\\mathbb E}\[ \| d(r,z) - d(r,v) \| \]
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D%5B+%7C+d%28r%2Cz%29+-+d%28r%2Cv%29+%7C+%5D++&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}[ | d(r,z) - d(r,v) | ]  ")
>
> ![\\displaystyle = \\frac {n-2}{n} \\cdot \|2-1\| + \\frac 1n \\cdot
> \|2-0\| + \\frac 1n \\cdot \|0-2\|
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle+++%3D+%5Cfrac+%7Bn-2%7D%7Bn%7D+%5Ccdot+%7C2-1%7C+%2B+%5Cfrac+1n+%5Ccdot+%7C2-0%7C+%2B+%5Cfrac+1n+%5Ccdot+%7C0-2%7C++&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle   = \frac {n-2}{n} \cdot |2-1| + \frac 1n \cdot |2-0| + \frac 1n \cdot |0-2|  ")
>
> ![\\displaystyle = 1 + \\frac 2n
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle+++%3D+1+%2B+%5Cfrac+2n+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle   = 1 + \frac 2n ")
>
> and so our error is going to be
> ![{\\Omega(n)}](https://s0.wp.com/latex.php?latex=%7B%5COmega%28n%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\Omega(n)}")
> instead of the ![{O(\\log
> n)}](https://s0.wp.com/latex.php?latex=%7BO%28%5Clog+n%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{O(\log n)}")
> that we are trying to establish.

Maybe the next simplest idea is that we should pick at random several
reference points
![{r_1,\\ldots,r_k}](https://s0.wp.com/latex.php?latex=%7Br_1%2C%5Cldots%2Cr_k%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{r_1,\ldots,r_k}").
But how do we combine the information
![{d(r_1,u),\\ldots,d(r_k,u)}](https://s0.wp.com/latex.php?latex=%7Bd%28r_1%2Cu%29%2C%5Cldots%2Cd%28r_k%2Cu%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(r_1,u),\ldots,d(r_k,u)}")
into a single number to associate to
![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")?
If we just take the sum of the distances, we are back to the case of
sampling a single reference point. (We are just scaling up the
expectation by a factor of
![{k}](https://s0.wp.com/latex.php?latex=%7Bk%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{k}").)

The next simplest way to combine the information is to take either the
maximum or the minimum. If we take the minimum, we see that we have the
very nice property that we immediately guarantee that our distances in
the L1 embedding are no bigger than the original distances, so that it
"only" remains to prove that the distances don't get compressed too
much.

> **Fact 3** []{#factfrechetupper} Let ![{d:V\\times V\\rightarrow
> {\\mathbb
> R}}](https://s0.wp.com/latex.php?latex=%7Bd%3AV%5Ctimes+V%5Crightarrow+%7B%5Cmathbb+R%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d:V\times V\rightarrow {\mathbb R}}")
> be a semimetric and ![{A\\subseteq
> V}](https://s0.wp.com/latex.php?latex=%7BA%5Csubseteq+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A\subseteq V}")
> be a non-empty subset of points. Define ![{f_A: V \\rightarrow
> {\\mathbb
> R}}](https://s0.wp.com/latex.php?latex=%7Bf_A%3A+V+%5Crightarrow+%7B%5Cmathbb+R%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_A: V \rightarrow {\mathbb R}}")
> as
>
> ![\\displaystyle f_A(v) := \\min\_{r\\in A} d(r,v)
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++f_A%28v%29+%3A%3D+%5Cmin_%7Br%5Cin+A%7D+d%28r%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  f_A(v) := \min_{r\in A} d(r,v) ")
>
> Then, for every two points
> ![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}")
> we have
>
> ![\\displaystyle \| f_A(u) - f_A(v) \| \\leq d(u,v)
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%7C+f_A%28u%29+-+f_A%28v%29+%7C+%5Cleq+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  | f_A(u) - f_A(v) | \leq d(u,v) ")

*Proof:* Let
![{a}](https://s0.wp.com/latex.php?latex=%7Ba%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{a}")
be the point such that ![{d(a,u) =
f_A(u)}](https://s0.wp.com/latex.php?latex=%7Bd%28a%2Cu%29+%3D+f_A%28u%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(a,u) = f_A(u)}")
and
![{b}](https://s0.wp.com/latex.php?latex=%7Bb%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{b}")
be the point such that ![{d(b,v) =
f_A(v)}](https://s0.wp.com/latex.php?latex=%7Bd%28b%2Cv%29+%3D+f_A%28v%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(b,v) = f_A(v)}").
(It's possible that
![{a=b}](https://s0.wp.com/latex.php?latex=%7Ba%3Db%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{a=b}").)
Then

![\\displaystyle f_A(u) = d(a,u)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++f_A%28u%29+%3D+d%28a%2Cu%29++&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  f_A(u) = d(a,u)  ")

![\\displaystyle \\geq d(v,a) - d(u,v) \\geq d(v,b) - d(u,v)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle+++%5Cgeq+d%28v%2Ca%29+-+d%28u%2Cv%29+%5Cgeq+d%28v%2Cb%29+-+d%28u%2Cv%29++&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle   \geq d(v,a) - d(u,v) \geq d(v,b) - d(u,v)  ")

![\\displaystyle = f_A(v)- d(u,v)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle+++%3D+f_A%28v%29-+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle   = f_A(v)- d(u,v) ")

and, similarly,

![\\displaystyle f_A(v) = d(b,v)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++f_A%28v%29+%3D+d%28b%2Cv%29++&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  f_A(v) = d(b,v)  ")

![\\displaystyle \\geq d(u,b) - d(u,v) \\geq d(u,a) - d(u,v)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle+++%5Cgeq+d%28u%2Cb%29+-+d%28u%2Cv%29+%5Cgeq+d%28u%2Ca%29+-+d%28u%2Cv%29++&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle   \geq d(u,b) - d(u,v) \geq d(u,a) - d(u,v)  ")

![\\displaystyle = f_A(u) - d(u,v)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle+++%3D+f_A%28u%29+-+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle   = f_A(u) - d(u,v) ")

![\\Box](https://s0.wp.com/latex.php?latex=%5CBox&bg=ffffff&fg=000000&s=0&c=20201002 "\Box")

Is there a way to sample a set ![{A=\\{
r_1,\\ldots,r_k\\}}](https://s0.wp.com/latex.php?latex=%7BA%3D%5C%7B+r_1%2C%5Cldots%2Cr_k%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A=\{ r_1,\ldots,r_k\}}")
such that, for every two points
![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}"),
the expectation ![{\\mathop{\\mathbb E} \| f_A(u) - f_A(v)
\|}](https://s0.wp.com/latex.php?latex=%7B%5Cmathop%7B%5Cmathbb+E%7D+%7C+f_A%28u%29+-+f_A%28v%29+%7C%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\mathop{\mathbb E} | f_A(u) - f_A(v) |}")
is not too much smaller than
![{d(u,v)}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)}")?
How large should the set
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
be?

> **Example 4 (1-2 Metric Again)** Suppose that for every ![{u\\neq
> v}](https://s0.wp.com/latex.php?latex=%7Bu%5Cneq+v%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u\neq v}")
> we have ![{d(u,v) \\in
> \\{1,2\\}}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29+%5Cin+%5C%7B1%2C2%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v) \in \{1,2\}}"),
> and that we pick a subset ![{A\\subseteq
> V}](https://s0.wp.com/latex.php?latex=%7BA%5Csubseteq+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A\subseteq V}")
> uniformly at random, that is, each event ![{r\\in
> A}](https://s0.wp.com/latex.php?latex=%7Br%5Cin+A%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{r\in A}")
> has probability
> ![{1/2}](https://s0.wp.com/latex.php?latex=%7B1%2F2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{1/2}")
> and the events are mutually independent.
>
> Then for every ![{u\\neq
> v}](https://s0.wp.com/latex.php?latex=%7Bu%5Cneq+v%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u\neq v}"):
>
> ![\\displaystyle \\frac 14 \\cdot d(u,v) \\leq \| \\mathop{\\mathbb E}
> \| f_A(u) - f_A(v)\| \\leq d(u,v)
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cfrac+14+%5Ccdot+d%28u%2Cv%29+%5Cleq+%7C+%5Cmathop%7B%5Cmathbb+E%7D+%7C+f_A%28u%29+-+f_A%28v%29%7C+%5Cleq+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \frac 14 \cdot d(u,v) \leq | \mathop{\mathbb E} | f_A(u) - f_A(v)| \leq d(u,v) ")
>
> because with probability
> ![{1/2}](https://s0.wp.com/latex.php?latex=%7B1%2F2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{1/2}")
> the set
> ![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
> contains exactly one of the elements
> ![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}"),
> and conditioned on that event we have ![{\|f_A(u) - f_A(v)\| \\geq
> 1}](https://s0.wp.com/latex.php?latex=%7B%7Cf_A%28u%29+-+f_A%28v%29%7C+%5Cgeq+1%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{|f_A(u) - f_A(v)| \geq 1}")
> (because one of
> ![{f_A(u),f_A(v)}](https://s0.wp.com/latex.php?latex=%7Bf_A%28u%29%2Cf_A%28v%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_A(u),f_A(v)}")
> is zero and the other is at least one), which is at least
> ![{d(u,v)/2}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%2F2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)/2}").

If we pick
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
uniformly at random, however, we incur an
![{\\Omega(n)}](https://s0.wp.com/latex.php?latex=%7B%5COmega%28n%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\Omega(n)}")
distortion in the case of the shortest path metric on the cycle. In all
the examples seen so far, we can achieve constant distortion if we "mix"
the distribution in which
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
is a random set of size 1 and the one in which
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
is a chosen uniformly at random among all sets, say by sampling from the
former probability with probability
![{1/2}](https://s0.wp.com/latex.php?latex=%7B1%2F2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{1/2}")
and from the latter with probability
![{1/2}](https://s0.wp.com/latex.php?latex=%7B1%2F2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{1/2}").

> **Example 5 (Far-Away Clusters)** Suppose now that
> ![{d(\\cdot,\\cdot)}](https://s0.wp.com/latex.php?latex=%7Bd%28%5Ccdot%2C%5Ccdot%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(\cdot,\cdot)}")
> has the following structure:
> ![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}")
> is partitioned into clusters
> ![{B_1,\\ldots,B_k}](https://s0.wp.com/latex.php?latex=%7BB_1%2C%5Cldots%2CB_k%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{B_1,\ldots,B_k}"),
> where ![{\|B_i\|=
> i}](https://s0.wp.com/latex.php?latex=%7B%7CB_i%7C%3D+i%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{|B_i|= i}")
> (so ![{k \\approx \\sqrt
> {2n}}](https://s0.wp.com/latex.php?latex=%7Bk+%5Capprox+%5Csqrt+%7B2n%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{k \approx \sqrt {2n}}")),
> and we have
> ![{d(u,v)=1}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%3D1%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)=1}")
> for vertices in the same cluster, and
> ![{d(u,v)=n}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%3Dn%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)=n}")
> for vertices in different clusters.
>
> If
> ![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}")
> are in the same cluster, then
> ![{d(u,v)=1}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%3D1%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)=1}")
> and
>
> ![\\displaystyle \\mathop{\\mathbb E} \| f_A(u) - f_A(v) \| =
> \\mathop{\\mathbb P} \[ A \\mbox{ contains exactly one of } u,v\]
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D+%7C+f_A%28u%29+-+f_A%28v%29+%7C+%3D+%5Cmathop%7B%5Cmathbb+P%7D+%5B+A+%5Cmbox%7B+contains+exactly+one+of+%7D+u%2Cv%5D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E} | f_A(u) - f_A(v) | = \mathop{\mathbb P} [ A \mbox{ contains exactly one of } u,v] ")
>
> If
> ![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}")
> are in different clusters
> ![{B_i,B_j}](https://s0.wp.com/latex.php?latex=%7BB_i%2CB_j%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{B_i,B_j}"),
> then
> ![{d(u,v)=n}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%3Dn%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)=n}")
> and
>
> ![\\displaystyle \\mathop{\\mathbb E} \| f_A(u) - f_A(v) \| \\approx n
> \\mathop{\\mathbb P} \[ A \\mbox{ intersects exactly one of }
> B_i,B_j\]
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D+%7C+f_A%28u%29+-+f_A%28v%29+%7C+%5Capprox+n+%5Cmathop%7B%5Cmathbb+P%7D+%5B+A+%5Cmbox%7B+intersects+exactly+one+of+%7D+B_i%2CB_j%5D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E} | f_A(u) - f_A(v) | \approx n \mathop{\mathbb P} [ A \mbox{ intersects exactly one of } B_i,B_j] ")

If we want to stick to this approach of picking a set
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
of reference elements according to a certain distribution, and then
defining the map ![{f_A(v):= \\min\_{r\\in A}
d(r,v)}](https://s0.wp.com/latex.php?latex=%7Bf_A%28v%29%3A%3D+%5Cmin_%7Br%5Cin+A%7D+d%28r%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_A(v):= \min_{r\in A} d(r,v)}"),
then the set
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
must have the property that for every two sets
![{S,T}](https://s0.wp.com/latex.php?latex=%7BS%2CT%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{S,T}"),
there is at least a probability
![{p}](https://s0.wp.com/latex.php?latex=%7Bp%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{p}")
that
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
intersects exactly one of
![{S,T}](https://s0.wp.com/latex.php?latex=%7BS%2CT%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{S,T}"),
and we would like
![{p}](https://s0.wp.com/latex.php?latex=%7Bp%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{p}")
to be as large as possible, because the distortion caused by the mapping
will be at least
![{1/p}](https://s0.wp.com/latex.php?latex=%7B1%2Fp%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{1/p}").

This suggest the following distribution
![{D}](https://s0.wp.com/latex.php?latex=%7BD%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D}"):

1.  Sample
    ![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}")
    uniformly at random in ![{\\{ 0,\\ldots,\\log_2
    n\\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7B+0%2C%5Cldots%2C%5Clog_2+n%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{ 0,\ldots,\log_2 n\}}")
2.  Sample ![{A\\subseteq
    V}](https://s0.wp.com/latex.php?latex=%7BA%5Csubseteq+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A\subseteq V}")
    by selecting each ![{v\\in
    V}](https://s0.wp.com/latex.php?latex=%7Bv%5Cin+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v\in V}"),
    independently, to be in
    ![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
    with probability
    ![{2\^{-t}}](https://s0.wp.com/latex.php?latex=%7B2%5E%7B-t%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{2^{-t}}")
    and to be in
    ![{V-A}](https://s0.wp.com/latex.php?latex=%7BV-A%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V-A}")
    with probability
    ![{1-2\^{-t}}](https://s0.wp.com/latex.php?latex=%7B1-2%5E%7B-t%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{1-2^{-t}}").

This distribution guarantees the above property with ![{p= 1/O(\\log
n)}](https://s0.wp.com/latex.php?latex=%7Bp%3D+1%2FO%28%5Clog+n%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{p= 1/O(\log n)}").

Indeed, the above distribution guarantees a distortion at most
![{O(\\log
n)}](https://s0.wp.com/latex.php?latex=%7BO%28%5Clog+n%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{O(\log n)}")
in all the examples encountered so far, including the tricky example of
the clusters of different size. In each example, in fact, we can prove
the following claim: for every two vertices
![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}"),
there is a scale
![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}"),
such that conditioned on that scale being chosen, the expectation of
![{\|f_A(u),f_A(v)\|}](https://s0.wp.com/latex.php?latex=%7B%7Cf_A%28u%29%2Cf_A%28v%29%7C%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{|f_A(u),f_A(v)|}")
is at least a constant times
![{d(u,v)}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)}").
We could try to prove Bourgain's theorem by showing that this is true in
every semimetric.

Let us call
![{D_t}](https://s0.wp.com/latex.php?latex=%7BD_t%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D_t}")
the conditional distribution of
![{D}](https://s0.wp.com/latex.php?latex=%7BD%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D}")
conditioned on the choice of a scale
![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}").
We would like to prove that for every semimetric
![{d(\\cdot,\\cdot)}](https://s0.wp.com/latex.php?latex=%7Bd%28%5Ccdot%2C%5Ccdot%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(\cdot,\cdot)}")
and every two points
![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}")
there is a scale
![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}")
such that

![\\displaystyle \\mathop{\\mathbb E}\_{A\\sim D_t} \|f_A(u) - f_A(v) \|
\\geq \\Omega(d(u,v))
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D_%7BA%5Csim+D_t%7D+%7Cf_A%28u%29+-+f_A%28v%29+%7C+%5Cgeq+%5COmega%28d%28u%2Cv%29%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}_{A\sim D_t} |f_A(u) - f_A(v) | \geq \Omega(d(u,v)) ")

which, recalling that ![{\|f_A(u)-f_A(v)\| \\leq
d(u,v)}](https://s0.wp.com/latex.php?latex=%7B%7Cf_A%28u%29-f_A%28v%29%7C+%5Cleq+d%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{|f_A(u)-f_A(v)| \leq d(u,v)}")
for every set
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}"),
is equivalent to arguing that

![\\displaystyle \\mathop{\\mathbb P}\_{A \\sim D_t} \[ \|f_A(u) -
f_A(v) \| \\geq \\Omega(d(u,v)) \] \\geq \\Omega(1)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+P%7D_%7BA+%5Csim+D_t%7D+%5B+%7Cf_A%28u%29+-+f_A%28v%29+%7C+%5Cgeq+%5COmega%28d%28u%2Cv%29%29+%5D+%5Cgeq+%5COmega%281%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb P}_{A \sim D_t} [ |f_A(u) - f_A(v) | \geq \Omega(d(u,v)) ] \geq \Omega(1) ")

For this to be true, there must be distances
![{d_1,d_2}](https://s0.wp.com/latex.php?latex=%7Bd_1%2Cd_2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d_1,d_2}")
such that ![{d_1 - d_2 \\geq
\\Omega(d(u,v))}](https://s0.wp.com/latex.php?latex=%7Bd_1+-+d_2+%5Cgeq+%5COmega%28d%28u%2Cv%29%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d_1 - d_2 \geq \Omega(d(u,v))}")
and such that, with constant probability according to
![{D_t}](https://s0.wp.com/latex.php?latex=%7BD_t%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D_t}"),
we have ![{f_A(u) \\geq
d_1}](https://s0.wp.com/latex.php?latex=%7Bf_A%28u%29+%5Cgeq+d_1%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_A(u) \geq d_1}")
and ![{f_A(v) \\leq
d_2}](https://s0.wp.com/latex.php?latex=%7Bf_A%28v%29+%5Cleq+d_2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_A(v) \leq d_2}")
(or vice-versa). For this to happen, there must be a constant
probability that
![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
avoids the set ![{\\{ r : d(u,r) \<
d_1\\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7B+r+%3A+d%28u%2Cr%29+%3C+d_1%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{ r : d(u,r) < d_1\}}")
and intersects the set ![{\\{ r: d(v,r) \\leq
d_2\\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7B+r%3A+d%28v%2Cr%29+%5Cleq+d_2%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{ r: d(v,r) \leq d_2\}}").
For this to happen, both sets must have size ![{\\approx
2\^t}](https://s0.wp.com/latex.php?latex=%7B%5Capprox+2%5Et%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\approx 2^t}").

This means that if we want to make this "at least one good scale for
every pair of points" argument work, we need to show that for every two
vertices
![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}")
there is a "large" distance
![{d_1}](https://s0.wp.com/latex.php?latex=%7Bd_1%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d_1}")
and a "small" distance
![{d_2}](https://s0.wp.com/latex.php?latex=%7Bd_2%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d_2}")
(whose difference is a constant times
![{d(u,v)}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)}"))
such that a large-radius ball around one of the vertices and a
small-radius ball around the other vertex contain roughly the same
number of elements of
![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}").

Consider, however, the following example.

> **Example 6 (Joined Trees)** Consider the graph obtained by taking two
> complete binary trees of the same size and identifying their leaves,
> as in the picture below.
>
> ![](https://i2.wp.com/cs.stanford.edu/people/trevisan/cs261-11/tree.png)
>
> Consider the shortest-path metric
> ![{d(\\cdot,\\cdot)}](https://s0.wp.com/latex.php?latex=%7Bd%28%5Ccdot%2C%5Ccdot%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(\cdot,\cdot)}")
> in the above graph. Consider the "root" vertices
> ![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")
> and
> ![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}").
> Their distance
> ![{d(u,v)}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)}")
> is ![{\\approx \\log
> n}](https://s0.wp.com/latex.php?latex=%7B%5Capprox+%5Clog+n%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\approx \log n}"),
> but, at every scale
> ![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}"),
> both
> ![{f_A(u)}](https://s0.wp.com/latex.php?latex=%7Bf_A%28u%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_A(u)}")
> and
> ![{f_A(v)}](https://s0.wp.com/latex.php?latex=%7Bf_A%28v%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f_A(v)}")
> are highly concentrated around
> ![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}")
> and, it can be calculated that, at every scale
> ![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}"),
> we have
>
> ![\\displaystyle \\mathop{\\mathbb E}\_{A\\sim D_t} \[ \|f_A(u) -
> f_A(v)\| \] = \\Theta(1)
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D_%7BA%5Csim+D_t%7D+%5B+%7Cf_A%28u%29+-+f_A%28v%29%7C+%5D+%3D+%5CTheta%281%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}_{A\sim D_t} [ |f_A(u) - f_A(v)| ] = \Theta(1) ")
>
> This is still good, because averaging over all scales we still get
>
> ![\\displaystyle \\mathop{\\mathbb E}\_{A\\sim D} \[ \|f_A(u) -
> f_A(v)\| \] \\geq \\Omega(1) = \\frac 1 {O(\\log n)} \\cdot d(u,v)
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D_%7BA%5Csim+D%7D+%5B+%7Cf_A%28u%29+-+f_A%28v%29%7C+%5D+%5Cgeq+%5COmega%281%29+%3D+%5Cfrac+1+%7BO%28%5Clog+n%29%7D+%5Ccdot+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}_{A\sim D} [ |f_A(u) - f_A(v)| ] \geq \Omega(1) = \frac 1 {O(\log n)} \cdot d(u,v) ")
>
> but this example shows that the analysis cannot be restricted to one
> good scale but has, in some cases, to take into account the
> contribution to the expectation coming from all the scales.

In the above example, the only way to get a ball around
![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")
and a ball around
![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}")
with approximately the same number of points is to get balls of roughly
the same radius. No scale could then give a large contribution to the
expectation ![{\\mathop{\\mathbb E}\_{A\\sim D} \[ \|f_A(u) - f_A(v)\|
\]}](https://s0.wp.com/latex.php?latex=%7B%5Cmathop%7B%5Cmathbb+E%7D_%7BA%5Csim+D%7D+%5B+%7Cf_A%28u%29+-+f_A%28v%29%7C+%5D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\mathop{\mathbb E}_{A\sim D} [ |f_A(u) - f_A(v)| ]}");
every scale, however, gave a noticeable contribution, and adding them up
we had a bounded distortion. The above example will be the template for
the full proof, which will do an "amortized analysis" of the
contribution to the expectation coming from each scale
![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}"),
by looking at the radii that define a ball around
![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")
and a ball around
![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}")
with approximately
![{2\^t}](https://s0.wp.com/latex.php?latex=%7B2%5Et%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{2^t}")
elements.

## 2. The Proof of Bourgain's Theorem

Given Fact [2](#factlone) and Fact [3](#factfrechetupper), proving
Bourgain's theorem reduces to proving the following theorem.

> **Theorem 4** For a finite set of points
> ![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}"),
> consider the distribution
> ![{D}](https://s0.wp.com/latex.php?latex=%7BD%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{D}")
> over subsets of
> ![{V}](https://s0.wp.com/latex.php?latex=%7BV%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{V}")
> sampled by uniformly picking a scale ![{t\\in \\{ 0,\\ldots,\\log_2
> \|V\|
> \\}}](https://s0.wp.com/latex.php?latex=%7Bt%5Cin+%5C%7B+0%2C%5Cldots%2C%5Clog_2+%7CV%7C+%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t\in \{ 0,\ldots,\log_2 |V| \}}")
> and then picking independently each ![{v\\in
> V}](https://s0.wp.com/latex.php?latex=%7Bv%5Cin+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v\in V}")
> to be in
> ![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
> with probability
> ![{2\^{-t}}](https://s0.wp.com/latex.php?latex=%7B2%5E%7B-t%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{2^{-t}}").
> Let ![{d: V\\times V\\rightarrow {\\mathbb
> R}}](https://s0.wp.com/latex.php?latex=%7Bd%3A+V%5Ctimes+V%5Crightarrow+%7B%5Cmathbb+R%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d: V\times V\rightarrow {\mathbb R}}")
> be a semimetric. Then for every ![{u,v\\in
> V}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%5Cin+V%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v\in V}"),
>
> ![\\displaystyle \\mathop{\\mathbb E}\_{A\\sim D} \[ \|f_A(u) - f_A(v)
> \| \] \\geq \\frac 1 {c\\log_2 \|V\|} \\cdot d(u,v)
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D_%7BA%5Csim+D%7D+%5B+%7Cf_A%28u%29+-+f_A%28v%29+%7C+%5D+%5Cgeq+%5Cfrac+1+%7Bc%5Clog_2+%7CV%7C%7D+%5Ccdot+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}_{A\sim D} [ |f_A(u) - f_A(v) | ] \geq \frac 1 {c\log_2 |V|} \cdot d(u,v) ")
>
> where
> ![{c}](https://s0.wp.com/latex.php?latex=%7Bc%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{c}")
> is an absolute constant.

*Proof:* For each
![{t}](https://s0.wp.com/latex.php?latex=%7Bt%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t}"),
let
![{ru_t}](https://s0.wp.com/latex.php?latex=%7Bru_t%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{ru_t}")
be the distance from
![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")
to the
![{2\^t}](https://s0.wp.com/latex.php?latex=%7B2%5Et%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{2^t}")-th
closest point to
![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")
(counting
![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")).
That is,

![\\displaystyle \| \\{ w : d(u,w) \< ru_t \\} \| \< 2\^t
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%7C+%5C%7B+w+%3A+d%28u%2Cw%29+%3C+ru_t+%5C%7D+%7C+%3C+2%5Et+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  | \{ w : d(u,w) < ru_t \} | < 2^t ")

and

![\\displaystyle \| \\{ w : d(u,w) \\leq ru_t \\} \| \\geq 2\^t
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%7C+%5C%7B+w+%3A+d%28u%2Cw%29+%5Cleq+ru_t+%5C%7D+%7C+%5Cgeq+2%5Et+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  | \{ w : d(u,w) \leq ru_t \} | \geq 2^t ")

and define
![{rv_t}](https://s0.wp.com/latex.php?latex=%7Brv_t%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{rv_t}")
similarly. Let
![{t\^\*}](https://s0.wp.com/latex.php?latex=%7Bt%5E%2A%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t^*}")
be the scale such that both
![{ru\_{t\^\*}}](https://s0.wp.com/latex.php?latex=%7Bru_%7Bt%5E%2A%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{ru_{t^*}}")
and
![{rv\_{t\^\*}}](https://s0.wp.com/latex.php?latex=%7Brv_%7Bt%5E%2A%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{rv_{t^*}}")
are smaller than
![{d(u,v)/3}](https://s0.wp.com/latex.php?latex=%7Bd%28u%2Cv%29%2F3%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{d(u,v)/3}"),
but at least one of
![{ru\_{t\^\*+1}}](https://s0.wp.com/latex.php?latex=%7Bru_%7Bt%5E%2A%2B1%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{ru_{t^*+1}}")
or
![{rv\_{t\^\*+1}}](https://s0.wp.com/latex.php?latex=%7Brv_%7Bt%5E%2A%2B1%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{rv_{t^*+1}}")
are ![{\\geq
d(u,v)/3}](https://s0.wp.com/latex.php?latex=%7B%5Cgeq+d%28u%2Cv%29%2F3%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\geq d(u,v)/3}").

Define

![\\displaystyle ru\'\_t := \\min \\{ ru_t, d(u,v)/3 \\}
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++ru%27_t+%3A%3D+%5Cmin+%5C%7B+ru_t%2C+d%28u%2Cv%29%2F3+%5C%7D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  ru'_t := \min \{ ru_t, d(u,v)/3 \} ")

and similarly

![\\displaystyle rv\'\_t := \\min \\{ rv_t, d(u,v)/3 \\}
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++rv%27_t+%3A%3D+%5Cmin+%5C%7B+rv_t%2C+d%28u%2Cv%29%2F3+%5C%7D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  rv'_t := \min \{ rv_t, d(u,v)/3 \} ")

We claim that there is an absolute constant
![{c}](https://s0.wp.com/latex.php?latex=%7Bc%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{c}")
such that for every scale ![{t\\in \\{ 0,\\ldots,
t\^\*\\}}](https://s0.wp.com/latex.php?latex=%7Bt%5Cin+%5C%7B+0%2C%5Cldots%2C+t%5E%2A%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t\in \{ 0,\ldots, t^*\}}"),
we have

![\\displaystyle \\mathop{\\mathbb E}\_{A\\sim D_t} \|f_A(u) - f_A(v)\|
\\geq c\\cdot ( ru\'\_{t+1} + rv\'\_{t+1} - ru\'\_t-rv\'\_t ) \\ \\ \\
\\ \\
(1)](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle+++%5Cmathop%7B%5Cmathbb+E%7D_%7BA%5Csim+D_t%7D+%7Cf_A%28u%29+-+f_A%28v%29%7C+%5Cgeq+c%5Ccdot+%28+ru%27_%7Bt%2B1%7D+%2B+rv%27_%7Bt%2B1%7D+-+ru%27_t-rv%27_t+%29+%5C+%5C+%5C+%5C+%5C+%281%29&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle   \mathop{\mathbb E}_{A\sim D_t} |f_A(u) - f_A(v)| \geq c\cdot ( ru'_{t+1} + rv'_{t+1} - ru'_t-rv'_t ) \ \ \ \ \ (1)")

We prove the claim by showing that there are two disjoint events, each
happening with probability ![{\\geq
c}](https://s0.wp.com/latex.php?latex=%7B%5Cgeq+c%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\geq c}"),
such that in one event ![{\|f_A(u)-f_A(v)\| \\geq ru\'\_{t+1} -
rv\'\_t}](https://s0.wp.com/latex.php?latex=%7B%7Cf_A%28u%29-f_A%28v%29%7C+%5Cgeq+ru%27_%7Bt%2B1%7D+-+rv%27_t%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{|f_A(u)-f_A(v)| \geq ru'_{t+1} - rv'_t}"),
and in the other event ![{\|f_A(u)-f_A(v)\| \\geq rv\'\_{t+1} -
ru\'\_t}](https://s0.wp.com/latex.php?latex=%7B%7Cf_A%28u%29-f_A%28v%29%7C+%5Cgeq+rv%27_%7Bt%2B1%7D+-+ru%27_t%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{|f_A(u)-f_A(v)| \geq rv'_{t+1} - ru'_t}").

1.  The first event is that
    ![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
    avoids the set ![{\\{ z: d(u,z) \< ru\'\_{t+1}
    \\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7B+z%3A+d%28u%2Cz%29+%3C+ru%27_%7Bt%2B1%7D+%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{ z: d(u,z) < ru'_{t+1} \}}")
    and intersects the set ![{\\{z: d(v,z) \\leq rv\'\_t
    \\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7Bz%3A+d%28v%2Cz%29+%5Cleq+rv%27_t+%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{z: d(v,z) \leq rv'_t \}}").
    The former set has size ![{\<
    2\^{t+1}}](https://s0.wp.com/latex.php?latex=%7B%3C+2%5E%7Bt%2B1%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{< 2^{t+1}}"),
    and the latter set has size ![{\\leq
    2\^t}](https://s0.wp.com/latex.php?latex=%7B%5Cleq+2%5Et%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\leq 2^t}");
    the sets are disjoint because we are looking at balls or radius
    ![{\\leq
    d(u,v)/3}](https://s0.wp.com/latex.php?latex=%7B%5Cleq+d%28u%2Cv%29%2F3%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\leq d(u,v)/3}")
    around
    ![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")
    and
    ![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}");
    so the event happens with a probability that is at least an absolute
    constant. When the event happens,

    ![\\displaystyle \|f_A(u) - f_A(v)\| \\geq f_A(u) - f_A(v) \\geq
    ru\'\_{t+1} - rv\'\_t
    ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%7Cf_A%28u%29+-+f_A%28v%29%7C+%5Cgeq+f_A%28u%29+-+f_A%28v%29+%5Cgeq+ru%27_%7Bt%2B1%7D+-+rv%27_t+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  |f_A(u) - f_A(v)| \geq f_A(u) - f_A(v) \geq ru'_{t+1} - rv'_t ")

2.  The second event is that
    ![{A}](https://s0.wp.com/latex.php?latex=%7BA%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A}")
    avoids the set ![{\\{ z: d(v,z) \< rv\'\_{t+1}
    \\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7B+z%3A+d%28v%2Cz%29+%3C+rv%27_%7Bt%2B1%7D+%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{ z: d(v,z) < rv'_{t+1} \}}")
    and intersects the set ![{\\{z: d(u,z) \\leq ru\'\_t
    \\}}](https://s0.wp.com/latex.php?latex=%7B%5C%7Bz%3A+d%28u%2Cz%29+%5Cleq+ru%27_t+%5C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\{z: d(u,z) \leq ru'_t \}}").
    The former set has size ![{\<
    2\^{t+1}}](https://s0.wp.com/latex.php?latex=%7B%3C+2%5E%7Bt%2B1%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{< 2^{t+1}}"),
    and the latter set has size ![{\\leq
    2\^t}](https://s0.wp.com/latex.php?latex=%7B%5Cleq+2%5Et%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\leq 2^t}");
    the sets are disjoint because we are looking at balls or radius
    ![{\\leq
    d(u,v)/3}](https://s0.wp.com/latex.php?latex=%7B%5Cleq+d%28u%2Cv%29%2F3%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\leq d(u,v)/3}")
    around
    ![{u}](https://s0.wp.com/latex.php?latex=%7Bu%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u}")
    and
    ![{v}](https://s0.wp.com/latex.php?latex=%7Bv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{v}");
    so the event happens with a probability that is at least an absolute
    constant. When the event happens,

    ![\\displaystyle \|f_A(u) - f_A(v)\| \\geq f_A(v) - f_A(u) \\geq
    rv\'\_{t+1} - ru\'\_t
    ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%7Cf_A%28u%29+-+f_A%28v%29%7C+%5Cgeq+f_A%28v%29+-+f_A%28u%29+%5Cgeq+rv%27_%7Bt%2B1%7D+-+ru%27_t+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  |f_A(u) - f_A(v)| \geq f_A(v) - f_A(u) \geq rv'_{t+1} - ru'_t ")

So we have established [(1)](#eqbourgainproof). Averaging over all
scales, we have

![\\displaystyle \\mathop{\\mathbb E}\_{A\\sim D} \|f_A(u) - f_A(v)\|
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D_%7BA%5Csim+D%7D+%7Cf_A%28u%29+-+f_A%28v%29%7C+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E}_{A\sim D} |f_A(u) - f_A(v)| ")

![\\displaystyle \\geq \\frac {c}{1+ \\log_2 n} \\cdot (ru\'\_{t\^\*+1} + rv\'\_{t\^\*+1} - ru\'\_0 - rv\'\_0)](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cgeq+%5Cfrac+%7Bc%7D%7B1%2B+%5Clog_2+n%7D+%5Ccdot+%28ru%27_%7Bt%5E%2A%2B1%7D+2B+rv%27_%7Bt%5E%2A%2B1%7D+-+ru%27_0+-+rv%27_0%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \geq \frac {c}{1+ \log_2 n} \cdot (ru'_{t^*+1} + rv'_{t^*+1} - ru'_0 - rv'_0) ")

![\\displaystyle \\geq \\frac {c}{1+ \\log_2 n} \\cdot \\frac {d(u,v)}
3](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cgeq+%5Cfrac+%7Bc%7D%7B1%2B+%5Clog_2+n%7D+%5Ccdot+%5Cfrac+%7Bd%28u%2Cv%29%7D+3&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \geq \frac {c}{1+ \log_2 n} \cdot \frac {d(u,v)} 3")

![\\Box](https://s0.wp.com/latex.php?latex=%5CBox&bg=ffffff&fg=000000&s=0&c=20201002 "\Box")

There is one remaining point to address. In Fact [2](#factlone), we
proved that a distribution over embeddings on the line can be turned
into an L1 embeddings, in which the number of dimensions is equal to the
size of the support of the distribution. In our proof, we have used a
distribution that ranges over
![{2\^{\|V\|}}](https://s0.wp.com/latex.php?latex=%7B2%5E%7B%7CV%7C%7D%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{2^{|V|}}")
possible functions, so this would give rise to an embedding that uses a
superpolynomial number of dimensions.

To fix this remaining problem, we sample ![{m= O(\\log\^3
\|V\|)}](https://s0.wp.com/latex.php?latex=%7Bm%3D+O%28%5Clog%5E3+%7CV%7C%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{m= O(\log^3 |V|)}")
sets
![{A_1,\\ldots,A_m}](https://s0.wp.com/latex.php?latex=%7BA_1%2C%5Cldots%2CA_m%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A_1,\ldots,A_m}")
and we define the embedding ![{f(u):= (m\^{-1}\\cdot f\_{A_1}
(u),\\ldots,m\^{-1} \\cdot
f\_{A_m}(u))}](https://s0.wp.com/latex.php?latex=%7Bf%28u%29%3A%3D+%28m%5E%7B-1%7D%5Ccdot+f_%7BA_1%7D+%28u%29%2C%5Cldots%2Cm%5E%7B-1%7D+%5Ccdot+f_%7BA_m%7D%28u%29%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{f(u):= (m^{-1}\cdot f_{A_1} (u),\ldots,m^{-1} \cdot f_{A_m}(u))}").
It remains to prove that this randomized mapping has low distortion with
high probability, which is an immediate consequence of the Chernoff
bounds. Specifically, we use the following form of the Chernoff bound:

> **Lemma 5** Let
> ![{Z_1,\\ldots,Z_m}](https://s0.wp.com/latex.php?latex=%7BZ_1%2C%5Cldots%2CZ_m%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{Z_1,\ldots,Z_m}")
> be independent nonnegative random variables such that, with
> probability 1, ![{0 \\leq Z_i \\leq
> M}](https://s0.wp.com/latex.php?latex=%7B0+%5Cleq+Z_i+%5Cleq+M%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{0 \leq Z_i \leq M}").
> Let ![{Z:= \\frac 1m (Z_1 + \\cdots +
> Z_m)}](https://s0.wp.com/latex.php?latex=%7BZ%3A%3D+%5Cfrac+1m+%28Z_1+%2B+%5Ccdots+%2B+Z_m%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{Z:= \frac 1m (Z_1 + \cdots + Z_m)}").
> Then
>
> ![\\displaystyle \\mathop{\\mathbb P} \[ \\mathop{\\mathbb E} Z - Z
> \\geq t \] \\leq e\^{-2mt\^2/M\^2}
> ](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+P%7D+%5B+%5Cmathop%7B%5Cmathbb+E%7D+Z+-+Z+%5Cgeq+t+%5D+%5Cleq+e%5E%7B-2mt%5E2%2FM%5E2%7D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb P} [ \mathop{\mathbb E} Z - Z \geq t ] \leq e^{-2mt^2/M^2} ")

Let us look at any two vertices
![{u,v}](https://s0.wp.com/latex.php?latex=%7Bu%2Cv%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{u,v}").
Clearly, for every choice of
![{A_1,\\ldots,A_m}](https://s0.wp.com/latex.php?latex=%7BA_1%2C%5Cldots%2CA_m%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{A_1,\ldots,A_m}"),
we have ![{\|\|f(u)-f(v) \|\|\_1 \\leq
d(u,v)}](https://s0.wp.com/latex.php?latex=%7B%7C%7Cf%28u%29-f%28v%29+%7C%7C_1+%5Cleq+d%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{||f(u)-f(v) ||_1 \leq d(u,v)}")
so it remains to prove a lower bound to their L1 distance. Let us call
![{Z}](https://s0.wp.com/latex.php?latex=%7BZ%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{Z}")
the random variable denoting their L1 distance, that is

![\\displaystyle Z:= \|\|f(u) - f(v) \|\| = \\sum\_{i=1}\^m \\frac 1m
\|f\_{A_i} (u) - f\_{A_i} (v) \|
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++Z%3A%3D+%7C%7Cf%28u%29+-+f%28v%29+%7C%7C+%3D+%5Csum_%7Bi%3D1%7D%5Em+%5Cfrac+1m+%7Cf_%7BA_i%7D+%28u%29+-+f_%7BA_i%7D+%28v%29+%7C+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  Z:= ||f(u) - f(v) || = \sum_{i=1}^m \frac 1m |f_{A_i} (u) - f_{A_i} (v) | ")

We can write ![{Z= \\frac 1m \\cdot ( Z_1 + \\cdots +
Z_m)}](https://s0.wp.com/latex.php?latex=%7BZ%3D+%5Cfrac+1m+%5Ccdot+%28+Z_1+%2B+%5Ccdots+%2B+Z_m%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{Z= \frac 1m \cdot ( Z_1 + \cdots + Z_m)}")
where ![{Z_i:= \|f\_{A_i} (u) - f\_{A_i} (v)
\|}](https://s0.wp.com/latex.php?latex=%7BZ_i%3A%3D+%7Cf_%7BA_i%7D+%28u%29+-+f_%7BA_i%7D+%28v%29+%7C%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{Z_i:= |f_{A_i} (u) - f_{A_i} (v) |}"),
so that
![{Z}](https://s0.wp.com/latex.php?latex=%7BZ%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{Z}")
is the sum of identically distributed nonnegative random variables, such
that

![\\displaystyle Z_i \\leq d(u,v)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++Z_i+%5Cleq+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  Z_i \leq d(u,v) ")

![\\displaystyle \\mathop{\\mathbb E} Z_i \\geq \\frac c {\\log \|V\|}
d(u,v)
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+E%7D+Z_i+%5Cgeq+%5Cfrac+c+%7B%5Clog+%7CV%7C%7D+d%28u%2Cv%29+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb E} Z_i \geq \frac c {\log |V|} d(u,v) ")

Applying the Chernoff bound with ![{M=
d(u,v)}](https://s0.wp.com/latex.php?latex=%7BM%3D+d%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{M= d(u,v)}")
and ![{t= \\frac c {2\\log \|V\|}
d(u,v)}](https://s0.wp.com/latex.php?latex=%7Bt%3D+%5Cfrac+c+%7B2%5Clog+%7CV%7C%7D+d%28u%2Cv%29%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{t= \frac c {2\log |V|} d(u,v)}"),
we have

![\\displaystyle \\mathop{\\mathbb P} \\left\[ Z \\leq \\frac c{2\\log
\|V\|} d(u,v) \\right\]
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+P%7D+%5Cleft%5B+Z+%5Cleq+%5Cfrac+c%7B2%5Clog+%7CV%7C%7D+d%28u%2Cv%29+%5Cright%5D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb P} \left[ Z \leq \frac c{2\log |V|} d(u,v) \right] ")

![\\displaystyle \\leq \\mathop{\\mathbb P} \\left\[ Z \\leq
\\mathop{\\mathbb E} Z - \\frac c{2\\log \|V\|} d(u,v) \\right\]
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cleq+%5Cmathop%7B%5Cmathbb+P%7D+%5Cleft%5B+Z+%5Cleq+%5Cmathop%7B%5Cmathbb+E%7D+Z+-+%5Cfrac+c%7B2%5Clog+%7CV%7C%7D+d%28u%2Cv%29+%5Cright%5D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \leq \mathop{\mathbb P} \left[ Z \leq \mathop{\mathbb E} Z - \frac c{2\log |V|} d(u,v) \right] ")

![\\displaystyle \\leq 2\^{- 2mc\^2/(2\\log \|V\|)\^2 }
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cleq+2%5E%7B-+2mc%5E2%2F%282%5Clog+%7CV%7C%29%5E2+%7D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \leq 2^{- 2mc^2/(2\log |V|)^2 } ")

which is, say, ![{\\leq
1/\|V\|\^3}](https://s0.wp.com/latex.php?latex=%7B%5Cleq+1%2F%7CV%7C%5E3%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{\leq 1/|V|^3}")
if we choose ![{m = c\' \\log\^3
\|V\|}](https://s0.wp.com/latex.php?latex=%7Bm+%3D+c%27+%5Clog%5E3+%7CV%7C%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{m = c' \log^3 |V|}")
for an absolute constant
![{c\'}](https://s0.wp.com/latex.php?latex=%7Bc%27%7D&bg=ffffff&fg=000000&s=0&c=20201002 "{c'}").

By taking a union bound over all pairs of vertices,

![\\displaystyle \\mathop{\\mathbb P} \\left\[ \\forall u,v. \\
\|\|f(u)-f(v)\|\|\_1 \\geq \\frac c {2\\log \|V\|} \\cdot d(u,v)
\\right\] \\geq 1 - \\frac 1 {\|V\|}
](https://s0.wp.com/latex.php?latex=%5Cdisplaystyle++%5Cmathop%7B%5Cmathbb+P%7D+%5Cleft%5B+%5Cforall+u%2Cv.+%5C+%7C%7Cf%28u%29-f%28v%29%7C%7C_1+%5Cgeq+%5Cfrac+c+%7B2%5Clog+%7CV%7C%7D+%5Ccdot+d%28u%2Cv%29+%5Cright%5D+%5Cgeq+1+-+%5Cfrac+1+%7B%7CV%7C%7D+&bg=ffffff&fg=000000&s=0&c=20201002 "\displaystyle  \mathop{\mathbb P} \left[ \forall u,v. \ ||f(u)-f(v)||_1 \geq \frac c {2\log |V|} \cdot d(u,v) \right] \geq 1 - \frac 1 {|V|} ")


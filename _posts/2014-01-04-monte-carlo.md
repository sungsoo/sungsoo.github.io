---
layout: post
title: Monte-Carlo Methods An Introduction
date: 2014-01-04
categories: [mathematical science]
tags: [big data]

---
<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

### Overview


몬테카를로 방법(Monte Carlo method)은 난수를 이용하여 함수의 값을 확률적으로 계산하는 알고리즘을 부르는 용어이다. 수학이나 물리학 등에 자주 사용되며, 계산하려는 값이 닫힌 형식으로 표현되지 않거나 복잡한 경우에 근사적으로 계산할 때 사용된다. 스타니스와프 울람(Stanislaw Ulam)이 모나코의 유명한 도박의 도시 몬테카를로의 이름을 본따 명명하였다.

1930년 엔리코 페르미(Enrico Fermi)가 중성자의 특성을 연구하기 위해 이 방법을 사용한 것으로 유명하다. 맨해튼 계획의 시뮬레이션이나 수소폭탄의 개발에서도 핵심적인 역할을 담당하였다.

알고리즘의 반복과 큰 수의 계산이 관련되기 때문에 몬테카를로는 다양한 컴퓨터 모의 실험 기술을 사용하여 컴퓨터로 계산하는 것이 적합하다.


### Definitions

#### What are Monte Carlo Method?

+ Incoporate probability into analysis
	- Used whe we know that a set of scenarios *can* happen but are unsure of whether they *will* happen
+ Examine the world as a system
+ Formulate the world as many little steps
+ Each step or iteration involves a realization of the world
+ System (or some aspect of it) will eventually converge to a desirable measure

#### What is a Measure?

![](http://sungsoo.github.com/images/measure.png)

There is no consensus on how *Monte Carlo* should be defined. For example, Ripley defines most probabilistic modeling as *stochastic simulation*, with Monte Carlo being reserved for Monte Carlo integration and Monte Carlo statistical tests. Sawilowsky distinguishes between a simulation, a Monte Carlo method, and a Monte Carlo simulation: a simulation is a fictitious representation of reality, a Monte Carlo method is a technique that can be used to solve a mathematical or statistical problem, and a Monte Carlo simulation uses repeated sampling to determine the properties of some phenomenon (or behavior). 

**Examples:**

+ **Simulation**: Drawing one pseudo-random uniform variable from the interval (0,1] can be used to simulate the tossing of a coin: If the value is less than or equal to 0.50 designate the outcome as heads, but if the value is greater than 0.50 designate the outcome as tails. This is a simulation, but not a Monte Carlo simulation.  

+ **Monte Carlo method**: The area of an irregular figure inscribed in a unit square can be determined by throwing darts at the square and computing the ratio of hits within the irregular figure to the total number of darts thrown. This is a Monte Carlo method of determining area, but not a simulation.  

+ **Monte Carlo simulation**: Drawing a large number of pseudo-random uniform variables from the interval (0,1], and assigning values less than or equal to 0.50 as heads and greater than 0.50 as tails, is a Monte Carlo simulation of the behavior of repeatedly tossing a coin.

![](http://sungsoo.github.com/images/overview-monte-carlo.png)

Kalos and Whitlock point out that such distinctions are not always easy to maintain. For example, the emission of radiation from atoms is a natural stochastic process. It can be simulated directly, or its average behavior can be described by stochastic equations that can themselves be solved using Monte Carlo methods. "Indeed, the same computer code can be viewed simultaneously as a 'natural simulation' or as a solution of the equations by natural sampling."

![](http://sungsoo.github.com/images/monte-carlo-types.png)

### Monte Carlo and random numbers


Monte Carlo simulation methods do not always require truly random numbers to be useful — while for some applications, such as primality testing, unpredictability is vital. Many of the most useful techniques use deterministic, *pseudorandom* sequences, making it easy to test and re-run simulations. The only quality usually necessary to make good simulations is for the pseudo-random sequence to appear "random enough" in a certain sense.

What this means depends on the application, but typically they should pass a series of statistical tests. Testing that the numbers are uniformly distributed or follow another desired distribution when a large enough number of elements of the sequence are considered is one of the simplest, and most common ones. Weak correlations between successive samples is also often desirable/necessary.

Sawilowsky lists the characteristics of a high quality Monte Carlo simulation:

+ the (pseudo-random) number generator has certain characteristics (e.g., a long “period” before the sequence repeats)  
+ the (pseudo-random) number generator produces values that pass tests for randomness  
+ there are enough samples to ensure accurate results  
+ the proper sampling technique is used  
+ the algorithm used is valid for what is being modeled  
+ it simulates the phenomenon in question.

*Pseudo-random number sampling* algorithms are used to transform uniformly distributed pseudo-random numbers into numbers that are distributed according to a given *probability distribution*.

*Low-discrepancy* sequences are often used instead of random sampling from a space as they ensure even coverage and normally have a faster order of convergence than Monte Carlo simulations using random or pseudorandom sequences. Methods based on their use are called *quasi-Monte Carlo methods*.

### References
[1] George S. Fishman, *Monte Carlo Concepts, Algorithms, and Applications*, Springer-Verlag, 1996.
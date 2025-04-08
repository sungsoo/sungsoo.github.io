---
layout: post
title: Centrifugal Compressor Efficiency - Part 3
date: 2014-01-10
categories: [mathematical science]
tags: [big data]

---

<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>


Centrifugal Compressor Efficiency - Part 3
--

[Part 1](http://sungsoo.github.io/2014/01/10/compressor-efficiency01.html) of the centrifugal compressor efficiency series addressed the measurements and parameters that are used to calculate compressor efficiency. In [Part 2](http://sungsoo.github.io/2014/01/10/compressor-efficiency02.html) of this series we examine how these measurements are used to calculate the enthalpy of the gas stream at the compressor suction and discharged for the refrigerant R134a. This calculation utilized bilinear interpolation of the *thermodynamic properties* published by DuPont in Technical Information T-134a – ENG. The remaining parameter that must be calculated to determine compressor efficiency is isentropic enthalpy as shown in Part 1. This parameter is depends on the *gas stream entropy* at the compressor *suction* and the compressor *discharge* pressure.

The following steps may be used to calculate **isentropic enthalpy**.

1. Calculate *the entropy of the gas at the compressor suction* as addressed in part 2 of the series.

2. Based on the compressor *discharge pressure*, find the gas temperature at the discharge pressure that represents a gas entropy that is equal to the gas at the compressor suction.

3. Using the gas temperature determined in step 2 calculate *the **enthalpy** of gas a this temperature and the compressor discharge pressure*. This is the isentropic enthalpy that is needed in the turbine efficiency calculation.


The key to addressing step 2 is realize that at a given pressure the entropy decreases monotonically with gas temperature as is illustrate by the following example taken from DuPont’s Technical Information T-134a – ENG.

![](http://sungsoo.github.com/images/r134a.jpg)

An example implementation of the *isentropic enthalpy calculation* is illustrated below:

![](http://sungsoo.github.com/images/iso_entropy.jpg)


[Part 4](http://sungsoo.github.io/2014/01/10/compressor-efficiency04.html) of this series on Centrifugal Compressor Efficiency will show how the *enthalpy values* calculated in Parts 2 and 3 of the series are used to implement an on-line calculation of compressor efficiency.

References
--

[1] [Centrifugal Compressor Efficiency - Part 3](http://modelingandcontrol.com/2012/01/centrifugal-compressor-efficiency-–-part-3/), *Modeling and Control Dynamic World of Process Control*, 2012.
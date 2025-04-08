---
layout: post
title: Centrifugal Compressor Efficiency - Part 4
date: 2014-01-10
categories: [mathematical science]
tags: [big data]

---

<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>


Centrifugal Compressor Efficiency - Part 4
--

[Part 1](http://sungsoo.github.io/2014/01/10/compressor-efficiency01.html) of the centrifugal compressor efficiency series addressed the measurements and parameters that must be calculated to determine compressor efficiency. In Part 2-3 of this series we examined one way of calculating the enthalpy and entropy of the gas stream at the compressor suction and discharge and isentropic enthalpy for the refrigerant R134a. Once these parameters are known, then [*the calculation of the compressor efficiency*](http://docs.lib.purdue.edu/cgi/viewcontent.cgi?article=3005&context=icec) is very straight forward as shown in Part 1 of this series. Below is an on-line view of the completed compressor efficiency calculation for the refrigerant R134a.

![](http://sungsoo.github.com/images/complete-efficiency.jpg)

When utilizing this module for on-line calculation of compressor efficiency in a DeltaV control system, the parameters shown for *suction* and *discharge* **temperature** and **pressure** would be changed to external references to the measurement values for suction and discharge pressure and temperature.

Later this year I will contribute the module shown above and associated documentation to the Emerson Application Exchange web site. Thus, through this web site the module will be freely available for download. If you have a DeltaV system and are responsible for a refrigeration compressor in your plant then I hope you find this module of value in improving your plant operation.


References
--

[1] [Centrifugal Compressor Efficiency - Part 4](http://modelingandcontrol.com/2012/01/centrifugal-compressor-efficiency-–-part-4/), *Modeling and Control Dynamic World of Process Control*, 2012.
---
layout: post
title: Centrifugal Compressor Efficiency - Part 1
date: 2014-01-10
categories: [mathmatical science]
tags: [thermodynamics]

---

<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

Centrifugal Compressor Efficiency
--


*Centrifugal compressors* play an important role within the process industry. In some cases compressor capacity may determine the throughput of a plant. If a compressor is used for refrigeration then any variation in compressor operation may directly impact the *temperature control* in key unit operations such as flash vessels and exothermic reactors. Also, the compressor drive is often major consumer of electric or steam energy. Thus, an on-line calculation of compressor efficiency can be useful in evaluating the impact of operating conditions on compressor performance and cost of operation. As illustrated below, the compressor *suction* and *discharge* pressure and *temperature* measurements are required to calculate *dynamic compression efficiency*.

![](http://sungsoo.github.com/images/measurements-efficiency.jpg)

The dynamic compression efficiency is calculated based these pressure and temperature measurements as shown below:

\\( Efficiency = 100 * \frac{h(p_2\cdot s_1) - h(p_1\cdot t_1)}{h(p_2\cdot t_2) - h(p_1\cdot t_1)} \\)

, where:

* \\(h(p_2\cdot s_1)\\) denotes isentropic enthalpy for suction entropy \\( s_1\\), 
* \\(h(p_2\cdot t_2)\\) denotes enthalpy at discharge pressure \\( p_2\\) and temperature \\( t_2\\), 
* \\(h(p_1\cdot t_1)\\) denotes enthalpy at suction pressure \\( p_1\\) and temperature \\( t_1\\), 
* \\( s_1\\) means the entropy a suction pressure \\( p_1\\) and temperature \\( t_1\\).

![](http://sungsoo.github.com/images/efficiency-equation.jpg)

It is estimated that there are over **80,000 centrifugal chillers** in operation in North America. Thus, in the upcoming series of blogs on Centrifugal Compressor Efficiency will focus on the dynamic compression efficiency of a centrifugal compressor used in a plant for refrigeration. This efficiency calculation may be implement using common tools in a DCS and put on-line within the control system. By making on-line compressor efficiency available to the plant operator as a continuously calculated value, the operator can better assess the impact of operation changes on the compressor efficiency and use this knowledge to improve plant operations.


References
--

[1] [Centrifugal Compressor Efficiency - Part 1](http://modelingandcontrol.com/2012/01/centrifugal-compressor-efficiency-–-part-1/), Modeling and Control Dynamic World of Process Control, 2012.
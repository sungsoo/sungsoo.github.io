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

<img src="http://www.sciweavers.org/tex2img.php?eq=Efficiency%20%3D%20100%20%2A%20%5Cfrac%7Bh%28p_2%5Ccdot%20s_1%29%20-%20h%28p_1%5Ccdot%20t_1%29%7D%7Bh%28p_2%5Ccdot%20t_2%29%20-%20h%28p_1%5Ccdot%20t_1%29%7D&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="Efficiency = 100 * \frac{h(p_2\cdot s_1) - h(p_1\cdot t_1)}{h(p_2\cdot t_2) - h(p_1\cdot t_1)}" width="281" height="40" />

, where:

* <img src="http://www.sciweavers.org/tex2img.php?eq=h%28p_2%5Ccdot%20s_1%29&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="h(p_2\cdot s_1)" width="63" height="18" /> denotes isentropic enthalpy for suction entropy <img src="http://www.sciweavers.org/tex2img.php?eq=s_1&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="s_1" width="17" height="13" />,

* <img src="http://www.sciweavers.org/tex2img.php?eq=h%28p_2%5Ccdot%20t_2%29&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="h(p_2\cdot t_2)" width="61" height="18" /> denotes enthalpy at discharge pressure <img src="http://www.sciweavers.org/tex2img.php?eq=p_2&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="p_2" width="21" height="14" /> and temperature <img src="http://www.sciweavers.org/tex2img.php?eq=t_2&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="t_2" width="14" height="15" />, 
* <img src="http://www.sciweavers.org/tex2img.php?eq=h%28p_1%5Ccdot%20t_1%29&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="h(p_1\cdot t_1)" width="61" height="18" /> denotes enthalpy at suction pressure <img src="http://www.sciweavers.org/tex2img.php?eq=p_1&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="p_1" width="21" height="14" /> and temperature <img src="http://www.sciweavers.org/tex2img.php?eq=t_1&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="t_1" width="14" height="15" />, 
* <img src="http://www.sciweavers.org/tex2img.php?eq=s_1&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="s_1" width="17" height="13" /> means the entropy a suction pressure <img src="http://www.sciweavers.org/tex2img.php?eq=p_1&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="p_1" width="21" height="14" /> and temperature <img src="http://www.sciweavers.org/tex2img.php?eq=t_1&bc=White&fc=Black&im=png&fs=12&ff=fourier&edit=0" align="center" border="0" alt="t_1" width="14" height="15" />.

![](http://sungsoo.github.com/images/efficiency-equation.jpg)

It is estimated that there are over **80,000 centrifugal chillers** in operation in North America. Thus, in the upcoming series of blogs on Centrifugal Compressor Efficiency will focus on the dynamic compression efficiency of a centrifugal compressor used in a plant for refrigeration. This efficiency calculation may be implement using common tools in a DCS and put on-line within the control system. By making on-line compressor efficiency available to the plant operator as a continuously calculated value, the operator can better assess the impact of operation changes on the compressor efficiency and use this knowledge to improve plant operations.


References
--

[1] [Centrifugal Compressor Efficiency - Part 1](http://modelingandcontrol.com/2012/01/centrifugal-compressor-efficiency-–-part-1/), Modeling and Control Dynamic World of Process Control, 2012.
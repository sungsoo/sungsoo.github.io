---
layout: post
title: Centrifugal Compressor Efficiency - Part 2
date: 2014-01-10
categories: [mathematical science]
tags: [big data]

---

<script type="text/javascript"  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

Centrifugal Compressor Efficiency - Part 2
--

As addressed in [Part 1](http://sungsoo.github.io/2014/01/10/compressor-efficiency01.html) of the centrifugal compressor efficiency series, the enthalpy of the gas stream at the compressor *suction* and *discharge* must be known to determine the **compressor efficiency**. Also, the isentropic enthalpy must be determined based on the gas stream entropy at the compressor suction and the compressor discharge pressure. These properties of the gas stream may be calculated based on the *thermodynamic property* of the gas used with the compressor. Since in this example the centrifugal compressors is part of a *refrigeration* systems, we assume the refrigerant is R134a. The thermodynamic properties of R134a have are published in DuPont’s Technical Information T-134a – ENG that is publically available on the web. Below is an example of the property tables supplied by DuPont for superheated R134a.

As noted in this table, enthalpy and entropy are a function of the gas pressure and temperature. Based on the information provided in the property tables for specific temperatures and pressures, the enthalpy and entropy at any pressure or temperature within the table range may be calculate. 

![](http://sungsoo.github.com/images/entropy-table.jpg)


For example, in one recent application, the values from the thermodynamic table that span a **temperature range** of **-10 degF to 200 degF** and a **pressure range** of **10psia to 200psia** were entered as array parameters in a DeltaV module. Calculation blocks were then created that utilize the thermodynamic property arrays to calculate enthalpy and entropy using bilinear interpolation based on the pressure and temperature provided as block inputs as illustrated below.

![](http://sungsoo.github.com/images/enthalpy-entropy-calculation.jpg)

The calculation of isentropic enthalpy used in the efficiency calculation will be addressed in part 3 of this series.


References
--

[1] [Centrifugal Compressor Efficiency - Part 2](http://modelingandcontrol.com/2012/01/centrifugal-compressor-efficiency-–-part-2/), *Modeling and Control Dynamic World of Process Control*, 2012.
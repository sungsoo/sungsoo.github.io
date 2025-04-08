---
layout: post
title: A Taxonomy of Predictive Methods
date: 2014-03-04
categories: [computer science]
tags: [big data]

---

Summary
---
* **Article Source**: Walter L. Perry, Brian McInnis, Carter C. Price, Susan C. Smith, John S. Hollywood, *Predictive Policing; The Role of Crime Forecasting in Law Enforcement Operations*, 2013 [1].


A Taxonomy of Predictive Methods
---

In our assessment of predictive policing, we found that predictive methods can be divided into four broad categories:


1. *Methods for predicting crimes*: These are approaches used to forecast places and times with an increased risk of crime.
2. *Methods for predicting offenders*: These approaches identify individuals at risk of offending in the future.
3. *Methods for predicting perpetrators’ identities*: These techniques are used to create profiles that accurately match likely offenders with specific past crimes.
4. *Methods for predicting victims of crimes*: Similar to those methods that focus on offenders, crime locations, and times of heightened risk, these approaches are used to identify groups or, in some cases, individuals who are likely to become victims of crime.

![words](http://sungsoo.github.com/images/predictive-policing_3.png)

Tables S.1–S.4 summarize each category and show the range of approaches that
law enforcement agencies have employed to predict crimes, offenders, perpetrators’ identities, and victims, respectively. We found a near one-to-one correspondence between conventional crime analysis and investigative methods and the more recent “predictive analytics” methods that mathematically extend or automate the earlier methods. Conventional methods tend to be heuristic, or mathematically simple. As a result, they are low-cost and can work quite well, especially for analysts facing *low to moderate* data volumes and levels of complexity. In contrast, full-scale predictive analytics require sophisticated analysis methods that draw on *large* data sets. In this context, *large* refers to an amount of data beyond what a single analyst could recall without the assistance of a computer program or similar resources. Conversely, *low to moderate* refers to a data set that is sufficiently small that an analyst could reasonably recall its key facts.


![Hot spots](http://sungsoo.github.com/images/predictive_policing-large.jpg)

Table S.1 summarizes predictive policing methods related to *predicting crimes*. As the table shows, conventional approaches start with mapping crime locations and determining (using human judgment) where crimes are concentrated (“**hot spots**”). The corresponding predictive analytics methods start, at the most basic level, with regression analyses and extend all the way to cutting-edge mathematical models that are the subjects of active research.

![Table S.1](http://sungsoo.github.com/images/table-s1.png)

Table S.2 summarizes methods to identify individuals at high risk of offending in the future. The bulk of these methods relate to assessing individuals’ risk. Here, conventional methods rely on clinical techniques that add up the number of risk factors to create an overall risk score. The corresponding predictive analytics methods use regression and classification models to associate the presence of risk factors with a percent chance that a person will offend. Also of interest are methods that identify criminal groups (especially gangs) that are likely to carry out violent assaults on each other in the near future. Hence, these methods can also be used to assess the risk that an individual will become a victim of crime.

![Table S.2](http://sungsoo.github.com/images/table-s2.png)

Table S.3 summarizes methods used to identify likely perpetrators of *past crimes*. These approaches are essentially real-world versions of the board game Clue<sup><small>TM</small></sup>: They use available information from crime scenes to link suspects to crimes, both directly and by processes of elimination. In conventional approaches, investigators and analysts do this largely by tracing these links manually, with assistance from simple database queries (usually, the names, criminal records, and other information known about the suspects). Predictive analytics automate the linking, matching available “*clues*” to potential (and not previously identified) suspects across very large data sets.

![Table S.3](http://sungsoo.github.com/images/table-s3.png)

Table S.4 summarizes methods to identify groups—and, in some cases, individuals—who are likely to *become victims of crime*. These methods mirror those used to predict where and when crimes will occur, as well as some of the methods used to predict who is most likely to commit crimes. Predicting victims of crime requires identifying at-risk groups and individuals—for example, groups associated with various types of crime, individuals in proximity to at-risk locations, individuals at risk of victimization, and individuals at risk of domestic violence.

![Table S.4](http://sungsoo.github.com/images/table-s4.png)


References
---
[1] Walter L. Perry, Brian McInnis, Carter C. Price, Susan C. Smith, John S. Hollywood, *Predictive Policing; The Role of Crime Forecasting in Law Enforcement Operations*, 2013.


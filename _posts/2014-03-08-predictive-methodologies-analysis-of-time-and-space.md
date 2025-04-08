---
layout: post
title: Predictive Methodologies - Analysis of Time and Space
date: 2014-03-08
categories: [computer science]
tags: [big data, analytics, graph mining]

---

Predictive Methodology Two: Analysis of Time and Space
---

The clustering methods described above are all aimed at identifying areas with high crime levels. In a forecasting context, clustering methods detect locations or areas where crime is likely to occur based on *where crime has occurred in the past* and, in the case of *risk-terrain modeling*, *environmental characteristics*. These methods, however, *do not* take advantage of temporal patterns in crime. Although some clustering algorithms *weight recent events* more heavily in generating forecasts, they do not illustrate how the incidence of crime changes over time. *Clustering* **does not** illuminate *movement* in criminal activity.


In practice, clustering without much regard to the *temporal dimension* of criminal activity is often sufficient. Hot-spot maps are easy to read and can help officers make quick, informed decisions about how to allocate their time during a shift. Some tasks, however, demand attention to *temporal patterns*. If a police department has observed a rash of robberies and is attempting to predict the next incident in the string, *it is critical to identify both the spatial and temporal path taken by the suspected offender.*


**CrimeStat III**, a software program developed by sociologist Ned Levine and the National Institute of Justice, allows users to *analyze both the spatial and temporal components* of crime patterns. If the analyst is interested in a descriptive summary of a sequence of events, they can compute a **spatial-temporal moving average (STMA)** [2]. An STMA permits examination of the path a criminal has taken. It is calculated using the *average time and location* for a subset of incidents. For each incident, the averages are calculated using the incidents that occurred just *before* and just *after*. A subset generally includes *three, five, or seven incidents*. The resulting map includes a line through the incidents, which marks that “average” path taken by the offender [2].

To forecast when and where the next crime in a sequence will occur, an analyst can perform a **correlated walk analysis (CWA)** [2]. *A CWA examines the temporal and spatial relationships between incidents in a given sequence to predict the next incident.* The first step in performing a CWA is to determine if there is a systematic pattern in an observed sequence of criminal incidents. This is accomplished by *computing the correlation between intervals*. An interval is defined by the time, distance, and direction (or bearing) between two events. With one lag, the interval is defined as the time, distance, and direction between an incident at time *t* and an incident at time *t–1*. With two lags, an interval is defined as the time, distance, and direction between an incident at time *t* and one at time *t–2*. The same logic applies to lags of three, four, and so on. Once the correlations between intervals for various lags (usually one to seven) have been calculated, *the analyst can determine which lag for time, distance, and direction has the highest correlation*.

To generate a prediction, the analyst can calculate *the average time, distance, and direction* based on the appropriate interval length. For example, if the analyst determines that a lag of three exhibits the highest correlation with respect to time, the average time would be calculated using intervals with three lags. After the average time, distance, and direction are calculated, they are added to the last incident in the sequence—this is the predicted time and location of the next offense.

Although a correlated walk analysis has a strong theoretical basis, it does not always produce conclusive results. There are many sequences of incidents in which a clear spatial and temporal pattern fails to emerge. Sequences with a small number of incidents or long timespans between incidents may fail to reveal an underlying pattern. And *inaccurate data*, such as the exclusion of incidents committed by the offender of interest or inclusion of events committed by another offender, will *bias the prediction*. In sum, while preliminary research suggests that CWA has potential as a tool for *crime prevention*, the method requires *refinement* before it can be regularly used by police departments.


References
---
[1] Jennifer Bachner, *Predictive Policing; Preventing Crime with Data and Analytics*, Improving Performance Series, [IBM Center for The Business of Government](http://www.businessofgovernment.org), 2013.  
[2] Ned Levine & Associates and the National Institute of Justice, *CrimeStat III: A Spatial Statistics Program*.  
[3] Graham Farrell and William Sousa, “*Repeat Victimization and Hot Spots: The Overlap and its Implications for Crime Control and
Problem-Oriented Policing*,” Crime Prevention Studies 12 (2001): 221–240.  
[4] Tony H. Grubesic, “On the Application of Fuzzy Clustering for Crime Hot Spot Detection,” *Journal of Quantitative Criminology* 22 (2006): 77–105.  
[5] Leslie Kennedy, Joel Caplan and Eric Piza, “Risk Clusters, Hotspots, and Spatial Intelligence: Risk Terrain Modeling as an Algorithm for Police Resource Allocation Strategies,” *Journal of Quantitative Criminology* 27 (2011): 339–362.  
[6] Patricia Brantingham and Paul Brantingham, “Criminality of Place,” *European Journal on Criminal Policy & Research* 3–3 (1995): 5–26.  
[7] Joel Caplan, Leslie Kennedy, and Joel Miller, “Risk Terrain Modeling: Brokering Criminological Theory and GIS Methods for Crime Forecasting,” *Justice Quarterly* 28:2 (2011): 360–381.
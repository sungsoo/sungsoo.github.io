---
layout: post
title: Limitations of Macroscopic and Mesoscopic Simulation
date: 2018-03-12
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [Hybrid microscopic-mesoscopic traffic simulation](https://www.kth.se/polopoly_fs/1.742065!/hybrid%20mesoscopic.pdf)
* Authors: Wilco Burghout, Royal Institute of Technology Stockholm, Sweden 2004

---

# Limitations of Macroscopic and Mesoscopic Simulation

While macroscopic and mesoscopic models should be *easier* to calibrate than microscopic models, due to their few and directly measurable parameters, their application is limited to cases where the interaction of vehicles is not crucial to the results of the simulation. For instance, analysis of merging areas usually requires the explicit simulation of gap acceptance behaviour of the vehicles, as well as a precise reproduction of the geometrical features of the ramp and freeway. Due to the high-level aggregate representation of traffic and road geometry in macroscopic (and to a lesser degree mesoscopic) models, these facilities cannot be accurately replicated and analysed. *Accurate modelling* of *adaptive signal control* is difficult in both macroscopic models and mesoscopic models. In macroscopic models, the vehicles are not modelled individually and in mesoscopic models the *positions* and *behaviour* of vehicles are *approximated*. When these vehicle positions are not known, or are inaccurate, it is difficult to simulate the activations of detectors that are used in the adaptive control system. This brings us to a general problem of comparing results from macroscopic models with real life detector data. While it is possible to obtain measures such as *flows* and *speeds* from these models, the exact location of the measurements can be difficult to determine. Normally they are averages over a whole link or segment, while in real life the location of a detector can make a difference on the *measured flows*, *speeds* and *occupancies*.

These types of models are most successfully applied to large scale networks and long time periods, where the shortcomings due to the limited detail of these types of models may not be important. For applications where these shortcomings can have a larger effect on the results, including modelling of *intelligent transport systems* (ITS) and the examples mentioned above, one should consider applying *microscopic models* instead.
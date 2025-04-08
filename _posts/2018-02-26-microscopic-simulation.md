---
layout: post
title: Microscopic Simulation
date: 2018-02-26
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [Hybrid microscopic-mesoscopic traffic simulation](https://www.kth.se/polopoly_fs/1.742065!/hybrid%20mesoscopic.pdf)
* Authors: Wilco Burghout, Royal Institute of Technology Stockholm, Sweden 2004

---

# Microscopic Simulation


While dynamic assignment in general can be studied using the macroscopic simulators, the need has arisen to understand at least part of the traffic system at a more detailed level. It has been found that ‘details’ at the macroscopic level, such as the length of an on-ramp or the settings of signal control, are often constraining when it comes to the maximum (capacity) and nominal flows through such sections, and the study of the vehicular interactions is needed to discover and understand such constraining factors.

Whereas the macroscopic models often exhibit a *minimalist approach*, so that an efficient solution can be reached, do the new generation of models aim at modelling the process of vehicular traffic in detail. This type of models, that try to describe the actions and reactions of the particles that make up the traffic as accurately as possible, are called *microscopic models*.

In microscopic models, traffic is described at the level of individual vehicles and their interaction with each other and the road infrastructure. Normally this behaviour is captured in some set of rules of behaviour which determine when a vehicle accelerates, decelerates, changes lane, but also how and when vehicles choose and change their routes to their destinations. The models that govern the vehicle’s behaviour can often be divided into a *car-following model*, a *lane-change model*, and a *route-choice model*. The car-following model describes the breaking and accelerating patterns that result from interaction of the driver with the vehicle in front as well as other objects (such as speed limits, road curvature, etc.). The lane-changing model describes the decisions when to change lanes, based on the driver’s preferences and the situation in both the current lane and other lanes (speed of vehicle in front, sufficiently large gap in adjacent lane, etc.) The route- choice model describes how drivers determine which path to take from their starting location (origin) to their destination, and how they react to traffic and route information along the way.

In addition, the traffic control to which the vehicles (drivers) react, is described in detail: the signs, traffic signals, the way these signals are operated, but also the location and operation of traffic detectors.
The demand in microscopic models is normally represented in one of two ways. One method is to model the flows of traffic that enter the network, together with the turning percentages at each intersection (i.e. the percentage of vehicles that turn left, right or go straight, for each intersection approach). Another method is to divide the modelled network up in zones and define the number of vehicles that want to travel from each zone to each other zone in an *Origin/Destination matrix* (OD matrix). Normally these demand patterns vary over time, so there is an OD matrix for each time period. This last method of representing demand can be a more accurate representation of reality, since it describes from where to where vehicles travel. This allows for modelling the *route choice* explicitly (as a *behavioural model*).

Where in the macroscopic models the *speeds*, *flows* and *densities* are model variables; in the microscopic model these are *aggregated measures*, resulting from the interactions of all vehicles with the infrastructure and other vehicles. This means that its measurement is not unlike the measurement of these flows in the real system, with the detectors being modelled and simulated as well. As is discussed later on, there are also drawbacks to this approach, and most notably these are the amount of detail needed when modelling a road network, as well as the effort needed to calibrate the large amount of model parameters. Examples of microscopic models are VISSIM (PTV 2003) and (Fellendorf, M. 1996), AIMSUN/2 (Barcelo, J. et al. 1997), Paramics (Smith, M. et al. 1994), MITSIMLab (Toledo, T. et al. 2003) and CORSIM (US-DoT 1995).
---
layout: post
title: Mesoscopic Simulation
date: 2018-03-09
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [Hybrid microscopic-mesoscopic traffic simulation](https://www.kth.se/polopoly_fs/1.742065!/hybrid%20mesoscopic.pdf)
* Authors: Wilco Burghout, Royal Institute of Technology Stockholm, Sweden 2004

---

# Mesoscopic Simulation

A third 'class' of traffic simulation models is gaining popularity. So-called *mesoscopic models* fill the gap between the *aggregate level approach* of macroscopic models and the *individual interactions* of the microscopic ones. Mesoscopic models normally describe the traffic entities at a high level of detail, but their behaviour and interactions are described at a lower level of detail.

These models can take varying forms. One form is vehicles grouped into packets, which are routed through the network (CONTRAM, (Leonard, D.R. et al. 1989)). The packet of vehicles acts as one entity and its speed on each road (link) is derived from a *speed-density function* defined for that link, and the density on the link at the moment of entry. The density on a link is defined as the number of vehicles per kilometre per lane. A speed-density function relates the speed of vehicles on the link to the density. If there is a lot of traffic on the link (the density is high), the speed-density function will give a low speed to the vehicles, whereas a low density will result in high speeds. The lane changes and acceleration/deceleration of vehicles is not modelled.

Another mesoscopic paradigm is that of individual vehicles that are grouped into *cells* which control their behaviour. The cells traverse the link and vehicles can enter and leave cells when needed, but not overtake. The speed of the vehicles is determined by the cell, not the individual drivers' decisions (DYNAMIT (Ben- Akiva, M. 1996)).

Alternatively, a *queue-server approach* is used in some models (DYNASMART (Jayakrishnan, R. et al. 1994), FASTLANE (Gawron, C. 1998), DTASQ (Mahut, M. 2001)), where the roadway is modelled as a *queuing* and a *running part*. The lanes can be modelled individually, but usually they are not. Although the vehicles are represented individually and maintain their individual speeds, their behaviour is not modelled in detail. The vehicles traverse the running part of the roadway with a speed that is determined using a *macroscopic speed-density function*, and at the downstream end a queue-server is transferring the vehicles to connecting roads. This last approach combines the advantages of dynamic disaggregated traffic stream modelling (since the vehicles are modelled individually), with the ease of calibration and use of macroscopic speed/density relationships. The capacities at the node servers follow from saturation flows and their variance (measured or calculated). Signal controlled intersections can be modelled by replacing the queue servers with gates that open and close according to the states of the signal control (green / amber / red). *Adaptive signal control* is harder to model since the positions of the vehicles on the link are not known, and therefore it is difficult to know when they pass detectors connected to the signal control. Another advantage of the representation of individual vehicles is the possibility of modelling disaggregated route-choice. This is important when en-route changes of routes need to be modelled, for instance when evaluating ITS systems that help drivers decide their routes.

Another type of mesoscopic model uses *cellular automata*. In these models the road is discretised into cells that can either be empty or occupied by a vehicle. The vehicles follow a minimalist set of behaviour rules (most notably the Nagel- Schreckenberg rules (Nagel, K. & Schreckenberg, M. 1992)), which determine for each time step the number of cells that are traversed by the vehicle (TRANSIMS (Bush, B.W. 2000)).

The main application area of mesoscopic models is where the detail of microscopic simulation might be desirable but infeasible due to a large network, or limited resources available to be spent on the coding and debugging of the network.

## Mesoscopic Traffic Simulation

*Mesoscopic traffic simulation* is one of the three modeling levels in traffic simulation. Basically, there are two main approaches to mesoscopic traffic simulation: one in which vehicles are grouped into *platoons* that move along the link, and the other one in which *dynamics* of individual vehicles are *simplified*. To handle time, mesoscopic traffic simulation either uses *time-step* or *event-based model*. Time-step model is computationally more expensive than event-based model. However, it is challenging to build an efficient event-based model especially for complex systems. In this paper, we deal with the *time-step approach* with individual vehicle modeling since it can better support applications for real-time traffic management.


![](http://sungsoo.github.com/images/link_model.png)

A simulation network consists of nodes and links. Vehicles travel from one node (origin) to another node (destination) by passing through links. On the *supply side* of mesoscopic traffic simulation, links are modeled using *queuing theory* as in Figure 1. Each link is split into a *queuing* part and a *moving* part. Vehicles in the queuing part are delayed due to capacity constraints at the link downstream. On the other hand, nodes are modeled as the transfer of queuing vehicles from upstream flows to downstream ones ruled by the vehicle discharging process. To simulate traffic flow in the moving part, link density is computed based on number of vehicles on link and link physical length and speed is derived from density using *speed-density relationship*. This speed is then used to calculate the time needed for vehicles in the moving part to reach the end of the link and be transferred to the next link.

The *demand side* of mesoscopic model includes *vehicle loading model* and *route choice model* in which the drivers select the route to travel in order to maximize some predefined objectives. Since the modeling of individual vehicles is simpli- fied, mesoscopic simulation *does not describe* the interaction between vehicles such as *lane changing* and *car following*.
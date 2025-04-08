---
layout: post
title: Simulation Loop
date: 2018-03-11
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [Hybrid microscopic-mesoscopic traffic simulation](https://www.kth.se/polopoly_fs/1.742065!/hybrid%20mesoscopic.pdf)
* Authors: Wilco Burghout, Royal Institute of Technology Stockholm, Sweden 2004

---

# The Simulation Loop

A typical simulation of traffic network operations is illustrated in the middle column of Figure 2. Basically, a *time-step mesoscopic traffic model* proceeds in two phases: the *update* phase and the *advance* phase.

![](http://sungsoo.github.com/images/sim-loop.png)

* 1) **Update Phase**: Update phase updates traffic dynamics at the link level (density, speed, queue, etc.) which are used in the current interval.
* 2) **Advance Phase**: Advance phase advances vehicles along their selected path to the new positions at the end of the simulation interval. The time step is set to a small enough value so that vehicle can just move along a link or is transfered from one link to the next. Vehicle cannot traverse more than two links within one simulation time-step. When a vehicle moves along the link where it is currently located at, the vehicle movement follows traffic dynamics calculated in the update phase. 

However, when a vehicle is in the queuing part at the end of a link, it can only move to next link if three conditions are fulfilled:

* 1) The current link has *enough output capacity* (which is updated by downstream end node)
* 2) The next link has *enough input capacity* (which is updated by upstream end node)
* 3) The next link has *available empty space* (which is updated by both upstream and downstream end nodes).

The first two conditions are *local to each node*, however the third one creates *upstream-downstream data dependency* because the available empty space of each link depends on both the upstream and the downstream nodes.
---
layout: post
title: Macroscopic Simulation
date: 2018-02-25
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [Hybrid microscopic-mesoscopic traffic simulation](https://www.kth.se/polopoly_fs/1.742065!/hybrid%20mesoscopic.pdf)
* Authors: Wilco Burghout, Royal Institute of Technology Stockholm, Sweden 2004

---

# Macroscopic Simulation

Dynamic, meaning *time-variant*, modelling of the traffic flows has become common nowadays. Dynamic macroscopic models such as the **LWR model** (by Lighthill and Whitham, (Lighthill, M.H. & Whitham, G.B. 1955) and Richards (Richards, P.I. 1956)) describe the evolution of traffic over time and space using a set of differential equations. Often analogues of physical phenomena are used in defining the differential equations, such as those describing traffic like flows in fluids or gases. The solution to these equations can be obtained analytically or using simulation. When evaluating a single segment of road, analytical approaches can still be used, but when the temporal and spatial interactions of traffic flows in road networks need to be evaluated, the method of solution that is used is normally simulation.

In Daganzo's **Cell Transmission Model** (Daganzo, C. 1994; 1995), the LWR continuum model is discretised into cells. The road is represented by a number of small sections (*cells*). The simulation model keeps track of the number of vehicles in each cell, and every time step it calculates the number of vehicles that cross the boundaries between adjacent cells. This flow from one cell to the other depends on how many vehicles can be sent by the upstream cell and how many can be received by the downstream cell. The amount of vehicles that can be sent is a function of the density in the upstream cell and the number that can be received depends on the density in the receiving cell. The *lagged cell transmission model* (Daganzo, C. 1999) is a refinement of this scheme, where the amount of vehicles that a cell can receive (from the adjacent upstream cell) depends on the density some time earlier in the cell.

Another model that uses simulation to describe the propagation of vehicle flows is METACOR (Elloumi, N. et al. 1994) (Papageorgiou, M. et al. 1989). METACOR is based on another *analytical continuum model*, developed by Payne (Payne, H.J. 1971). The road is divided into *cells*, for which at discrete time intervals the flow, speed and density are calculated evaluating *macroscopic differential equations*. In each time interval, also interactions of consecutive cells in terms of speed and concentration are calculated. Step by step the temporal and spatial dynamics of the traffic system are approximated by these calculations. This way the interacting cells make up a road, and roads can be connected via intersections. Because of the explicit modelling of the interactions of the entities of the system (in this case the road cells and intersections), and the relative ease of modelling the (small) entities, the modelled area can be extended to include large road networks.

The common term for simulations that model *traffic* as *flows* is *macroscopic simulation*. The use of these tools has grown extensively, and been facilitated by the development of extensive traffic measurement systems that have been installed in major urban areas and motorways. An additional factor that helped especially macroscopic models gain popularity is the fact that the data needed for such models (flow counts, speeds) is at the same level of aggregation as the data supplied by the measurements.
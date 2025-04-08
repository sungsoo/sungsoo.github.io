---
layout: post
title: Sequential Implementation of Mesoscopic Simulation
date: 2018-03-15
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [High-performance mesoscopic traffic simulation with GPU for large scale networks](http://ieeexplore.ieee.org/document/8167676/)
* Authors: Vinh An Vu, Gary Tan
* Published in: *IEEE/ACM 21st International Symposium on Distributed Simulation and Real Time Applications* (DS-RT), 2017

---

# The Sequential Implementation of Mesoscopic Simulation Loop

The sequential implementation of mesoscopic simulation loop is straight-forward. For each time step, update and advance phases are executed on each link one by one. Sequential version resolves *upstream-downstream dependency* by processing links in *downstream-upstream order*. This guarantees that a vehicle only moves from one link to another when the leading link has already been processed and the *availability of empty space* in the leading link has been confirmed. But there is an exception when the network contains *cycles*. Figure 3 shows a sample network with a cycle between 4 nodes *b, c, d* and *e*. After the link between node *d* and node *f* is processed, next link cannot be selected since the remaining links *wait* for each other in a *cycle*. To handle the situation when a vehicle moves to a link which has not been processed, one method called *virtual processing* was proposed. As illustrated in Figure 4, vehicles moving through Node a which have not been processed are stored temporarily in a *virtual link* associated with Link *A*. Once Link *A* is processed, vehicles on this virtual link can be moved. The capacity of virtual link associated with Link *A* is set to *the same as input capacity* of Link *A*.

![](http://sungsoo.github.com/images/network-with-cycle.png)

With virtual processing in place, *advance phase* could be split into two smaller steps. In the first step, links are processed sequentially, vehicles are moved along the links or from one link to another. When upstream-downstream dependency happens, virtual processing is employed to move vehicles to virtual links. In the second step, virtual links are processed sequentially to move vehicles on virtual links to actual link based on the available space of actual link. For both two steps, vehicles in each link are processed in *downstream-upstream order*.

![](http://sungsoo.github.com/images/virtual-processing.png)

Virtual processing contains an *assumption about empty space *of links since at the time the vehicle makes a move, the downstream link, which the vehicle is trying to move to, has not been processed and there is no way of determining the number of vehicles that link could take. There is a chance that there are more vehicles in virtual link than what the actual link could handle which leads to vehicles getting stuck in virtual link till future time steps. This assumption creates the gap between real life traffic network operation and traffic simulation. In order to minimize virtual processing, sequential simulation *sorts links in downstream-upstream order* to ensure that downstream links are processed before vehicles from upstream links are transferred. *Virtual processing* is still needed to break cycles when necessary.

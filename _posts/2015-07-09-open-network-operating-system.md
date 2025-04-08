---
layout: post
title: Open Network Operating System
date: 2015-07-09
categories: [computer science]
tags: [computer networks]

---


ONOS : Open Network Operating System
====================================

## What is ONOS?
ONOS is a new SDN network operating system designed for high availability,
performance, scale-out.

## Top-Level Features

* High availability through clustering and distributed state management.
* Scalability through clustering and sharding of network device control.
* Performance that is good for a first release, and which has an architecture
  that will continue to support improvements.
* Northbound abstractions for a global network view, network graph, and
  application intents.
* Pluggable southbound for support of OpenFlow and new or legacy protocols.
* Graphical user interface to view multi-layer topologies and inspect elements
  of the topology.
* REST API for access to Northbound abstractions as well as CLI commands.
* CLI for debugging.
* Support for both proactive and reactive flow setup.
* SDN-IP application to support interworking with traditional IP networks
  controlled by distributed routing protocols such as BGP.
* IP-Optical use case demonstration.

Checkout out our [website](http://www.onosproject.org) and our
[tools](http://www.onosproject.org/software/#tools)

## Tech Talk: ONOS- A Distributed SDN Network Operating System

<iframe width="600" height="400" src="https://www.youtube.com/embed/cTHVwZ9FzN4" frameborder="0" allowfullscreen></iframe>

## ONOS Architecture

ONOS architecture is strictly segmented into a protocol-agnostic system core tier and the protocol-aware providers tier as shown in the figure below:

[![ONOS architecture tiers](http://sungsoo.github.com/images/onos-tiers.png)](http://sungsoo.github.com/images/onos-tiers.png)

The ONOS core is responsible for tracking information about the network environment and distributing it to the applications either synchronously via query or asynchronously via listener callbacks. The core is also responsible for persisting select state and synchronizing state among the cluster peers.

The protocol-aware providers are responsible for interacting with the network environment using various control and configuration protocols and supplying such sensory data to the core. Some providers may also need to accept control edicts from the core and apply them to the environment using the appropriate protocol-specific means.

The figure below provides a visual inventory of the various ONOS subsystems. The ones with the gray outline represent either work in progress features planned for release in 2015.


[![ONOS architecture tiers](http://sungsoo.github.com/images/onos-subsystems.png)](http://sungsoo.github.com/images/onos-subsystems.png)

The following diagram describes the general structure of each ONOS subsystem: 

[![ONOS subsystem structure](http://sungsoo.github.com/images/onos-subsystem.png)](http://sungsoo.github.com/images/onos-subsystem.png)

For example, the device-subsystem comprises of a core {@link org.onosproject.net.device.impl.DeviceManager}, which exposes a north-bound {@link org.onosproject.net.device.DeviceService} through which applications or other core components can learn about the global infrastructure device inventory and through which they can also subscribe for asynchronous {@link org.onosproject.net.device.DeviceEvent} notifications via the {@link org.onosproject.net.device.DeviceListener} mechanism. A set of administrative actions can be performed via {@link org.onosproject.net.device.DeviceAdminService}, e.g. setting mastership role, removing a decommissioned device.

On the south-bound side, the core {@link org.onosproject.net.device.impl.DeviceManager} exposes a {@link org.onosproject.net.device.DeviceProviderRegistry} through which any number of {@link org.onosproject.net.device.DeviceProvider} entities can register and in turn obtain a {@link org.onosproject.net.device.DeviceProviderService}. Device and port information can then be supplied to the core by each provider through the provider service issued to them. When a provider unregisters, its {@link org.onosproject.net.device.DeviceProviderService} will be invalidated and can no longer be used for interacting with the core.

Within the core, the tasks of indexing, persisting and synchronizing the global device and port state with the cluster peers falls on the {@link org.onosproject.net.device.DeviceStore}.

Similar structure applies to the link subsystem, host subsystem and others.
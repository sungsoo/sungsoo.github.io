---
layout: post
title: Open Daylight Technical Overview 
date: 2015-06-24
categories: [computer science]
tags: [big data]

---

# Open Daylight Technical Overview

*Software Defined Networking (SDN)* separates the control plane from the
data plane within the network, allowing the intelligence and state of
the network to be managed centrally while abstracting the complexity of
the underlying physical network. Great strides have been made within the
industry toward this goal with standardized protocols such as OpenFlow.
However, greater collaboration leveraging open source development best
practices will significantly accelerate real, deployable solutions for
the industry at large. Similarly, by evolving network services from an
appliance model to one that leverages virtual compute, storage, and
networking, Network Functions Virtualization (NFV) promises to
drastically improve both the agility of when and where to run network
functions as well as the cost structure of doing so.

SDN and NFV are a new way of deploying network infrastructure. A
software-defined network adapts to the requirements of applications
deployed on the network. Current generation networks and architectures
are statically configured and vertically integrated. New generation
applications such as Hadoop, video delivery, and virtualized network
functions require networks to be agile and to flexibly adapt to
application requirements.

From a high level view, software defined networking is commonly
described in layers.

[![](http://sungsoo.github.com/images/odp_diagram_helium.jpg)](http://sungsoo.github.com/images/odp_diagram_helium.jpg)

**Network Apps & Orchestration:** The top layer consists of business and
network logic applications that control and monitor network behavior. In
addition, more complex solution orchestration applications needed for
cloud and NFV thread services together and engineer network traffic in
accordance with the needs of those environments.

**Controller Platform:** The middle layer is the framework in which the
SDN abstractions can manifest, providing a set of common APIs to the
application layer (commonly referred to as the northbound interface)
while implementing one or more protocols for command and control of the
physical hardware within the network (typically referred to as the
southbound interface).

**Physical & Virtual Network Devices:** The bottom layer consists of the
physical & virtual devices, switches, routers, etc., that make up the
connective fabric between all endpoints within the network.

OpenDaylight is an open source project with a modular, pluggable, and
flexible controller platform at its core. This controller is implemented
strictly in software and is contained within its own Java Virtual
Machine (JVM). As such, it can be deployed on any hardware and operating
system platform that supports Java.

The controller exposes open northbound APIs which are used by
applications. OpenDaylight supports the OSGi framework and bidirectional
REST for the northbound API. The OSGi framework is used for applications
that will run in the same address space as the controller while the REST
(web based) API is used for applications that do not run in the same
address space (or even necessarily on the same machine) as the
controller. The business logic and algorithms reside in the
applications. These applications use the controller to gather network
intelligence, run algorithms to perform analytics, and then use the
controller to orchestrate the new rules, if any, throughout the network.

The controller platform itself contains a collection of dynamically
pluggable modules to perform needed network tasks. There are a series of
base network services for such tasks as understanding what devices are
contained within the network and the capabilities of each, statistics
gathering, etc. In addition, platform oriented services and other
extensions can also be inserted into the controller platform for
enhanced SDN functionality.

The southbound interface is capable of supporting multiple protocols (as
separate plugins), e.g. OpenFlow 1.0, OpenFlow 1.3, BGP-LS, etc. These
modules are dynamically linked into a Service Abstraction Layer (SAL).
The SAL exposes device services to which the modules north of it are
written. The SAL determines how to fulfill the requested service
irrespective of the underlying protocol used between the controller and
the network devices.

The OpenDaylight Project is ever evolving based on the contributions of
its developer community. For additional documentation on the different
components that make up the OpenDaylight project, please visit the
[Developer Wiki](http://wiki.opendaylight.org).

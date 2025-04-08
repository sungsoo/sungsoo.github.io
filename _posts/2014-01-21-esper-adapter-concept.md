---
layout: post
title: Esper Adapter Concept
date: 2014-01-21
categories: [computer science]
tags: [big data]

---


Adapter Overview
---

Input and output adapters to Esper provide the means of accepting *events* from *various* sources, and for making available events to destinations.

The following input and output adapters exist. 

<div class="table"><a name="adapter-available"></a><p class="title"><b>Table&nbsp;1.1.&nbsp;Input and Output Adapters</b></p><table summary="Input and Output Adapters" border="1"><colgroup><col><col></colgroup><thead><tr><th>Adapter</th><th>Description</th></tr></thead><tbody><tr><td>CSV Input Adapter</td><td><p>
							The CSV input adapter can read one or more CSV-formatted input sources, transform the textual values into events, and play the events into the engine. The adapter also makes it possible to run complete simulations of events arriving in time-order from different input streams.
						</p></td></tr><tr><td>Spring JMS Input and Output Adapter</td><td><p>
							JMS adapters based on the JmsTemplate offered by Spring 2. Provides unmarshalling of JMS <tt class="literal">javax.jms.Message</tt> messages for sending into an engine instance, and marshaling of <tt class="literal">com.espertech.esper.client.EventBean</tt> events into JMS messages.
						</p></td></tr><tr><td>Opentick Input Adapter</td><td><p>
							The opentick input adapter receives real-time stock market data from opentick corporation's API. Please see <tt class="literal">http://www.opentick.com</tt> for more information. Opentick license, copyright and trademark are properties of opentick corporation.
						</p></td></tr></tbody></table>


Adapter Library Classes
---

### The Adapter Interface
The Adapter interface allows client applications to control the *state* of an input and output adapter. It provides *state transition methods* that each input and output adapter implements.

An input or output adapter is always in one of the following states:

* **Opened** - The begin state; The adapter is *not generating* or *accepting* events in this state  
* **Started** - When the adapter is *active*, generating and accepting events  
* **Paused** - When operation of the adapter is *suspended*
* **Destroyed** 

The state transition table below outlines adapter states and, for each state, the *valid state transitions*.

<div class="table"><a name="adapter-states"></a><p class="title"><b>Table&nbsp;1.2.&nbsp;Adapter State Transitions</b></p><table summary="Adapter State Transitions" border="1"><colgroup><col><col><col></colgroup><thead><tr><th>Start State</th><th>Method</th><th>Next State</th></tr></thead><tbody><tr><td>Opened</td><td>start()</td><td>Started</td></tr><tr><td>Opened</td><td>destroy()</td><td>Destroyed</td></tr><tr><td>Started</td><td>stop()</td><td>Opened</td></tr><tr><td>Started</td><td>pause()</td><td>Paused</td></tr><tr><td>Started</td><td>destroy()</td><td>Destroyed</td></tr><tr><td>Paused</td><td>resume()</td><td>Started</td></tr><tr><td>Paused</td><td>stop()</td><td>Opened</td></tr><tr><td>Paused</td><td>destroy()</td><td>Destroyed</td></tr></tbody></table>
    
### Using AdapterInputSource

The `com.espertech.esperio.AdapterInputSource` encapsulates information about an input source. *Input adapters* use the `AdapterInputSource` to determine how to read input. The class provides constructors for use with different input sources.

* `java.io.Reader` to read character streams  
* `java.io.InputStream` to read byte streams  
* `java.net.URL`  
* Classpath resource by name  
* `java.io.File` 

Adapters resolve Classpath resources in the following order:

* Current thread classloader via `Thread.currentThread().getContextClassLoader().getResourceAsStream`  
* If the resource is not found: `AdapterInputSource.class.getResourceAsStream`  
* If the resource is not found: `AdapterInputSource.class.getClassLoader().getResourceAsStream`

References
---
[1] [EsperIO Adapters](http://esper.codehaus.org/esperio-4.0.0/doc/reference/en/html_single/index.html#adapter_overview), *EsperIO Reference Documentation 4.0.0*, 2009.
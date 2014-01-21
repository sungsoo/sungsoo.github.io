---
layout: post
title: Esper Adapter Concept
date: 2014-01-21
categories: [computer science]
tags: [stream computing]

---


Adapter Overview
---

Input and output adapters to Esper provide the means of accepting events from various sources, and for making available events to destinations.

The following input and output adapters exist: 

<div class="table"><a name="adapter-available"></a><p class="title"><b>Table&nbsp;1.1.&nbsp;Input and Output Adapters</b></p><table summary="Input and Output Adapters" border="1"><colgroup><col><col></colgroup><thead><tr><th>Adapter</th><th>Description</th></tr></thead><tbody><tr><td>CSV Input Adapter</td><td><p>
							The CSV input adapter can read one or more CSV-formatted input sources, transform the textual values into events, and play the events into the engine. The adapter also makes it possible to run complete simulations of events arriving in time-order from different input streams.
						</p></td></tr><tr><td>Spring JMS Input and Output Adapter</td><td><p>
							JMS adapters based on the JmsTemplate offered by Spring 2. Provides unmarshalling of JMS <tt class="literal">javax.jms.Message</tt> messages for sending into an engine instance, and marshaling of <tt class="literal">com.espertech.esper.client.EventBean</tt> events into JMS messages.
						</p></td></tr><tr><td>Opentick Input Adapter</td><td><p>
							The opentick input adapter receives real-time stock market data from opentick corporation's API. Please see <tt class="literal">http://www.opentick.com</tt> for more information. Opentick license, copyright and trademark are properties of opentick corporation.
						</p></td></tr></tbody></table>


Adapter Library Classes
---


References
---
[1] [EsperIO Adapters](http://esper.codehaus.org/esperio-4.0.0/doc/reference/en/html_single/index.html#adapter_overview), *EsperIO Reference Documentation 4.0.0*, 2009.
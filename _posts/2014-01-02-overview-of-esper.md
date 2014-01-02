---
layout: post
title: Introduction to Esper for Java 
date: 2014-01-02
categories: [computer science]
tags: [stream computing, developments]

---

### Overview of Esper


* A Java/.NET library for complex event processing  
	- Stream based  
	- Our examples are from the Java version 
	
* Processes complex queries written in a language called EPL (event processing language)  
– Uses DBMS, DSMS and CEP concepts  

* The code is available at esper.codehaus.org
* Tutorial(s), code examples  
* Open source* Can be used in several data stream and CEP applications### Achitecture Overview
* The main elements in the Esper architecture resemble any DSMS/CEP system  
	- Input data is processed by one or more queries

#### CEP Architecture
![](http://sungsoo.github.com/images/cep-architecture.png)

#### Esper Architecture	
![](http://sungsoo.github.com/images/esper-architecture.png)

### Data Model

* **A data stream of event objects**  
	- Attributes that are defined with types and values  
		* String, boolean, integer, long, float, byte, ...
		* One needs to write a method that converts to event objects from the data stream or file  
	- Represented as Java objects

* **Stream types**
	- Input stream: `istream`		* All the new events arriving, and entering a data window or aggregation
		* The default stream type
	- Remove stream: `rstream`
		* All the old events leaving a data window or aggregation
	- Both: `irstream`
	
	
### Event Declaration

The event objects can be declared by 

* Schema	* `create schema schema_name [as] (property_name property_type [,property_name property_type [,...]) [inherits inherited_event_type[, inherited_event_type] [,...]]`
	* XML
	* Events can be represented as org.w3c.dom.Node instances  

```
	<?xml version="1.0" encoding="UTF-8"?> <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">	<xs:element name="Sensor"> 
		<xs:complexType>			<xs:sequence>				<xs:element name="ID" type="xs:string"/> 
				<xs:element ref="Observation" />			</xs:sequence> 
		</xs:complexType>	</xs:element> 
	...```

* Code

```	package org.myapp.event;
	public class OrderEvent {
		private String itemName;
		private double price;
		
		public OrderEvent(String itemName, double price) {
			this.itemName = itemName;
			this.price = price;
		}
		       public String getItemName() {
          return itemName;
       }          public double getPrice() {              return price;
       } 
	}
```
* Many other types	* E.g. `java.util.Map`
	
### Creating Events
* Create a new event object and send the object to the event processor runtime:
```	OrderEvent event = new OrderEvent("shirt", 74.50);       	epService.getEPRuntime().sendEvent(event);```### Windows
* In Esper a window is called a view
* Provides many types of windows/views
	* some examples:![](http://sungsoo.github.com/images/esper-windows.png)
![](http://sungsoo.github.com/images/esper-windows-example.png)
### Timestamps and Time Specficiation
* Implicit timing
	* Esper uses the system clock 
* Explicit timing
	* Can use the timestamps on the data in the data stream
* Defines time periods in the queries

```
	time-period : [day-part] [hour-part] [minute-part] [seconds-part] [milliseconds- part]	day-part : (number|variable_name) ("days" | "day")	hour-part : (number|variable_name) ("hours" | "hour")	minute-part : (number|variable_name) ("minutes" | "minute" | "min") seconds-part : (number|  
	variable_name) ("seconds" | "second" | "sec")   
	milliseconds-part : (number|variable_name)("milliseconds" | "millisecond" | "msec“)
```

### Aggregations

* The aggregate functions are `sum, avg, count, max, min, median, stddev, and avedev`

* For example, to find out the total price for all stock tick events in the last 30 seconds```select sum(price) from StockTickEvent.win:time(30 sec)
```* Supports group-by and having

### Output Defintions

* Optional	* control or stabilize the rate at which events are output and to suppress output events	* Examples
	```	select sum(price) from OrderEvent.win:time(30 min) output snapshot every 60 seconds	select * from StockTickEvent.win:time(30 sec) output every 5 events	select * from StockTickEvent.win:length(5) output every 1.5 minutes
```

### Esper Syntax for Data Stream Management

* Basic SQL-inspired queries for data stream management called EPL

```	[insert into insert_into_def]
	select select_list 
	from stream_def [as name] [, stream_def [as name]] [,...] [where search_conditions]
	[group by grouping_expression_list]
	[having grouping_search_conditions]
	[output output_specification]
	[order by order_by_expression_list]
	[limit num_rows]
```* DBMS support for joins between databases and data streams
	* Historical queries	* Additional information
		* E.g. location of a sensor
### Patterns for Complex Event Processing
* Extends Esper beyond windows and aggregations (DSMS features)
* Uses atoms, e.g. expressions
* Operators
	* Control pattern sub-expression repetition: every, every-distinct, [num] and until
	* Logical operators: and, or, not
	* Temporal operators that operate on event order: -> (followed-by)
	* Guards control the lifecycle of sub-expressions, e.g. timer:within, timer:withinmax and while-expression.
		* Custom plug-in guards may also be used. 

* Example of patterns

```
	select a.custId, sum(a.price + b.price)	from pattern [every a=ServiceOrder ->	b=ProductOrder(custId = a.custId) where timer:within(1 min)].win:time(2 hour) where a.name in ('Repair', b.name)	group by a.custId	having sum(a.price + b.price) > 100```
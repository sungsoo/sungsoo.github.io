---
layout: post
title: Introduction to Esper for Java 
date: 2014-01-02
categories: [computer science]
tags: [big data]

---

### Overview of Esper


* A Java/.NET library for complex event processing  
	- Stream based  
	- Our examples are from the Java version 
	
* Processes complex queries written in a language called EPL (event processing language)  
– Uses DBMS, DSMS and CEP concepts  

* The code is available at esper.codehaus.org
* Tutorial(s), code examples  
* Open source
* Can be used in several data stream and CEP applications

### Achitecture Overview

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
	- Input stream: `istream`
		* All the new events arriving, and entering a data window or aggregation
		* The default stream type
	- Remove stream: `rstream`
		* All the old events leaving a data window or aggregation
	- Both: `irstream`
	
	
### Event Declaration

The event objects can be declared by 

* Schema
	* `create schema schema_name [as] (property_name property_type [,property_name property_type [,...]) [inherits inherited_event_type[, inherited_event_type] [,...]]`

	
* XML
	* Events can be represented as org.w3c.dom.Node instances  

```
	<?xml version="1.0" encoding="UTF-8"?> <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xs:element name="Sensor"> 
		<xs:complexType>
			<xs:sequence>
				<xs:element name="ID" type="xs:string"/> 
				<xs:element ref="Observation" />
			</xs:sequence> 
		</xs:complexType>
	</xs:element> 

	...
```

* Code

```
	package org.myapp.event;
	public class OrderEvent {
		private String itemName;
		private double price;
		
		public OrderEvent(String itemName, double price) {
			this.itemName = itemName;
			this.price = price;
		}
		
       public String getItemName() {
          return itemName;
       }
          public double getPrice() {
              return price;
       } 
	}
```

* Many other types
	* E.g. `java.util.Map`

	

### Creating Events


* Create a new event object and send the object to the event processor runtime:

```
	OrderEvent event = new OrderEvent("shirt", 74.50);       
	epService.getEPRuntime().sendEvent(event);
```

### Windows


* In Esper a window is called a view

* Provides many types of windows/views

	* some examples:

![](http://sungsoo.github.com/images/esper-windows.png)

![](http://sungsoo.github.com/images/esper-windows-example.png)


### Timestamps and Time Specficiation


* Implicit timing
	* Esper uses the system clock 
* Explicit timing
	* Can use the timestamps on the data in the data stream
* Defines time periods in the queries

```
	time-period : [day-part] [hour-part] [minute-part] [seconds-part] [milliseconds- part]
	day-part : (number|variable_name) ("days" | "day")
	hour-part : (number|variable_name) ("hours" | "hour")
	minute-part : (number|variable_name) ("minutes" | "minute" | "min") seconds-part : (number|  
	variable_name) ("seconds" | "second" | "sec")   
	milliseconds-part : (number|variable_name)("milliseconds" | "millisecond" | "msec“)
```

### Aggregations


* The aggregate functions are `sum, avg, count, max, min, median, stddev, and avedev`

* For example, to find out the total price for all stock tick events in the last 30 seconds

```
select sum(price) from StockTickEvent.win:time(30 sec)
```

* Supports group-by and having

### Output Defintions

* Optional
	* control or stabilize the rate at which events are output and to suppress output events
	* Examples
	
```
	select sum(price) from OrderEvent.win:time(30 min) output snapshot every 60 seconds
	select * from StockTickEvent.win:time(30 sec) output every 5 events
	select * from StockTickEvent.win:length(5) output every 1.5 minutes
```

### Esper Syntax for Data Stream Management

* Basic SQL-inspired queries for data stream management called EPL

```
	[insert into insert_into_def]
	select select_list 
	from stream_def [as name] [, stream_def [as name]] [,...] [where search_conditions]
	[group by grouping_expression_list]
	[having grouping_search_conditions]
	[output output_specification]
	[order by order_by_expression_list]
	[limit num_rows]
```

* DBMS support for joins between databases and data streams
	* Historical queries
	* Additional information
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
	select a.custId, sum(a.price + b.price)
	from pattern [every a=ServiceOrder ->
	b=ProductOrder(custId = a.custId) where timer:within(1 min)].win:time(2 hour) where a.name in ('Repair', b.name)
	group by a.custId
	having sum(a.price + b.price) > 100
```

### Esper Sample Program

![](http://sungsoo.github.com/images/esper-sample.png)

#### Event Class: SampleEvent.java
Event를 저장하는 POJO class를 생성

```
package com.jopenbusiness.hadoop.esper.event;

public class SampleEvent {
	private String item = null;
	private Double price = null;
	
	public SampleEvent(String item, Double price) {
		super();
		this.item = item; 
		this.price = price;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
}
```

#### Event Listener Class: SampleListener.java
EPL (Event Processing Engine)에서 정의된 조건을 만족할 때, 처리하는 프로그램

```
package com.jopenbusiness.hadoop.esper.listener;

import com.espertech.esper.client.EventBean;
import com.espertech.esper.client.UpdateListener;

public class SampleListener implements UpdateListener {
	public void update(EventBean[] newEvents, EventBean[] oldEvents) {
		EventBean event = null;
		
		event = newEvents[0];
		System.out.println(event.get("item") + " : 갯수 = " + event.get("count(*)") + ", 평균 = " + event.get("avg(price)"));
	}
}
```

#### Engine/Main Class: SampleEngine.java

```
package com.jopenbusiness.hadoop.esper.cli;

import com.espertech.esper.client.Configuration;
import com.espertech.esper.client.EPRuntime;
import com.espertech.esper.client.EPServiceProvider;
import com.espertech.esper.client.EPServiceProviderManager;
import com.espertech.esper.client.EPStatement;
import com.jopenbusiness.hadoop.esper.event.SampleEvent;
import com.jopenbusiness.hadoop.esper.listener.SampleListener;

public class SampleEngine {
	public static void main(String[] args) {
		Configuration config = null;
		EPServiceProvider service = null;
		EPStatement stat = null;
		String epl = null;
		SampleListener listener = null;
		EPRuntime runtime = null;
		
		//---	처리할 Event를 등록하여 Esper용 서비스를 생성 합니다.
		config = new Configuration();
		config.addEventType("SampleEvent", SampleEvent.class.getName());
		service = EPServiceProviderManager.getDefaultProvider(config);
		
		//---	EPL(Event Processing Language)을 사용하여 Statement를 생성 합니다.
		//---	지난 3초 동안 발생한 이벤트로 전체 갯수와 가격 평균을 구합니다. 
		epl = "select item, count(*), avg(price) from SampleEvent.win:time(3 sec)";
		stat = service.getEPAdministrator().createEPL(epl);
				
		listener = new SampleListener();
		stat.addListener(listener);
		
		//---	Event를 발생시켜 봅니다.
		runtime = service.getEPRuntime();
		for (int i = 0;i < 20; i++) {
			runtime.sendEvent(new SampleEvent("aaa_" + i, 10.0 * i));
			try {
				Thread.sleep(300);
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}
	}
}
```

#### SampleEngine.java 프로그램 실행 결과

3초간 발생한 이벤트의 갯수와 평균을 출력 합니다.

```
    [java] aaa_0 : 갯수 = 1, 평균 = 0.0
    [java] aaa_1 : 갯수 = 2, 평균 = 5.0
    [java] aaa_2 : 갯수 = 3, 평균 = 10.0
    [java] aaa_3 : 갯수 = 4, 평균 = 15.0
    [java] aaa_4 : 갯수 = 5, 평균 = 20.0
    [java] aaa_5 : 갯수 = 6, 평균 = 25.0
    [java] aaa_6 : 갯수 = 7, 평균 = 30.0
    [java] aaa_7 : 갯수 = 8, 평균 = 35.0
    [java] aaa_8 : 갯수 = 9, 평균 = 40.0
    [java] aaa_9 : 갯수 = 10, 평균 = 45.0
    [java] aaa_10 : 갯수 = 11, 평균 = 50.0
    [java] aaa_11 : 갯수 = 10, 평균 = 65.0
    [java] aaa_12 : 갯수 = 10, 평균 = 75.0
    [java] aaa_13 : 갯수 = 10, 평균 = 85.0
    [java] aaa_14 : 갯수 = 10, 평균 = 95.0
    [java] aaa_15 : 갯수 = 10, 평균 = 105.0
    [java] aaa_16 : 갯수 = 10, 평균 = 115.0
    [java] aaa_17 : 갯수 = 10, 평균 = 125.0
    [java] aaa_18 : 갯수 = 10, 평균 = 135.0
    [java] aaa_19 : 갯수 = 10, 평균 = 145.0
Total time: 8 seconds
```

### Development Tips

#### Configuration Files
**설정 파일**

* vi config/esper.default.cfg.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<esper-configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://www.espertech.com/schema/esper"
    xsi:noNamespaceSchemaLocation="esper-configuration-4-0.xsd"> 
	<event-type-auto-name package-name="com.jopenbusiness.hadoop.esper.event"/>
	<event-type name="ServiceEvent" class="com.jopenbusiness.hadoop.esper.event.ServiceEvent"/>
</esper-configuration>
```

* 프로그램에서 설정 적용

```
Configuration config = null;
EPServiceProvider service = null;

config = new Configuration();
config.configure(new File("~/config/esper.default.cfg.xml"));
service = EPServiceProviderManager.getProvider(ENGINE_URI, config);
```




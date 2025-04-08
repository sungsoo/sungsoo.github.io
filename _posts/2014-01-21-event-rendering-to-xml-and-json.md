---
layout: post
title: Event Rendering to XML and JSON
date: 2014-01-21
categories: [computer science]
tags: [stream computing, developments]

---

Event Rendering to XML and JSON
---

Your application may use the **built-in XML** and **JSON formatters** to render output events into a readable textual format, such as for integration or debugging purposes. This article introduces the *utility classes* in the client util package for rendering events to strings. Further API information can be found in the JavaDocs.

The `EventRenderer` interface accessible from the *runtime interface* via the `getEventRenderer` method provides access to JSON and XML rendering. For repeated rendering of events of the same event type or subtypes, it is recommended to obtain a `JSONEventRenderer` or `XMLEventRenderer` instance and use the render method provided by the interface. This allows the renderer implementations to cache event type metadata for fast rendering.

In this example we show how one may obtain a renderer for repeated rendering of events of the same type, assuming that statement is an instance of **EPStatement**:

```java
JSONEventRenderer jsonRenderer = epService.getEPRuntime().
    getEventRenderer().getJSONRenderer(statement.getEventType());
```

Assuming that *event* is an instance of **EventBean**, this code snippet renders an event into the JSON format:

```java
￼String jsonEventText = jsonRenderer.render("MyEvent", event);
```

The *XML renderer* works the same:  

```java
XMLEventRenderer xmlRenderer = epService.getEPRuntime().
    getEventRenderer().getXMLRenderer(statement.getEventType());
```
...and...


```java
String xmlEventText = xmlRenderer.render("MyEvent", event);
```

If the event type is not known in advance or if you application does not want to obtain a renderer instance per event type for *fast rendering*, your application can use one of the following methods to render an event to a XML or JSON textual format:

```java
String json = epService.getEPRuntime().getEventRenderer().renderJSON(event);
String xml = epService.getEPRuntime().getEventRenderer().renderXML(event);
```

Use the `JSONRenderingOptions` or `XMLRenderingOptions` classes to control how events are rendered. To render specific event properties using a custom event property renderer, specify an `EventPropertyRenderer` as part of the options that renders event property values to strings. Please see the JavaDoc documentation for more information.

JSON Event Rendering Conventions and Options
---
The JSON renderer produces JSON text according to the standard documented at http://www.json.org.

The renderer formats simple properties as well as *nested* properties and *indexed* properties according to the JSON string encoding, array encoding and nested object encoding requirements.

The renderer does render *indexed properties*, it does not render indexed properties that require an index, i.e. if your event representation is backed by *POJO objects* and your getter method is `getValue(int index)`, the indexed property values are not part of the JSON text. This is because the implementation has no way to determine how many index keys there are. A workaround is to have a method such as `Object[] getValue()` instead.

The same is true for mapped properties that the renderer also renders. If a property requires a **Map** key for access, i.e. your getter method is `getValue(String key)`, such property values are not part of the result text as there is no way for the implementation to determine the key set.


XML Event Rendering Conventions and Options
---
The XML renderer produces well-formed XML text according to the XML standard.  
The renderer can be configured to format simple properties as *attributes* or as *elements*. *Nested properties* and *indexed properties* are always represented as XML sub-elements to the root or parent element.  
The root element name provided to the XML renderer must be the element name of the root in the XML document and may include namespace instructions.
The renderer does render indexed properties, it does not render indexed properties that require an index, i.e. if your event representation is backed by POJO objects and your getter method is `getValue(int index)`, the indexed property values are not part of the XML text. This is because the implementation has no way to determine how many index keys there are. A workaround is to have a method such as `Object[] getValue()` instead.  
The same is true for mapped properties that the renderer also renders. If a property requires a **Map** key for access, i.e. your getter method is `getValue(String key)`, such property values are not part of the result text as there is no way for the implementation to determine the key set.


References
---
[1] *Esper Reference*, Version 4.11.0, Esper Team and EsperTech Inc., 2014.




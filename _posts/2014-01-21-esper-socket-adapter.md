---
layout: post
title: Esper Socket Adapter
date: 2014-01-21
categories: [computer science]
tags: [big data]

---

The Socket Adapter
---

This article discusses the EsperIO Socket adapter.  
The **EsperIO Socket input adapter** can be used to send events into an Esper engine instance via *socket client*, either as **Java objects** or as **CSV name-value pair strings**.


Getting Started
---
You may configure the EsperIO Socket adapter either as part of your **Esper configuration file** in the *plugin loader section* or via *the adapter API*. Add the **esperio-socket-version.jar** file to your classpath. There are no other dependent jar files required.

A sample adapter configuration file is provided in <tt class="literal">esperio-socket-sample-config.xml</tt> in the etc folder of the distribution. A configuration file must be valid according to schema <tt class="literal">esperio-socket-configuration-4-0.xsd</tt>.

Plugin Loader Configuration
---

You may place the configuration XML directly into your **Esper configuration file** as the example below shows.

```xml
<esper-configuration>
  <plugin-loader name="EsperIOSocketAdapter" 
      class-name="com.espertech.esperio.socket.EsperIOSocketAdapterPlugin">
    <config-xml>	
      <esperio-socket-configuration>
	    <socket name="mysocketOne" port="7101" data="object"/>
	    <socket name="mysocketTwo" port="7102" data="csv"/>
      </esperio-socket-configuration>
    </config-xml>
  </plugin-loader>
</esper-configuration>
```

Alternatively you can provide a **URL** in the Esper configuration file to point to your adapter configuration file.

```xml
<esper-configuration>
  <plugin-loader name="EsperIOSocketAdapter" 
      class-name="com.espertech.esperio.socket.EsperIOSocketAdapterPlugin">
      <init-arg name="esperio.socket.configuration.file" 
          value="file:/path/esperio-socket-sample-config.xml" />
  </plugin-loader>
</esper-configuration>
```

Configuration and Starting via API
----

If using Spring or if your application requires API access, the following code snippet configures and starts the adapter via API.

The class for configuring an EsperIO Socket adapter is `com.espertech.esperio.socket.config.ConfigurationSocketAdapter`. The adapter class itself is `EsperIOSocketAdapter`.

The code snippet below is a sample that configures using *driver manager* and starts the adapter via API.

```java
ConfigurationSocketAdapter adapterConfig = new ConfigurationSocketAdapter();

SocketConfig socket = new SocketConfig();
socket.setDataType(DataType.CSV);
socket.setPort(port);
adapterConfig.getSockets().put("SocketService", socket);

// start adapter
EsperIOSocketAdapter socketAdapter = new EsperIOSocketAdapter(adapterConfig, "engineURI");
socketAdapter.start();

// destroy the adapter when done
socketAdapter.destroy();
```

Socket Service
---

Add a socket configuration for each unique port that you want to expose a *socket receive service* for use by socket client connections.

The synopsis is as follows.

```xml
<esperio-socket-configuration>
  <socket name="[name]" port="[port]" data="[csv|object]"/>
</esperio-socket-configuration>
```

The required **name** attribute provides the *name* of the socket service for use in logging.

The required **port** attribute provides the *port* that the socket service accepts client connections.

The required **data** attribute specifies whether the data arriving through the socket is formatted as a *Java binary object stream* or as *CSV string values*.

If configuring via the **adapter API** or **Spring**, use the `com.espertech.esperio.socket.config.SocketConfig class`.

Object Data Format
---
When sending events as Java objects, configure the **data** attribute value to **object** and use `ObjectOutputStream` to write events to the client socket. When sending a `java.util.Map` event, your Map must contain a String value for the key **stream** which must denote a configured Map event type.

This example XML configures a socket accepting client connections that provide Java objects.

```xml
<esperio-socket-configuration>
  <socket name="objectStreamSocket" port="8079" data="object"/>
</esperio-socket-configuration>
```

When **object** data type is configured, clients connections are expected to send `java.io.Serializable` or `java.io.Externalizable` objects using `ObjectOutputStream`.

Below is a block of sample code that for use in clients to the adapter. It assumes the `MyEvent` class implements either of the above interfaces.

```java
// connect first
Socket requestSocket = new Socket("localhost", port);
ObjectOutputStream out = new ObjectOutputStream(requestSocket.getOutputStream());

// send a few events, here we send only one
out.writeObject(new MyEvent("Hello World"));
out.flush();

// close when done
out.close();
requestSocket.close();
```

String CSV Data Format
---

When sending events as CSV strings, the format of the string should be

```
stream=[type],[name]=[value] [,...] (newline)
```

The CSV string must end with a *newline character*: Each event is one line. Each CSV element must be in the **[name]=[value]** format. Your CSV must contain a value for stream which must denote a configured event type. The adapter parses each string value and populates an instance of the target type.

This next example XML configures a socket accepting client connections that provide events as CSV-formatted strings with name-value pairs :

```xml
<esperio-socket-configuration>
  <socket name="csvStreamSocket" port="8079" data="csv"/>
</esperio-socket-configuration>
```

A piece of client code that sends an event of type **MyEvent** may look as follows:


```java
// connect first
String newline = System.getProperty("line.separator");
Socket requestSocket = new Socket("localhost", port);
BufferedWriter wr = new BufferedWriter(
    new OutputStreamWriter(socket.getOutputStream()));

// send a few events
wr.write("stream=MyEvent,price=20.d,upcCode=A0001");
wr.write(newline);
wr.flush();

// close when done
wr.close();
requestSocket.close();
```

Note that if your target type is a *Java object event*, your event class must provide *setter-methods* according to **JavaBean** conventions. The event class should also provide a default constructor taking no parameters. If your event class does not have a default constructor, your application may configure a *factory* method via `ConfigurationEventTypeLegacy`.


References
---
[1] [EsperIO Adapters](http://esper.codehaus.org/esperio-4.0.0/doc/reference/en/html_single/index.html#adapter_overview), *EsperIO Reference Documentation 4.0.0*, 2009.
































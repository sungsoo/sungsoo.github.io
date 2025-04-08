---
layout: post
title: Esper Relational Database Adapter
date: 2014-01-22
categories: [computer science]
tags: [stream computing, developments]

---

This article discusses the EsperIO adapter for relational databases.

Adapter Overview
---

The EsperIO relational database adapter can write events to a database table.

If your application only reads from tables, the Esper jar file and Esper configuration suffices and there is no additional **EsperIO DB adapter configuration** or jar file required. Please see below tips for *reading* or *polling* tables.  

The EsperIO DB adapter supports two means to write to a database table:  

1. Execute a **SQL DML** (Data Manipulation, i.e. Update, Insert, Delete or stored procedure call) statement as a response to a triggering event.  

2. Execute an **Update-Insert**: The adapter attempts an Update of a row by key and if unsuccessful (update returns zero rows updated) the adapter performs an Insert.

The adapter also provides infrastructure for queuing database write requests for execution by a thread pool.

Getting Started
---

You may configure the **EsperIO DB adapter** either as part of your *Esper configuration* file in the plugin loader section or via the adapter API. Add the <tt class="literal">esperio-db-version.jar</tt> file to your classpath as well as the JDBC driver. There are not other dependent jar files required by the adapter.  

A sample adapter configuration file is provided in <tt class="literal">esperio-db-sample-config.xml</tt> in the etc folder of the distribution. A configuration file must be valid according to schema <tt class="literal">esperio-db- configuration-4-0.xsd</tt>.


### Plugin Loader Configuration

You may place the configuration XML directly into your Esper configuration file as the example below shows:

```xml
<esper-configuration>
  <plugin-loader name="EsperIODBAdapter"
      class-name="com.espertech.esperio.db.EsperIODBAdapterPlugin">
    <config-xml>
      <esperio-db-configuration>
	  .....as outlined below or contents of esperio-db-sample-config.xml here... 
	  </esperio-db-configuration>
    </config-xml>
  </plugin-loader>
</esper-configuration>
```

￼Alternatively you can provide a URL in the *Esper configuration file* to point to your adapter configuration file:  

```xml
￼￼￼￼<esper-configuration>
  <plugin-loader name="EsperIODBAdapter"
      class-name="com.espertech.esperio.db.EsperIODBAdapterPlugin">
      <init-arg name="esperio.db.configuration.file"
          value="file:/path/esperio-db-sample-config.xml" />
  </plugin-loader>
</esper-configuration>
```

### ￼Configuration and Starting via API

If using Spring or if your application requires API access, the following code snippet configures and starts the adapter via API.  
The class for configuring an EsperIO DB adapter is <tt class="literal">com.espertech.esperio.db.config.ConfigurationDBAdapter</tt>.   
The adapter class itself is <tt class="literal">EsperIODBAdapter</tt>.  
The code snippet below is a sample that configures using driver manager and starts the adapter via API:


```java
￼￼￼￼ConfigurationDBAdapter adapterConfig = new ConfigurationDBAdapter();
ConfigurationDBRef configDB = new ConfigurationDBRef();
configDB.setDriverManagerConnection("DRIVER", "URL", new Properties());
adapterConfig.getJdbcConnections().put("db1", configDB);
// add additional configuration such as DML and Upsert
// start adapter
EsperIODBAdapter dbAdapter = new EsperIODBAdapter(adapterConfig, "engineURI");
dbAdapter.start();
```

JDBC Connections
---

The configuration for the *source* of JDBC connections follows the Esper configuration. Please consult the Esper documentation or *sample adapter configuration file* for details.

￼Your configuration should set <tt class="literal">auto-commit</tt> to true thereby each change to database tables is automatically *committed*.    
The adapter obtains a new connection for each operation and closes the connection after each operation. For optimum performance consider configuring a connection pool.  
A sample JDBC connection configuration is shown in below XML. The API class is <tt class="literal">ConfigurationDBRef</tt> (an Esper core engine class). You may also configure a <tt class="literal">DataSource</tt> or <tt class="literal">DataSource factory</tt> as outlined in the Esper docs.  

```xml
<esperio-db-configuration>
  <jdbc-connection name="db1">
                <drivermanager-connection    class-name="com.mysql.jdbc.Driver"
 url="jdbc:mysql://localhost/test"
        user="root" password="password">
    <connection-settings auto-commit="true" catalog="TEST"/>
  </jdbc-connection>
  <!-- Add DML and Upsert configurations here, as below. -->
</esperio-db-configuration>  
```


Triggered DML Statement Execution
---
This facility allows running a **SQL DML** (*Data Manipulation*) query, i.e. an Update, Insert, Delete query or a stored procedure when an event in a triggering stream occurs.    
Define a <tt class="literal">dml</tt> element in the adapter configuration file (or use the <tt class="literal">DMLQuery</tt> class) for every query to execute.  
The synopsis is as follows:

```xml
￼￼￼￼<dml connection="[connection]" stream="[stream]"
[name="name"] [executor-name="executor"] [retry="count"] [retry-interval-
sec="sec"]>
  <sql>[sql]</sql>
  <bindings>
    <parameter pos="[position]" property="[property_name]"/>
    [...parameters]
  </bindings>
</dml>  
```

￼The *connection* attribute value is required and provides the name of the configured JDBC connection.  
A value for the *stream* attribute is required and provides the name of the stream that triggers the DML. The adapter expects a stream by this name to exist at adapter start time.

￼￼The *name* attribute is optional and is only used for logging errors.  

The *executor-name* attribute is optional. If specified, it must be the name of an executor configuration. If specified, the adapter will use the executor service (queue and thread pool) for performing all DML work. If not specified, the adapter performs the DML work in the same thread.  

The *retry* attribute is optional. If specified, the adapter will retry a given number of times in case an error is encountered. If retry-interval-sec is specified, the adapter waits the given number of seconds between retries.  

The *sql* element is required and provides the SQL DML or stored procedure call to execute, with parameters as question mark (?).  
The *bindings* element is required and provides the bindings for expression parameters.  
The *parameter* element should occur as often as there are parameters in the SQL query. The *position* attribute starts at 1 and counts up for each parameter. The *property* parameter provide the name of the event property of the stream to use as the parameter value.  
A sample DML configuration follows:

```xml
￼￼￼￼<dml connection="db1" stream="InsertToDBStream"
      name="MyInsertQuery" executor-name="queue1" retry="count">
  <sql>insert into MyEventStore(key1, value1, value2) values (?, ?, ?)</sql>
  <bindings>
    <parameter pos="1" property="eventProperty1"/>
    <parameter pos="2" property="eventProperty2"/>
    <parameter pos="3" property="eventProperty3"/>
  </bindings>
</dml>
```

￼Triggered Update-Insert Execution
---

This facility allows running an SQL Update that is followed by an Insert if the Update did not update any rows.  
Define an <tt class="literal">upsert</tt> element in the adapter configuration file (or use the <tt class="literal">UpsertQuery</tt> class) for every update-insert to execute.  
The synopsis is as follows:  

```xml
￼￼￼￼<upsert connection="[connection]" stream="[stream]" table-name="[table]" [name="name"] [executor-name="executor"] [retry="count"] [retry-interval-
sec="sec"]>
  <keys>
<column property="[property_name]" column="[column_name]" type="[sql_type]"/>
￼￼￼￼￼    [...column]
  </keys>
<values>
<column property="[property_name]" column="[column_name]" type="[sql_type]"/>
    [...column]
  </values>
</upsert>
```

￼The *connection* attribute value is required and provides the name of the configured JDBC connection.  

A value for the *stream* attribute is required and provides the name of the stream that triggers the Update-Insert. The adapter expects a stream by this name to exist at adapter start time.

The *table* attribute value is required and provides the database table name.  
The *name* attribute is optional and is only used for logging errors.
The *executor-name* attribute is optional. If specified, it must be the name of an executor configuration. If specified, the adapter will use the executor service (queue and thread pool) for performing all work. If not specified, the adapter performs the work in the same thread.  
The *retry* attribute is optional. If specified, the adapter will retry a given number of times in case an error is encountered. If *retry-interval-sec* is specified, the adapter waits the given number of seconds between retries.  
The *keys* element is required and provides the key columns of the table and the values element provides the list of value columns of the table.  
The *column* element should occur as many as there are key and value columns in the table. The *property* attribute provides the name of the event property, the column attribute provides the database table column name and the type is any of the <tt class="literal">java.sql.Types</tt> names (case ignored).  
A sample Update-Insert configuration follows:

```xml
￼￼￼￼<upsert connection="db1" stream="UpdateInsertDBTableTrigger" name="UpdateInsertSample"
    table-name="MyKeyedTable" executor-name="queue1" retry="3">
  <keys>
    <column property="eventProperty1" column="keyColumn1" type="varchar"/>
    <column property="eventProperty2" column="keyColumn2" type="varchar"/>
  </keys>
  <values>
    <column property="eventProperty3" column="valueColumn1" type="varchar"/>
    <column property="eventProperty4" column="valueColumn2" type="integer"/>
  </values>
</upsert>
```
￼￼￼￼
Executor Configuration
---

Executors are named thread pools and queues that may be assigned to perform DML or update- insert work.    
Define a <tt class="literal">executor</tt> element in the adapter configuration file (or use the <tt class="literal">Executor</tt> class) for every thread pool and queue to declare.  
Upon adapter start, for each executor the adapter starts the given number of threads and an unbound queue.  
The synopsis is as follows:  

```xml
<executors>
  <executor name="[name]" threads="[count]"/>
</executors>
```

The *name* attribute value is required and provides the name of the executor, while the *count* attribute specifies the number of threads for the thread pool.  
An example executor configuration:: 

```xml
<executors>
  <executor name="threadPool1" threads="2"/>
</executors>
``` 

An application can obtain a handle to all thread pools and queues via the Esper engine context:  

```java
ExecutorServices execs = (ExecutorServices)
    provider.getContext().lookup("EsperIODBAdapter/ExecutorServices");
```

Reading and Polling Database Tables
---

Herein we provide sample statements and documentation pointers to use **Esper EPL** for reading from database tables. If only reading and not writing to a database, no configuration or <tt class="literal">EsperIO jar</tt> is file required.  
Please consult the Esper SQL access documentation for more information.  

### Polling and Startup SQL Queries

To execute an SQL query repeatedly, Esper provides the opportunity to join a pattern to an SQL statement. The pattern may provide a single interval or crontab schedule or may also contain multiple schedules or combinations thereof via the pattern or operator.

￼￼The sample query below simply executes every 10 seconds retrieving all rows from table MyTable:

```
￼￼￼￼select * from pattern[every timer:interval(10)], sql:db1 ['select * from MyTable']
```

To perform an incremental query, consider utilizing a variable to parameterize your SQL statement so that only new rows are returned.
      
The next EPL statements create a variable and pass the variable value to the query to poll for new rows only. It assumes the timestamp column in the MyTable table holds long-type millisecond values:  

```java
￼￼￼￼￼// Create a variable to hold the last poll timestamp
create variable long VarLastTimestamp = 0
// Poll every 15 seconds between 8am and 4pm based on variable value
insert into PollStream
select * from pattern[every timer:crontab(*, 8-16, *, *, *, */15)],
  sql:db1 ['select * from MyTable where timestamp > ${VarLastTimestamp}']
// Assign last value to variable
on PollStream set VarLastTimestamp = timestamp
```

￼A sample statement to read a table at startup time is below:

```
￼￼￼￼select * from pattern[timer:interval(0)], sql:db1 ['select * from MyTable']
```

References
---
[1] EsperIO Reference Version 4.6.0, *Esper Team and EsperTech Inc.*, 2012.
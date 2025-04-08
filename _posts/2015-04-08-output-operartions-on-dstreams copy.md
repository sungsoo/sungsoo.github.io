---
layout: post
title: Design Patterns for using foreachRDD
date: 2015-04-08
categories: [computer science]
tags: [big data]

---

## Design Patterns for using foreachRDD 

`dstream.foreachRDD` is a powerful primitive that allows data to sent
out to external systems. However, it is important to understand how to
use this primitive correctly and efficiently. Some of the common
mistakes to avoid are as follows.

Often writing data to external system requires creating a connection
object (e.g. TCP connection to a remote server) and using it to send
data to a remote system. For this purpose, a developer may inadvertently
try creating a connection object at the Spark driver, but try to use it
in a Spark worker to save records in the RDDs. For example (in Scala),

```scala
    dstream.foreachRDD { rdd =>
      val connection = createNewConnection()  // executed at the driver
      rdd.foreach { record =>
        connection.send(record) // executed at the worker
      }
    }

    def sendRecord(rdd):
        connection = createNewConnection()  # executed at the driver
        rdd.foreach(lambda record: connection.send(record))
        connection.close()

    dstream.foreachRDD(sendRecord)
```

This is incorrect as this requires the connection object to be
serialized and sent from the driver to the worker. Such connection
objects are rarely transferrable across machines. This error may
manifest as serialization errors (connection object not serializable),
initialization errors (connection object needs to be initialized at the
workers), etc. The correct solution is to create the connection object
at the worker.

However, this can lead to another common mistake - creating a new
connection for every record. For example,

```scala
    dstream.foreachRDD { rdd =>
      rdd.foreach { record =>
        val connection = createNewConnection()
        connection.send(record)
        connection.close()
      }
    }

    def sendRecord(record):
        connection = createNewConnection()
        connection.send(record)
        connection.close()

    dstream.foreachRDD(lambda rdd: rdd.foreach(sendRecord))
```

Typically, creating a connection object has time and resource overheads.
Therefore, creating and destroying a connection object for each record
can incur unnecessarily high overheads and can significantly reduce the
overall throughput of the system. A better solution is to use
`rdd.foreachPartition` - create a single connection object and send all
the records in a RDD partition using that connection.

```scala
    dstream.foreachRDD { rdd =>
      rdd.foreachPartition { partitionOfRecords =>
        val connection = createNewConnection()
        partitionOfRecords.foreach(record => connection.send(record))
        connection.close()
      }
    }

    def sendPartition(iter):
        connection = createNewConnection()
        for record in iter:
            connection.send(record)
        connection.close()

    dstream.foreachRDD(lambda rdd: rdd.foreachPartition(sendPartition))
```

This amortizes the connection creation overheads over many records.

Finally, this can be further optimized by reusing connection objects
across multiple RDDs/batches. One can maintain a static pool of
connection objects than can be reused as RDDs of multiple batches are
pushed to the external system, thus further reducing the overheads.

```scala
    dstream.foreachRDD { rdd =>
      rdd.foreachPartition { partitionOfRecords =>
        // ConnectionPool is a static, lazily initialized pool of connections
        val connection = ConnectionPool.getConnection()
        partitionOfRecords.foreach(record => connection.send(record))
        ConnectionPool.returnConnection(connection)  // return to the pool for future reuse
      }
    }

    def sendPartition(iter):
        # ConnectionPool is a static, lazily initialized pool of connections
        connection = ConnectionPool.getConnection()
        for record in iter:
            connection.send(record)
        # return to the pool for future reuse
        ConnectionPool.returnConnection(connection)

    dstream.foreachRDD(lambda rdd: rdd.foreachPartition(sendPartition))
```

Note that the connections in the pool should be lazily created on demand
and timed out if not used for a while. This achieves the most efficient
sending of data to external systems.

### Other points to remember: 

-   DStreams are executed lazily by the output operations, just like
    RDDs are lazily executed by RDD actions. Specifically, RDD actions
    inside the DStream output operations force the processing of the
    received data. Hence, if your application does not have any output
    operation, or has output operations like `dstream.foreachRDD()`
    without any RDD action inside them, then nothing will get executed.
    The system will simply receive the data and discard it.

-   By default, output operations are executed one-at-a-time. And they
    are executed in the order they are defined in the application.

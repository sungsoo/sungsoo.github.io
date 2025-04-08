---
layout: post
title: Serialization
date: 2014-08-03
categories: [computer science]
tags: [big data]

---


# Serialization


￼As you work on turning your data into something useful, it will have to pass between various systems and probably be stored in files at various points. These operations all require some kind of serialization, especially since different stages of your processing are likely to require different languages and APIs. When you’re dealing with very large numbers of records, the choices you make about how to represent and store them can have a massive impact on your storage requirements and performance.

## JSON


Though it’s well known to most web developers, **JSON (JavaScript Object Notation)** has only recently emerged as a popular format for data processing. Its biggest advantages are that it maps trivially to existing data structures in most languages and it has a layout that’s restrictive enough to keep the parsing code and schema design simple, but with enough flexibility to express most data in a fairly natural way. Its simplicity does come with some costs, though, especially in storage size. If you’re representing a list of objects mapping keys to values, the most intuitive way would be to use an indexed array of associative arrays. This means that the string for each key is stored inside each object, which involves a large number of duplicated strings when the number of unique keys is small compared to the number of values. There are manual ways around this, of course, especially as the textual representations usually compress well, but many of the other serialization approaches I’ll talk about try to combine the flexibility of JSON with a storage mechanism that’s more space efficient.

## BSON


Originally created by the team behind MongoDB, and still used in its storage engine, the **BSON (Binary JSON)** specification can represent any JSON object in a binary form. Interestingly, the main design goal was not space efficiency, but speed of conversion. A lot of parsing time can be saved during loading and saving by storing integers and doubles in their native binary representations rather than as text strings. There’s also
￼￼native support for types that have no equivalent in JSON, like blobs of raw binary information and dates.

## Thrift

With Thrift, you predefine both the structure of your data objects and the interfaces you’ll be using to interact with them. The system then generates code to serialize and deserialize the data and stub functions that implement the entry points to your interfaces. It generates efficient code for a wide variety of languages, and under the hood offers a lot of choices for the underlying data format without affecting the application layer. It has proven to be a popular IDL (Interface Definition Language) for open source infrastructure projects like Cassandra and HDFS. It can feel a bit overwhelming for smaller teams working on lightweight projects, though. Much like statically-typed languages, using a predefined IDL requires investing some time up front in return for strong documentation, future bug prevention, and performance gains. That makes the choice very dependent on the expected lifetime and number of developers on your project.

## Avro

A newer competitor to Thrift, and also under the Apache umbrella, Avro offers similar functionality but with very different design tradeoffs. You still define a schema for your data and the interfaces you’ll use, but instead of being held separately within each program, the schema is transmitted alongside the data. That makes it possible to write code that can handle arbitrary data structures, rather than only the types that were known when the program was created. This flexibility does come at the cost of space and performance efficiency when encoding and decoding the information. Avro schemas are defined using JSON, which can feel a bit clunky compared to more domain-specific IDLs, though there is experimental support for a more user-friendly format known as [Avro IDL](http://avro.apache.org/docs/1.4.0/idl.html).

## Protocol Buffers


An open sourced version of the system that Google uses internally on most of its projects, the Protocol Buffers stack is an IDL similar to Thrift. One difference is that Thrift includes network client and server code in its generated stubs, whereas *protobuf* limits its scope to pure serialization and deserialization. The biggest differentiator between the two projects is probably their developer base. Though the code is open source, Google is the main contributor and driver for Protocol Buffers, whereas Thrift is more of a classic crowd-sourced project. If your requirements skew towards stability and strong documentation, Protocol Buffers is going to be attractive, whereas if you need a more open, community-based approach, Thrift will be a lot more appealing.

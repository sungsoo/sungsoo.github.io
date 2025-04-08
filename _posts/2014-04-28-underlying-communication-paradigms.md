---
layout: post
title: Underlying Communication Paradigms
date: 2014-04-28
categories: [computer science]
tags: [design patterns, big data]

---

## Article Source
* Title: *DISTRIBUTED SYSTEMS Concepts and Design* Fifth Edition
* Authors: George Coulouris, Jean Dollimore, Tim Kindberg and Gordon Blair

![](http://sungsoo.github.com/images/communication-paradigms.png)



# Underlying communication paradigms


It is clear that the choice of underlying communication paradigm(s) is crucial to the success of an overall system design. Options include:


* using an underlying *interprocess communication* service directly, such as that offered by socket abstractions


* using a *remote invocation* service (such as a request-reply protocol, remote procedure calls or remote method invocation) offering support for client-server interactions

* using an indirect communication paradigm such as group communication, distributed event-based approaches, tuple spaces or distributed shared memory approaches.


In keeping with the design principles identified in [the previous post](http://sungsoo.github.io/2014/04/28/overall-architecture-and-design-philosophy.html), Google adopts a simple, minimal and efficient remote invocation service that is a variant of a *remote procedure call approach*.


Readers will recall that remote procedure call communication requires a serialization component to convert the procedure invocation data (procedure name and parameters, possibly structured) from their internal binary representation to a *flattened* or *serialized* processor-neutral format ready for transmission to the remote partner. Serialization for Java RPC is described in Section 4.3.2 [1]. XML has emerged more recently as a ‘**universal**’ serialized data format, but its generality brings substantial *overheads*. Google has therefore developed a *simplified* and *high-performance serialization* component known as **protocol buffers** that is used for a substantial majority of interactions within the infrastructure. This can be used over any underlying communication mechanism to provide an RPC capability. An open source version of protocol buffers is available [code.google.com](http://code.google.com/).


A separate *publish-subscribe service* is also used, recognizing the key role that this paradigm can offer in many areas of distributed system design, including the *efficient* and *real-time dissemination* of events to multiple participants. In common with many other distributed system platforms, the Google infrastructure therefore offers a *hybrid* solution allowing developers to select the best communication paradigm for their requirements. Publish-susbcribe is not an alternative to protocol buffers in the Google infrastructure, but rather an augmentation offering an added-value service for where it is most appropriate.


We examine the design of these two approaches below, with emphasis on protocol buffers (full details of the publish-subscribe protocol are not yet publicly available).


Remote invocation
---

Protocol buffers place emphasis on the description and subsequent serialization of data, and hence the concept is best compared to direct alternatives such as XML. The goal is to provide a *language- and platform-neutral* way to specify and serialize data in a manner that is simple, highly efficient and extensible; the serialized data can then be used for subsequent storage of data or transmission using an underlying communications protocol, or indeed for any other purpose that demands a serialization format for structured data. We will see later how this can be used as the basis for RPC- style exchange.


In protocol buffers, a language is provide for the specification of *messages*. We introduce the key features of this (simple) language by example, with Figure 21.7 showing how a book message might be specified.


As can be seen, the overall *Book* message consists of a series of uniquely numbered fields, each represented by a field name and the type of the associated value.   

![](http://sungsoo.github.com/images/protocol-buffers-example.png)

The type can be one of:

* *a primitive data type* (including integer, floating-point, boolean, string or raw bytes);

* an *enumerated type*;


* a *nested message* allowing a hierarchical structuring of data. 

We can see examples of each in Figure 21.7.

Fields are annotated with one of three labels:


* *required* fields must be present in the message;

* *optional* fields may be present in the message;

* *repeated* fields can exist zero or more times in the message (the developers of protocol buffers view this as a type of dynamically sized array).


Again, we can see uses of each annotation in the *Book* message format illustrated in Figure 21.7.


The unique number (=1, =2 and so on) represents the tag that a particular field has in the binary encoding of the message.


This specification is contained in a *.proto* file and compiled by a *protoc* tool. The output of this tool is generated code that allows programmers to manipulate the particular message type, in particular assigning/extracting values to/from messages. In more detail, the *protoc* tool generates a *builder* class that provides *getter* and *setter* methods for each field together with additional methods to *test* if a method has been set and to *clear* a field to the associated null value. For example, the following methods would be generated for the title field:

```java
public boolean hasTitle();
public java.lang.String getTitle();   
public Builder setTitle(String value);   
public Builder clearTitle();
```

The importance of the builder class is that while messages are immutable in protocol buffers, builders are mutable and are used to construct and manipulate new messages.


For repeated fields the generated code is slightly more complicated, with methods provided to return a count of the number of elements in the associated list, to get or set specific fields in the list, to append a new element to a list and to add a set of elements to a list (the addAll method). We illustrate this by example by listing the methods generated for the keyword field:

```java
public List<string> getKeywordList();
public int getKeywordCount();
public string getKeyword(int index);
public Builder setKeyword(int index, string value); 
public Builder addKeyword(string value);
public Builder addAllKeyword(Iterable<string> value); 
public Builder clearKeyword();
```

The generated code also provides a range of other methods to manipulate messages, including methods such as toString to provide a readable representation of the message (often used for debugging for example) and also a series of methods to parse incoming messages.


As can be seen, this is a very simple format compared to XML (for example, contrast the specification above with equivalent specifications in XML as shown in Section 4.3.3), and one that its developers claim is 3 to 10 times smaller than XML equivalents and 10 to 100 times faster in operation. The associated programming interface providing access to the data is also considerably simpler than equivalents for XML.

Note that this is a somewhat unfair comparison, for two reasons. Firstly, the Google infrastructure is a relatively closed system and hence, unlike, XML, it does not address interoperability across open systems. Secondly, XML is significantly richer in that it generates self-describing messages that contain the data and associated metadata describing the structure of the messages (see Section 4.3.3). Protocol buffers do not provide this facility directly (although it is possible to achieve this effect, as described in the relevant web pages in a section on techniques [code.google.com II]). In outline, this is achieved by asking the *protoc* compiler to generate a *FileDescriptorSet* that contains self-descriptions of messages, and then including this explicitly in message descriptions. The developers of protocol buffers, though, emphasize that this is not seen as a particularly useful feature and that it is rarely used in the Google infrastructure code.

Supporting RPC 
---

As mentioned above, protocol buffers are a general mechanism that can be used for storage or communication. The most common use of protocol buffers, however, is to specify RPC exchanges across the network, and this is accommodated with extra syntax in the language. Again, we illustrate the syntax by example:

```java
service SearchService {
	rpc Search (RequestType) returns (ResponseType);
}
```

This code fragment specifies a service interface called *SearchService* containing one remote operation, *Search*, which takes one parameter of type RequestType and returns one parameter of type *ResponseType*. For example, the types could correspond to a list of keywords and a list of *Books* matching this set of keywords, respectively. The *protoc* compiler takes this specification and produces both an abstract interface SearchService and a stub that supports type-safe RPC-style calls to the remote service using protocol buffers.

As well as being language- and platform-neutral, protocol buffers are also agnostic with respect to the underlying RPC protocol. In particular, the stub assumes that implementations exist for two abstract interfaces RpcChannel and RpcController, the former offering a common interface to underlying RPC implementations and the latter offering a common control interface, for example, to manipulate settings associated with that implementation. A programmer must provide implementations of these abstract interfaces, effectively selecting the desired RPC implementation. For example, this could pass serialized messages using HTTP or TCP or could map onto one of a number of third-party RPC implementations available and linked from the protocol buffers site [code.google.com III].

Note that a service interface can support multiple remote operations, but each operation must adhere to the pattern of taking a single parameter and returning a single result (with both being protocol buffer messages). This is unusual compared to the designs of RPC and RMI systems – as we saw in Chapter 5 – remote invocations can have an arbitrary number of parameters, and in the case of RMI the parameters or results can be objects or indeed object references (although note that Sun RPC, as documented in Section 5.3.3 [1], adopts a similar approach to protocol buffers). The rationale for having one request and one reply is to support extensibility and software evolution; whereas the more general styles of interface may change significantly over time, this more constrained style of interface is likely to remain more constant. This approach also pushes the complexity towards the data in a manner that is reminiscent of the REST philosophy, with its constrained set of operations and emphasis on manipulating resources (see Section 9.2).

Publish-subscribe
---

Protocol buffers are used extensively but not exclusively as the communication paradigm in the Google infrastructure. To complement protocol buffers, the infrastructure also supports a publish-subscribe system intended to be used where distributed events need to be disseminated in real time and with reliability guarantees to potentially large numbers of recipients. As mentioned above, the publish-subscribe service is an augmentation to protocol buffers and indeed uses protocol buffers for its underlying communication.

One key use for the publish-subscribe system, for example, is to underpin the Google Ads system, recognizing that advertisments in Google are world-wide and that advertisement serving systems anywhere in the network need to know in a fraction of a second the eligibility of certain advertisements that can be shown in response to a query.

The RPC system described above would clearly be inappropriate and highly inefficient for this style of interaction, especially given the potentially large numbers of subscribers and the guarantees required by the associated applications. In particular, the sender would need to know the identity of all the other advertisment serving systems, which could be very large. RPCs would need to be sent to all the individual serving systems, consuming many connections and a great deal of associated buffer space at the sender, not to mention the bandwidth requirements of sending the data across wide area network links. A publish-subsribe solution, in contrast, with its inherent time and space uncoupling, overcomes these difficulties and also offers natural support for failure and recovery of subscribers (see Section 6.1 [1]).

Google has not made details of the publish-subscribe system publicly available. We therefore restrict our discussion to some high-level features of the system.

Google adopts a *topic-based* publish-subscribe system, providing a number of channels for event streams with channels corresponding to particular topics. A topic- based system was chosen for its ease of implementation and its relative predictability in terms of performance compared to content-based approaches – that is, the infrastructure can be set up and tailored to deliver events related to a given topic. The downside is a lack of expressive power in specifying events of interest. As a compromise, the Google publish-subscribe system allows enhanced subscriptions defined not just by selecting a channel but also by selecting subsets of events from within that channel. In particular, a given event consists of a header, an associated set of keywords and a payload, which is opaque to the programmer. Subscription requests specify the channel together with a filter defined over the set of keywords. Channels are intended to be used for relatively static and coarse-grained data streams requiring high throughputs of events (at least 1- Mbps), so the added capability for expressing refined subscriptions using filters helps greatly. For example, if a topic generates less than this volume of data, it will be subsumed within another topic but identifiable by keyword.

The publish-subscribe system is implemented as a *broker overlay* in the form of a set of trees, where each tree represents a topic. The root of the tree is the publisher and the leaf nodes represent subscribers. When filters are introduced, they are pushed as far back in the tree as possible to minimize unnecessary traffic.

Unlike the publish-subscribe systems discussed in Chapter 6, there is a strong emphasis on both reliable and timely delivery:

* In terms of reliability, the system maintains redundant trees; in particular, two separate tree overlays are maintained per logical channel (topic).


* In terms of timely delivery, the system implements a quality of service management technique to control message flows. In particular, a simple rate control scheme is introduced based on an imposed rate limit enforced on a per user/ per topic basis. This replaces a more complex approach and manages the anticipated resource usage across the tree in terms of memory, CPU and message and byte rates.

Trees are initially constructed and constantly re-evaluated according to a shortest path algorithm (see Chapter 3 [1]).

Summary of key design choices for communication
---

The overall design choices relating to communication paradigms in the Google infrastructure are summarized in Figure 21.8. This table highlights the most important decisions associated with the overall design and the constituent elements (protocol buffers and the publish-subscribe system) and summarizes the rationale and the particular trade-offs associated with each choice.


![](http://sungsoo.github.com/images/design-choices.png)


Overall, we see a hybrid approach offering two distinct communication paradigms designed to support different styles of interaction within the architecture. This allows developers to select the best paradigm for each particular problem domain.

We shall repeat this style of analysis at the end of each of the following posts, thus providing an overall perspective of key design decisions relating to the Google infrastructure.


# References
[1] George Coulouris, Jean Dollimore, Tim Kindberg and Gordon Blair, *DISTRIBUTED SYSTEMS Concepts and Design* Fifth Edition, Pearson Education, Inc., 2012.

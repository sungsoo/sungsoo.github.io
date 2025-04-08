---
layout: post
title: Output Operations on DStreams
date: 2015-04-07
categories: [computer science]
tags: [big data]

---

Output Operations on DStreams
-----------------------------

Output operations allow DStream’s data to be pushed out external systems
like a database or a file systems. Since the output operations actually
allow the transformed data to be consumed by external systems, they
trigger the actual execution of all the DStream transformations (similar
to actions for RDDs). Currently, the following output operations are
defined:

<table class="table">
<tr><th style="width:30%">Output Operation</th><th>Meaning</th></tr>
<tr>
  <td> <b>print</b>()</td>
  <td> Prints first ten elements of every batch of data in a DStream on the driver node running
  the streaming application. This is useful for development and debugging.
  <br />
  <span class="badge" style="background-color: grey">Python API</span> This is called
  <b>pprint()</b> in the Python API.
  </td>
</tr>
<tr>
  <td> <b>saveAsTextFiles</b>(<i>prefix</i>, [<i>suffix</i>]) </td>
  <td> Save this DStream's contents as a text files. The file name at each batch interval is
  generated based on <i>prefix</i> and <i>suffix</i>: <i>"prefix-TIME_IN_MS[.suffix]"</i>. </td>
</tr>
<tr>
  <td> <b>saveAsObjectFiles</b>(<i>prefix</i>, [<i>suffix</i>]) </td>
  <td> Save this DStream's contents as a <code>SequenceFile</code> of serialized Java objects. The file
  name at each batch interval is generated based on <i>prefix</i> and
  <i>suffix</i>: <i>"prefix-TIME_IN_MS[.suffix]"</i>.
  <br />
  <span class="badge" style="background-color: grey">Python API</span> This is not available in
  the Python API.
  </td>
</tr>
<tr>
  <td> <b>saveAsHadoopFiles</b>(<i>prefix</i>, [<i>suffix</i>]) </td>
  <td> Save this DStream's contents as a Hadoop file. The file name at each batch interval is
  generated based on <i>prefix</i> and <i>suffix</i>: <i>"prefix-TIME_IN_MS[.suffix]"</i>.
  <br />
  <span class="badge" style="background-color: grey">Python API</span> This is not available in
  the Python API.
  </td>
</tr>
<tr>
  <td> <b>foreachRDD</b>(<i>func</i>) </td>
  <td> The most generic output operator that applies a function, <i>func</i>, to each RDD generated from
  the stream. This function should push the data in each RDD to a external system, like saving the RDD to
  files, or writing it over the network to a database. Note that the function <i>func</i> is executed
  in the driver process running the streaming application, and will usually have RDD actions in it
  that will force the computation of the streaming RDDs.</td>
</tr>
</table>
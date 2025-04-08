---
layout: post
title: Transformations on DStreams
date: 2015-04-06
categories: [computer science]
tags: [big data]

---

# Transformations on DStreams


Similar to that of RDDs, transformations allow the data from the input
DStream to be modified. DStreams support many of the transformations
available on normal Spark RDD’s. Some of the common ones are as follows.

<table class="table">
<tr><th style="width:25%">Transformation</th><th>Meaning</th></tr>
<tr>
  <td> <b>map</b>(<i>func</i>) </td>
  <td> Return a new DStream by passing each element of the source DStream through a
  function <i>func</i>. </td>
</tr>
<tr>
  <td> <b>flatMap</b>(<i>func</i>) </td>
  <td> Similar to map, but each input item can be mapped to 0 or more output items. </td>
</tr>
<tr>
  <td> <b>filter</b>(<i>func</i>) </td>
  <td> Return a new DStream by selecting only the records of the source DStream on which
  <i>func</i> returns true. </td>
</tr>
<tr>
  <td> <b>repartition</b>(<i>numPartitions</i>) </td>
  <td> Changes the level of parallelism in this DStream by creating more or fewer partitions. </td>
</tr>
<tr>
  <td> <b>union</b>(<i>otherStream</i>) </td>
  <td> Return a new DStream that contains the union of the elements in the source DStream and
  <i>otherDStream</i>. </td>
</tr>
<tr>
  <td> <b>count</b>() </td>
  <td> Return a new DStream of single-element RDDs by counting the number of elements in each RDD
   of the source DStream. </td>
</tr>
<tr>
  <td> <b>reduce</b>(<i>func</i>) </td>
  <td> Return a new DStream of single-element RDDs by aggregating the elements in each RDD of the
  source DStream using a function <i>func</i> (which takes two arguments and returns one).
  The function should be associative so that it can be computed in parallel. </td>
</tr>
<tr>
  <td> <b>countByValue</b>() </td>
  <td> When called on a DStream of elements of type K, return a new DStream of (K, Long) pairs
  where the value of each key is its frequency in each RDD of the source DStream.  </td>
</tr>
<tr>
  <td> <b>reduceByKey</b>(<i>func</i>, [<i>numTasks</i>]) </td>
  <td> When called on a DStream of (K, V) pairs, return a new DStream of (K, V) pairs where the
  values for each key are aggregated using the given reduce function. <b>Note:</b> By default,
  this uses Spark's default number of parallel tasks (2 for local mode, and in cluster mode the number
  is determined by the config property <code>spark.default.parallelism</code>) to do the grouping.
  You can pass an optional <code>numTasks</code> argument to set a different number of tasks.</td>
</tr>
<tr>
  <td> <b>join</b>(<i>otherStream</i>, [<i>numTasks</i>]) </td>
  <td> When called on two DStreams of (K, V) and (K, W) pairs, return a new DStream of (K, (V, W))
  pairs with all pairs of elements for each key. </td>
</tr>
<tr>
  <td> <b>cogroup</b>(<i>otherStream</i>, [<i>numTasks</i>]) </td>
  <td> When called on DStream of (K, V) and (K, W) pairs, return a new DStream of
  (K, Seq[V], Seq[W]) tuples.</td>
</tr>
<tr>
  <td> <b>transform</b>(<i>func</i>) </td>
  <td> Return a new DStream by applying a RDD-to-RDD function to every RDD of the source DStream.
  This can be used to do arbitrary RDD operations on the DStream. </td>
</tr>
<tr>
  <td> <b>updateStateByKey</b>(<i>func</i>) </td>
  <td> Return a new "state" DStream where the state for each key is updated by applying the
  given function on the previous state of the key and the new values for the key. This can be
  used to maintain arbitrary state data for each key.</td>
</tr>
</table>                                             

A few of these transformations are worth discussing in more detail.

## UpdateStateByKey Operation 

The `updateStateByKey` operation allows you to maintain arbitrary state
while continuously updating it with new information. To use this, you
will have to do two steps.

1.  Define the state - The state can be of arbitrary data type.
2.  Define the state update function - Specify with a function how to
    update the state using the previous state and the new values from
    input stream.

Let’s illustrate this with an example. Say you want to maintain a
running count of each word seen in a text data stream. Here, the running
count is the state and it is an integer. We define the update function
as

```scala
def updateFunction(newValues: Seq[Int], runningCount: Option[Int]): Option[Int] = {
	val newCount = ...  // add the new values with the previous running count to get the new count
	Some(newCount)
}
```

This is applied on a DStream containing words (say, the `pairs` DStream
containing `(word, 1)` pairs in the [earlier
example](#a-quick-example)).


```scala
val runningCounts = pairs.updateStateByKey[Int](updateFunction _)
```

The update function will be called for each word, with `newValues`
having a sequence of 1’s (from the `(word, 1)` pairs) and the
`runningCount` having the previous count. For the complete Scala code,
take a look at the example
[StatefulNetworkWordCount.scala](https://github.com/apache/spark/blob/master/examples/src/main/scala/org/apache%0A/spark/examples/streaming/StatefulNetworkWordCount.scala).

```java
    import com.google.common.base.Optional;
    Function2<List<Integer>, Optional<Integer>, Optional<Integer>> updateFunction =
      new Function2<List<Integer>, Optional<Integer>, Optional<Integer>>() {
        @Override public Optional<Integer> call(List<Integer> values, Optional<Integer> state) {
          Integer newSum = ...  // add the new values with the previous running count to get the new count
          return Optional.of(newSum);
        }
      };
```

This is applied on a DStream containing words (say, the `pairs` DStream
containing `(word, 1)` pairs in the [quick example](#a-quick-example)).

```java
    JavaPairDStream<String, Integer> runningCounts = pairs.updateStateByKey(updateFunction);
```

The update function will be called for each word, with `newValues`
having a sequence of 1’s (from the `(word, 1)` pairs) and the
`runningCount` having the previous count. For the complete Java code,
take a look at the example
[JavaStatefulNetworkWordCount.java](https://github.com/apache/spark/blob/master/examples/src/main/java/org/apache/spark/examples/streaming%0A/JavaStatefulNetworkWordCount.java).

```scala
    def updateFunction(newValues, runningCount):
        if runningCount is None:
           runningCount = 0
        return sum(newValues, runningCount)  # add the new values with the previous running count to get the new count
```

This is applied on a DStream containing words (say, the `pairs` DStream
containing `(word, 1)` pairs in the [earlier
example](#a-quick-example)).

```scala
    runningCounts = pairs.updateStateByKey(updateFunction)
```

The update function will be called for each word, with `newValues`
having a sequence of 1’s (from the `(word, 1)` pairs) and the
`runningCount` having the previous count. For the complete Python code,
take a look at the example
[stateful\_network\_wordcount.py](https://github.com/apache/spark/blob/master/examples/src/main/python/streaming/stateful_network_wordcount.py).

Note that using `updateStateByKey` requires the checkpoint directory to
be configured, which is discussed in detail in the
[checkpointing](#checkpointing) section.

## Transform Operation 

The `transform` operation (along with its variations like
`transformWith`) allows arbitrary RDD-to-RDD functions to be applied on
a DStream. It can be used to apply any RDD operation that is not exposed
in the DStream API. For example, the functionality of joining every
batch in a data stream with another dataset is not directly exposed in
the DStream API. However, you can easily use `transform` to do this.
This enables very powerful possibilities. For example, if you want to do
real-time data cleaning by joining the input data stream with
precomputed spam information (maybe generated with Spark as well) and
then filtering based on it.

```scala
    val spamInfoRDD = ssc.sparkContext.newAPIHadoopRDD(...) // RDD containing spam information

    val cleanedDStream = wordCounts.transform(rdd => {
      rdd.join(spamInfoRDD).filter(...) // join data stream with spam information to do data cleaning
      ...
    })

    import org.apache.spark.streaming.api.java.*;
    // RDD containing spam information
    final JavaPairRDD<String, Double> spamInfoRDD = jssc.sparkContext().newAPIHadoopRDD(...);

    JavaPairDStream<String, Integer> cleanedDStream = wordCounts.transform(
      new Function<JavaPairRDD<String, Integer>, JavaPairRDD<String, Integer>>() {
        @Override public JavaPairRDD<String, Integer> call(JavaPairRDD<String, Integer> rdd) throws Exception {
          rdd.join(spamInfoRDD).filter(...); // join data stream with spam information to do data cleaning
          ...
        }
      });

    spamInfoRDD = sc.pickleFile(...) # RDD containing spam information

    # join data stream with spam information to do data cleaning
    cleanedDStream = wordCounts.transform(lambda rdd: rdd.join(spamInfoRDD).filter(...))
```

In fact, you can also use [machine learning](mllib-guide.html) and
[graph computation](graphx-programming-guide.html) algorithms in the
`transform` method.

## Window Operations 

Spark Streaming also provides *windowed computations*, which allow you
to apply transformations over a sliding window of data. This following
figure illustrates this sliding window.

![Spark
Streaming](http://spark.apache.org/docs/latest/img/streaming-dstream-window.png "Spark Streaming data flow")

As shown in the figure, every time the window *slides* over a source
DStream, the source RDDs that fall within the window are combined and
operated upon to produce the RDDs of the windowed DStream. In this
specific case, the operation is applied over last 3 time units of data,
and slides by 2 time units. This shows that any window operation needs
to specify two parameters.

-   *window length* - The duration of the window (3 in the figure)
-   *sliding interval* - The interval at which the window operation is
    performed (2 in the figure).

These two parameters must be multiples of the batch interval of the
source DStream (1 in the figure).

Let’s illustrate the window operations with an example. Say, you want to
extend the [earlier example](#a-quick-example) by generating word counts
over last 30 seconds of data, every 10 seconds. To do this, we have to
apply the `reduceByKey` operation on the `pairs` DStream of `(word, 1)`
pairs over the last 30 seconds of data. This is done using the operation
`reduceByKeyAndWindow`.

```scala
    // Reduce last 30 seconds of data, every 10 seconds
    val windowedWordCounts = pairs.reduceByKeyAndWindow((a:Int,b:Int) => (a + b), Seconds(30), Seconds(10))

    // Reduce function adding two integers, defined separately for clarity
    Function2<Integer, Integer, Integer> reduceFunc = new Function2<Integer, Integer, Integer>() {
      @Override public Integer call(Integer i1, Integer i2) throws Exception {
        return i1 + i2;
      }
    };

    // Reduce last 30 seconds of data, every 10 seconds
    JavaPairDStream<String, Integer> windowedWordCounts = pairs.reduceByKeyAndWindow(reduceFunc, Durations.seconds(30), Durations.seconds(10));

    # Reduce last 30 seconds of data, every 10 seconds
    windowedWordCounts = pairs.reduceByKeyAndWindow(lambda x, y: x + y, lambda x, y: x - y, 30, 10)
```

Some of the common window operations are as follows. All of these
operations take the said two parameters - *windowLength* and
*slideInterval*.

<table class="table">
<tr><th style="width:25%">Transformation</th><th>Meaning</th></tr>
<tr>
  <td> <b>window</b>(<i>windowLength</i>, <i>slideInterval</i>) </td>
  <td> Return a new DStream which is computed based on windowed batches of the source DStream.
  </td>
</tr>
<tr>
  <td> <b>countByWindow</b>(<i>windowLength</i>, <i>slideInterval</i>) </td>
  <td> Return a sliding window count of elements in the stream.
  </td>
</tr>
<tr>
  <td> <b>reduceByWindow</b>(<i>func</i>, <i>windowLength</i>, <i>slideInterval</i>) </td>
  <td> Return a new single-element stream, created by aggregating elements in the stream over a
  sliding interval using <i>func</i>. The function should be associative so that it can be computed
  correctly in parallel.
  </td>
</tr>
<tr>
  <td> <b>reduceByKeyAndWindow</b>(<i>func</i>, <i>windowLength</i>, <i>slideInterval</i>,
  [<i>numTasks</i>]) </td>
  <td> When called on a DStream of (K, V) pairs, returns a new DStream of (K, V)
  pairs where the values for each key are aggregated using the given reduce function <i>func</i>
  over batches in a sliding window. <b>Note:</b> By default, this uses Spark's default number of
  parallel tasks (2 for local mode, and in cluster mode the number is determined by the config
  property <code>spark.default.parallelism</code>) to do the grouping. You can pass an optional
  <code>numTasks</code> argument to set a different number of tasks.
  </td>
</tr>
<tr>
  <td> <b>reduceByKeyAndWindow</b>(<i>func</i>, <i>invFunc</i>, <i>windowLength</i>,
  <i>slideInterval</i>, [<i>numTasks</i>]) </td>
  <td> A more efficient version of the above <code>reduceByKeyAndWindow()</code> where the reduce
  value of each window is calculated incrementally using the reduce values of the previous window.
  This is done by reducing the new data that enter the sliding window, and "inverse reducing" the
  old data that leave the window. An example would be that of "adding" and "subtracting" counts
  of keys as the window slides. However, it is applicable to only "invertible reduce functions",
  that is, those reduce functions which have a corresponding "inverse reduce" function (taken as
  parameter <i>invFunc</i>. Like in <code>reduceByKeyAndWindow</code>, the number of reduce tasks
  is configurable through an optional argument. Note that [checkpointing](#checkpointing) must be
  enabled for using this operation.
</td>
</tr>
<tr>
  <td> <b>countByValueAndWindow</b>(<i>windowLength</i>,
  <i>slideInterval</i>, [<i>numTasks</i>]) </td>
  <td> When called on a DStream of (K, V) pairs, returns a new DStream of (K, Long) pairs where the
  value of each key is its frequency within a sliding window. Like in
  <code>reduceByKeyAndWindow</code>, the number of reduce tasks is configurable through an
  optional argument.
</td>
</tr>
</table>                     

## Join Operations 

Finally, its worth highlighting how easily you can perform different
kinds of joins in Spark Streaming.

### Stream-stream joins 

Streams can be very easily joined with other streams.

```scala
    val stream1: DStream[String, String] = ...
    val stream2: DStream[String, String] = ...
    val joinedStream = stream1.join(stream2)

    JavaPairDStream<String, String> stream1 = ...
    JavaPairDStream<String, String> stream2 = ...
    JavaPairDStream<String, String> joinedStream = stream1.join(stream2);

    stream1 = ...
    stream2 = ...
    joinedStream = stream1.join(stream2)
```

Here, in each batch interval, the RDD generated by `stream1` will be
joined with the RDD generated by `stream2`. You can also do
`leftOuterJoin`, `rightOuterJoin`, `fullOuterJoin`. Furthermore, it is
often very useful to do joins over windows of the streams. That is
pretty easy as well.

```java
    val windowedStream1 = stream1.window(Seconds(20))
    val windowedStream2 = stream2.window(Minutes(1))
    val joinedStream = windowedStream1.join(windowedStream2)

    JavaPairDStream<String, String> windowedStream1 = stream1.window(Durations.seconds(20));
    JavaPairDStream<String, String> windowedStream2 = stream2.window(Durations.minutes(1));
    JavaPairDStream<String, String> joinedStream = windowedStream1.join(windowedStream2);

    windowedStream1 = stream1.window(20)
    windowedStream2 = stream2.window(60)
    joinedStream = windowedStream1.join(windowedStream2)
```

### Stream-dataset joins 

This has already been shown earlier while explain `DStream.transform`
operation. Here is yet another example of joining a windowed stream with
a dataset.

```scala
    val dataset: RDD[String, String] = ...
    val windowedStream = stream.window(Seconds(20))...
    val joinedStream = windowedStream.transform { rdd => rdd.join(dataset) }

    JavaPairRDD<String, String> dataset = ...
    JavaPairDStream<String, String> windowedStream = stream.window(Durations.seconds(20));
    JavaPairDStream<String, String> joinedStream = windowedStream.transform(
        new Function<JavaRDD<Tuple2<String, String>>, JavaRDD<Tuple2<String, String>>>() {
            @Override 
            public JavaRDD<Tuple2<String, String>> call(JavaRDD<Tuple2<String, String>> rdd) {
                return rdd.join(dataset);
            }
        }
    );

    dataset = ... # some RDD
    windowedStream = stream.window(20)
    joinedStream = windowedStream.transform(lambda rdd: rdd.join(dataset))
```

In fact, you can also dynamically change the dataset you want to join
against. The function provided to `transform` is evaluated every batch
interval and therefore will use the current dataset that `dataset`
reference points to.

The complete list of DStream transformations is available in the API
documentation. For the Scala API, see
[DStream](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.streaming.dstream.DStream)
and
[PairDStreamFunctions](http://spark.apache.org/docs/latest/api/scala/index.html#org.apache.spark.streaming.dstream.PairDStreamFunctions).
For the Java API, see
[JavaDStream](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/streaming/api/java/JavaDStream.html)
and
[JavaPairDStream](http://spark.apache.org/docs/latest/api/java/index.html?org/apache/spark/streaming/api/java/JavaPairDStream.html).
For the Python API, see
[DStream](http://spark.apache.org/docs/latest/api/python/pyspark.streaming.html#pyspark.streaming.DStream).

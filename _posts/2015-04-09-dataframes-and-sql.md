---
layout: post
title: DataFrame and SQL Operations
date: 2015-04-09
categories: [computer science]
tags: [big data]

---

DataFrame and SQL Operations
----------------------------

You can easily use [DataFrames and SQL](http://spark.apache.org/docs/latest/sql-programming-guide.html)
operations on streaming data. You have to create a SQLContext using the
SparkContext that the StreamingContext is using. Furthermore this has to
done such that it can be restarted on driver failures. This is done by
creating a lazily instantiated singleton instance of SQLContext. This is
shown in the following example. It modifies the earlier [word count
example](http://spark.apache.org/docs/latest/streaming-programming-guide.html#a-quick-example) to generate word counts using DataFrames and
SQL. Each RDD is converted to a DataFrame, registered as a temporary
table and then queried using SQL.

```scala
    /** Lazily instantiated singleton instance of SQLContext */
    object SQLContextSingleton {
      @transient private var instance: SQLContext = null

      // Instantiate SQLContext on demand
      def getInstance(sparkContext: SparkContext): SQLContext = synchronized {
        if (instance == null) {
          instance = new SQLContext(sparkContext)
        }
        instance
      }
    }

    ...

    /** Case class for converting RDD to DataFrame */
    case class Row(word: String)

    ...

    /** DataFrame operations inside your streaming program */

    val words: DStream[String] = ...

    words.foreachRDD { rdd =>

      // Get the singleton instance of SQLContext
      val sqlContext = SQLContextSingleton.getInstance(rdd.sparkContext)
      import sqlContext.implicits._

      // Convert RDD[String] to RDD[case class] to DataFrame
      val wordsDataFrame = rdd.map(w => Row(w)).toDF()

      // Register as table
      wordsDataFrame.registerTempTable("words")

      // Do word count on DataFrame using SQL and print it
      val wordCountsDataFrame = 
        sqlContext.sql("select word, count(*) as total from words group by word")
      wordCountsDataFrame.show()
    }
```

See the full [source
code](https://github.com/apache/spark/blob/master/examples/src/main/scala/org/apache/spark/examples/streaming/SqlNetworkWordCount.scala).

```java
    /** Lazily instantiated singleton instance of SQLContext */
    class JavaSQLContextSingleton {
      static private transient SQLContext instance = null;
      static public SQLContext getInstance(SparkContext sparkContext) {
        if (instance == null) {
          instance = new SQLContext(sparkContext);
        }
        return instance;
      }
    }

    ...

    /** Java Bean class for converting RDD to DataFrame */
    public class JavaRow implements java.io.Serializable {
      private String word;

      public String getWord() {
        return word;
      }

      public void setWord(String word) {
        this.word = word;
      }
    }

    ...

    /** DataFrame operations inside your streaming program */

    JavaDStream<String> words = ... 

    words.foreachRDD(
      new Function2<JavaRDD<String>, Time, Void>() {
        @Override
        public Void call(JavaRDD<String> rdd, Time time) {
          SQLContext sqlContext = JavaSQLContextSingleton.getInstance(rdd.context());

          // Convert RDD[String] to RDD[case class] to DataFrame
          JavaRDD<JavaRow> rowRDD = rdd.map(new Function<String, JavaRow>() {
            public JavaRow call(String word) {
              JavaRow record = new JavaRow();
              record.setWord(word);
              return record;
            }
          });
          DataFrame wordsDataFrame = sqlContext.createDataFrame(rowRDD, JavaRow.class);

          // Register as table
          wordsDataFrame.registerTempTable("words");

          // Do word count on table using SQL and print it
          DataFrame wordCountsDataFrame =
              sqlContext.sql("select word, count(*) as total from words group by word");
          wordCountsDataFrame.show();
          return null;
        }
      }
    );
```

See the full [source
code](https://github.com/apache/spark/blob/master/examples/src/main/java/org/apache/spark/examples/streaming/JavaSqlNetworkWordCount.java).

```scala
    # Lazily instantiated global instance of SQLContext
    def getSqlContextInstance(sparkContext):
        if ('sqlContextSingletonInstance' not in globals()):
            globals()['sqlContextSingletonInstance'] = SQLContext(sparkContext)
        return globals()['sqlContextSingletonInstance']

    ...

    # DataFrame operations inside your streaming program

    words = ... # DStream of strings

    def process(time, rdd):
        print "========= %s =========" % str(time)
        try:
            # Get the singleton instance of SQLContext
            sqlContext = getSqlContextInstance(rdd.context)

            # Convert RDD[String] to RDD[Row] to DataFrame
            rowRdd = rdd.map(lambda w: Row(word=w))
            wordsDataFrame = sqlContext.createDataFrame(rowRdd)

            # Register as table
            wordsDataFrame.registerTempTable("words")

            # Do word count on table using SQL and print it
            wordCountsDataFrame = sqlContext.sql("select word, count(*) as total from words group by word")
            wordCountsDataFrame.show()
        except:
            pass

    words.foreachRDD(process)
```

See the full [source
code](https://github.com/apache/spark/blob/master/examples/src/main/python/streaming/sql_network_wordcount.py).

You can also run SQL queries on tables defined on streaming data from a
different thread (that is, asynchronous to the running
StreamingContext). Just make sure that you set the StreamingContext to
remember sufficient amount of streaming data such that query can run.
Otherwise the StreamingContext, which is unaware of the any asynchronous
SQL queries, will delete off old streaming data before the query can
complete. For example, if you want to query the last batch, but your
query can take 5 minutes to run, then call
`streamingContext.remember(Minutes(5))` (in Scala, or equivalent in
other languages).

See the [DataFrames and SQL](http://spark.apache.org/docs/latest/streaming-programming-guide.html) guide to learn
more about DataFrames.
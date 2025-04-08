---
layout: post
title: Implementing Drill Math Functions
date: 2014-07-13
categories: [computer science]
tags: [big data, big data]

---

# Implementing Drill Math Functions
## What are Math Functions

Math Functions are the set of functions that standard SQL queries allow
us to use. We would be adding up few math functions to Drill. I selected
the floor and ceil functions to start with.

## What is sqlline

Drill has a SQL prompt named sqlline where we hit our queries to start
working on Drill. The sqlline prompt can be started as below. Try below
queries to play around with sqlline. Try out more fancier queries from
[Drill Wiki
here](https://cwiki.apache.org/confluence/display/DRILL/Running+Queries "Drill - Running queries").

```sql
    $ cd incubator-drill
    $ ./sqlline -u jdbc:drill:schema=parquet-local -n admin -p admin
    SELECT * FROM "sample-data/region.parquet";
```

## Trying out a new Math Function

Trying to invoke a new/unimplemented math function throws an
ExpressionParsingException on the prompt. If we try to make a call for
floor/ceil in our query we will end up with an exception below. Try this
query on the sqlline prompt:

```sql
    $ SELECT FLOOR(2.3) FROM "sample-data/region.parquet";

    Query failed: org.apache.drill.exec.rpc.RpcException: Remote failure while running query.[error_id: "6e482ea4-9578-4a33-a268-077cbec014f9"
     endpoint {
     address: "localhost"
     user_port: 31010
     bit_port: 31011
     }
     error_type: 0
     message: "Failure while setting up Foreman. < ExpressionParsingException:[ Unable to find function definition for function named \'floor\' ]"
     ]
```

This tells us that Drill cannot find any implementation of a function
named floor/ceil. Now we need to provide the implementation for floor &
ceil function.

## Implementing a new Math Function

There are two important things that we have to do for this:

-   **Implement the Math Function :** In the java
    class- /drill-java-exec/src/main/java/org/apache/drill/exec/expr/fn/impl/MathFunctions.java
-   **Register the function definition :** In the java
    class- /drill-common/src/main/java/org/apache/drill/common/expression/fn/MathFunctions.java

Its actually pretty straight forward:

Opening the above files we would see code for few samples already
present. You can use the existing code as your reference. I am adding
the snippet of code added by me.

**IMPLEMENTING:
/drill-java-exec/src/main/java/org/apache/drill/exec/expr/fn/impl/MathFunctions.java**

We add two classes for handling the floor and ceil functions here, and
also give it an annotated name. This name is then used to register in
the Function Definition in the drill-common’s MathFunctions class.


```java
@FunctionTemplate(name = "floatceil", scope = FunctionScope.SIMPLE, nulls = NullHandling.NULL_IF_NULL)
  public static class Float8Ceil implements DrillSimpleFunc{
    @Param Float8Holder input;
    @Output Float8Holder out;
    public void setup(RecordBatch b){}
    public void eval(){
      out.value = Math.ceil(input.value);
    }
  }
@FunctionTemplate(name = "floatfloor", scope = FunctionScope.SIMPLE, nulls = NullHandling.NULL_IF_NULL)
  public static class Float8Floor implements DrillSimpleFunc{
    @Param Float8Holder input;
    @Output Float8Holder out;
    public void setup(RecordBatch b){}
    public void eval(){
      out.value = Math.floor(input.value);
    }
  }
```

**REGISTERING:
/drill-common/src/main/java/org/apache/drill/common/expression/fn/MathFunctions.java**

These two line of code are added in the get function definition method.
It is the place where we specify FLOOR and CEIL as functions and provide
it the annotated name of the class which would handle the operation.

```java
FunctionDefinition.simple("floatfloor", new BasicArgumentValidator(new Arg(Types.required(TypeProtos.MinorType.FLOAT8))), new OutputTypeDeterminer.SameAsFirstInput(), "floor"),
FunctionDefinition.simple("floatceil", new BasicArgumentValidator(new Arg(Types.required(TypeProtos.MinorType.FLOAT8))), new OutputTypeDeterminer.SameAsFirstInput(), "ceil"),
```


## Testing our new functions

Have a clean build and go to the sqlline prompt to test our newly
created Math Functions.

```sql
    $ cd incubator-drill
    $ mvn clean install -DskipTests
    $  ./sqlline -u jdbc:drill:schema=parquet-local -n admin -p admin
0: jdbc:drill:schema=parquet-local> SELECT CEIL(1.768) AS CEIL_VALUE FROM "sample-data/region.parquet";
```
```
+-------------+
| CEIL_VALUE  |
+-------------+
| 2.0         |
| 2.0         |
| 2.0         |
| 2.0         |
| 2.0         |
+-------------+
5 rows selected (0.638 seconds)
```
```sql
0: jdbc:drill:schema=parquet-local> SELECT FLOOR(1.768) AS FLOOR_VALUE FROM "sample-data/region.parquet";
```
```
+--------------+
| FLOOR_VALUE  |
+--------------+
| 1.0          |
| 1.0          |
| 1.0          |
| 1.0          |
| 1.0          |
+--------------+
5 rows selected (0.485 seconds)
```

## Bingo

We have successfully written 2 new Math Functions for Apache Drill. Now
pick up your own Drill Functions and you can start contributing with new
functions.

String Functions might also be a good place to start looking at since
currrently there are only few StringFunctions available in Drill.

## Entire Code

Get the entire code from this link here. [Apache Review Board-
DRILL-199](https://reviews.apache.org/r/14015/ "Floor and Ceil functions- DRILL-199").

 

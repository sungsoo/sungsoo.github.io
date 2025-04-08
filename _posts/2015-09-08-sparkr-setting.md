---
layout: post
title: SparkR Setting for RStudio
date: 2015-09-08
categories: [computer science]
tags: [big data]

---


# SparkR Setting for RStudio


Overview
========

SparkR originated at UC Berkeley AMPLAB, with additional contributions from Alteryx, Intel, Databricks, and others.

## What is SparkR?

* New *R language API* for Spark and SparkSQL
* Exposes existing Spark functionality in an R-friendly syntax via the *DataFrame API*
* Has its own shell, but can also be imported like a standard R package and used with Rstudio.

## History of DataFrames

* SparkR began as an R package that ported Spark’s core functionality (*RDDs*) to the R language.
* The next logical step was to add SparkSQL and SchemaRDDs.
* Initial implementation of *SQLContext* and *SchemaRDDs* working in SparkR

## Why DataFrames?

* Uses the *distributed, parallel* capabilities offered by RDDs, but imposes a schema on the data
* More structure == Easier access and manipulation
* Natural extension of existing R conventions since DataFrames are already the standard
* Super awesome *distributed, in-memory collections*
* *Schemas* == *metadata, structure, declarative* instead of imperative

```
Sys.setenv(SPARK_HOME="/usr/local/Cellar/apache-spark/1.4.1/libexec")
.libPaths(c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib"), .libPaths()))
library(SparkR)
sc <- sparkR.init(master="local[8]")
sqlContext <- sparkRSQL.init(sc)
faithful
df <- createDataFrame(sqlContext, faithful)
# Select one column
head(select(df, df$eruptions))
# Filter out rows
head(filter(df, df$waiting < 50))
```

## DataFrames in SparkR

* Multiple Components:
	* A set of native S4 classes and methods that live inside a standard R package
	* A SparkR backend that passes data structures and method calls to the JVM
	* A set of “helper” methods written in Scala
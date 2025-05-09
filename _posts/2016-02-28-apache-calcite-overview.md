---
layout: post
title: Apache Calcite Overview
date: 2016-02-28
categories: [computer science]
tags: [big data]

---

# Apache Calcite Overview

Apache Calcite is a *dynamic data management framework*.

It contains many of the pieces that comprise a typical database
management system, but omits some key functions: storage of data,
algorithms to process data, and a repository for storing metadata.

Calcite intentionally stays out of the business of storing and
processing data. As we shall see, this makes it an excellent choice for
mediating between applications and one or more data storage locations
and data processing engines. It is also a perfect foundation for
building a database: just add data.

To illustrate, let’s create an empty instance of Calcite and then point
it at some data.


```java
    public static class HrSchema {
      public final Employee[] emps = 0;
      public final Department[] depts = 0;
    }
    Class.forName("org.apache.calcite.jdbc.Driver");
    Properties info = new Properties();
    info.setProperty("lex", "JAVA");
    Connection connection = DriverManager.getConnection("jdbc:calcite:", info);
    CalciteConnection calciteConnection =
        connection.unwrap(CalciteConnection.class);
    ReflectiveSchema.create(calciteConnection,
        calciteConnection.getRootSchema(), "hr", new HrSchema());
    Statement statement = calciteConnection.createStatement();
    ResultSet resultSet = statement.executeQuery(
        "select d.deptno, min(e.empid)\n"
        + "from hr.emps as e\n"
        + "join hr.depts as d\n"
        + "  on e.deptno = d.deptno\n"
        + "group by d.deptno\n"
        + "having count(*) > 1");
    print(resultSet);
    resultSet.close();
    statement.close();
    connection.close();
```

Where is the database? There is no database. The connection is
completely empty until `ReflectiveSchema.create` registers a Java object
as a schema and its collection fields `emps` and `depts` as tables.

Calcite does not want to own data; it does not even have favorite data
format. This example used in-memory data sets, and processed them using
operators such as `groupBy` and `join` from the linq4j library. But
Calcite can also process data in other data formats, such as JDBC. In
the first example, replace

```java
    ReflectiveSchema.create(calciteConnection,
        calciteConnection.getRootSchema(), "hr", new HrSchema());
```


with

```java
    Class.forName("com.mysql.jdbc.Driver");
    BasicDataSource dataSource = new BasicDataSource();
    dataSource.setUrl("jdbc:mysql://localhost");
    dataSource.setUsername("username");
    dataSource.setPassword("password");
    JdbcSchema.create(calciteConnection.getRootSchema(), "name", dataSource,
        null, "hr");
```java


and Calcite will execute the same query in JDBC. To the application, the
data and API are the same, but behind the scenes the implementation is
very different. Calcite uses optimizer rules to push the `JOIN` and
`GROUP BY` operations to the source database.

In-memory and JDBC are just two familiar examples. Calcite can handle
any data source and data format. To add a data source, you need to write
an adapter that tells Calcite what collections in the data source it
should consider “tables”.

For more advanced integration, you can write optimizer rules. Optimizer
rules allow Calcite to access data of a new format, allow you to
register new operators (such as a better join algorithm), and allow
Calcite to optimize how queries are translated to operators. Calcite
will combine your rules and operators with built-in rules and operators,
apply cost-based optimization, and generate an efficient plan.

## Writing an adapter

The subproject under example/csv provides a CSV adapter, which is fully
functional for use in applications but is also simple enough to serve as
a good template if you are writing your own adapter.

See the [tutorial](/docs/tutorial.html) for information on using the CSV
adapter and writing other adapters.

See the [HOWTO](howto.html) for more information about using other
adapters, and about using Calcite in general.

Status
------

The following features are complete.

-   Query parser, validator and optimizer
-   Support for reading models in JSON format
-   Many standard functions and aggregate functions
-   JDBC queries against Linq4j and JDBC back-ends
-   Linq4j front-end
-   SQL features: SELECT, FROM (including JOIN syntax), WHERE, GROUP BY
    (including GROUPING SETS), aggregate functions (including
    COUNT(DISTINCT …) and FILTER), HAVING, ORDER BY (including NULLS
    FIRST/LAST), set operations (UNION, INTERSECT, MINUS), sub-queries
    (including correlated sub-queries), windowed aggregates, LIMIT
    (syntax as
    [Postgres](http://www.postgresql.org/docs/8.4/static/sql-select.html#SQL-LIMIT));
    more details in the [SQL reference](reference.html)
-   Local and remote JDBC drivers; see [Avatica](avatica_overview.html)
-   Several [adapters](adapter.html)
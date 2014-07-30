---
layout: post
title: Advantages and Drawbacks of Using Stored Procedures for Processing Data 
date: 2014-07-31
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: [Advantages and Drawbacks of Using Stored Procedures for Processing Data](http://www.seguetech.com/blog/06/04/Advantage-drawbacks-stored-procedures-processing-data)
* Authors: PJ Hambrick



# Advantages and Drawbacks of Using Stored Procedures for Processing Data

Stored procedures have been viewed as the de facto standard for
applications to access and manipulate database information through the
use of codified methods, or "procedures." This is largely due to what
they offer developers: the opportunity to couple the set-based power of
SQL with the iterative and conditional processing control of code
development. Developers couldn't be happier about this; finally, instead
of writing inline SQL and then attempting to manipulate the data from
within the code, developers could take advantage of:

-   **Familiar Coding Principles**
    -   Iterative Loops
    -   Conditionals
    -   Method Calls (the stored procedure itself is built and similarly
        called like a method)
-   **One-time, One-place Processing**
    -   Instead of having inline SQL code spread throughout the
        application, now sections of SQL code can be encapsulated into
        chunks of named methods that are easily identifiable and
        accessible all within one location – the "Stored Procedure"
        folder of the database.
    -   All complex data processing can now be performed on the server,
        allowing the client processing to focus more on presentation
        rather than manipulation of data.

Of course, just because something is popular doesn't always mean that
it's the best tool in all situations. The efficiency, efficacy and
utility of Stored Procedures, just like the implementation of all
programming languages and platforms, are all dependent on the needs of
the client and the subsequent architecture of the application.

Advantages of Using Stored Procedures
-------------------------------------

Stored procedures are so popular and have become so widely used and
therefore *expected*of Relational Database Management Systems (RDBMS)
that even MySQL finally caved to developer peer pressure and added the
ability to utilize stored procedures to their very popular [open
source](http://www.seguetech.com/blog/2013/03/27/open-source-best-for-your-company)
database. The list below details why stored procedures have gained such
a stalwart following among application developers (and even Database
Administrators for that matter):

-   **Maintainability**
    -   Because scripts are in one location, updates and tracking of
        dependencies based on schema changes becomes easier
-   **Testing**
    -   Can be tested independent of the application
-   **Isolation of Business Rules**
    -   Having Stored Procedures in one location means that there's no
        confusion of having business rules spread over potentially
        disparate code files in the application
-   **Speed / Optimization**
    -   Stored procedures are cached on the server
    -   Execution plans for the process are easily reviewable without
        having to run the application
-   **Utilization of Set-based Processing**
    -   The power of SQL is its ability to quickly and efficiently
        perform set-based processing on large amounts of data; the
        coding equivalent is usually iterative looping, which is
        generally much slower
-   **Security**
    -   Limit direct access to tables via defined roles in the database
    -   Provide an "interface" to the underlying data structure so that
        all implementation and even the data itself is shielded.
    -   Securing just the data and the code that accesses it is easier
        than applying that security within the application code itself

Drawbacks to Using Stored Procedures
------------------------------------

There are certainly drawbacks to Stored Procedures that preclude them
from being the one-stop shop solution to application database access.
The list below contains some reasons why Stored Procedures might not be
right for your application solution. Interestingly, you'll probably
recognize some headings that also appear in the "Advantages" section
above; this is because what one developer views as affirmative evidence
for their use might cause another to see the same evidence to disprove
their viability as a solution.

-   **Limited Coding Functionality**
    -   Stored procedure code is not as robust as app code, particularly
        in the area of looping (not to mention that iterative
        constructs, like cursors, are slow and processor intensive)
-   **Portability**
    -   Complex Stored Procedures that utilize complex, core
        functionality of the RDBMS used for their creation will not
        always port to upgraded versions of the same database. This is
        especially true if moving from one database type (Oracle) to
        another (MS SQL Server).
-   **Testing**
    -   Any data errors in handling Stored Procedures are not generated
        until runtime
-   **Location of Business Rules**
    -   Since SP's are not as easily grouped/encapsulated together in
        single files, this also means that business rules are spread
        throughout different Stored Procedures. App code architecture
        helps to ensure that business rules are encapsulated in single
        objects.
    -   There is a general opinion that business rules / logic should
        not be housed in the data tier
-   **Utilization of Set-based Processing**
    -   Too much overhead is incurred from maintaining Stored Procedures
        that are not *complex*enough. As a result, the general consensus
        is that simple SELECT statements should *not*be bound to Stored
        Procedures and instead implemented as inline SQL.
-   **Cost**
    -   Depending on your corporate structure and separation of concern
        for development, there is the potential that Stored Procedure
        development could potentially require a dedicated database
        developer. Some businesses will not allow developers access to
        the database at all, requiring instead a separate DBA. This will
        automatically incur added cost.
    -   Some companies believe (and sometimes it's true, but not always)
        that a DBA is more of a SQL expert than an application
        developer, and therefore will write better Stored Procedures. In
        that case, an extra developer in the form of a DBA is required.

Alternatives to Stored Procedures
---------------------------------

Because Stored Procedures are not always the perfect solution nor do
they satisfy all the needs of all developers, other solutions exist that
attempt to provide *most*of what a developer wants to do when accessing
a database backend. These include:

-   **In-line or Parameterized Queries**
    -   These are written within the application code itself
-   **Object Relational Mapping (ORM)**
    -   Provides an abstraction to the database without having to
        manually write data access classes. At this point, most all
        major platforms offer some form of ORM software, as illustrated
        at this
        [site](http://en.wikipedia.org/wiki/List_of_object-relational_mapping_software).

When Should You Use Stored Procedures?
--------------------------------------

Stored Procedures may not always be the right answer for processing
data, but there's also not enough compelling evidence to *not*use them
either. Whether or not to use them determines on your particular
situation and ability to develop the Stored Procedure(s) to match. Just
like with writing a good, quality application, if you or your developers
can write good, quality Stored Procedures, then by all means implement
them. If they can't, then another solution might be best for you.
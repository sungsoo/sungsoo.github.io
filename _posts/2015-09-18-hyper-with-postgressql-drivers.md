---
layout: post
title: Using HyPer with PostgreSQL Drivers
date: 2015-09-18
categories: [computer science]
tags: [big data]

---


# Using HyPer with PostgreSQL Drivers 



using a database from within an application requires language bindings,
database drivers, etc., Support  a large range of languages is requires
a lot of effort, therefore we have decided to emulate the
[PostgreSQL](http://www.postgresql.org/) wire protocol in HyPer. The
immediate benefit is that it is now possible to use HyPer with many
existing tools, including
[psql](http://www.postgresql.org/docs/9.4/static/app-psql.html) and the
[PostgreSQL JDBC driver](https://jdbc.postgresql.org/).

 To try it out, download the [updated
binary](http://www.hyper-db.com/downloads/hyperdemo-0.5.tar.xz), unpack
it, create a new database instance using


    bin/hyperdb --initdb mydatabase



 And start the database server (note that you need to add -i is you plan
to use TCP, for example for the JDBC driver)
    bin/hyperdb mydatabase



 Now we can connect using the regular PostgerSQL tools, for example by
using

    psql -h /tmp -p 7483



 The PostgreSQL wire protocol emulation is still relatively new, but it
should be usable already. Please send us a note if you encounter bugs or
missing features.

 A more detailed description of how to use that setup together with the
DBT-3 setup can be found [here](https://github.com/muehlbau/dbt3). We
had to fix some bugs in the original DBT-3 release to get it running,
but now we can run nearly exactly the same benchmark script in PostgrSQL
and HyPer (we are working on fixing the remaining issues).

 Of course while we want to emulate the PostgreSQL interface for
compatibility reasons, the actual implementation is completely
different. We have some performance numbers for SF-10 on
[PostgreSQL](http://www-db.in.tum.de/~muehlbau/dbt3/sf10/postgres/) and
on [HyPer](http://www-db.in.tum.de/~muehlbau/dbt3/sf10/hyper/) online,
and the composite score of HyPer is roughly a factor 45 better than the
score of PostgreSQL.


---
layout: post
title: Database Recovery - Basic Concepts
date: 2016-03-01
categories: [computer science]
tags: [data management]

---

The Database Recovery Process: Basic Concepts
=============================================================================

Reconstructing the contents of all or part of a database from a backup
typically involves two phases: retrieving a copy of the datafile from a
backup, and reapplying changes to the file since the backup from the
archived and online redo logs, to bring the database to a desired SCN
since the backup (usually, the present).

To restore a datafile or control file
from backup is to retrieve the file onto disk from a backup location on
tape, disk or other media, and make it available to the database server.

To <span class="bold">recover</span> a datafile (also called <span
class="bold">performing recovery</span> on a datafile), is to take a
restored copy of the datafile and apply to it changes recorded in the
database's redo logs. To recover a whole database is to perform recovery
on each of its datafiles.

Figure 1-1 illustrates the basic principle of backing up,
restoring, and recovering a database. Most of the data recovery
procedures supported by the Oracle database are variations on the
process described here.

Figure 1-1. Restoring and Recovering a Database

![Description of Figure 1-1
follows](https://docs.oracle.com/cd/B19306_01/backup.102/b14192/img/brbsc002.gif )

Description of "Figure 1-1 Restoring and Recovering a Database"

In this example a full backup of a database (copies of its datafiles and
control file) is taken at SCN 100. Redo logs generated during the
operation of the database capture all changes that occur between SCN 100
and SCN 500. Along the way, some logs fill and are archived. At SCN 500,
the datafiles of the database are lost due to a media failure. The
database is then returned to its transaction-consistent state at SCN
500, by restoring the datafiles from the backup taken at SCN 100, then
applying the transactions captured in the archived and online redo logs
and undoing the uncomitted transactions.

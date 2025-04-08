---
layout: post
title: How Apache Hadoop YARN HA Works
date: 2014-05-09
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [How Apache Hadoop YARN HA Works](https://blog.cloudera.com/blog/2014/05/how-apache-hadoop-yarn-ha-works/)
* Authors: Karthik Kambatla, Wing Yew Poon, and Vikram Srivastava

[![](http://sungsoo.github.com/images/resourcemanager.png)](http://sungsoo.github.com/images/resourcemanager.png)

# How Apache Hadoop YARN HA Works 

**Thanks to recent work upstream, YARN is now a highly available
service. This post explains its architecture and configuration
details.**

YARN, the next-generation compute and resource management framework in
Apache Hadoop, until recently had a single point of failure: the
ResourceManager, which coordinates work in a YARN cluster. With planned
(upgrades) or unplanned (node crashes) events, this central service, and
YARN itself, could become unavailable.

This post details Cloudera’s recent work in the Hadoop community
([YARN-149](https://issues.apache.org/jira/browse/YARN-149)) to make the
ResourceManager (and thus YARN) highly available. We’ll also explain the
high-level design for how the ResourceManager’s active state is
preserved (state store), and how ResourceManagers fail-over to achieve
high availability (HA). We also outline how to deploy an HA cluster, and
review some important configuration options.

# Background


CDH 5 (and Apache Hadoop 2.x) ship YARN as the vehicle to manage cluster
resources, and share the said resources among compute frameworks like
MapReduce, Impala, and Apache Spark. In [previous
posts](http://blog.cloudera.com/blog/category/yarn/), you have learned
the [high-level architecture of
YARN](http://blog.cloudera.com/blog/2012/02/mapreduce-2-0-in-hadoop-0-23/),
and how to migrate from MR1 to MR2/YARN for
[users](http://blog.cloudera.com/blog/2013/11/migrating-to-mapreduce-2-on-yarn-for-users/)
and [cluster
admins](http://blog.cloudera.com/blog/2013/11/migrating-to-mapreduce-2-on-yarn-for-operators/).

To briefly re-cap, YARN has a master/worker architecture (see below);
the master (the ResourceManager) manages the resources on the workers
and schedules work in the cluster. Furthermore, the ResourceManager
handles all client interactions.

[![](http://blog.cloudera.com/wp-content/uploads/2013/11/mr21.png "mr2")](http://blog.cloudera.com/wp-content/uploads/2013/11/mr21.png)

**YARN’s master/worker architecture**

As you can see, the ResourceManager is an obvious single point of
failure!

# Design for HA


ResourceManager HA is realized through an Active/Standby architecture:
one ResourceManager is Active, and one or more ResourceManagers are in
Standby mode waiting to take over should anything happen to the Active:

 

![](http://blog.cloudera.com/wp-content/uploads/2014/05/Client_Failover.png "diagram_Client_Failover")\
**YARN HA design**

Below, you’ll learn how the store enables restarting the ResourceManager
without losing any state, restarting an ResourceManager in a
single-ResourceManager cluster, and failing over between
ResourceManagers when there are multiple ResourceManagers in the
cluster.

## ResourceManager State Store

The `ResourceManagerStateStore` enables storing the internal state of
the ResourceManager (applications and their attempts, delegation tokens,
and version information). The state of the cluster (resource consumption
on individual nodes) is not stored because it can be easily
reconstructed when the NodeManagers heartbeat to the “new”
ResourceManager.

There are three possible implementations of the state store:

-   Memory-based implementation (primarily for testing)
-   Filesystem-based implementation (HDFS or local filesystems can be
    used)
-   Apache ZooKeeper-based implementation

We recommend using the ZooKeeper-based implementation when there are
multiple ResourceManagers to ensure one assumes the Active role.

## ResourceManager Restart

With the state store enabled, an ResourceManager, on restart, loads the
internal application state from the store. The scheduler reconstructs
its state when each node heartbeats. A new attempt is spawned for each
managed application previously submitted to the ResourceManager.
Applications can checkpoint periodically to avoid losing any work; the
MR ApplicationMaster checkpoints completed tasks, so the completed tasks
need not be re-run on ResourceManager restart.

## ResourceManager Failover

ResourceManager failover is an extension of ResourceManager restart.
When the cluster is configured to have multiple ResourceManagers (two or
more – one Active, others Standby), one of the Standby ResourceManagers
takes over if/when the Active ResourceManager goes down. On startup,
each ResourceManager starts in the Standby mode — the process is
started, but the state is not loaded. When transitioning to Active, the
ResourceManager loads the internal state from the designated state store
and starts all the internal services to assume the Active
ResourceManager duties. The stimulus to transition-to-active comes from
either the admin (through CLI) or through the integrated failover
controller when automatic failover is enabled.

*Fencing\
*In a multi-ResourceManager cluster, there is a risk of more than one
ResourceManager assuming the Active role. This can lead to a split-brain
situation, where each ResourceManager controls a subset of the resources
in the cluster and handles client requests. To avoid this split-brain
condition, a “fencing” mechanism is required by which an Active
ResourceManager disallows other ResourceManagers to assume the Active
role. The ZooKeeper-based state store (ZKResourceManagerStateStore)
implicitly allows write access to a single ResourceManager at any point
in time, and hence is the recommended state store to use in an HA
cluster. When using the ZKResourceManagerStateStore, there is no need
for a separate fencing mechanism to address a potential split-brain
situation where multiple ResourceManagers assume the Active role.

The ZooKeeper state store achieves this implicit fencing through ACLs.
All the ResourceManagers have shared read-write-admin access to the
store, but only the Active has create-delete access. A ResourceManager
claims this create-delete access while transitioning to Active. At this
point, any other ResourceManager that previously had create-delete
access loses access, fails to make changes to the store, and transitions
itself to Standby. By having each ResourceManager create a dummy znode
every so often (10 seconds, by default), a ResourceManager is always
informed of its access to the store.

*Automatic failover though embedded leader election (Recommended)*\
 ResourceManagers use ZooKeeper-based `ActiveStandbyElector` to decide
which ResourceManager should be the Active. When the Active goes down or
becomes unresponsive, another ResourceManager is automatically elected
to be the Active and takes over. (Note that this elector is embedded in
the ResourceManager, and hence there is no need to run a separate
`ZooKeeperFailoverController` (ZKFC) daemon as is the case for HDFS
NameNode HA.)

*Manual failover (Not recommended)*\
 When automatic failover is not enabled, admins have to manually
transition one of the ResourceManagers to Active. To failover from one
ResourceManager to the other, they are expected to first transition the
Active ResourceManager to Standby and transition a Standby
ResourceManager to Active. All this can be done using the `yarn rmadmin`
CLI.

*Client failover*\
 When there are multiple ResourceManagers, the YARN configuration
(`yarn-site.xml`) used by clients and nodes is expected to list all the
ResourceManagers. Clients, ApplicationMasters, and NodeManagers try
connecting to the ResourceManagers in a round-robin fashion until they
hit the Active ResourceManager. If the Active goes down, they resume the
round-robin polling until they hit the “new” Active.

# Deploying an HA Cluster


One can set up an HA cluster with or without using Cloudera Manager. We
recommend using it, because all you have to do is click a few buttons!

## Deploying an HA Cluster using Cloudera Manager (Recommended)

Cloudera Manager 5 provides a simple wizard to enable high availability
for YARN ResourceManager similar to other services like HDFS, MapReduce,
and Oozie. The wizard takes care of adding the second ResourceManager
and setting all configuration properties needed for HA setup. To get to
the wizard, go to your YARN service in Cloudera Manager and under
“Actions”, click on “Enable High Availability”.

[![](http://blog.cloudera.com/wp-content/uploads/2014/04/yarnha-3.png "yarnha-3")](http://blog.cloudera.com/wp-content/uploads/2014/04/yarnha-3.png)

**Kicking-off the Cloudera Manager wizard for YARN HA**

The next page in the wizard asks you to specify the host where the new
ResourceManager should start.

[![](http://blog.cloudera.com/wp-content/uploads/2014/04/yarnha-4.png "yarnha-4")](http://blog.cloudera.com/wp-content/uploads/2014/04/yarnha-4.png)

**Specifying the host**

Finally, Cloudera Manager starts the workflow that enables HA, restarts
all the dependent services of YARN so that they can pick up the new
ResourceManager, and deploys the client configuration.

[![](http://blog.cloudera.com/wp-content/uploads/2014/04/yarnha-5.png "yarnha-5")](http://blog.cloudera.com/wp-content/uploads/2014/04/yarnha-5.png)

**YARN HA workflow in progress**

## Deploying an HA Cluster Manually

Steps:

1.  To enable HA, set `yarn.resourcemanager.ha.enabled` to true in
    `yarn-site.xml`.
2.  YARN uses identifiers (rm-ids) as logical names for each
    resourcemanager. Set `yarn.resourcemanager.ha.rm-ids` to the list of
    identifiers you wish to use; for example, `rm1,rm2` (the value is a
    comma-separated list).
3.  For each of the identifiers (corresponding to each ResourceManager),
    define `yarn.resourcemanager.hostname.` (should be the hostname of
    the ResourceManager). Alternatively, you can define the addresses
    for that ResourceManager: `yarn.resourcemanager.address`,
    `yarn.resourcemanager.scheduler.address`, and so on. (See the [CDH5
    documentation](http://www.google.com/url?q=http%3A%2F%2Fwww.cloudera.com%2Fcontent%2Fcloudera-content%2Fcloudera-docs%2FCDH5%2Flatest%2FCDH5-High-Availability-Guide%2Fcdh5hag_cfg_RM_HA.html&sa=D&sntz=1&usg=AFQjCNF46oYXaZgP2SSbiQ2fT8nKxh1eYw)
    for more details.) NodeManagers and clients use the configured
    addresses to find the ResourceManager service they need to talk to.
    They go through the list of rm-ids and successively try the address
    corresponding to each rm-id.

## Enabling Recovery

For a YARN application to complete successfully, both the
ApplicationMaster and the ResourceManager must be live. Containers with
completed tasks need to report to the ApplicationMaster, which in turn
needs to report to the ResourceManager to commit the job completion.
Recovery is controlled via configs:

1.  To enable recovering applications on ResourceManager
    restart/failover, set `yarn.resourcemanager.recovery.enabled` to
    true.
2.  The maximum number of times any YARN application can be recovered is
    set by `yarn.resourcemanager.am.max-attempts`; we recommend setting
    this global limit to a high value.

When a ResourceManager dies and is restarted, or fails over to another
ResourceManager in the case of an HA cluster, the newly active
ResourceManager instructs running ApplicationMasters to abort
([YARN-556](https://issues.apache.org/jira/browse/YARN-556)). This uses
up an application attempt. Also, if the ResourceManager is down for some
time and the ApplicationMaster is unable to connect, it will timeout and
abort. That uses up an application attempt too. When a new
ResourceManager becomes active, it can recover applications with failed
attempts that have not exceeded their max-attempts.

For MapReduce running on YARN (aka MR2), the MR ApplicationMaster plays
the role of a per-job jobtracker. MRAM failure recovery is controlled by
the property, `mapreduce.am.max-attempts`. This property may be set per
job. If its value is greater than 1, then when the ApplicationMaster
dies, a new one is spun up for a new application attempt, up to the
max-attempts. When a new application attempt is started, in-flight tasks
are aborted and rerun but completed tasks are not rerun.

## State Store Configuration

As mentioned previously, we recommend using the ZooKeeper-based
ResourceManager state store implementation:

1.  Set `yarn.resourcemanager.store.class` to
    `org.apache.hadoop.yarn.server.resourcemanager.recovery.ZKResourceManagerStateStore`.
2.  Set `yarn.resourcemanager.zk-address` to the address of the
    ZooKeeper ensemble (a comma-separated list of hosts, optionally with
    port if not using the default port of 2181).

## Failover

1.  To configure automatic ResourceManager failover, set
    `yarn.resourcemanager.ha.automatic-failover.enabled` to true.
2.  In addition, we recommend setting
    `yarn.resourcemanager.ha.automatic-failover.embedded` to true; this
    uses the `EmbeddedElectorService` to pick an active ResourceManager.
3.  Also, you need to configure `yarn.resourcemanager.cluster-id` for
    the cluster; this name is used for electing the active
    ResourceManager.

The web UI of the standby ResourceManager will automatically redirect to
that of the active ResourceManager, which is convenient. If you want to
ascertain the HA status of a particular ResourceManager in an HA
cluster, you can go to the `/cluster/cluster` page of the
ResourceManager web address (this page does not redirect), or you can
use the REST API, by going to `/ws/v1/cluster/info` of the web address.

# What’s Next?

Currently, all in-flight work is interrupted on ResourceManager
restart/failover. While this approach doesn’t hurt applications with
short-lived tasks like MapReduce, restarting long-running applications
can lead to losing significant amount of internal task/application state
and would be nice to avoid. [Working-preserving ResourceManager
restart](https://issues.apache.org/jira/browse/YARN-556) aims to do
exactly that: all ApplicationMaster and task containers continue running
and “resync” with the “new” ResourceManager.

The community is also working on work-preserving restart for the
NodeManager (worker;
[YARN-1336](https://issues.apache.org/jira/browse/YARN-1336)) and the
ApplicationMaster
([YARN-1489](https://issues.apache.org/jira/browse/YARN-1489)) to
complement ResourceManager high availability. With all these pieces in
place, one would be able to do a rolling restart on a YARN cluster
without losing any work at all!

## Acknowledgements

Several people in the Hadoop community have contributed to improving the
availability of YARN. In particular, Alejandro Abdelnur, Arpit Gupta,
Bikas Saha, Hitesh Shah, Jian He, Sandy Ryza, Tom White, Tsuyoshi Ozawa,
Vinod Kumar Vavilapalli, Xuan Gong, and Zhijie Shen all played a major
role in design, implementation, testing, and code reviews. Insights from
Aaron T Myers, Patrick Hunt, Phil Zeyliger, Santhosh Srinivasan, and
Todd Lipcon also helped us arrive at the final design.

*Karthik Kambatla, Wing Yew Poon, and Vikram Srivastava are Software
Engineers at Cloudera. Karthik is also a Hadoop committer.*

---
layout: post
title: Apache Hadoop YARN – ResourceManager
date: 2014-03-01 
categories: [computer science]
tags: [big data, yarn]

---

Apache Hadoop YARN – ResourceManager
---

**ResourceManager (RM)** is the master that arbitrates all the available cluster resources and thus helps manage the distributed applications running on the YARN system. It works together with the per-node **NodeManagers (NMs)** and the per-application **ApplicationMasters (AMs)**.

1. **NodeManagers** take instructions from the ResourceManager and manage resources available on a single node.
2. **ApplicationMasters** are responsible for negotiating resources with the ResourceManager and for working with the NodeManagers to start the containers.

---

**리소스매니저**는 모든 가용한 클러스터 자원을 중재하는 마스터이고, 그렇기 때문에 얀 시스템에서 동작 중인 분산 응용프로그램을 관리하는 것을 돕는다. 리소스마스터는 노드 당 설치되는 노드마스터, 응용프로그램당 생성되는 애플리케이션마스터와 함께 동작한다.

1. **노드매니저**는 리소스매니저로부터 명령을 받고 단일 노드상의 자원들을 가용하게 관리한다.
2. **애플리케이션마스터**는 리소스매니저와 자원을 협상하는 역할을 하며 컨테이너들이 시작할 수 있도록 노드매니저와 함께 동작한다.


### Diagram of resource manager components

![](http://sungsoo.github.com/images/resource_manager_small.gif)

ResourceManager Components
---

The ResourceManager has the following components (see the figure above):

1. Components interfacing RM to the clients:
	* **ClientService**: The client interface to the Resource Manager. This component handles all the RPC interfaces to the RM from the clients including operations like application submission, application termination, obtaining queue information, cluster statistics etc.
	* **AdminService**: To make sure that admin requests don’t get starved due to the normal users’ requests and to give the operators’ commands the higher priority, all the admin operations like refreshing node-list, the queues’ configuration etc. are served via this separate interface.
2. Components connecting RM to the nodes:
	* **ResourceTrackerService**: This is the component that responds to RPCs from all the nodes. It is responsible for registration of new nodes, rejecting requests from any invalid/decommissioned nodes, obtain node-heartbeats and forward them over to the YarnScheduler. It works closely with NMLivelinessMonitor and NodesListManager described below.
	* **NMLivelinessMonitor**: To keep track of live nodes and specifically note down the dead nodes, this component keeps track of each node’s its last heartbeat time. Any node that doesn’t heartbeat within a configured interval of time, by default 10 minutes, is deemed dead and is expired by the RM. All the containers currently running on an expired node are marked as dead and no new containers are scheduling on such node.
	* **NodesListManager**: A collection of valid and excluded nodes. Responsible for reading the host configuration files specified via `yarn.resourcemanager.nodes.include-path` and `yarn.resourcemanager.nodes.exclude-path` and seeding the initial list of nodes based on those files. Also keeps track of nodes that are decommissioned as time progresses.
3. Components interacting with the per-application AMs:
	* **ApplicationMasterService**: This is the component that responds to RPCs from all the AMs. It is responsible for registration of new AMs, termination/unregister-requests from any finishing AMs, obtaining container-allocation & deallocation requests from all running AMs and forward them over to the YarnScheduler. This works closely with AMLivelinessMonitor described below.
	* **AMLivelinessMonitor**: To help manage the list of live AMs and dead/non-responding AMs, this component keeps track of each AM and its last heartbeat time. Any AM that doesn’t heartbeat within a configured interval of time, by default 10 minutes, is deemed dead and is expired by the RM. All the containers currently running/allocated to an AM that gets expired are marked as dead. RM schedules the same AM to run on a new container, allowing up to a maximum of 4 such attempts by default.
4. The core of the ResourceManager – the scheduler and related components:
	* **ApplicationsManager**: Responsible for maintaining a collection of submitted applications. Also keeps a cache of completed applications so as to serve users’ requests via web UI or command line long after the applications in question finished.
	* **ApplicationACLsManager**: RM needs to gate the user facing APIs like the client and admin requests to be accessible only to authorized users. This component maintains the ACLs lists per application and enforces them whenever an request like killing an application, viewing an application status is received.
	* **ApplicationMasterLauncher**: Maintains a thread-pool to launch AMs of newly submitted applications as well as applications whose previous AM attempts exited due to some reason. Also responsible for cleaning up the AM when an application has finished normally or forcefully terminated.
	* **YarnScheduler**: The Scheduler is responsible for allocating resources to the various running applications subject to constraints of capacities, queues etc. It performs its scheduling function based on the resource requirements of the applications such as memory, CPU, disk, network etc. Currently, only memory is supported and support for CPU is close to completion.
	* **ContainerAllocationExpirer**: This component is in charge of ensuring that all allocated containers are used by AMs and subsequently launched on the correspond NMs. AMs run as untrusted user code and can potentially hold on to allocations without using them, and as such can cause cluster under-utilization. To address this, ContainerAllocationExpirer maintains the list of allocated containers that are still not used on the corresponding NMs. For any container, if the corresponding NM doesn’t report to the RM that the container has started running within a configured interval of time, by default 10 minutes, the container is deemed as dead and is expired by the RM.
5. **TokenSecretManagers (for security)**:ResourceManager has a collection of SecretManagers which are charged with managing tokens, secret-keys that are used to authenticate/authorize requests on various RPC interfaces. A future post on YARN security will cover a more detailed descriptions of the tokens, secret-keys and the secret-managers but a brief summary follows:
	* **ApplicationTokenSecretManager**: To avoid arbitrary processes from sending RM scheduling requests, RM uses the per-application tokens called ApplicationTokens. This component saves each token locally in memory till application finishes and uses it to authenticate any request coming from a valid AM process.
	* **ContainerTokenSecretManager**: SecretManager for ContainerTokens that are special tokens issued by RM to an AM for a container on a specific node. ContainerTokens are used by AMs to create a connection to the corresponding NM where the container is allocated. This component is RM-specific, keeps track of the underlying master and secret-keys and rolls the keys every so often.
	* **RMDelegationTokenSecretManager**: A ResourceManager specific delegation-token secret-manager. It is responsible for generating delegation tokens to clients which can be passed on to unauthenticated processes that wish to be able to talk to RM.
6. **DelegationTokenRenewer**: In secure mode, RM is Kerberos authenticated and so provides the service of renewing file-system tokens on behalf of the applications. This component renews tokens of submitted applications as long as the application runs and till the tokens can no longer be renewed.

---

리소스매니저는 다음의 구성요소를 가지고 있다.

1. 리소스매니저와 클라이언트간의 통신을 하는 구성요소  
	* **ClientService**: 리소스매니저의 클라이언트 인터페이스이다. 이 요소는 응용프로그램 제출, 응용프로그램 종료, 큐 정보 획득, 클러스터 상태 등의 클라이언트에서 RM으로 오는 모든 RPC 인터페이스를 관리한다. 
	* **AdminService**: 관리 요청이 일반 사용자 요청때문에 서비스를 받지 못하는 경우가 없도록, 그리고 더 높은 우선순위를 가지도록 하기 위해서 노드-목록 갱신, 큐의 설정 등의 관리 명령은 이 별도의 인터페이스를 통하여 수행된다.  

2. RM과 노드를 연결하는 구성요소  
	* **ResourceTrackerService**: 이 요소는 모든 노드에서 오는 RPC에 응답한다. 또한 새 노드의 등록, 유효하지 않거나 퇴역한 노드로부터의 연결 거부, 노드의 하트비트 획득과 스케쥴러로의 전달을 책임지고 있다. 이 요소는 다음의 NMLivelinessMonitor와 매우 밀접하게 연관되어 있다.
	* **NMLivelinessMonitor**: 운영되고 있는 노드들을 추적하고 내려간(정지한) 노드를 명확히 하기 위해서 이 구성요소는 각 노드의 마지막 하트비트 시간을 추적한다. 미리 정의된 간격의 시간내에 하트비트를 보내지 않는 어떠한 노드든 정지한 것으로 여기고 RM에 의해서 만료된다. 만료된 노드에서 현재 수행중인 모든 컨테이너는 정지한 것으로 표시되고 이후로 만료된 노드에는 어떠한 새 컨테이너도 배정하지 않습니다.
	* **NodesListManager**: 유효 및 제외된 노드의 집합이다. `yarn.resourcemanager.nodes.include-path`와 `yarn.resourcemanager.nodes.exclude-path`에 설정된 호스트 설정 파일을 읽고 그 파일들에 기반하여 초기 노드 목록을 생성할 책임이 있다. 또한 시간이 진행됨에 따라 퇴역한 노드에 대한 추적을 유지해야 한다.
3. 애플리케이션당 생성되는 AM과 통신하는 구성요소
	* **ApplicationMasterService**: 이 요소는 모든 AM들과의 RPC를 책임진다. 이 요소는 새 AM의 등록과 종료된 AM으로부터 보내오는 종료/해제 요청, 현재 동작중인 모든 AM으로부터의 컨테이터 배치/해제 요청을 받아 YarnScheduler로 전송하는 역할을 책임진다. 이 요소는 아래에 설명된 AMLivelinessMonitor와 밀접하게 연관되어 있다.
	* **AMLivelinessMonitor**: 동작, 정지/응답없는 AM들의 관리를 돕기 위해서 이 요소는 각 AM의 추적과 마지막 하트비트 시간을 유지한다. 미리 정의된 간격의 시간내에 하트비트를 보내지 않는 어떠한 AM이든 정지한 것으로 여기고 RM에 의해서 만료된다. 만료된 AM에서 현재 수행중인 모든 컨테이너는 정지(dead)한 것으로 표시한다. RM은 동일한 AM을 새 컨테이너에서 동작시키기 위해 스케쥴한다. 이러한 동작은 최대 4번 시도될 수 있다.
4. RM의 핵심 - 스케쥴러와 관련 구성 요소
	* **ApplicationsManager**: 제출된 응용프로그램의 집합을 관리할 책임이 있음. 또한 완료된 응용프로그램의 캐시를 유지하여 웹 UI나 명령행을 통한 사용자의 요청에 대해 응답함.
	* **ApplicationACLsManager**: RM은 클라이언트와 어드민에 권한이 있는 사용자만 접근을 허락하는 문이 필요하다. 이 구성요소는 ACL(Access-Control-List)들을 응용프로그램별로 관리하면서 응용프로그램의 중단, 응용프로그램의 상태 요청등이 있을 때 권한을 강제한다.
	* **ApplicationMasterLauncher**: 어떠한 요청으로 인하여 종료괸 이전의 AM 시도들과 함께 새로 제출된 AM을 실행하기 위한 스레드 풀을 관리한다. 또한 응용프로그램이 정상적으로 혹은 강제로 종료되었을 경우 AM을 청소할 책임을 가지고 있다.
	* **YarnScheduler**: 스케쥴러는 자원들을 수용력, 큐 등의 제한을 조건으로 현재 실행중인 다양한 응용프로그램에 할당할 책임이 있다. 스케쥴러는 메모리, CPU, 디스크, 네트워크 등, 응용프로그램의 자원 요구사항에 기반하여 스케쥴링 함수를 동작시킨다. 현재 메모리만이 지원되고 있으며 CPU에 대한 지원이 완성되기 직전이다.
	* **ContainerAllocationExpirer**: 이 구성요소는 모든 할당된 컨테이너들이 AM들에 의해서 사용되고 있으며 차후에 컨테이너가 해당되는 노드메니저에서 실행되는지 확인할 책임이 있다. AM들은 신뢰할 수 없는 사용자 코드로 실행되며 컨테이너를 사용하지 않고 할당을 유지할 수 있을 수 있으며, 이에 따라 클러스터 사용률이 저하될 수 있다. 이 문제를 해결하기 위해서, 	* **ContainerAllocationExpirer**는 해당하는 노드에서 사용되고 있지 않는 할당된 컨테이너들의 목록을 유지한다.어떠한 컨테이너이든 해당하는 노드매니저가 정해진 시간- 기본 10분 -안에 RM으로 컨테이너가 동작을 시작하였다고 보고하지 않으면 컨테이너는 정지했다고 가정하고 RM에의해 만료된다.
5. **TokenSecretManagers**(보안을 위해): 리소스매니저는 토큰, 다양한 RPC 인터페이스에서 인증/허가를 위해 사용되는 비밀키를 관리하기 위해 몇개의 SecretManager를 가지고 있다. 얀 보안에 대한 미래의 글에는 토큰, 비밀키, SecretManager들에 대한 설명을 할 것이며, 현재는 다음의 대략적인 설명만 한다.
	* **ApplicationTokenSecretManager**: RM 스케쥴링 요청을 전송하는 독단적인 프로세스를 피하기 위해 RM은 ApplicationToken이라는 응용프로그램별 토큰을 사용한다. 이 구성요소는 각 토큰을 응용 프로그램이 종료되기전까지 지역적으로 메모리에 저장하고 유효한 AM 프로세스로부터 오는 모든 요청을 인증하기 위해 사용한다.
	* **ContainerTokenSecretManager**: RM에 의해 특정한 노드에 있는 컨테이너를 위해 AM에게 발급하는 특별한 토큰인 ContainerToken을 위한 SecretManager이다. ContainerToken은 컨테이너가 할당된 해당하는 노드매니저와 연결을 생성하기 위해 AM에 의해 사용된다. 이 구성요소는 RM 특정이며 근본적인 마스터와 비밀키를 기록하고 가끔 키를 롤한다.
	* **RMDelegationTokenSecretManager**: 리소스매니저 특정 위임 토큰 SecretManager이다. 이 구성요소는 RM과 통신이 가능하기를 원하는 인증되지않은 프로세서에게 전달할 가능성이 있는 클라이언트에게 위임 토큰을 생성할 책임이 있다.
6. **DelegationTokenRenewer**: 보안 모드에서 RM은 Kerberos로 인증되며 응용프로그램을 대신하여 파일 시스템 토큰을 갱신하는 서비스를 제공해야 한다. 이 구성요소는 응용프로그램이 동작하는 동안 그리고 토큰이 갱신할 수 없기 전까지 제출된 응용프로그램의 토큰을 갱신한다.


Conclusion
---

In YARN, the **ResourceManager** is primarily limited to *scheduling* i.e. only arbitrating available resources in the system among the competing applications and not concerning itself with *per-application state management*. Because of this clear separation of responsibilities coupled with the modularity described above, and with the powerful scheduler API discussed in the previous post, RM is able to address the most important design requirements – *scalability*, support for alternate programming paradigms.

---

얀에서 리소스매니저는 주로 스케쥴링, 단지 시스템에 있는 가용한 자원들을 경쟁관계에 있는 응용프로그램들 사이에 중재만 하는 것으로 한정되어 있으며 응용프로그램별 상태 관리는 고려하지 않는다. 이러한 분명한 책임 구분과 짝을 이룬 모듈 방식 그리고 강력한 스케쥴러 API로 인하여 RM은 가장 중요한 설계 요구조건인 확장성과 다른 프로그래밍 모델의 지원을 해결할 수 있다.

To allow for different policy constraints, the scheduler described above in the RM is *pluggable* and allows for different algorithms. In a future post of this series, we will dig deeper into various features of **CapacityScheduler** that schedules containers based on capacity guarantees and queues.

References
---
[1] Vinod Kumar Vavilapalli, [*Apache Hadoop YARN – ResourceManager*](http://hortonworks.com/blog/apache-hadoop-yarn-resourcemanager/), August 2012.  
[2] [Apache tez](http://incubator.apache.org/projects/tez.html). http://incubator.apache.org/projects/tez.html.   
[3] [Netty project](http://netty.io). http://netty.io.  
[4] [Storm](http://storm-project.net/). http://storm-project.net/.  
[5] H.Ballani, P.Costa, T.Karagiannis, and A.I.Rowstron. Towards predictable datacenter networks. In *SIGCOMM*, volume 11, pages 242–253, 2011.  
[6] F.P.Brooks,Jr. *The mythical man-month (anniversary ed.)*. Addison-Wesley Longman Publishing Co., Inc., Boston, MA, USA, 1995.  
[7] N. Capit, G. Da Costa, Y. Georgiou, G. Huard, C. Martin, G. Mounie, P. Neyron, and O. Richard. A batch scheduler with high level components. In *Cluster Computing and the Grid, 2005. CC-Grid 2005. IEEE International Symposium on*, volume 2, pages 776–783 Vol. 2, 2005.  
[8] R. Chaiken, B. Jenkins, P.-A. Larson, B. Ramsey, D. Shakib, S. Weaver, and J. Zhou. Scope: easy and efficient parallel processing of massive data sets. *Proc. VLDB Endow.*, 1(2):1265–1276, Aug. 2008.  
[9] M. Chowdhury, M. Zaharia, J. Ma, M. I. Jordan, and I. Stoica. Managing data transfers in computer clusters with orchestra. *SIGCOMM- Computer Communication Review*, 41(4):98, 2011.  
[10] B.-G. Chun, T. Condie, C. Curino, R. Ramakrishnan, R. Sears, and M. Weimer. Reef: Retainable evaluator execution framework. In *VLDB 2013*, Demo, 2013.  
[11] B. F. Cooper, E. Baldeschwieler, R. Fonseca, J. J. Kistler, P. Narayan, C. Neerdaels, T. Negrin, R. Ramakrishnan, A. Silberstein, U. Srivastava, et al. Building a cloud for Yahoo! *IEEE Data Eng. Bull.*, 32(1):36–43, 2009.  
[12] J. Dean and S. Ghemawat. MapReduce: simplified data processing on large clusters. *Commun. ACM*, 51(1):107–113, Jan. 2008.  
[13] W. Emeneker, D. Jackson, J. Butikofer, and D. Stanzione. Dynamic virtual clustering with xen and moab. In G. Min, B. Martino, L. Yang, M. Guo, and G. Rnger, editors, *Frontiers of High Performance Computing and Networking, ISPA 2006 Workshops*, volume 4331 of Lecture Notes in Computer Science, pages 440–451. Springer Berlin Heidelberg, 2006.  
[14] Facebook Engineering Team. *Under the Hood: Scheduling MapReduce jobs more efficiently with Corona*. http://on.fb.me/TxUsYN, 2012.  
[15] D. Gottfrid. *Self-service prorated super-computing fun*. http://open. blogs.nytimes.com/2007/11/01/self-service-prorated-super-computing-fun, 2007.  
[16] T. Graves. *GraySort and MinuteSort at Yahoo on Hadoop 0.23*. http://sortbenchmark. org/Yahoo2013Sort.pdf, 2013.  
[17] B. Hindman, A. Konwinski, M. Zaharia, A. Ghodsi, A. D. Joseph, R. Katz, S. Shenker, and I. Stoica. Mesos: a platform for fine-grained resource sharing in the data center. In *Proceedings of the 8th USENIX conference on Networked systems design and implementation, NSDI’11*, pages 22–22, Berkeley, CA, USA, 2011. USENIX Association.  
[18] M. Isard, M. Budiu, Y. Yu, A. Birrell, and D. Fetterly. Dryad: distributed data-parallel programs from sequential building blocks. In *Proceedings of the 2nd ACM SIGOPS/EuroSys European Conference on Computer Systems 2007, EuroSys ’07*, pages 59–72, New York, NY, USA, 2007. ACM.  
[19] M. Islam, A. K. Huang, M. Battisha, M. Chiang, S. Srinivasan, C. Peters, A. Neumann, and A. Abdelnur. Oozie: towards a scalable workflow management system for hadoop. In *Proceedings of the 1st ACM SIGMOD Workshop on Scalable Workflow Execution Engines and Technologies*, page 4. ACM, 2012.  
[20] D. B. Jackson, Q. Snell, and M. J. Clement. Core algorithms of the maui scheduler. In *Revised Papers from the 7th International Workshop on Job Scheduling Strategies for Parallel Processing, JSSPP ’01*, pages 87–102, London, UK, UK, 2001. Springer-Verlag.  
[21] S. Loughran, D. Das, and E. Baldeschwieler. [*Introducing Hoya – HBase on YARN*](http://hortonworks.com/blog/introducing-hoya-hbase-on-yarn/). http://hortonworks.com/blog/introducing-hoya-hbase-on-yarn/, 2013.  
[22] G. Malewicz, M. H. Austern, A. J. Bik, J. C. Dehnert, I. Horn, N. Leiser, and G. Czajkowski. Pregel: a system for large-scale graph processing. In *Proceedings of the 2010 ACM SIGMOD International Conference on Management of data, SIGMOD ’10*, pages 135–146, New York, NY, USA, 2010. ACM.  
[23] R. O. Nambiar and M. Poess. The making of tpcds. In *Proceedings of the 32nd international conference on Very large data bases, VLDB ’06*, pages 1049–1058. VLDB Endowment, 2006.  
[24] C. Olston, B. Reed, U. Srivastava, R. Kumar, and A. Tomkins. Pig Latin: a not-so-foreign language for data processing. In *Proceedings of the 2008 ACM SIGMOD international conference on Management of data, SIGMOD ’08*, pages 1099–1110, New York, NY, USA, 2008. ACM.  
[25] O.O’Malley. *Hadoop: The Definitive Guide*, chapter Hadoop at Yahoo!, pages 11–12. O’Reilly Media, 2012.  
[26] M. Schwarzkopf, A. Konwinski, M. Abd-El-Malek, and J. Wilkes. Omega: flexible, scalable schedulers for large compute clusters. In *Proceedings of the 8th ACM European Conference on Computer Systems, EuroSys ’13*, pages 351–364, New York, NY, USA, 2013. ACM.  
[27] K.Shvachko, H.Kuang, S.Radia, and R.Chansler. The Hadoop Distributed File System. In *Proceedings of the 2010 IEEE 26th Symposium on Mass Storage Systems and Technologies (MSST), MSST ’10*, pages 1–10, Washington, DC, USA, 2010. IEEE Computer Society.    
[28] T.-W. N. Sze. [*The two quadrillionth bit of π is 0!*](http://developer.yahoo.com/blogs/hadoop/two-quadrillionth-bit-0-467.html) http://developer.yahoo.com/blogs/hadoop/two-quadrillionth-bit-0-467.html.  
[29] D. Thain, T. Tannenbaum, and M. Livny. Distributed computing in practice: the Condor experience. *Concurrency and Computation: Practice and Experience*, 17(2-4):323–356, 2005.  
[30] A. Thusoo, J. S. Sarma, N. Jain, Z. Shao, P. Chakka, N. Z. 0002, S. Anthony, H. Liu, and R. Murthy. Hive - a petabyte scale data warehouse using Hadoop. In F. Li, M. M. Moro, S. Ghandeharizadeh, J. R. Haritsa, G. Weikum, M. J. Carey, F. Casati, E. Y. Chang, I. Manolescu, S. Mehrotra, U. Dayal, and V. J. Tsotras, editors, *Proceedings of the 26th International Conference on Data Engineering, ICDE 2010*, March 1-6, 2010, Long Beach, California, USA, pages 996–1005. IEEE, 2010.  
[31] Y. Yu, M. Isard, D. Fetterly, M. Budiu, U. Erlingsson, P. K. Gunda, and J. Currey. DryadLINQ: a system for general-purpose distributed data-parallel computing using a high-level language. In *Proceedings of the 8th USENIX conference on Operating systems design and implementation, OSDI’08*, pages 1–14, Berkeley, CA, USA, 2008. USENIX Association.  
[32] M. Zaharia, M. Chowdhury, M. J. Franklin, S. Shenker, and I. Stoica. Spark: cluster computing with working sets. In *Proceedings of the 2nd USENIX conference on Hot topics in cloud computing, HotCloud’10*, pages 10–10, Berkeley, CA, USA, 2010. USENIX Association.  
[33] Vinod Kumar Vavilapali, et. al, *Apache Hadoop YARN – Yet Another Resource Negotiator*, SoCC'13, 1-3 Oct. 2013, Santa Clara, California, USA.

---
layout: post
title: Apache Hadoop YARN – NodeManager
date: 2014-03-01 
categories: [computer science]
tags: [big data, yarn]

---

Apache Hadoop YARN – NodeManager
---

The **NodeManager (NM)** is YARN’s *per-node agent*, and takes care of the *individual compute nodes* in a Hadoop cluster. This includes keeping up-to date with the **ResourceManager (RM)**, overseeing *containers’ life-cycle management*; *monitoring resource usage* (memory, CPU) of individual containers, *tracking node-health*, *log’s management* and *auxiliary services* which may be exploited by different YARN applications.

**노드매니저(NM)**은 얀의 *노드 당 설치되는 에이전트*이며, 하둡 클러스터에 있는 *각각의 연산 노드들*을 관리한다. 노드매니저에는 리소스매니저로의 동기화, 컨테이너 생명주기 관리, 각 컨테이너가 사용하는 자원의 사용량 모니터링, 노드 상태/ 로그 관리/ 다른 얀 응용프로그램들이 사용할 수 있는 보조 서비스들을 추적한다.

NodeManager Components
---

![](http://sungsoo.github.com/images/Node-Manager-Diagram-Small.png)

### NodeStatusUpdater

On startup, this component registers with the RM and sends information about the resources available on the nodes. Subsequent NM-RM communication is to provide updates on container statuses – new containers running on the node, completed containers, etc.

In addition the RM may signal the NodeStatusUpdater to potentially kill already running containers.

시작할 때, NodeStatusUpdater는 RM에 등록을 수행하고, 가용한 노드상에 있는 자원 정보를 송신한다. 이후의 NM-RM 통신은 노드에서 동작중인 새 컨테이너, 완료된 컨테이너 등의 컨테이너 상태에 대한 업데이트를 제공한다.

추가로 RM은 이미 동작중인 컨테이너를 잠재적으로 종료하기 위해서 NodeStatusUpdater에게 신호를 줄 수 있다.

### ContainerManager

This is the core of the NodeManager. It is composed of the following sub-components, each of which performs a subset of the functionality that is needed to manage containers running on the node.

컨테이너매니저는 노드매니저의 핵심이다. 컨테이너매니저는, 노드에서 동작 중인 컨테이너를 관리하기 위해 필요한 기능의 일부를 수행하는 다음의 하위 구성요소를 가진다.

A. **RPC server**: ContainerManager accepts requests from Application Masters (AMs) to start new containers, or to stop running ones. It works with ContainerTokenSecretManager (described below) to authorize all requests. All the operations performed on containers running on this node are written to an audit-log which can be post-processed by security tools.  

B. **ResourceLocalizationService**: Responsible for securely downloading and organizing various file resources needed by containers. It tries its best to distribute the files across all the available disks. It also enforces access control restrictions of the downloaded files and puts appropriate usage limits on them.  

C. **ContainersLauncher**: Maintains a pool of threads to prepare and launch containers as quickly as possible. Also cleans up the containers’ processes when such a request is sent by the RM or the ApplicationMasters (AMs).  

D. **AuxServices**: The NM provides a framework for extending its functionality by configuring auxiliary services. This allows per-node custom services that specific frameworks may require, and still sandbox them from the rest of the NM. These services have to be configured before NM starts. Auxiliary services are notified when an application’s first container starts on the node, and when the application is considered to be complete.  

E. **ContainersMonitor**: After a container is launched, this component starts observing its resource utilization while the container is running. To enforce isolation and fair sharing of resources like memory, each container is allocated some amount of such a resource by the RM. The ContainersMonitor monitors each container’s usage continuously and if a container exceeds its allocation, it signals the container to be killed. This is done to prevent any runaway container from adversely affecting other well-behaved containers running on the same node.  

F. **LogHandler**: A pluggable component with the option of either keeping the containers’ logs on the local disks or zipping them together and uploading them onto a file-system.

---

A. **RPC server**: 컨테이너매니저는 애플리케이션마스터로부터 새로운 컨테이너를 시작하거나 동작중인 컨테이너를 정지시키는 요청을 받는다. ContainerManager는 아래에서 설명할  ContainerTokenSecretManager와 협력하여 모든 요청을 인증한다. 이 노드에서 수행중인 컨테이너에 대한 모든 연산은 보안 도구에 의해 후처리될 수 있는 로그에 기록된다.     

B. **ResourceLocalizationService**: 컨테이너가 필요한 다양한 파일 리소스를 안전하게 다운로드하고 관리할 책임이 있다. 이 구성요소는 가능한 모든 디스크에 파일을 분산하도록 최선을 다하여 시도한다. 또한 다운로드받은 파일들의 접근 권한과 적절한 사용량를 제한한다.  

C. **ContainersLauncher**: 컨테이너를 가능한 빠르게 준비하고 시작하기 위해서 스레드 풀을 유지한다. 또한 RM이나 AMs에서 보내진 요청이 있다면 컨테이너의 프로세스들을 정리한다.  

D. **AuxServices**: 노드매니저는 예비 서비스들을 설정하여 노드매니저의 기능을 확장하기 위한 프레임워크를 제공한다. 이 기능은 특정한 프레임워크들이 필요로 하는 노드 별 커스텀 서비스 사용을 허가하면서도 여전히 NM의 다른 부분으로부터 분리한다. 이러한 서비스들은 NM이 시작되기전에 설정되어야 한다. 예비 서비스들은 노드에서 응용프로그램의 첫번째 컨테이너가 시작되었을때와 응용프로그램이 완료되었다고 여겨질 때 통보받는다.  

E. **ContainersMonitor**: 컨테이너가 시작된 후 이 구성요소는 컨테이너가 실행되는 동안의 자원 사용 관측을 시작한다. 메모리같은 자원의 공평한 공유와 격리를 강제하기 위해서 각 컨테이너는 RM에 의해서 자원들의 일부를 할당받는다. ContainersMonitor는 각 컨테이너의 사용을 지속적으로 모니터링 하고, 컨테이너가 할당을 넘어선다면, 컨테이너를 종료시키기 위해 신호를 보낸다. 이 것은 탈주자 컨테이너가 동일한 노드에서 실행중인 다른 정상 동작하는 컨테이너들에게 영향을 주는 것을 막는다.  

F. **LogHandler**: 컨테이너의 로그들을 로컬 디스크에 유지하거나 압축하여 파일 시스템에 업로드할 수 있도록 설정할 수 있는 탈착가능한 구성요소이다.

### ContainerExecutor
Interacts with the underlying operating system to securely place files and directories needed by containers and subsequently to launch and clean up processes corresponding to containers in a secure manner.

이 구성요소는 컨테이너가 필요로하는 파일들과 디렉터리들을 안전하게 위치시키기 위해서 그리고 안전한 방법으로 컨테이너에 상응하는 프로세스들을 시작하거나 정리하기 위해서 밑 바탕의 운영체제와 상호작용한다.

### NodeHealthCheckerService
Provides functionality of checking the health of the node by running a configured script frequently. It also monitors the health of the disks specifically by creating temporary files on the disks every so often. Any changes in the health of the system are notified to NodeStatusUpdater (described above) which in turn passes on the information to the RM.

이 구성요소는 미리 구성된 스크립트를 주기적으로 실행하여 노드의 상태를 점검하는 기능을 제공한다. 또한 특히 디스크에 가끔 임시파일을 생성하여 디스크의 상태를 모니터링한다. 시스템의 모든 상태 변경은 정보를 차례차례 RM으로 전송하는 NodeStatusUpdater로 보고된다.

### Security

A. **ApplicationACLsManager**: NM needs to gate the user facing APIs like container-logs’ display on the web-UI to be accessible only to authorized users. This component maintains the ACLs lists per application and enforces them whenever such a request is received.  

B. **ContainerTokenSecretManager**: verifies various incoming requests to ensure that all the incoming operations are indeed properly authorized by the RM.

---

A. **ApplicationACLsManager**: NM은 허가된 사용자만 접근해야 하는 웹UI의 컨테이너 로그 디스플레이 같은 사용자 방향 API를 선별할 필요가 있다. 이 구성요소는 ACL(접근 조정 목록)을 응용프로그램별로 관리하며 그런 요청을 받았을 때 ACL을 강제한다.   

B. **ContainerTokenSecretManager**: 이 구성요소는 모든 동작이 RM에 의해서 인증되었는가 확실히 보장하기 위해서 다양한 도착 요청을 확인한다. 

### WebServer
Exposes the list of applications, containers running on the node at a given point of time, node-health related information and the logs produced by the containers.

응용프로그램, 주어진 시점에서 실행 중인 컨테이너들, 노드 상태에 관련된 정보들 그리고 컨테이너에 의해서 생성된 로그들의 목록을 보여준다.

Spotlight on Key Functionality
---

### Container Launch
To facilitate container launch, the NM expects to receive detailed information about a container’s runtime as part of the container-specifications. This includes the container’s command line, environment variables, a list of (file) resources required by the container and any security tokens.

On receiving a container-launch request – the NM first verifies this request, if security is enabled, to authorize the user, correct resources assignment, etc. The NM then performs the following set of steps to launch the container.

A local copy of all the specified resources is created (Distributed Cache).
Isolated work directories are created for the container, and the local resources are made available in these directories.
The launch environment and command line is used to start the actual container.

컨테이너 시작을 가능하게 하기 위해서 NM은 컨테이너 명세의 일부로서 컨테이너의 실행시간에 대한 자세한 정보를 수신하기를 기대한다. 이 정보는 컨테이너의 커맨드 라인 명령, 환경 변수, 컨테이너가 필요로 하는 (파일) 리소스들의 목록과 보안 토큰을 포함한다.

컨테이너-시작 요청을 받게 되면 보안이 활성화 되어 있다면, NM은 먼저 사용자, 올바른 자원 할당 등을 검증한다. 그후 NM은 컨테이너를 시작하기 위해서 다음의 단계를 수행한다.

명세된 모든 자원들의 로컬 복사본을 생성한다.(디스트리뷰티드 캐시).
컨테이너가 사용하기 위해 생성한 워킹 디렉터리를 격리하고, 로컬 자원들을 이 디렉터리에서 사용가능한 상태로 만든다.
실제의 컨테이너를 시작하기 위해서 실행 환경과 커맨드 라인을 사용한다.

### Log Aggregation
Handling user-logs has been one of the big pain-points for Hadoop installations in the past. Instead of truncating user-logs, and leaving them on individual nodes like the TaskTracker, the NM addresses the logs’ management issue by providing the option to move these logs securely onto a file-system (FS), for e.g. HDFS, after the application completes.

Logs for all the containers belonging to a single Application and that ran on this NM are aggregated and written out to a single (possibly compressed) log file at a configured location in the FS. Users have access to these logs via YARN command line tools, the web-UI or directly from the FS.

사용자-로그 처리는 과거 하둡 설치에서 큰 골칫거리 중 하나였다. 사용자-로그를 잘라버리고 태스크트래커처럼 개별 노드에 놔두는 대신 NM은 응용프로그램이 완료된 후 로그들을 안전하게 HDFS등의 파일 시스템으로 옮길 수 있는 옵션을 제공하여 로그의 관리 문제를 해결하였다. 

단일 응용프로그램에 속하고 이 NM에서 실행한 모든 컨테이너들의 로그들은 취합되어 파일 시스템의 지정된 위치에 단일 로그 파일(가능하다면 압축된)로 저장된다. 사용자들은 이 로그들을 YARN 커맨드 라인 툴, 웹UI 또는 FS에서 직접 접근한다.

### How MapReduce shuffle takes advantage of NM’s Auxiliary-services
The Shuffle functionality required to run a MapReduce (MR) application is implemented as an Auxiliary Service. This service starts up a Netty Web Server, and knows how to handle MR specific shuffle requests from Reduce tasks. The MR AM specifies the service id for the shuffle service, along with security tokens that may be required. The NM provides the AM with the port on which the shuffle service is running which is passed onto the Reduce tasks.

맵리듀스 응용프로그램을 실행하기 위해서 필요한 셔플 기능은 예비 서비스로 구현되어 있다. 이 서비스는 Netty 웹 서버를 시작하고 리듀스 태스크의 구체적인 MR 셔플 요청을 어떻게 처리해야 하는지 알고 있다. MR 애플리케이션마스터는 필요할 수 있는 보안 토큰과 함께 셔플 서비스를 위한 서비스 id 를 특정한다. NM은 리듀스 태스크로 전달하는 셔플 서비스가 관계되는 포트와 함께 애플리케이션마스터를 제공한다.


Conclusion
---

In YARN, the **NodeManager** is primarily limited to *managing abstract containers* i.e. only processes corresponding to a container and *not concerning* itself with per-application state management like MapReduce tasks. It also does away with the notion of named slots like map and reduce slots. Because of this clear separation of responsibilities coupled with the modular architecture described above, NM can scale much more easily and its code is much more maintainable.

YARN에서, 노드매니저는 주로 컨테이너와 연관되는 프로세스들 등의 추상 컨테이너들을 관리하는 일로 제한되며, 맵리듀스 태스크 같은 애플리케이션별 상태 관리에 관여하지 않는다. 또한 맵과 리듀스 슬롯과 같이 명명된 슬롯의 관념을 폐지한다. 이상에서 기술한 모듈러 구조와 더불어 이러한 명확한 책임 구분 때문에 노드매니저는 훨씬 더 간단히 확장가능하며 코드도 훨씬 더 유지보수 가능하다.

References
---
[1]  Vinod Kumar Vavilapalli, [*Apache Hadoop YARN – NodeManager*](http://hortonworks.com/blog/apache-hadoop-yarn-nodemanager/), September 2012.  
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









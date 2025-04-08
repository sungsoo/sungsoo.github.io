---
layout: post
title: Apache Hadoop YARN – Concepts and Applications
date: 2014-02-28 
categories: [computer science]
tags: [big data, yarn]

---


Apache Hadoop YARN – Concepts & Applications
---

YARN is essentially a system for managing distributed applications. It consists of a central **ResourceManager**, which arbitrates all available cluster resources, and a per-node **NodeManager**, which takes direction from the ResourceManager and is responsible for managing resources available on a single node.

YARN은 분산 응용프로그램을 관리하는 데 중요한 시스템이다. YARN은 클러스터내의 모든 가용한 자원을 관리하는 중앙 ResourceManager와 리소스매니저로부터 지시를 받고 단일 노드안에서 자원을 관리할 책임이 있는, 노드 당 필요한 NodeManager로 구성되어 있다. 


![](http://sungsoo.github.com/images/yarnflow1.png)

### Resource Manager

In YARN, the ResourceManager is, primarily, a pure scheduler. In essence, it’s strictly limited to arbitrating available resources in the system among the competing applications – a market maker if you will.  It optimizes for cluster utilization (keep all resources in use all the time) against various constraints such as capacity guarantees, fairness, and SLAs. To allow for different policy constraints the ResourceManager has a pluggable scheduler that allows for different algorithms such as capacity and fair scheduling to be used as necessary.

YARN에서 리소스매니저는 기본적으로(우선적으로) 순수한 스케줄러이다. 리소스매니저는 시스템에서 서로 경쟁하는 응용프로그램들간 사용가능한 자원을 엄격히 제한한다. 얀은 캐파시티 개런티, 평등성과 SLA와 같은 다양한 제약조건들을 지키며 클러스터 유틸라이제이션(모든 자원을 매 시각 전부 사용하고있는)을 최적화한다. 서로다른 제약 규칙을 허용하기 위해 리소스매니저는 필요에 따라 캐파시티나 페어니스 스케쥴링 같은 다양한 알고리즘을 사용할 수 있는 플러거블 스케쥴러를 가지고 있다.

### ApplicationMaster

Many will draw parallels between YARN and the existing Hadoop MapReduce system (MR1 in Apache Hadoop 1.x). However, the key difference is the new concept of an **ApplicationMaster**.

The ApplicationMaster is, in effect, an instance of a framework-specific library and is responsible for negotiating resources from the ResourceManager and working with the NodeManager(s) to execute and monitor the containers and their resource consumption. It has the responsibility of negotiating appropriate resource containers from the ResourceManager, tracking their status and monitoring progress.

The ApplicationMaster allows YARN to exhibit the following key characteristics:

* **Scale**: The Application Master provides much of the functionality of the traditional ResourceManager so that the entire system can scale more dramatically. In tests, we’ve already successfully simulated 10,000 node clusters composed of modern hardware without significant issue. This is one of the key reasons that we have chosen to design the ResourceManager as a pure scheduler i.e. it doesn’t attempt to provide fault-tolerance for resources. We shifted that to become a primary responsibility of the ApplicationMaster instance. Furthermore, since there is an instance of an ApplicationMaster per application, the ApplicationMaster itself isn’t a common bottleneck in the cluster.
* **Open**: Moving all application framework specific code into the ApplicationMaster generalizes the system so that we can now support multiple frameworks such as MapReduce, MPI and Graph Processing.

---
얀과 하둡맵리듀스 시스템간의 대부분이 유사하다. 그러나 가장 큰 차이점은 어플리케이션마스터의 개념이다. 사실상 어플레키이션마스터는 프레임워크-특화된 라이브러리의 인스턴스이며, 리소스매니저와 자원들을 협상할 책임이 있으며 컨테이너를 실행하고 소비하는 자원을 모니터링하기 위해 노드매니저와 함께 동작한다. 어플리케이션마스터는 리소스마스터로부터 적절한 자원 컨테이너를 협상하고 상태를 추적하고 진행상황을 모니터링할 책임을 가진다. 어플리케이션마스터는 얀이 다음의 핵심 성향을 드러내보이는 것에 기여한다.

* **스케일**: 어플리케이션마스터는 기존 리소스매니저의 대부분의 기능을 제공하기 때문에 전체 시스템이 더욱 드라마티컬리 확장될 수 있다. 테스트에서 이미 모던 하드웨어로 구성된 10,000개의 노드 클러스터를 심각한 문제 없이 성공적으로 시뮬레이트하였다. 이것이 리소스매니저를 순수한 스케쥴러로 디자인하는 것을 선택한 핵심이유 중 하나이다. 리소스매니저는 자원들을 장애-허용가능하게 제공하도록 시도하지 않는다. 우리는 이 기능을 애플리케이션마스터 인스턴스의 주요 책임으로 옮겼다. 추가로 응용프로그램마다 애플리케이션마스터의 인스턴스가 있기 때문에 애플리케이션마스터 자체는 클러스터에서 일반적인 병목이 되지 않는다.
* **개방**: 모든 응용프로그램 프레임워크 특화 코드를 애플리케이션마스터로 옮긴 것은 시스템을 일반화하여 이제는 맵리듀스, MPI, 그래프 프로세싱등의 다양한 프레임워크를 지원할 수 있다.

---

It’s a good point to interject some of the key YARN design decisions:

* Move all complexity (to the extent possible) to the ApplicationMaster while providing sufficient functionality to allow application-framework authors sufficient flexibility and power.
* Since it is essentially user-code, do not trust the ApplicationMaster(s) i.e. any ApplicationMaster is not a privileged service.
* The YARN system (ResourceManager and NodeManager) has to protect itself from faulty or malicious ApplicationMaster(s) and resources granted to them at all costs.

---

핵심 얀 설계의 결정 몇가지는 다음과 같다.
응용프로그램 프레임워크 개발자들에게 충분한 유연성과 파워를 주기 위해 모든 복잡도(가능성을 확장하기 위한)를 어플리케이션마스터로 옮긴다.
전적으로 사용자-코드이기 때문에 애플리케이션마스터를 신뢰하지 않는다. 예) 애플리케이션마스터는 특권 서비스가 아니다.
얀 시스템(리소스매니저와 노드매니저)는 장애가 있거나 악의적인 애플리케이션마스터로부터 스스로를 보호해야만 하고, 애플리케이션마스터에게 어떠한 일이 있어도 자원을 보장해야 한다.

---

It’s useful to remember that, in reality, every application has its own instance of an ApplicationMaster. However, it’s completely feasible to implement an ApplicationMaster to manage a set of applications (e.g. ApplicationMaster for Pig or Hive to manage a set of MapReduce jobs). Furthermore, this concept has been stretched to manage long-running services which manage their own applications (e.g. launch HBase in YARN via an hypothetical HBaseAppMaster).

---

실제로 모든 응용프로그램은 자신만의 애플리케이션마스터 인스턴스를 가진다는 것을 기억하면 유용하다. 그러나 애플리케이션마스터가 응용프로그램들의 집합(맵리듀스 작업을 관리하기 위해 Pig, Hive를 위한 애플리케이션마스터)을 관리하도록 구현하는 것이 완벽하게 실현가능하다. 추가로 이러한 개념은 스스로의 응용프로그램을 관리해야 하는 오래 동작하는 서비스들(얀에서 가상의 HBaseAppMaster를 통하여 HBase를 시작하는 것)을 관리하기 위해서 확장될 수 있다.

### Resource Model

YARN supports a very general resource model for applications. An application (via the ApplicationMaster) can request resources with highly specific requirements such as:

얀은 응용프로그램을 위하여 매우 보편적인 자원 모델을 지원한다. 응용프로그램은 (애플리케이션마스터를 통하여) 다음의 매우 특화된 요구들을 바탕으로 자원들을 요청할 수 있다.
자원-이름(호스트이름, 랙이름 - YARN-18을 통하여 좀 더 복잡한 네트워크 토폴로지를 지원할 수 있도록 작업중이다.)

* Resource-name (hostname, rackname – we are in the process of generalizing this further to support more complex network topologies with YARN-18).
* Memory (in MB)
* CPU (cores, for now)
* In future, expect us to add more resource-types such as disk/network I/O, GPUs etc.


### ResourceRequest and Container

YARN is designed to allow individual applications (via the ApplicationMaster) to utilize cluster resources in a shared, secure and multi-tenant manner. Also, it remains aware of cluster topology in order to efficiently schedule and optimize data access i.e. reduce data motion for applications to the extent possible.

In order to meet those goals, the central Scheduler (in the ResourceManager) has extensive information about an application’s resource needs, which allows it to make better scheduling decisions across all applications in the cluster. This leads us to the **ResourceRequest** and the resulting **Container**.

Essentially an application can ask for specific resource requests via the ApplicationMaster to satisfy its resource needs. The Scheduler responds to a resource request by granting a container, which satisfies the requirements laid out by the ApplicationMaster in the initial ResourceRequest.

---

얀은 각각의 응용프로그램이 (애플리케이션마스터를 통해서) 클러스터의 자원을 공유하고, 안전하고 다중-임대하는 방법으로 활용하도록 설계되었다. 또한 효과적으로 스케쥴하고 데이터 접근을 최적화(예: 데이터의 이동을 감소)하기 위해 클러스터 토폴로지를 알고 있다. 이러한 목표에 도달하기 위해 중앙 스케쥴러(리소스매니저에 있는)은 클러스터에 있는 모든 응용프로그램들을 대상으로 더 좋은 스케쥴링 결정을 하기위해 응용프로그램의 요청에 대해서 광범위한 정보를 가지고 있다. 이것이 우리를 리소스리퀘스트와 그 결과인 컨테이너를 생각하게 했다. 근본적으로 응용프로그램은 리소스 요구를 만족시키기 위해 애플리케이션마스터를 통하여 특정한 리소스리퀘스트를 요청할 수 있다. 스케쥴러는 애플리케이션마스터에 의해 발생한 초기 리소스리퀘스트에 있는 요구사항을 만족하는 컨테이너를 허가함으로서 리소스 리퀘스트에 응답한다. 

---

Let’s look at the ResourceRequest – it has the following form:

`<resource-name, priority, resource-requirement, number-of-containers>`

Let’s walk through each component of the ResourceRequest to understand this better.

* resource-name is either hostname, rackname or * to indicate no preference. In future, we expect to support even more complex topologies for virtual machines on a host, more complex networks etc.
* priority is intra-application priority for this request (to stress, this isn’t across multiple applications).
* resource-requirement is required capabilities such as memory, cpu etc. (at the time of writing YARN only supports memory and cpu).
* number-of-containers is just a multiple of such containers.

---

먼저 리소스리퀘스트에 대하여 알아보자. 리소스리퀘스트는 다음의 형태로 되어 있다:
<리소스-이름, 우선순위, 리소스-요구사항, 컨테이너의 개수>
더 잘 이해하기 위해 리소스리퀘스트의 각 부분에 대하여 알아보자.
리소스-이름은 호스트네임이거나 렉네임 또는 *로 관계없음을 나타낸다. 미래에는 호스트에 있는 가상머신을 위한 더욱 복잡한 토폴로지 또는 복잡한 네트워크를 지원할 것이다.
우선순위는 이 요청의 응용프로그램 내부의 우선순위이다.(강조하는데, 이것은 다중 응용프로그램에서의 우선순위가 아니다.)
리소스-요구사항은 메모리, cpu 등의 요구되는 능력이다.(얀이 개발되는 중에는 메모리와 cpu만 지원한다.)
컨테이너의 개수는 요구되는 컨테이너들의 수이다.

---

Now, on to the Container.

Essentially, the Container is the resource **allocation**, which is the successful result of the ResourceManager granting a specific ResourceRequest. A Container grants rights to an application to use a specific amount of resources (memory, cpu etc.) on a specific host.

The ApplicationMaster has to take the Container and present it to the NodeManager managing the host, on which the container was allocated, to use the resources for launching its tasks. Of course, the Container allocation is verified, in the secure mode, to ensure that ApplicationMaster(s) cannot fake allocations in the cluster.

---

이제 컨테이너에 대하여 살펴보자.
근본적으로 컨테이너는 리소스매니저가 특정한 리소스리퀘스트를 승인한 성공적 결과인 리소스 할당이다. 컨테이너는 응용프로그램에게 특정한 호스트에 있는 특정한 양의 자원을 사용할 수 있는 권리를 승인한다. 애플리케이션마스터는 컨테이너를 얻어야 하며, 태스크를 시작하기 위한 자원으로 사용하기 위해 컨테이너가 위치한 호스트를 관리하는 노드매니저에게 제출해야 한다.당연히 컨테이너 할당은 그 애플리케이션마스터가 클러스터에서 할당을 속일 수 없도록 안전하게 검증된다.


### Container Specification during Container Launch

While a Container, as described above, is merely a right to use a specified amount of resources on a specific machine (NodeManager) in the cluster, the ApplicationMaster has to provide considerably more information to the NodeManager to actually *launch* the container.

YARN allows applications to launch any process and, unlike existing Hadoop MapReduce in hadoop-1.x (aka MR1), it isn’t limited to Java applications alone.

---

이상에서 설명한 것과 같이, 컨테이너는 그저 클러스터에서 특정 노드(노드매니저)에 있는 특정한 양의 자원을 사용할 수 있는 권리이기 때문에 애플리케이션마스터는 컨테이너를 실제로 실행(런치)하기 위해서 상당히 많은 정보를 노드매니저에게 제공해야만 한다. 

얀은 기존의 하둡 맵리듀스와는 틀리게 응용프로그램이 어떠한 프로세스든 실행하도록 허용하며, 자바 응용프로그램에 국한되지도 않는다.


The YARN Container launch specification API is platform agnostic and contains:

* Command line to launch the process within the container.
* Environment variables.
* Local resources necessary on the machine prior to launch, such as jars, shared-objects, auxiliary data files etc.
* Security-related tokens.

This allows the ApplicationMaster to work with the NodeManager to launch containers ranging from simple shell scripts to C/Java/Python processes on Unix/Windows to full-fledged virtual machines (e.g. KVMs).

---



YARN – Walkthrough
---

Armed with the knowledge of the above concepts, it will be useful to sketch how applications conceptually work in YARN.

이상의 개념들을 알고 있는 상태에서 응용프로그램이 개념적으로 어떻게 동작하는지 아는 것은 유용하다.

Application execution consists of the following steps:

* Application submission.
* Bootstrapping the ApplicationMaster instance for the application.
* Application execution managed by the ApplicationMaster instance.

---
응용프로그램 실행은 다음의 단계를 거친다:

* 응용프로그램 제출
* 응용프로그램을 위한 애플리케이션마스터 인스턴스 생성(bootstrap)
* 애플리케이션마스터 인스턴스에 의한 응용프로그램 실행 관리

---

Let’s walk through an application execution sequence (steps are illustrated in the diagram):

1. A client program submits the application, including the necessary specifications to l*aunch the application-specific ApplicationMaster* itself.
2. The ResourceManager assumes the responsibility to negotiate a specified container in which to start the ApplicationMaster and then *launches* the ApplicationMaster.
3. The ApplicationMaster, on boot-up, *registers* with the ResourceManager – the registration allows the client program to query the ResourceManager for details, which allow it to  directly communicate with its own ApplicationMaster.
4. During normal operation the ApplicationMaster negotiates appropriate resource containers via the resource-request protocol.
5. On successful container allocations, the ApplicationMaster launches the container by providing the container launch specification to the NodeManager. The launch specification, typically, includes the necessary information to allow the container to communicate with the ApplicationMaster itself.
6. The application code executing within the container then provides necessary information (progress, status etc.) to its ApplicationMaster via an *application-specific* protocol.
7. During the application execution, the client that submitted the program communicates directly with the ApplicationMaster to get status, progress updates etc. via an application-specific protocol.
8. Once the application is complete, and all necessary work has been finished, the ApplicationMaster deregisters with the ResourceManager and shuts down, allowing its own container to be repurposed.

![](http://sungsoo.github.com/images/yarnflow.png)

---

응용프로그램 실행 순서에 대하여 알아보자.

1. 클라이언트 프로그램이 응용프로그램-특화 애플리케이션마스터 자체를 실행하기 위해 필요한 데이터를 포함한 응용프로그램을 제출한다. 
2. 리소스매니저는 애플리케이션마스터를 시작하기 위한 특정 컨테이너를 협상할 책임을 맡고, 애플리케이션마스터를 실행한다.
3. 시작된 애플리케이션마스터는 리소스매니저에 등록된다 - 등록을 함으로서 클라이언트 프로그램이 리소스매니저에게 질의할 수 있다.
4. 일반 동작 중 애플리케이션마스터는 리소스리퀘스트 프로토콜을 통해 적절한 리소스 컨테이너를 협상한다.
5. 컨테이너가 성공적으로 할당되면, 애플리케이션마스터는 컨테이너 실행 스펙을 노느메니저에게 제공하여 컨테이너를 실행시킨다. 실행 스펙은 일반적으로 컨테이너가 애플리케이션마스터 그 자체와 통신하기 위해 필요한 정보를 포함하고 있다.
6. 응용프로그램 코드는 컨테이너에서 실행되고 진행률, 상태 등의 정보를 응용프로그램-스펙 프로토콜을 통해 응용프로그램의 애플리케이션마스터에게 제공한다.
7. 응용프로그램 실행 중 응용프로그램을 제출한 클라이언트는 상태, 진행률 등을 얻기 위해 애플리케이션마스터와 응용프로그램-스팩 프로토콜을 통해 직접 통신한다.
8. 일단 응용프로그램이 완료되고 모든 필요한 작업이 종료되면, 애플리케이션마스터는 리소스매니저로의 등록을 해제하고 자신의 컨테이너를 다른 용도로 사용할 수 있도록 종료한다.

References
---
[1] Arun Murthy, [*Apache Hadoop YARN – Concepts and Applications*](http://hortonworks.com/blog/apache-hadoop-yarn-concepts-and-applications/), August 2012.  
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

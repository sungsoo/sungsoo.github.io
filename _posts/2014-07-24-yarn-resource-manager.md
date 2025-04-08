---
layout: post
title: Apache Hadoop YARN ResourceManager
date: 2014-07-24
categories: [computer science]
tags: [big data, big data]

---


## Article Source
* Title: [Apache Hadoop YARN : ResourceManager](http://blrunner.com/68)
* Authors: 정재화



# Apache Hadoop YARN : ResourceManager


YARN의 가장 중요한 컴포넌트는 리소스매니저와 노드매니저입니다. 오늘은
리소스매니저의 구조에 대해서 자세히 알아보겠습니다. 리소스매니저는 전체
클러스터의 가용 가능한 리소스를 스케쥴링하고, 클러스터에서 실행되는
어플리케이션들에게 리소스를 중재합니다. 그리고
노드매니저와어플리케이션마스터를 제어하면서, 어플리케이션들이 정상적으로
실행될 수 있도록 도와줍니다. 리소스매니저는 이러한 기능을 수행하기 위해
다양한 컴포넌트로 구성되어 있습니다. 다음 그림 1은 리소스매니저의
아키텍처를 나타냅니다.


![리소스매니저.jpg](https://lh5.googleusercontent.com/zeHaQIVui-3SdVl3R10gQj6WEcKSRGVDcuoyUP0T4OsRSbVTQpHQTONk-Pu1WmGknIa7SDUvnj3t3Mo-BuDq5vgKoMgh5dvWq9fwnFs84UGfAafSpHUchjhv2L6ywfZGDA)

**[그림 1] ResourceManager Architecture**


각각의 컴포넌트는 다음과 같은 기능을 담당합니다.


## 1) 주요 컴포넌트

-   **RMContext**: 리소스매니저의 컨텍스트 정보를 유지합니다. 그림1에 나타난
    대부분의 컴포넌트 정보를 포함합니다.

-   **Dispatcher**: 이벤트 전달을 위한 인터페이스입니다. 이 인터페이스는
    이벤트 유형에 맞는 이벤트 핸들러에게 이벤트를 전달합니다. 참고로
    리소스매니저는 Dispatcher 인터페이스를 구현하기 위해, 앞서 이벤트
    처리 모델에서 설명한 AsyncDispatcher를 생성합니다.

-   **ResourceScheduler**: 이 컴포넌트는 YarnScheduler 인터페이스를 확장한
    인터페이스입니다. 이 인터페이스는 클러스터에서 실행되는
    어플리케이션에게 리소스를 할당하는 역할을 담당합니다. 이를 위해
    스케쥴러 큐 정보 조회, 가용 리소스 조회, 리소스 할당당, 노드 수 조회
    등 다양한 기능을 제공합니다. ResourceScheduler는 인터페이스이기
    때문에, 이를 구현한 클래스를 생성해야만 실제 스케쥴 기능을 수행할 수
    있습니다. 현재 기본 스케쥴러는 CapacityScheduler를 사용하고 있으며,
    얀 설정 파일의 scheduler.class 옵션으로 스케쥴러를 설정할 수
    있습니다. 참고로 클러스터의 가용 가능한 자원은 메모리, CPU, 디스크,
    네트워크 정보가 있지만, 현재 CapacityScheduler를 CPU와 메모리만으로
    자원 스케쥴링을 하고 있습니다.



## 2) 클라이언트 인터페이스

-   **ClientRMService**: 클라이언트는 리소스매니저와 인터페이스를 유지해야
    합니다. ClientRMService는 클라이언트가 리소스매니저에게 요청하는
    모든 RPC 요청을 관리합니다. 어플리케이션 실행, 어플리케이션 종료,
    실행중인 어플리케이션 목록 요청, 클러스터 상태 정보, 큐 정보 조회
    등의 인터페이스를 제공합니다.

-   **AdminService**: 관리자 사용자로부터 요청되는 RPC 요청을 처리합니다.
    ClientRMService에서 제공하는 인터페이스보다 권한이 높은 기능을
    제공합니다. 큐 설정, 노드 목록, 사용자 그룹 설정, ACL 목록을
    리프레시할 수 있습니다.

-   **RMWebApp**: 얀은 리소스 사용 및 실행 중인 어플리케이션들의 상태 정보를
    쉽게 조회할 수 있도록, 웹 인터페이스를 제공합니다. RMWebApp은 위와
    같은 인터페이스를 제공하기 위한, 내장 웹서버입니다.
    ([https://issues.apache.org/jira/browse/MAPREDUCE-2399](https://issues.apache.org/jira/browse/MAPREDUCE-2399))



## 3) 어플리케이션마스터 관리

-   **ApplicationMasterService**: 이 컴포넌트는 모든 어플리케이션마스터에서
    요청하는 RPC 요청을 관리합니다. 주요 기능으로는 신규
    어플리케이션마스터 등록 및 어플리케이션 종료가 있습니다. 또한
    클러스터내에서 실행중인 어플리케이션마스터들로부터 컨테이너 할당 및
    해제에 대한 요청을 받아서, 리소스매니저의 스케쥴러에 전달하는 역할도
    수행합니다.

-   **ApplicationMasterLauncher**: 어플리케이션마스터를 실행하기 위한 내부
    스레드 풀을 유지하고 있습니다. 신규 어플리케이션 실행 요청이
    들어오면,  스레드 풀은 어플리케이션마스터 런처 클래스인 AMLauncher을
    호출하며, 이때 AMLauncher는 노드매니저에게 컨테이너에서
    어플리케이션마스터 실행을 요청합니다. 그리고 어플리케이션이
    종료되면, AMLauncher에게 어플리케이션마스터 초기화를 요청하고,
    AMLauncher가 노드매니저에게 이 요청을 전달합니다.

-   **AMLivelinessMonitor**: 이 콤포넌트는 어플리케이션마스터의 상태를
    모니터링하며, 이를 위해 어플리케이션마스터의 하트비트를 체크합니다.
    하트비트는 기본값인 10분을 주기로 체크하며,이 설정은 얀 설정 파일의
    am.liveness-monitor.expiry-interval-ms 옵션을 조정하면 됩니다.
    참고로 10분 내에 어플리케이션마스터로부터 하트비트를 받지 못할
    경우에는 해당 어플리케이션마스터는 종료됐다고 보고, 해당
    어플리케이션마스터에게 할당됐던 모든 컨테이너들을 해제합니다.  



## 4) 노드매니저 관리

-   **NodesListManager**: 이 컴포넌트는 유효한 노드 목록과 클러스터에서
    제외할 노드 목록을 관리합니다. 해당 노드 목록은 환경 설정 파일을
    참조하여 작성하며, 유효한 노드 목록은 nodes.include-path 옵션을,
    제외할 노드 목록은 nodes.exclude-path을 참조합니다. 파일이 변경될
    경우,  관리하고 있는 노드 목록을 초기화할 수 있습니다. 참고로 곧
    설명할 ResourceTrackerService는 노드매니저를 등록하는 기능을
    제공합니다. 이때 ResourceTrackerService는 노드매니저를 등록하기 전에
     NodesListManager를 호출해서, 해당 노드의 유효성을 검증합니다.

-   **NMLivelinessMonitor**: 이 컴포넌트는 노드매니저의 상태를
    모니터링합니다. 앞서 설명한 AMLivelinessMonitor와 동일한
    매커니즘으로 동작하며, 하트비트도 10분 주기로 체크합니다. 참고로
    하트비트 체크 주기는 얀 환경 설정 파일의
    nm.liveness-monitor.expiry-interval-ms 옵션으로 변경할 수 있습니다.

-   **ResourceTrackerService**: 이 콤포넌트는 노드매니저들의 RPC 요청을
    처리합니다. 주요 기능은 신규 노드매니저 등록과 노드매니저의
    하트비트를 확인하는 것입니다. 이러한 기능을 수행하기 위해서 앞서
    설명한 NodesListManager, NMLivelinessMonitor를 내부적으로
    활용합니다.



## 5) 어플리케이션 관리

-   **RMAppManager**: 이 콤퍼넌트는 리소스매니저저를 위한 어플리케이션
    목록을 관리합니다. 즉, 클라이언트가 얀 클러스터에 실행을 요청한
    어플리케이션 목록을 관리합니다. 실행 요청된 어플리케이션의 유효성을
    검증하고, 어플리케이션의 실행 관련 통계 정보를 로그로 기록합니다.
    또한 어플리케이션에 문제가 있을 경우, 복구하는 기능도 제공합니다.

-   **ApplicationACLsManager**: 클라이언트가 RPC 호출을 하는 경우, 해당
    클라이언트와 호출한 API가 유효한 지 검사합니다. 이때 해당 API가
    ClientService인지, AdminService인지도 판단합니다. 참고로 내부적으로
    정상 승인된 API 목록을 유지하고 있습니다.

-   **ContainerAllocationExpirer**: YARN에 어플리케이션 실행을 요청하면,
    어플리케이션마스터가 노드매니저에게 컨테이너 실행을 요청합니다. 만약
    어플리케이션마스터가 자신이 할당받은 컨테이너들을 사용하지 못하고,
    컨테이너를 점유하고 있다면, 다른 클라이언트들이 리소스매니저에게서
    자원을 할당받지 못하는 경우가 발생할 것입니다. 리소스매니저는 이러한
    장애를 방지하기 위해서, 노드매니저가 어플리케이션이 실행 요청한
    컨테이너를 정상적으로 실행했는지 확인합니다. 기본적으로 10분까지
    컨테이너 실행을 대기한 후, 컨테이너 실행 응답을 받지 못할 경우,
    ResourceScheduler에서 해당 어플리케이션마스터에게 할당됐던 자원을
    모두 해제합니다. 참고로 대기 시간은 얀 환경 설정 파일의
    rm.container-allocation.expiry-interval-ms로 설정 가능합니다.


## 6) 보안

보안은 얀 아키텍처의 중요한 부분입니다. 왜냐하면 얀은 인증된 RPC
호출만을 허가하기 때문입니다. 얀은 RPC 호출을 하는 컴포넌트에게 토큰
혹은 보안키와 같은 인증 정보를 발급합니다. 인증 정보를 발급받은
컴포넌트는 해당 정보를 유지해야 하고, RPC 호출을 할 때마다 인증 정보를
함께 포함해서 요청해야 합니다. RPC 호출을 하는 컴포넌트 뿐만 아니라, RPC
호출을 받는 컴포넌트는 어떠한 인증 정보를 발급했고, 또한 자신에게 요청된
RPC 호출이 유효한 인증 정보를 포함하는 지를 알아야 합니다. 얀은 이를
위해 보안 매니저(SecretManager)를 제공합니다. 보안 매니저는 RPC 호출을
인증하고, 인증 정보를 발급하고, 관리하는 기능을 담당합니다. 이와 같은
구조 때문에 리소스매니저도 주요 컴포넌트들의 통신을 위한 다양한 보안
매니저를 제공합니다.



-   **RMDelegationTokenSecretManager**: RMDelegationTokenSecretManager는 RPC
    호출을 하는 클라이언트를 위한 Delegation Token(위임 토큰) 발급,
    저장, 갱신하는 기능을 수행합니다. ClientRMService가 이 컴포넌트를
    호출해 토큰을 생성한 후, 클라이언트에게 토큰을 보내줍니다.

-   **DelegationTokenRenewer**: 보안 모드일 경우, 리소스매니저는 커버로스
    인증을 사용하며, 위임 토큰을 갱신할 수 있는 서비스를 제공합니다. 이
    컴포넌트는 어플리케이션이 실행되는 동안에 실행 요청된 어플리케이션의
    토큰을 갱신합니다. 이를 위해서 어플리케이션의 상태를 추적해서,
    토큰의 갱신, 해지 여부를 관리합니다.

-   **ClientToAMTokenSecretManagerInRM**: 클라이언트가 어플리케이션마스터에
    접근하기 위한 보안키를 관리합니다. 클라이언트는
    ClientToAMTokenSecretManager가 어플리케이션마스터에 할당된 보안키를
    조회합니다. 참고로 ClientToAMTokenSecretManagerInRM와
    ClientToAMTokenSecretManager가 모두
    BaseClientToAMTokenSecretManager를 상속해서, 구현한 클래스들입니다.

-   **RMContainerTokenSecretManager**: 어플리케이션마스터는 노드매니저에게
    자신이 할당 받은 컨테이너의 실행을 요청합니다. 이때 노드매니저는
    어플리케이션마스터가 유효한 컨테이너 토큰을 전송했는지 확인하게
    되는데, 바로 이 컴포넌트가 컨테이너 토큰을 관리하는 기능을
    수행합니다.

-   **NMTokenSecretManagerInRM**: 이 컴포넌트는 노드매니저 토큰을
    관리합니다. 노드매니저가 리소스매니저와 통신하는 경우, 이 컴포넌트가
    생성한 노드매니저 토큰(NMToken)을 사용하게 됩니다. 보안 매니저는
    토큰을 대상으로 활성화 연기(activation delay) 시간을 추가합니다.
    리소스매니저는 스케쥴러에 때문에 특정 시점에 토큰을 버릴 수도
    있습니다. 이때 토큰은 새로운 키로 다시 만들어 질 것입니다. 하지만
    노드매니저는 리소스매니저에게 토큰 갱신을 요청하지 않을 수도
    있습니다. 그래서 활성화된 노드매니저들이 갱신된 토큰을 조회할 수
    있도록, 활성화 연기 시간을 추가한 것입니다. 이 시간은 “10분 \* 1.5”
    로 계산되며, 기본 시간인 10분은 얀 환경 설정 파일의
    nm.liveness-monitor.expiry-interval-ms 옵션으로 설정 가능합니다.

-   **AMRMTokenSecretManager**: 이 컴포넌트는 AMRM 토큰을 관리합니다. AMRM
    토큰은 ApplicationAttempt(어플리케이션 어템프트)별로 할당됩니다.
    여기서 어플리케이션 어템프트란 어플리케이션마스터가 어플리케이션
    실행을 시도한 것을 의미합니다. 어플리케이션마스터가 한번에
    어플리케이션을 실행할 수도 있겠지만, 하드웨어 오류가 발생했거나,혹은
    네트워크등에 문제가 생기면 어플리케이션마스터는 원하는 노드에서
    어플리케이션을 실행할 수 없을 것입니다. 참고로 얀은 어플리케이션
    어템프트 수를 2로 제한두고 있으며, 이 값은 얀의 환경설정 파일의
    am.max-attempts 옵션으로 변경할 수 있습니다.



## References 

1. [http://hortonworks.com/blog/apache-hadoop-yarn-resourcemanager](http://hortonworks.com/blog/apache-hadoop-yarn-resourcemanager/)
2. [http://hadoop.apache.org](http://hadoop.apache.org)

---
layout: post
title: Gateway Routing Pattern
date: 2022-05-28
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [게이트웨이 라우팅 패턴](https://docs.microsoft.com/ko-kr/azure/architecture/patterns/gateway-routing)


---

# Gateway Routing Pattern

**단일 엔드포인트**를 사용하여 요청을 **여러 서비스에 라우팅**합니다. 이 패턴은 단일 엔드포인트 및 경로의 여러 서비스를 요청에 따라 적절한 서비스에 노출하려는 경우에 유용합니다.

## 컨텍스트 및 문제점
클라이언트가 여러 서비스를 이용해야 하는 경우 각 서비스에 대해 별도의 엔드포인트를 설정하고 클라이언트를 통해 각 엔드포인트를 관리하는 것이 어려울 수 있습니다. 예를 들어 전자 상거래 애플리케이션은 검색, 리뷰, 카트, 체크 아웃 및 주문 기록과 같은 서비스를 제공할 수 있습니다. *서비스마다 클라이언트가 조작해야 하는 다른 API*가 있으며 클라이언트는 서비스에 연결하기 위해 각 엔드포인트에 대해 알고 있어야 합니다. *API가 변경되면 클라이언트도 업데이트*해야 합니다. 두 개 이상의 *개별 서비스로 서비스를 리팩터링하는 경우 서비스와 클라이언트 둘 다에서 코드를 변경*해야 합니다.

## 해결 방법
애플리케이션, 서비스 또는 배포 집합 앞에 게이트웨이를 배치합니다. **애플리케이션 계층 7 라우팅을 사용**하여 요청을 적절한 인스턴스로 라우트합니다.

이 패턴을 사용하면 클라이언트 애플리케이션이 **단일 엔드포인트만 알고 통신하면 됩니다.** 서비스를 통합하거나 분해하는 경우 클라이언트를 업데이트할 필요가 없습니다. 게이트웨이를 계속 요청할 수 있으며 라우팅만 변경됩니다.

또한 게이트웨이를 통해 클라이언트의 백 엔드 서비스를 추상화하여 게이트웨이 뒤에 있는 백 엔드 서비스의 변경을 허용하는 동시에 클라이언트 호출을 단순하게 유지할 수 있습니다. 예상 클라이언트 동작을 처리해야 하는 어떤 서비스로든 클라이언트 호출을 라우트할 수 있으므로 클라이언트를 변경하지 않고 게이트웨이 뒤에 서비스를 추가, 분할 및 재구성할 수 있습니다.

![Diagram of the Gateway Routing pattern](https://docs.microsoft.com/ko-KR/azure/architecture/patterns/_images/gateway-routing.png)

이 패턴은 사용자에게 업데이트를 롤아웃하는 방법을 관리할 수 있으므로 배포에도 도움이 될 수 있습니다. 새 버전의 서비스를 배포할 때 기존 버전과 함께 배포할 수 있습니다. 라우팅을 통해 클라이언트에게 제공되는 서비스 버전을 제어할 수 있으므로 증분, 병렬 또는 전체 업데이트 롤아웃 등 다양한 릴리스 전략을 유연하게 사용할 수 있습니다. *새 서비스를 배포한 후 문제가 발견될 경우 클라이언트에 영향을 주지 않고 게이트웨이에서 구성을 변경하여 빠르게 되돌릴 수 있습니다*.

## 문제 및 고려 사항
* 게이트웨이 서비스에 단일 실패 지점이 발생할 수 있습니다. 가용성 요구 사항을 충족하도록 올바르게 설계되었는지 확인합니다. 구현 시 복원력 및 내결함성 기능을 고려합니다.
* 게이트웨이 서비스로 인해 병목 상태가 발생할 수 있습니다. 게이트웨이가 부하를 처리할 수 있는 적절한 성능을 갖추고 있고 예상 증가량에 맞게 쉽게 확장될 수 있는지 확인합니다.
* 게이트웨이 부하 테스트를 수행하여 서비스가 연속으로 실패하지 않도록 합니다.
* 게이트웨이 라우팅은 수준 7입니다. IP, 포트, 헤더 또는 URL을 기반으로 할 수 있습니다.

## 이 패턴을 사용해야 하는 경우
다음 경우에 이 패턴을 사용합니다.

* 클라이언트가 게이트웨이 뒤에서 액세스할 수 있는 여러 서비스를 이용해야 하는 경우.
* 단일 엔드포인트를 사용하여 클라이언트 애플리케이션을 간소화하려는 경우.
* VM의 포트를 클러스터 가상 IP 주소에 노출하는 경우와 같이 외부에서 주소 지정 가능한 엔드포인트에서 내부 가상 엔드포인트로 요청을 라우트해야 하는 경우.


하나 또는 두 개의 서비스만 사용하는 단순 애플리케이션을 가진 경우에는 이 패턴이 적합하지 않을 수 있습니다.

## 예제
Nginx를 라우터로 사용하는 다음 예는 다른 가상 디렉터리에 있는 애플리케이션에 대한 요청을 백 엔드의 다른 컴퓨터로 라우트하는 서버에 대한 단순한 예제 구성 파일입니다.

```
server {
    listen 80;
    server_name domain.com;

    location /app1 {
        proxy_pass http://10.0.3.10:80;
    }

    location /app2 {
        proxy_pass http://10.0.3.20:80;
    }

    location /app3 {
        proxy_pass http://10.0.3.30:80;
    }
}
```

Azure에서는 계층 7 라우팅을 제공하는 Application Gateway 인스턴스 뒤에 여러 서비스를 설정할 수 있습니다.

### 관련 지침

* [프런트 엔드에 대한 백 엔드 패턴](https://docs.microsoft.com/ko-KR/azure/architecture/patterns/backends-for-frontends)
* [게이트웨이 집계 패턴](https://docs.microsoft.com/ko-KR/azure/architecture/patterns/gateway-aggregation)
* [게이트웨이 오프로딩 패턴](https://docs.microsoft.com/ko-KR/azure/architecture/patterns/gateway-offloading)
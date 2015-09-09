---
layout: post
title: Building Good Docker Images
date: 2015-09-10
categories: [computer science]
tags: [big data]

---



##  Article Source

- Title: [Building Good Docker Images](http://jonathan.bergknoff.com/journal/building-good-docker-images)


# Building Good Docker Images

[Docker레지스트리](https://registry.hub.docker.com/)는 넘쳐나고
있습니다. 이글을 쓰고 있는 시점에는, “node”로 검색하면 1000개 약간
안되는 결과를 얻을 수 있습니다. 이중에 어떻게 골라야 할까요?

좋은 docker 이미지를 구성하는 것은 무엇일까요?
----------------------------------------------

주관적인 이야기겠지만, 이미지를 구성에 있어 제가 좋다고 생각하는 몇가지
기준이 있습니다.

-   **동작 할 것** 예를들면:
    -   Android SDK 이미지는 최초의 컨테이너에 업데이트를 안해도,
        프로젝트를 컴파일할 수 있어야 함.
    -   MySQL 컨테이너는 데이터베이스, 유저를 포함해 서버를 준비하는
        방법을 명시해야함.
-   **작을 것** 컨테이너의 이점은 어플리케이션을 샌드박스로 만들 수 있는
    것입니다.(보안이 아니라도, 호스트 파일 시스템의 혼란을 피하려고)
    호스트 시스템에 node.js를 인스톨하거나, JDK로 시스템을 더럽히는
    방법으로도 할 수 있지만, 제 경우는 디스크 스페이스나 퍼포먼스에
    여유를 가지고 다른 파일들과 분리시키는데 메리트를 느끼고 있습니다.
    사실은 이런 신경을 최대한 안쓰려는 게 목적이죠. 그러기 위해서 Docker
    이미지는 군더더기없이 정확히 필요한 기능만 넣은 상태로
    제공되어야합니다. 이 원칙에 따르기만 하면, 이미지는 확장성을 띄고
    고장날 일도 적게 됩니다.
-   **화이트 박스** docker이미지 에서는, 이 단어는 `Dockerfile`을
    의미합니다. 이미지를 무엇으로 만든지 파악하고, 원한다면 더 가볍게도
    할 수 있습니다.

불행히도 docker 레지스트리에서는 “좋은” 이미지를 찾기 쉽지 않을 뿐더러,
특정 이미지를 평가하기도 힘듭니다. `docker pull <...>` 단계에서 문제가
되는 경우도 많지만, 왜 10 MB정도의 `node` 바이너리가 파일 시스템 레이어
10개가 필요하고 결과적으로 700 MB의 가상 환경이 되는지는 이해하기
힘듭니다.

좋은 도커 이미지 만들기
-----------------------

“좋은” docker 이미지에 대한 합의가 없고 docker 레지스트리에 새로운
이미지를 추가하기가 너무 쉽기 때문에, 지금 상황은 [xkcd#927](http://xkcd.com/927/)이랑 완전 일치합니다. 모두가 각각 만들고
있죠. [언어에 특화된 “공식” docker 개발
환경](https://github.com/docker-library/official-images)이 도입된 것은
좋은 시작입니다. 이 이미지들에 (밑에 있는) 내가 선호하는 방법이 몇몇
들어있는건 기뻤습니다. 하지만, “천여개의 노드 이미지”가 있는 상황은
docker가 검색과 평가 시스탬을 강화하지 않는 이상, 아마 개선되기 힘들
것입니다.

그래서, 여기서 내가 생각하는 Dockerfile의 베스트 프락티스를 정리해
보았습니다. 제가 전문가는 아니지만,(지금 docker의 나이로는 누구도
전문가는 아니겠죠) 그래서 더더욱 토론과 피드백은 환영합니다.

## `debian` 으로 줄인 베이스 이미지

이 글을 쓰는 시점에서, `ubuntu:14.04`는 195 MB이지만 `debian:wheezy`는
85 MB입니다. 하지만 Ubuntu의 100MB정도의 추가분은 (제가 보기엔) 아무
의미도 없습니다. 극단적인 케이스로 `busybox`를 사용하면 2MB정도로
격감시키는것도 가능합니다. 이것은 정적 링크된 바이너리와 함께 사용할
경우에만 가능할 것입니다. `busybox`기반의 도커 이미지의 예로
`progrium/logspout` ([link](https://github.com/progrium/logspout))가
있습니다. 이 이미지는 14MB까지 줄였습니다.

## 그럴듯한 이유가 없으면 빌드 툴을 설치하지 말 것

빌드 툴은 많은 공간을 차지하고, 소스에서 빌드하는건 대체로 시간이
걸립니다. 직접 만든 소프트웨어가 아니라면, 굳이 소스에서 빌드할필요가
없고 되도록 하지 말아야 합니다. 예를들어, Debian호스트에 최신 node.js를
올려 돌리려고 python, gcc 등등을 설치할 필요가 없습니다.
 [node.js 다운로드 페이지](http://nodejs.org/download/)에 바이너리
tarball이 있고, 비슷하게, Redis도 패키지 관리자를 통해 설치 가능합니다.

빌드 툴을 사용해도 되는 그럴듯한 이유들은 이런 것들이 있습니다.

-   특정 버전이 필요한 경우(예를들어 Debian의 저장소에 redis는 꽤나
    오래됀 버전입니다)
-   특정 옵션으로 컴파일 해야하는 경우
-   `npm install`(이나 비슷한 것으)로 모듈을 바이너리로 컴파일 해야할
    경우

두번째 경우는, 저는 정말 그렇게해야 된다고 생각되지 않습니다. 세번째
경우, 작은 node.js를 기초로 한 다른 “npm installer” 이미지로 빌드 툴을
설치할 것을 권장합니다.

## 임시파일을 남겨두지 말 것

이 Dokerfile의 결과는 109 MB의 이미지 입니다.

    FROM debian:wheezy
    RUN apt-get update && apt-get install -y wget
    RUN wget http://cachefly.cachefly.net/10mb.test
    RUN rm 10mb.test

한편, 비슷해 보이는 이 Dockerfile의 이미지는 99 MB입니다.

    FROM debian:wheezy
    RUN apt-get update && apt-get install -y wget
    RUN wget http://cachefly.cachefly.net/10mb.test && rm 10mb.test

요는, `Dockerfile`에서 각 스탭 간에 디스크에 파일을 남겨두면, 그 공간은
파일을 지워도 돌아오지 않습니다. 커맨드들을 파이프로 연결하면 임시
파일을 전혀 만들지 않는 것도 가능합니다.

예를 들면, 이 명령어는 파일 시스템에 파일을 만들지 않고, 직접 tarball의
압축을 풀 수 있습니다.

    wget -O - http://nodejs.org/dist/v0.10.32/node-v0.10.32-linux-x64.tar.gz | tar zxf -

## 패키지 관리자 정리하기

컨테이너를 설정하는데 `apt-get update`를 실행했다면, 이미지가 만들어진
시점에 불필요한 데이터가 `/var/lib/apt/lists/`으로 이동됩니다. 그
디렉토리를 안전하게 제거해서 수 MB를 회수할 수 있습니다.

이 `Dockerfile`은 99 MB의 이미지를 만듭니다.

    FROM debian:wheezy
    RUN apt-get update && apt-get install -y wget

한편 이 `Dockerfile`은 90 MB의 이미지를 만듭니다.

    FROM debian:wheezy
    RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

## 패키지 버전 고정하기

Docker는 (고맙게도) 불변이지만, `Dockerfile`은 실행하는 때에 따라 변해서
같은 결과를 보장하지 않습니다. 물론 문제는 외부 환경이므로, 어찌할 수
있는게 아닙니다만, 이런 경우 외부 환경 변화에 의한 `Dockerfile`의 영향을
최소화하는게 최선이라 하겠습니다. 패키지 관리자를 통해 버전을 고정하는
것은 영향의 최소화를 실현하는 간단한 방법입니다. 여기에 그 예제가
있습니다.

    # apt-get update
    # apt-cache showpkg redis-server
    Package: redis-server
    Versions:
    2:2.4.14-1
    ...
    # apt-get install redis-server=2:2.4.14-1

보장되면 좋겠지만, 패키지 저장소가 일년후 이 버전을 제공하는지는 보장할
수 없습니다. 그래도, 이미지가 의존하는 소프트웨어의 버전을 명확히
해두는것은 틀림없이 유용합니다.

## 커맨드 합치기

관련있는 커맨드가 연속되는 경우, 1개의 `RUN` 명령어에 묶어두는 것이
좋습니다. 이것은 빌드 케쉬를 좀더 의미있게 만들고 (논리적 묶은 단계는
하나의 케쉬 단계가 됩니다.) 파일 시스템의 계층 수를 줄입니다.
(일반적으로는 바람직하다고 생각하지만, 객관적으로 나은지는
모르겠습니다.)

역슬레쉬 `` 는 읽기 편하도록 넣어 두었습니다.

    RUN apt-get update && 
        apt-get install -y 
            wget=1.13.4-3+deb7u1 
            ca-certificates=20130119 
            ...

## 반복을 피하기 위해 환경변수를 사용하기

“공식” node.js docker 이미지의 `Dockerfile`
([link](https://github.com/docker-library/node/blob/51b1dd1984e287189106884c453ca506737eed78/0.10/Dockerfile))에도
사용하는 방법입니다. 여담이지만, 이 `Dockerfile` 은 훌륭합니다. 한가지
흠이라면 이미지 위의 거대한 `buildpack-deps`
([link](https://github.com/docker-library/buildpack-deps/blob/69f0b516b5515939bef6170f1e82362174143d13/wheezy/Dockerfile))입니다.
여기에는 필요하지도 않은 것들이 들어있죠.

`ENV`에 환경 변수를 정의한 후에 `RUN`명령에서 이를 참조할 수 있습니다.
밑의, 구문은 링크된 `Dockerfile`에서 발췌한 것입니다.

    ENV NODE_VERSION 0.10.32
    RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" 
        && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 
        && rm "node-v$NODE_VERSION-linux-x64.tar.gz”


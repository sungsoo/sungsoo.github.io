---
layout: post
title: Datawarehouse
date: 2014-07-04
categories: [computer science]
tags: [big data]

---

# Data Warehouse

데이터 웨어하우스(data warehouse)란 사용자의 의사 결정에 도움을 주기 위하여, 기간시스템의 데이터베이스에 축적된 데이터를 공통의 형식으로 변환해서 관리하는 데이터베이스를 말한다. 줄여서 DW로도 불린다.

IBM이 자사 하드웨어를 판매하기 위해 1980년대 중반에 처음 도입한 것으로 알려져 있다. IBM은 '정보창고'라는 의미로 인포메이션 웨어하우스(Informationn Warehouse)라고 하였다. 이후 이 개념은 많은 하드웨어, 소프트웨어 및 툴 공급 업체 들에 의해 이론적, 현실적으로 성장하였으며, 1980년대 후반 Inmon이 데이터 접근 전략으로 데이터 웨어하우스 개념을 사용함으로써 많은 관심과 집중을 받게 되었다.

# Overview
정보(data)와 창고(warehouse)의 의미가 합성되어 만든 어휘이다. 따라서 데이터 웨어하우스는 방대한 조직 내에서 분산 운영되는 각각의 데이터 베이스 관리 시스템들을 효율적으로 통합하여 조정ㆍ관리하기 때문에 효율적인 의사 결정 시스템을 위한 기초를 제공하는 실무적인 활용 방법론이 제공되고 있다.

데이터 웨어하우스의 구성은 관리 하드웨어, 관리 소프트웨어, 추출ㆍ변환ㆍ정렬 도구, 데이터 베이스 마케팅 시스템, 메타 데이터(meta data), 최종 사용자 접근 및 활용 도구 등으로 구성되어 있다.

관리하는 방법론으로 기업의 정보 자산을 효율적으로 활용하기 위한 하나의 패러다임으로서, 기업의 전략적 관점에서 효율적인 의사 결정을 지원하기 위해 데이터의 시계열적(時系列的) 축적과 통합을 목표로 하는 기술의 구조적ㆍ통합적 환경. 데이터 베이스가 여기저기 흩어져 있는 데이터 테이블을 연결하여 사용되고 있다.

그래서 데이터 웨어하우스는 경영자의 의사 결정을 지원하는 데이터의 집합체로 주제 지향적(subjectoriented), 통합적(integrated), 시계열적(timevarient), 비휘발적(nonvolatile)인 네 가지 특성을 지닌다.

주제 지향성(subject-orientation)으로 데이터를 주제별로 구성함으로써 최종 사용자(end user)와 전산에 약한 분석자라도 이해하기 쉬운 형태가 되는 것이고 통합성(integration)으로 데이터가 데이터 웨어하우스에 들어갈 때는 일관적인 형태(데이터의 일관된 이름짓기, 일관된 변수 측정, 일관된 코드화 구조 등)로 변환되는 것이다.

그러므로 시계열성(time-variancy)로 데이터 웨어하우스의 데이터는 일정 기간 동안 정확성을 나타내고 비휘발성(nonvolatilization)로 데이터 웨어하우스에 일단 데이터가 적재되면 일괄 처리(batch) 작업에 의한 갱신 이외에는 「Insert」나 「Delete」등의 변경이 수행되지 않는 특징을 가지게 된다.

웨어하우스(warehouse)의 사전적 의미는 단순히 창고이지만 데이터웨어하우스는 데이터만이 아닌 분석 방법까지도 포함하여 조직 내 의사 결정을 지원하는 정보 관리 시스템을 의미한다.

특화된 데이터뿐만이 아니라 기업 활동 전반에 필요한 모든 정보를 일원화해 관리하며, 원시 데이터 계층, 데이터 웨어하우스 계층, 클라이언트 계층으로 구성되어 데이터의 추출, 저장, 조회 등의 기능을 수행한다. 기업 활동에 관한 모든 정보를 전체 회사 규모의 데이터베이스로 일원화하여 관리하므로 그 용량이 작게는 수백 GB에서 수 TB에 이른다.

따라서 대형 메인 프레임 등 기존의 플랫폼으로는 시간과 비용의 제약으로 곤란하였으나 병렬 서버의 등장과 자기 디스크 장치의 대용량화•저가격화로 인해 가능하게 되었다. 병렬 서버를 사용하면 하나의 검색 처리 요구를 분할하여 복수 프로세스로 병렬 처리함으로써 고속으로 검색할 수 있기 때문이다. 병렬 서버에 대응해서 관계형 데이터베이스 관리 시스템(RDBMS)을 사용한다.

# Features

* 웨어하우스 데이터는 비즈니스 사용자들의 의사결정 지원에 전적으로 이용된다.
* 기업의 운영시스템과 분리되며, 운영시스템으로부터 많은 데이터가 공급된다. 데이터 웨어하우스는 여러 개의 개별적인 운영시스템으로부터 데이터가 집중된다. 기본적인 자료 구조는 운영시스템과 완전히 다르므로 데이터들이 데이터 웨어하우스로 이동되면서 재구조화되어야 한다. 운영시스템과 데이터 웨어하우스는 근본적으로 다르며, 두 개의 매우 상이한 시스템을 요구한다.
* 데이터 웨어하우스는 신뢰할 수 있는 하나의 버전 (one version of truth)을 사용자에게 제공한다. 기존 운영시스템의 대부분은 항상 많은 부분이 중복됨으로써 하나의 사실에 대해 다수의 버전이 존재하게 된다. 그렇지만 데이터 웨어하우스에서 이러한 데이터는 전사적인 관점에서 통합된다.
* 시간성 혹은 역사성을 가진다. 즉 일, 월, 년 회계기간등과 같은 정의된 기간과 관련되어 저장된다. 운영시스템의 데이터는 사용자가 사용하는 매순간 정확한 값을 가진다. 즉 바로 지금의 데이터를 정확하게 가지고 있을 것이 요구된다. 반면 웨어하우스의 데이터는 특정 시점을 기준으로 정확하다.
* 주제 중심적이다. 운영시스템은 재고 관리, 영업관리 등과 같은 기업운영에 필요한 특화된 기능을 지원하는 데 반해, 데이터 웨어하우스는 고객, 제품 등과 같은 중요한 주제를 중심으로 그 주제와 관련된 데이터들로 조직된다.
* 컴퓨터 시스템 혹은 자료 구조에 대한 지식이 없는 사용자들이 쉽게 접근할 수 있어야 한다. 조직의 관리자들과 분석가들은 그들의 PC로부터 데이터 웨어하우스에 연결될 수 있어야 한다. 이런 연결은 요구에 즉각적이어야 하고, 또한 신속성을 보여야 한다.
* 데이터 웨어하우스는 읽기 전용 데이터베이스로서 갱신이 이루어지지 않는다. 웨어하우스 환경에서는 프로덕션 데이터 로드(Production Data Load)와 활용만이 존재하며, 운영시스템에서와 같은 의미의 데이터의 갱신은 발생하지 않는다.
* 데이터 웨어하우스는 일정한 시간 동안의 데이터를 대변하는 것으로 snap shot과 같다고 할 수 있다. 따라서 데이터 구조상에 '시간이 아주 중요한 요소로 작용한다.



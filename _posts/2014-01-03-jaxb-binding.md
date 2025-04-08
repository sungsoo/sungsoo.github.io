---
layout: post
title: JAXB Class Generation From XML Schema File using JAXB Tool
date: 2014-01-03
categories: [computer science]
tags: [design patterns]

---
### JAXB Concept

**JAXB(Java Architecture for XML Binding)**는 웹 서비스의 단순화된 개발을 위해 Java 클래스 및 XML 스키마를 맵핑하기 쉽고 편리한 방법을 제공하는 Java 기술입니다. JAXB는 Java 응용프로그램에 XML 스키마를 바인드하는 데 Java 응용프로그램에서 플랫폼 중립적인 XML 데이터의 유연성을 활용하므로 XML 프로그래밍에 대한 폭넓은 지식은 필요하지 않습니다.

웹 서비스용 WebSphere Application Server 버전 6.1 기능팩은 JAXB 2.0 표준을 제공합니다.

JAXB는 스키마와 Java 오브젝트 사이, XML 인스턴스 문서와 Java 오브젝트 인스턴스 사이에서 변환을 지원하는 XML 대 Java 바인딩 기술입니다. JAXB는 XML 문서에 대한 액세스를 단순화하는 런타임 API(application programming interface)와 수반되는 도구로 구성됩니다. JAXB는 XML 스키마를 준수하고 유효성을 검증하는 XML 문서를 빌드하는 데 도움을 주기도 합니다.

JAXB는 xjc 스키마 컴파일러 도구, schemagen 스키마 생성기 도구 및 런타임 프레임워크를 제공합니다. XSD 스키마에 정의된 요소 및 유형에 맵핑된 일련의 JavaBeans를 작성하기 위해 xjc 스키마 컴파일러 도구를 사용하여 XML 스키마 정의(XSD)를 시작할 수 있습니다. 일련의 JavaBeans를 시작한 후 schemagen 스키마 생성기 도구를 사용하여 XML 스키마를 작성할 수도 있습니다. XML 스키마와 Java 클래스 사이의 맵핑이 존재하면, XML 인스턴스 문서는 JAXB 바인딩 런타임 API를 사용하여 Java 오브젝트 사이에서 변환될 수 있습니다. 데이터 구조를 이해하지 않고도 XML 문서에 저장된 데이터에 액세스할 수 있습니다. 그런 후 결과 Java 클래스를 사용하여 웹 서비스 응용프로그램을 어셈블할 수 있습니다.

JAXB 어노테이션이 있는 클래스 및 아티팩트에는 XML 인스턴스 문서를 처리하기 위해 JAXB 런타임 API에서 필요로 하는 모든 정보가 들어 있습니다. JAXB 런타임 API는 XML로 JAXB 오브젝트의 정렬 및 JAXB 클래스 인스턴스로 다시 XML 문서의 정렬 해제를 지원합니다. 선택적으로 수신 및 전송 XML 문서 둘 모두 XML 스키마 내에 정의된 XML 제한조건을 강제로 준수하도록 XML 유효성 검증을 제공하는 JAXB를 사용할 수 있습니다.

JAXB는 이 제품 내의 JAX-WS(Java API for XML Web Services) 2.0 툴링 및 구현에서 사용되는 기본적인 데이터 바인딩 기술입니다. JAX-WS 응용프로그램 내에서 사용할 JAXB를 개발할 수 있습니다.

Java 응용프로그램 내에서 XML을 조작할 XML 데이터 바인딩 기술을 활용하려면 JAX-WS와는 무관하게 JAXB를 사용할 수도 있습니다.

다음 다이어그램은 JAXB 아키텍처를 나타냅니다.

![JAXB Architecture](http://sungsoo.github.com/images/jaxb-architecture.gif)

### JAXB 도구를 사용하여 XML 스키마 파일로부터 JAXB 클래스 생성

**JAXB(Java Architecture for XML Binding)** 작업으로, XML 스키마 파일을 어노테이션이 있는 Java 클래스로 컴파일하십시오.

#### 시작하기 전에
XML 스키마 파일을 개발하거나 확보하십시오.

#### 이 타스크 정보
JAXB API 및 도구를 사용하여 XML 스키마 및 Java 클래스 간에 맵핑을 성립시키십시오. XML 스키마에서는 XML 문서의 해당 데이터 요소 및 관계에 대해서 설명합니다. 데이터 맵핑 또는 바인딩이 존재한 후, XML 문서를 Java 오브젝트로 또는 그 반대로 변환할 수 있습니다. 이제 해당 데이터 구조를 이해할 필요 없이 XML 문서에 저장된 데이터에 액세스할 수 있습니다.

JAXB 스키마 컴파일러인 xjc 명령행 도구를 사용하여, XML 스키마 파일에서 어노테이션이 있는 Java 클래스를 생성할 수 있습니다. 어노테이션이 있는 결과 Java 클래스는, XML을 정렬 및 정렬 해제에 대해 구문 분석하기 위해 JAXB 런타임이 필요로 하는 모든 필수 정보를 포함합니다. JAX-WS(Java API for XML Web Services) 응용프로그램 내에서 또는 비JAX-WS Java 응용프로그램에서, XML 데이터 처리에 대해 결과 JAXB 클래스를 사용할 수 있습니다.

#### 프로시저
1. JAXB 스키마 컴파일러인 xjc 명령을 사용하여 to generate JAXB 어노테이션이 있는 Java 클래스를 생성하십시오. 스키마 컴파일러는 app_server_root\bin\ 디렉토리에 있습니다. 스키마 컴파일러는 편집에 이용되는 바인딩 옵션에 따라서 Java 소스 파일 및 JAXB 특성 파일을 포함하는 일련의 패키지를 만듭니다.
2. (선택적) 사용자 정의 바인딩 선언을 사용하여 기본 JAXB 맵핑을 변경하십시오. XML 스키마 파일 또는 독립적인 바인딩 파일 중 하나에서 바인딩 선언을 정의하십시오. -b 옵션을 xjc 명령에 사용하여 사용자 정의 바인딩 파일을 전달할 수 있습니다.
3. 생성된 JAXB 오브젝트를 컴파일하십시오. 생성된 아티팩트를 컴파일하려면, JAX-WS용 Thin 클라이언트를 WebSphere Application Server와 함께 해당 클래스 경로에 추가하십시오.


#### 결과
JAXB 오브젝트를 생성하였으므로, 생성된 JAXB 오브젝트를 사용하여 Java 응용프로그램을 작성하고 생성된 JAXB 클래스를 통해 XML 컨텐츠를 처리할 수 있습니다.

#### 예
다음 예제에서는 기존 XML 스키마 파일을 이용하여 시작 시 JAXB 작업이 Java 클래스를 생성하는 방법에 대해 설명합니다.

* 다음 bookSchema.xsd 스키마 파일을 임시 디렉토리에 복사하십시오.  

```
  <xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">                                          
     <xsd:element name="CatalogData">                                                               
       <xsd:complexType >                                                                         
         <xsd:sequence>
           <xsd:element name="books" type="bookdata" minOccurs="0" 
						maxOccurs="unbounded"/>    
         </xsd:sequence>
       </xsd:complexType>
     </xsd:element>
     <xsd:complexType name="bookdata">                                                              
       <xsd:sequence>
         <xsd:element name="author" type="xsd:string"/>                                         
         <xsd:element name="title" type="xsd:string"/>                                          
         <xsd:element name="genre" type="xsd:string"/>                                          
         <xsd:element name="price" type="xsd:float"/>                                           
         <xsd:element name="publish_date" type="xsd:dateTime"/>                                 
         <xsd:element name="description" type="xsd:string"/>                                    
       </xsd:sequence>
       <xsd:attribute name="id" type="xsd:string"/>                                               
     </xsd:complexType>
   </xsd:schema> 
```

* 명령 프롬프트를 여십시오.  


* 해당 스키마 파일이 위치한 디렉토리에서 JAXB 스키마 컴파일러인 xjc 명령을 실행하십시오. xjc 스키마 컴파일러 도구는 app_server_root\bin\ 디렉토리에 있습니다.


**[Windows]**

```
app_server_root\bin\xjc.bat bookSchema.xsd
```

**[Linux] [AIX] [HP-UX] [Solaris]**

```
app_server_root/bin/xjc.sh bookSchema.xsd
```
	
* xjc 명령을 실행하면 다음과 같은 JAXB Java 파일이 생성됩니다.

```	
generated\Bookdata.java
generated\CatalogdData.java
generated\ObjectFactory.java
```

* 생성된 JAXB 오브젝트를 Java 응용프로그램 내에서 사용하여, 생성된 JAXB 클래스를 통해 XML 컨텐츠를 처리하십시오.


xjc 명령에 관한 자세한 정보는 JAXB 2.0 참조 구현 문서를 참조하십시오.

### References
[1] [JAXB 도구를 사용하여 XML 스키마 파일로부터 JAXB 클래스 생성](http://www-01.ibm.com/support/knowledgecenter/?lang=ko#!/SSEQTP_6.1.0/com.ibm.websphere.wsfep.multiplatform.doc/info/ae/ae/twbs_jaxbschema2java.html), IBM Knowledge Center, 2009.
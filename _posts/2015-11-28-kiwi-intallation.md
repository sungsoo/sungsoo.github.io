---
layout: post
title: KIWI Installation
date: 2015-11-28
categories: [computer science]
tags: [developments]

---

# KIWI Installation

## 환경변수 설정

KIWI_HOME/conf/kiwi-env.sh 에 아래의 필수 환경 변수를 설정해 준다. 

```
export HADOOP_HOME= 
export JAVA_HOME= 
```

start-kiwi.sh를 실행하여 키위를 기동한다. 

```
$KIWI_HOME/bin/start-kiwi.sh 
```


## 카탈로그 서버 설정 

별도로 설정하지 않으면, 키위는 기본으로 데이터의 카탈로그 정보를 관리하는 카탈로그 서버 저장소로 아파치 더비(Apache Derby)를 사용한다. 더비의 기본 저장 디렉토리 위치가 /tmp/kiwi-catalog-${username} 인데, /tmp 디렉토리는 머신 설정에 따라 주기적으로 삭제될 우려가 있으므로, 지속적으로 사용하기 위해서는 안전한 위치로 설정하기를 권장한다. 또한 아파치 더비는 멀티 유저 접속을 지원하지 않으므로, 키위에서 지원하는 PostgreSQL, MySQL 등의 다른 저장소를 사용하기를 권장한다. 

카탈로그 서버 설정은 $KIWI_HOME/conf/catalog-site.xml을 다음과 같이 설정한다. 


## 아파치 더비

```xml
<property>
  <name>kiwi.catalog.store.class</name>
  <value>kr.re.etri.kiwi.catalog.store.DerbyStore</value>
</property>
<property>
  <name>kiwi.catalog.uri</name>
  <value>jdbc:derby:<저장할 디렉토리 경로>;create=true</value>
</property>
```
## MySQL

```xml
<property>
  <name>kiwi.catalog.store.class</name>
  <value>kr.re.etri.kiwi.catalog.store.MySQLStore</value>
</property>
<property>
  <name>kiwi.catalog.connection.id</name> 
  <value><mysql user name></value>
</property>
<property> 
  <name>kiwi.catalog.connection.password</name> 
  <value><mysql user password></value>
</property>
<property> 
  <name>kiwi.catalog.uri</name> 
  <value>jdbc:mysql://<mysql host name>:<mysql port>/<database name for kiwi>?createDatabaseIfNotExist=true</value> 
</property>
```

### MySQL Database 설정

```bash
rose:~sungsoo$ mysql.server start
rose:~sungsoo$ mysql -u root
```

```xml
mysql> create user 'kiwi'@'localhost' identified by 'kiwi'; 
Query OK, 0 rows affected (0.00 sec)
mysql> create database kiwi; 
Query OK, 1 row affected (0.00 sec)
mysql> grant all on kiwi.* to 'kiwi'@'localhost'; 
Query OK, 0 rows affected (0.01 sec)
```

MySQL의 JDBC 드라이버를 클래스패스 경로에 추가해야 하는데, $KIWI_HOME/conf/kiwi-env.sh에 다음과 같이 추가합니다. 

```
export KIWI_CLASSPATH=/usr/local/mysql/lib/mysql-connector-java-x.x.x-bin.jar 
```

## PostgreSQL


```xml
<property> 
  <name>kiwi.catalog.store.class</name>
  <value>kr.re.etri.kiwi.catalog.store.PostgreSQLStore</value>
</property>
<property> 
  <name>kiwi.catalog.connection.id</name> 
  <value><postgresql user name></value> 
</property>
<property> 
  <name>kiwi.catalog.connection.password</name> 
  <value><postgresql user password></value> 
</property>
<property> 
  <name>kiwi.catalog.uri</name> 
  <value>jdbc:postgresql://<postgresql host name>:<postgresql port>/<database name for kiwi>?createDatabaseIfNotExist=true</value> 
</property>
```

### PostgreSQL Database 설정

```
postgresql> create user kiwi with password 'xxxxxx'; 
postgresql> create database kiwi; 
postgresql> grant all privileges on database "kiwi" to kiwi;
```

PostgreSQL의 JDBC 드라이버를 클래스패스 경로에 추가해야 하는데, $KIWI_HOME/conf/kiwi-env.sh에 다음과 같이 추가한다.

```
export KIWI_CLASSPATH=/usr/local/postgresql/lib/postgresql-x.x-x.jdbc4.jar 
```


## 분산 클러스터 설정

kiwi-site.xml에 다음과 같이 설정한다. 

```xml
<property>
  <name>kiwi.rootdir</name> 
  <value>hdfs://hostname:port/kiwi</value>
</property>
<property>
  <name>kiwi.master.umbilical-rpc.address</name> 
  <value>hostname:26001</value>
</property>
<property>
  <name>kiwi.master.client-rpc.address</name> 
  <value>hostname:26002</value>
</property>
<property>
  <name>kiwi.resource-tracker.rpc.address</name> 
  <value>hostname:26003</value>
</property>
<property>
  <name>kiwi.catalog.client-rpc.address</name> 
  <value>hostname:26005</value>
</property> 
```




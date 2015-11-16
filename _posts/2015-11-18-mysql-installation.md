---
layout: post
title: MySQL Installation on Ubuntu
date: 2015-11-18
categories: [computer science]
tags: [data management]

---

# MySQL Installation on Ubuntu


## 1) mysql 검색


	sudo apt-cache search mysql-server


## 2) mysql 설치

	sudo apt-get install mysql-server-5.6



## 3) 외부에서 접속할 수 있도록 권한부여.


### (1) mysql database에 로그인.

	mysql -u root -p
	mysql -h 192.168.115.207 -P 3306 -u root -p

### (2) default db 변경

	 use mysql;

### (3) 권한부어

	GRANT ALL PRIVILEGES ON *.* to 'root'@'%' IDENTIFIED BY 'password';

password => 어드민 패스워드 입력


### (4) 즉시반영

	flush privileges;



### 4) my.cnf 설정화일 변경

	sudo vi /etc/mysql/my.cnf

bind-address = 127.0.0.1 이부분을 주석처리 


### 5). mysql Server 재시작

	sudo /etc/init.d/mysql restart



### 6) 한글 설정

	sudo vi /etc/mysql/my.cnf 열어 


```
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
character-set-server=utf8
collation-server=utf8_general_ci
init_connect = set collation_connection = utf8_general_ci
init_connect = set names utf8

[mysql]
default-character-set=utf8

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
default-character-set=utf8

[client]
default-character-set=utf8

[mysqldump]
default-character-set=utf8
```

내용을 추가


설정내용확인

	mysql -h 192.168.115.207 -P 3306 -u root -p



### 7) innodb 설정

	sudo vi /etc/mysql/my.cnf에 추가

```
innodb_data_home_dir = /var/lib/mysql
innodb_data_file_path = ibdata1:10M:autoextend
innodb_log_group_home_dir = /var/lib/mysql
innodb_buffer_pool_size = 256M
innodb_additional_mem_pool_size = 20M
innodb_log_file_size = 64M
innodb_log_buffer_size = 8M
innodb_flush_log_at_trx_commit = 1
innodb_lock_wait_timeout = 50
```

## JDBC 설정 

	$ wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.27.tar.gz && tar xvzf mysql*.gz
	$ cp mysql-connector-java-5.1.27/*.jar $HIVE_HOME/lib


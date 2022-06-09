---
layout: post
title: Connect to MySQL Database from Visual Studio Code
date: 2022-06-09
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Connect to MySQL Database from Visual Studio Code and Run SQL Queries using SQLTools Extension](https://www.youtube.com/watch?v=wzdCpJY6Y4c)


---

# Connect to MySQL Database from Visual Studio Code

## Abstract
Setup MySQL Connection in Visual Studio Code and Run SQL Queries using SQLTools. How to install and use SQLTools with Visual Studio Code. How to run SQL queries from Visual Studio Code. How to fix couldn't find any drivers installed yet. How to fix ER_NOT_SUPPORTED_AUTH_MODE Client does not support authentication protocol requested by server; consider upgrading mysql client. 

```sql
Create new MySQL user with old authentication method:
CREATE USER 'sqluser'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'sqluser'@'%';
FLUSH PRIVILEGES;
```

<iframe width="600" height="400" src="https://www.youtube.com/embed/wzdCpJY6Y4c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
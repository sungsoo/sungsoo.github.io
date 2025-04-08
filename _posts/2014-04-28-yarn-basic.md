---
layout: post
title: Simple YARN Application
date: 2014-04-28
categories: [computer science]
tags: [big data]

---

# Article Source
* Title: [GETTING STARTED - Simple YARN Application](http://spring.io/guides/gs/yarn-basic/)

[![](http://sungsoo.github.com/images/yarn-sample.png)](http://sungsoo.github.com/images/yarn-sample.png)

# Simple YARN Application

## Getting Started

This guide walks you through the process of creating a Spring Hadoop
YARN application.

What you’ll build 
-----------------

You’ll build a simple Hadoop YARN application with Spring Hadoop and
Spring Boot.

What you’ll need 
----------------

-   About 15 minutes

-   A favorite text editor or IDE

-   [JDK
    1.6](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
    or later

-   [Gradle 1.11+](http://www.gradle.org/downloads) or [Maven
    3.0+](http://maven.apache.org/download.cgi)

-   You can also import the code from this guide as well as view the web
    page directly into [Spring Tool Suite (STS)](/guides/gs/sts) and
    work your way through it from there.

-   Local single-node instance based on Hadoop 2.2.0 or later. The
    Apache Hadoop site has some
    [instructions](http://hadoop.apache.org/docs/r2.2.0/hadoop-project-dist/hadoop-common/SingleCluster.html).

How to complete this guide 
--------------------------

Like most Spring [Getting Started guides](/guides), you can start from
scratch and complete each step, or you can bypass basic setup steps that
are already familiar to you. Either way, you end up with working code.

To **start from scratch**, move on to [Set up the project](#scratch).

To **skip the basics**, do the following:

-   [Download](https://github.com/spring-guides/gs-yarn-basic/archive/master.zip)
    and unzip the source repository for this guide, or clone it using
    [Git](/understanding/Git):
    `git clone https://github.com/spring-guides/gs-yarn-basic.git`

-   cd into `gs-yarn-basic/initial`

-   Jump ahead to [Create a Yarn Container](#initial).

**When you’re finished**, you can check your results against the code in
`gs-yarn-basic/complete`.

Hadoop YARN Intro
-----------------

If you have been following the Hadoop community over the past year or
two, you’ve probably seen a lot of discussions around YARN and the next
version of Hadoop’s MapReduce called MapReduce v2. YARN (Yet Another
Resource Negotiator) is a component of the MapReduce project created to
overcome some performance issues in Hadoop’s original design. The
fundamental idea of MapReduce v2 is to split the functionalities of the
JobTracker, Resource Management and Job Scheduling/Monitoring, into
separate daemons. The idea is to have a global Resource Manager (RM) and
a per-application Application Master (AM). A generic diagram for YARN
component dependencies can be found on the Hadoop page describing the
[YARN
architecture](http://hadoop.apache.org/docs/r2.2.0/hadoop-yarn/hadoop-yarn-site/YARN.html).

MapReduce Version 2 is a re-write of the original MapReduce code run as
an application on top of YARN. It is also possible to write other types
of applications, having nothing to do with MapReduce, and then run them
on YARN. However, the YARN APIs are complex and writing a custom YARN
based application is difficult. The YARN APIs are low-level
infrastructure APIs, not high-level developer APIs.

Spring YARN Intro 
-----------------

The development process for a YARN application, from the moment when a
developer starts his or her work to the point when someone actually
executes the application on a Hadoop cluster, is a bit more complicated
than just creating a few lines of "Hello world!" code.

Let’s see what needs to be considered:

-   What is the project structure for the application code?

-   How is the project built and packaged?

-   How is the packaged application configured?

-   How is the final application executed on YARN?

We believe that Spring YARN and Spring Boot creates a very clear story
for how above topics could be handled.

At a high level, Spring YARN provides three different components,
[`YarnClient`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/client/YarnClient.html),
[`YarnAppmaster`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/am/YarnAppmaster.html)
and
[`YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/container/YarnContainer.html)
which together can be called a Spring YARN Application. We provide
default implementations for all components while still giving the end
user an option to customize as much as he or she wants.

In a pure Hadoop environment it has always been a cumbersome process to
get your own code packaged, deployed and executed on a Hadoop cluster.
Should you just put your compiled package in Hadoop’s classpath, or rely
on Hadoop’s tools to copy your artifacts into Hadoop during the job
submission? What about if your own code depends on some library that
isnt already present on Hadoop’s default classpath? Even worse, what
about if the dependencies in your code collides with libraries already
on Hadoop’s default classpath?

With Spring Boot you can work around all these issues. You either create
an executable jar (sometimes called an uber or fat jar) which bundles
all dependencies, or a zip package which can be automatically extracted
before the code is about to be executed. In the latter case, it’s
possible to re-use entries already available on Hadoop’s default
classpath.

In this guide we are going to show how these 3 components,
[`YarnClient`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/client/YarnClient.html),
[`YarnAppmaster`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/am/YarnAppmaster.html)
and
[`YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/container/YarnContainer.html)
are packaged into executable jars using Spring Boot. Internally Spring
Boot rely heavy on application auto-configuration and Spring YARN adds
its own auto-configuration magic. The application developer can then
concentrate on his or her own code and application configuration instead
of spending a lot of time trying to understand how all the components
should integrate with each other.

Set up the project 
------------------

First you set up a basic build script. You can use any build system you
like when building apps with Spring, but the code you need to work with
[Gradle](http://gradle.org) and [Maven](https://maven.apache.org) is
included here. If you’re not familiar with either, refer to [Building
Java Projects with Gradle](/guides/gs/gradle) or [Building Java Projects
with Maven](/guides/gs/maven).

We also have additional guides having specific instructions using build
systems with Spring YARN. If you’re not familiar with either, refer to
[Building Spring YARN Projects with Gradle](/guides/gs/gradle-yarn) or
[Building Spring YARN Projects with Maven](/guides/gs/maven-yarn).

### Create the directory structure 

In a project directory of your choosing, create the following
subdirectory structure:

``` 
├── gs-yarn-basic-appmaster
│   └── src
│       └── main
│           ├── resources
│           └── java
│               └── hello
│                   └── appmaster
├── gs-yarn-basic-container
│   └── src
│       └── main
│           ├── resources
│           └── java
│               └── hello
│                   └── container
├── gs-yarn-basic-client
│   └── src
│       └── main
│           ├── resources
│           └── java
│               └── hello
│                   └── client
└── gs-yarn-basic-dist
```

for example, on \*nix systems, with:

``` 
mkdir -p gs-yarn-basic-appmaster/src/main/resources
mkdir -p gs-yarn-basic-appmaster/src/main/java/hello/appmaster
mkdir -p gs-yarn-basic-container/src/main/resources
mkdir -p gs-yarn-basic-container/src/main/java/hello/container
mkdir -p gs-yarn-basic-client/src/main/resources
mkdir -p gs-yarn-basic-client/src/main/java/hello/client
mkdir -p gs-yarn-basic-dist
```

### Create the Gradle build files 

Below is the [initial Gradle build
file](https://github.com/spring-guides/gs-yarn-basic/blob/master/initial/build.gradle)
and the [initial Gradle settings
file](https://github.com/spring-guides/gs-yarn-basic/blob/master/initial/settings.gradle).
But you can also use Maven. The pom.xml file is included [right
here](https://github.com/spring-guides/gs-yarn-basic/blob/master/initial/pom.xml).
If you are using [Spring Tool Suite (STS)](/guides/gs/sts), you can
import the guide directly.

`build.gradle`

```java
buildscript {
    repositories {
        maven { url "http://repo.spring.io/libs-milestone" }
    }
    dependencies {
        classpath("org.springframework.boot:spring-boot-gradle-plugin:1.0.0.RELEASE")
    }
}

allprojects {
    apply plugin: 'base'
}

subprojects { subproject ->
    apply plugin: 'java'
    apply plugin: 'eclipse'
    apply plugin: 'idea'
    version =  '0.1.0'
    repositories {
        mavenCentral()
        maven { url "http://repo.spring.io/libs-milestone" }
    }
    dependencies {
        compile("org.springframework.data:spring-yarn-boot:2.0.0.RC2")
    }
    task copyJars(type: Copy) {
        from "$buildDir/libs"
        into "$rootDir/gs-yarn-basic-dist/target/gs-yarn-basic-dist/"
        include "**/*.jar"
    }
    assemble.doLast {copyJars.execute()}
}

project('gs-yarn-basic-client') {
    apply plugin: 'spring-boot'
}

project('gs-yarn-basic-appmaster') {
    apply plugin: 'spring-boot'
}

project('gs-yarn-basic-container') {
    apply plugin: 'spring-boot'
}

project('gs-yarn-basic-dist') {
    dependencies {
        compile project(":gs-yarn-basic-client")
        compile project(":gs-yarn-basic-appmaster")
        compile project(":gs-yarn-basic-container")
        testCompile("org.springframework.data:spring-yarn-boot-test:2.0.0.RC2")
        testCompile("org.hamcrest:hamcrest-core:1.2.1")
        testCompile("org.hamcrest:hamcrest-library:1.2.1")
    }
    test.dependsOn(':gs-yarn-basic-client:assemble')
    test.dependsOn(':gs-yarn-basic-appmaster:assemble')
    test.dependsOn(':gs-yarn-basic-container:assemble')
    clean.doLast {ant.delete(dir: "target")}
    jar.enabled = false
}

task wrapper(type: Wrapper) {
    gradleVersion = '1.11'
}
```

`settings.gradle`

```java
rootProject.name = 'gs-yarn-basic'
include 'gs-yarn-basic-client','gs-yarn-basic-appmaster','gs-yarn-basic-container','gs-yarn-basic-dist'
```

In the above gradle build file we simply create three different jars,
each having classes for its specific role. These jars are then
repackaged by Spring Boot’s gradle plugin to create an executable jar.

Create a Yarn Container 
-----------------------

Here you create `ContainerApplication` and `HelloPojo` classes.

`gs-yarn-basic-container/src/main/java/hello/container/ContainerApplication.java`

```java
package hello.container;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableAutoConfiguration
public class ContainerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ContainerApplication.class, args);
    }

    @Bean
    public HelloPojo helloPojo() {
        return new HelloPojo();
    }

}
```

In the above `ContainerApplication`, notice how we added the
[`@Configuration`](http://docs.spring.io/spring/docs/4.0.3.RELEASE/javadoc-api/org/springframework/context/annotation/Configuration.html)
annotation at the class level and the
[`@Bean`](http://docs.spring.io/spring/docs/4.0.3.RELEASE/javadoc-api/org/springframework/context/annotation/Bean.html)
annotation on the `helloPojo()` method. We have jumped a little bit
ahead of what you most likely expect us to do. We previously mentioned
[`YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/container/YarnContainer.html)
component which is an interface towards what you’d execute in your
containers. You could define your custom
[`YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/container/YarnContainer.html)
to implement this interface and wrap all logic inside of that
implementation.

However, Spring YARN defaults to a
[`DefaultYarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/container/DefaultYarnContainer.html)
if none is defined and this default implementation expects to find a
specific bean type from a `Spring Application Context` having the real
user facing logic what container is supposed to do.

`gs-yarn-basic-container/src/main/java/hello/container/HelloPojo.java`

```java
package hello.container;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.fs.FsShell;
import org.springframework.yarn.annotation.OnYarnContainerStart;
import org.springframework.yarn.annotation.YarnContainer;

@YarnContainer
public class HelloPojo {

    private static final Log log = LogFactory.getLog(HelloPojo.class);

    @Autowired
    private Configuration configuration;

    @OnYarnContainerStart
    public void publicVoidNoArgsMethod() throws Exception {
        log.info("Hello from HelloPojo");
        log.info("About to list from hdfs root content");

        FsShell shell = new FsShell(configuration);
        for (FileStatus s : shell.ls(false, "/")) {
            log.info(s);
        }
        shell.close();
    }

}
```

`HelloPojo` class is a simple `POJO` in a sense that it doesn’t extend
any Spring YARN base classes. What we did in this class:

-   We added a class level
    [`@YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/annotation/YarnContainer.html)
    annotation.

-   We added a method level
    [`@OnYarnContainerStart`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/annotation/OnYarnContainerStart.html)
    annotation

-   We `@Autowired` a Hadoop’s `Configuration` class

[`@YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/annotation/YarnContainer.html)
is a stereotype annotation, providing a Spring
[`@Component`](http://docs.spring.io/spring/docs/4.0.3.RELEASE/javadoc-api/org/springframework/stereotype/Component.html)
annotation. This is automatically marking a class to be a candidate for
having
[`@YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/annotation/YarnContainer.html)
functionality.

Within this class we can use
[`@OnYarnContainerStart`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/annotation/OnYarnContainerStart.html)
annotation to mark a public method with `void` return type and no
arguments act as an entry point for some application code that needs to
be executed on Hadoop.

To demonstrate that we actually have some real functionality in this
class, we simply use Spring Hadoop’s
[`@FsShell`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/data/hadoop/fs/FsShell.html)
to list entries from the root of the `HDFS` file system. We needed to
have Hadoop’s `Configuration` which is prepared for you so that you can
just rely on autowiring for access to it.

Create a Yarn Appmaster 
-----------------------

Here you create an `AppmasterApplication` class.

`gs-yarn-basic-appmaster/src/main/java/hello/appmaster/AppmasterApplication.java`

```java
package hello.appmaster;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

@EnableAutoConfiguration
public class AppmasterApplication {

    public static void main(String[] args) {
        SpringApplication.run(AppmasterApplication.class, args);
    }

}
```

The application class for
[`YarnAppmaster`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/am/YarnAppmaster.html)
looks even simpler than what we just did for `ClientApplication`. Again
the `main()` method uses Spring Boot’s `SpringApplication.run()` method
to launch an application.

One might argue that if you use this type of dummy class to basically
fire up your application, could we not use a generic class for this?
Well simple answer is yes, we even have a generic
[`SpringYarnBootApplication`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/boot/app/SpringYarnBootApplication.html)
class just for this purpose. You’d define that to be your main class for
an executable jar and you’d accomplish this during the gradle build.

In real life, however, you most likely need to start adding more custom
functionality to your application component and you’d do that by
starting to add more beans. To do that you need to define a Spring
[`@Configuration`](http://docs.spring.io/spring/docs/4.0.3.RELEASE/javadoc-api/org/springframework/context/annotation/Configuration.html)
or
[`@ComponentScan`](http://docs.spring.io/spring/docs/4.0.3.RELEASE/javadoc-api/org/springframework/context/annotation/ComponentScan.html).
`AppmasterApplication` would then act as your main starting point to
define more custom functionality. Effectively this is exactly what we do
with a
[`YarnContainer`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/container/YarnContainer.html)
in section below.

Create a Yarn Client 
--------------------

Here you create a `ClientApplication` class.

`gs-yarn-basic-client/src/main/java/hello/client/ClientApplication.java`

```java
package hello.client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.yarn.client.YarnClient;

@EnableAutoConfiguration
public class ClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(ClientApplication.class, args)
            .getBean(YarnClient.class)
            .submitApplication();
    }

}
```

-   [`@EnableAutoConfiguration`](http://docs.spring.io/spring-boot/docs/1.0.0.RELEASE/api/org/springframework/boot/autoconfigure/EnableAutoConfiguration.html)
    tells Spring Boot to start adding beans based on classpath setting,
    other beans, and various property settings.

-   Specific auto-configuration for Spring YARN components takes place
    in a same way than from a core Spring Boot.

The `main()` method uses Spring Boot’s `SpringApplication.run()` method
to launch an application. From there we simply request a bean of type
[`YarnClient`](http://docs.spring.io/spring-hadoop/docs/2.0.0.RC2/api/org/springframework/yarn/client/YarnClient.html)
and execute its `submitApplication()` method. What happens next depends
on application configuration, which we go through later in this guide.
Did you notice that there wasn’t a single line of XML?

Create an Application Configuration 
-----------------------------------

Create a new yaml configuration file for all sub-projects.

`gs-yarn-basic-container/src/main/resources/application.yml`
`gs-yarn-basic-appmaster/src/main/resources/application.yml`
`gs-yarn-basic-client/src/main/resources/application.yml`

```
spring:
    hadoop:
        fsUri: hdfs://localhost:8020
        resourceManagerHost: localhost
    yarn:
        appName: gs-yarn-basic
        applicationDir: /app/gs-yarn-basic/
        client:
            files:
              - "file:gs-yarn-basic-dist/target/gs-yarn-basic-dist/gs-yarn-basic-container-0.1.0.jar"
              - "file:gs-yarn-basic-dist/target/gs-yarn-basic-dist/gs-yarn-basic-appmaster-0.1.0.jar"
            launchcontext:
                archiveFile: gs-yarn-basic-appmaster-0.1.0.jar
        appmaster:
            containerCount: 1
            launchcontext:
                archiveFile: gs-yarn-basic-container-0.1.0.jar
```


Pay attention to the `yaml` file format which expects correct indentation and no tab characters.

Final part for your application is its runtime configuration, which
glues all the components together, which then can be executed as a
Spring YARN application. This configuration act as source for Spring
Boot’s
[`@ConfigurationProperties`](http://docs.spring.io/spring-boot/docs/1.0.0.RELEASE/api/org/springframework/boot/context/properties/ConfigurationProperties.html)
and contains relevant configuration properties which cannot be
auto-discovered or otherwise needs to have an option to be overwritten
by an end user.

This way you can define your own defaults for your environment. Because
these
[`@ConfigurationProperties`](http://docs.spring.io/spring-boot/docs/1.0.0.RELEASE/api/org/springframework/boot/context/properties/ConfigurationProperties.html)
are resolved at runtime by Spring Boot, you even have an easy option to
overwrite these properties either by using command-line options,
environment variables or by providing additional configuration property
files.

Build the Application 
---------------------

For gradle simply execute the `clean` and `build` tasks.

``` 
./gradlew clean build
```

To skip existing tests if any:

``` 
./gradlew clean build -x test
```

For maven simply execute the `clean` and `package` goals.

``` 
mvn clean package
```

To skip existing tests if any:

``` 
mvn clean package -DskipTests=true
```

Below listing shows files after a succesfull gradle build.

    gs-yarn-basic-dist/target/gs-yarn-basic-dist/gs-yarn-basic-client-0.1.0.jar
    gs-yarn-basic-dist/target/gs-yarn-basic-dist/gs-yarn-basic-appmaster-0.1.0.jar
    gs-yarn-basic-dist/target/gs-yarn-basic-dist/gs-yarn-basic-container-0.1.0.jar

Run the Application 
-------------------

Now that you’ve successfully compiled and packaged your application,
it’s time to do the fun part and execute it on Hadoop YARN.

To accomplish this, simply run your executable client jar from the
projects root dirctory.

``` 
$ java -jar gs-yarn-basic-dist/target/gs-yarn-basic-dist/gs-yarn-basic-client-0.1.0.jar
```

Using the [Resource Manager UI](http://localhost:8088/cluster) you can
see status of an application.

![Resource Manager UI](http://sungsoo.github.com/images/rm-ui.png)

To find Hadoop’s application logs, you need to do a simple find within
the hadoop clusters configured userlogs directory.

``` 
$ find hadoop/logs/userlogs/ | grep std
hadoop/logs/userlogs/application_1395578417086_0001/container_1395578417086_0001_01_000001/Appmaster.stdout
hadoop/logs/userlogs/application_1395578417086_0001/container_1395578417086_0001_01_000001/Appmaster.stderr
hadoop/logs/userlogs/application_1395578417086_0001/container_1395578417086_0001_01_000002/Container.stdout
hadoop/logs/userlogs/application_1395578417086_0001/container_1395578417086_0001_01_000002/Container.stderr
```

Grep logging output from a `HelloPojo` class.

``` 
$ grep HelloPojo hadoop/logs/userlogs/application_1395578417086_0001/container_1395578417086_0001_01_000002/Container.stdout
[2014-03-23 12:42:05.763] boot - 17064  INFO [main] --- HelloPojo: Hello from HelloPojo
[2014-03-23 12:42:05.763] boot - 17064  INFO [main] --- HelloPojo: About to list from hdfs root content
[2014-03-23 12:42:06.745] boot - 17064  INFO [main] --- HelloPojo: FileStatus{path=hdfs://localhost:8020/; isDirectory=true; modification_time=1395397562421; access_time=0; owner=root;
group=supergroup; permission=rwxr-xr-x; isSymlink=false}
[2014-03-23 12:42:06.746] boot - 17064  INFO [main] --- HelloPojo:
FileStatus{path=hdfs://localhost:8020/app; isDirectory=true;
modification_time=1395501405412; access_time=0; owner=hadoop; group=supergroup; permission=rwxr-xr-x; isSymlink=false}
```

Summary 
-------

Congratulations! You’ve just developed a Spring YARN application!


Get the Code
------------

* [Download
ZIP](https://github.com/spring-guides/gs-yarn-basic/archive/master.zip)

* [Import into STS](https://github.com/spring-guides/gs-yarn-basic)

* [Go To Repo](https://github.com/spring-guides/gs-yarn-basic)

---
layout: post
title: Setup a JavaCL Maven Project 
date: 2015-04-21
categories: [computer science]
tags: [machine learning]

---


# Setup a JavaCL Maven Project

This quick tutorial will get you through setting up a JavaCL project.

You can either create a plain Maven project by hand and modify its
`pom.xml` as below, or use the fully automated way that uses a Maven
archetype :

-   Create a new project

> ![](http://javacl.googlecode.com/svn/wiki/images/NetbeansArchetype-NewProject.png)

-   Choose `Maven / Project from Archetype` :

> ![](http://javacl.googlecode.com/svn/wiki/images/NetbeansArchetype-ChooseProject.png)

In the `Maven Archetype` screen, click on `Add`, fill-in the details
then click on `Ok` :

-   Group Id = `com.nativelibs4java`
-   Archetype Id = `javacl-simple-tutorial`
-   Version = `1.0-SNAPSHOT`
-   Repository = `http://oss.sonatype.org/content/groups/public`

> ![](http://javacl.googlecode.com/svn/wiki/images/NetbeansArchetype-AchetypeDetails.png)

-   Select the custom archetype you've just created and click on `Next`,
    then `Finish` :

> ![](http://javacl.googlecode.com/svn/wiki/images/NetbeansArchetype-CustomArchetype.png)


## With IntelliJ IDEA

This will work with the open source Community Edition as well as with
the Ultimate Edition. If you haven't tried it yet, [IntelliJ
IDEA](http://www.jetbrains.com/idea/) is a great IDE to work with...

It's very easy to create the sources for this tutorial with IDEA :

-   Make sure to install [Maven](http://maven.apache.org/) and set the
    `M2_HOME` environment variable properly
-   Create a new project

> ![](http://javacl.googlecode.com/svn/wiki/images/IdeaArchetype-FileNewProject.png)

-   Select `Create a project from scratch` :

> ![](http://javacl.googlecode.com/svn/wiki/images/IdeaArchetype-NewProject.png)

-   Choose a name for your tutorial project and select `Maven Module`
    for the type of the project, then click on `Next` :

> ![](http://javacl.googlecode.com/svn/wiki/images/IdeaArchetype-NewMavenProject.png)

Tick `Create from archetype` and click on `Add archetype`, then fill-in
the details :

-   Group Id = `com.nativelibs4java`
-   Archetype Id = `javacl-simple-tutorial`
-   Version = `1.0-SNAPSHOT`
-   Repository = `http://oss.sonatype.org/content/groups/public`

> ![](http://javacl.googlecode.com/svn/wiki/images/IdeaArchetype-AddArchetype.png)

-   Click `Ok` and `Finish` : you're done

## With Maven in command-line

First, please make sure you've properly installed
[Maven](http://maven.apache.org/).

Then simply type the following commands in a shell :

-   With Maven 3.0.3+ :
-   With previous versions of Maven :

This will generate a directory with the following layout :

``` 
JavaCLTutorial
|__ pom.xml
|__ src/
     |__ test 
     |__ main/
          |__ java/
          |    |__ tutorial/
          |         |__ JavaCLTutorial1.java
          |         |__ JavaCLTutorial2.java
          |         |__ JavaCLTutorial3.java
          |__ opencl/
               |__ tutorial/
                    |__ TutorialKernels.cl
```

The three versions of the JavaCLTutorial class correspond to the
progression of this tutorial, as you'll see below.

## A very simple OpenCL addition program

This is the OpenCL equivalent of the traditional Hello-world example :
we're just going to perform parallel piece-wise additions on two float
vectors, storing the results on a third float vector.

It contains two parts :

-   an OpenCL source code that will be compiled at run-time and run on
    an OpenCL device (CPU or GPU)
-   a Java host program that sets up the JavaCL context, reads and
    compiles the OpenCL source code and calls it with appropriately
    initialized arguments.

## The Maven `pom.xml` project file

This file contains a single cross-platform JavaCL dependency :

``` 
  <repositories>
    <repository>
      <id>sonatype</id>
      <name>Sonatype OSS Snapshots Repository</name>
      <url>http://oss.sonatype.org/content/groups/public</url>
    </repository>
  </repositories>
  
  <dependencies>
    <dependency>
      <groupId>com.nativelibs4java</groupId>
      <artifactId>javacl</artifactId>
      <version>1.0-SNAPSHOT</version>
    </dependency>
  </dependencies>
```

It also contains the configuration needed by the [JavaCL
Generator](/p/javacl/wiki/JavaCLGenerator) plugin, which will help make
your kernels programming experience a lot (type-)safer and more
enjoyable (see below).

## The `add_floats` OpenCL kernel

Here's our first kernel in `src/main/opencl/tutorial/TutorialKernels.cl`
:

``` 
__kernel void add_floats(__global const float* a, __global const float* b, __global float* out, int n) 
{
    int i = get_global_id(0);
    if (i >= n)
        return;

    out[i] = a[i] + b[i];
}
```

It's very simple : it takes the global id of this execution (it will be
executed many times in parallel, with only the global id differing
between two executions) and adds values found in `a` and `b` at index
`i`, storing the result in `out` at index `i`.

## The JavaCL host program

Here's the contents of `src/main/java/tutorial/JavaCLTutorial1.java` :

```java 
package tutorial;

import com.nativelibs4java.opencl.*;
import com.nativelibs4java.opencl.util.*;
import com.nativelibs4java.util.*;
import org.bridj.Pointer;
import static org.bridj.Pointer.*;
import static java.lang.Math.*;

public class JavaCLTutorial1 {
    public static void main(String[] args) {
        CLContext context = JavaCL.createBestContext();
        CLQueue queue = context.createDefaultQueue();
        ByteOrder byteOrder = context.getByteOrder();
        
        int n = 1024;
        Pointer<Float>
            aPtr = allocateFloats(n).order(byteOrder),
            bPtr = allocateFloats(n).order(byteOrder);

        for (int i = 0; i < n; i++) {
            aPtr.set(i, (float)cos(i));
            bPtr.set(i, (float)sin(i));
        }

        // Create OpenCL input buffers (using the native memory pointers aPtr and bPtr) :
        CLBuffer<Float> 
            a = context.createBuffer(Usage.Input, aPtr),
            b = context.createBuffer(Usage.Input, bPtr);

        // Create an OpenCL output buffer :
        CLBuffer<Float> out = context.createBuffer(Usage.Output, n);

        // Read the program sources and compile them :
        String src = IOUtils.readText(JavaCLTutorial1.class.getResource("TutorialKernels.cl"));
        CLProgram program = context.createProgram(src);

        // Get and call the kernel :
        CLKernel addFloatsKernel = program.createKernel("add_floats");
        addFloatsKernel.setArgs(a, b, out, n);
        CLEvent addEvt = addFloatsKernel.enqueueNDRange(queue, new int[] { n });
        
        Pointer<Float> outPtr = out.read(queue, addEvt); // blocks until add_floats finished

        // Print the first 10 output values :
        for (int i = 0; i < 10 && i < n; i++)
            System.out.println("out[" + i + "] = " + outPtr.get(i));
        
    }
}
```

## Running

If you're using Maven in command-line, type this in the shell in
project's folder (otherwise, click on `Run` in your IDE of choice ;-)) :

``` 
mvn compile exec:java -Dexec.mainClass=com.mycompany.JavaCLTutorial1
```

The end of the output will look like this (please allow some time the
first time Maven runs : it will download **many** files, but won't do it
again ;-)) :

``` 
out[0] = 1.0
out[1] = 1.3817732
out[2] = 0.49315056
out[3] = -0.8488725
out[4] = -1.4104462
out[5] = -0.6752621
out[6] = 0.6807548
out[7] = 1.4108889
out[8] = 0.84385824
out[9] = -0.49901175
```

## Refining that simple code...

### Use the JavaCL program wrapper generator to make the code even simpler 

Saw that "javacl-generator" plugin configuration in the `pom.xml` file ?

[JavaCL Generator](/p/javacl/wiki/JavaCLGenerator) is a tool that parses
any `.cl` file present in `src/main/opencl` and creates a wrapper class
that only accepts the correct argument types and numbers, instead of the
all-forgiving
[CLKernel.setArgs(Object...)](http://nativelibs4java.sourceforge.net/javacl/api/stable/com/nativelibs4java/opencl/CLKernel.html#setArgs(java.lang.Object...))
that might make your program crash at runtime if you used an incorrect
argument type (or missed an argument).

As the Maven `pom.xml` file you've got from the archetype already
contains the correct configuration for the generator, you can simply
modify the host code as follows (see `JavaCLTutorial2.java`):

```java 
        /* 
        This code is no longer needed :
        // Read the program sources and compile them :
        String src = IOUtils.readText(JavaCLTutorial.class.getResource("TutorialKernels.cl"));
        CLProgram program = context.createProgram(src);
        
        // Get and call the kernel :
        CLKernel addFloatsKernel = program.createKernel("add_floats");
        addFloatsKernel.setArgs(a, b, out, n);
        CLEvent evt = addFloatsKernel.enqueueNDRange(queue, new int[] { n });
        */

        // Instantiate the auto-generated program wrapper and call the kernel :
        TutorialKernels kernels = new TutorialKernels(context);
        CLEvent addEvt = kernels.add_floats(queue, a, b, out, n, new int[] { n }, null);

        Pointer<Float> outPtr = out.read(queue, addEvt); // blocks until add_floats finished
```

Simple, isn't it ?

The program wrappers will be regenerated automatically at each
compilation, so they'll keep in sync with your OpenCL kernels !

Perform (and chain) more calculations in OpenCL[](#Perform_(and_chain)_more_calculations_in_OpenCL)
---------------------------------------------------------------------------------------------------

In the code above, we've initialized the `a` and `b` buffers with
pointers to memory that we've filled by hand in Java... Why not fill it
straight in OpenCL (i.e. on the GPU, if the context uses a GPU device) ?

Let's consider this other kernel in `src/main/opencl/TutorialKernels.cl`
:

```cpp 
__kernel void fill_in_values(__global float* a, __global float* b, int n) 
{
    int i = get_global_id(0);
    if (i >= n)
        return;

    a[i] = cos((float)i);
    b[i] = sin((float)i);
}
```

With the following changes in the Java code (see `JavaCLTutorial3.java`)
:

```cpp 
        // Create OpenCL input and output buffers :
        CLBuffer<Float> 
            a = context.createBuffer(Usage.InputOutput, n), // a and b are now read AND written to
            b = context.createBuffer(Usage.InputOutput, n),
            out = context.createBuffer(Usage.Output, n);

        // Instantiate the auto-generated program wrapper and chain calls to the two kernel :
        TutorialKernels kernels = new TutorialKernels(context);

        CLEvent fillEvt = kernels.fill_in_values(queue, a, b, n, new int[] { n }, null);
        CLEvent addEvt = kernels.add_floats(queue, a, b, out, n, new int[] { n }, null, fillEvt);

        Pointer<Float> outPtr = out.read(queue, addEvt); // blocks until add_floats finished
```

See how we've chained dependent operations through events (operations
are executed asynchronously from the Java program) :

-   the add\_floats kernel execution must wait for the fill\_in\_values
    execution to finish
-   the out.read operation must wait for the add\_floats execution to
    finish.

## Wrap up

That's it ! In this short tutorial, you've seen how to :

-   setup a simple JavaCL project (in command-line, with Netbeans or
    IntelliJ IDEA)
-   allocate OpenCL buffers
-   call and chain executions of simple OpenCL kernels
-   use the [JavaCL Generator](/p/javacl/wiki/JavaCLGenerator) to get
    free compile-time checks of OpenCL kernel arguments and less
    boilerplate code

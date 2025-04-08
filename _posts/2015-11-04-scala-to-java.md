---
layout: post
title: Scala to Java
date: 2015-11-04
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Authors: Alvin Alexander. 
* Last updated: Jun 14, 2014


-----

# Converting a Scala class file to decompiled Java source code

As a Scala newbie, I'm curious about how the process of converting a
Scala class back to Java source code works. What I really want to see is
how my Scala source code is converted to Java source code. Besides plain
old curiosity, I think that understanding more about how Scala works can
also be very important to my understanding of Scala (such as the apply()
method, and so on).

To that end, I just ran a couple of experiments with a very simple Scala
class, Scala object, and Scala case class to see how each class would be
converted to Java source code. I compile each Scala source code file
with the *scalac* compiler, then looked at the result Java *class* file
with the *javap* command.

Towards the end of this tutorial I'll also convert the Scala class files
back to Java source code using a tool named jad, which is a Java
decompiler.

Scala to Java: A simple Scala class
-----------------------------------

I started with a very simple [Scala](http://www.scala-lang.org/) class
definition, which I named Main, and stored in a file named Main.scala.
Here's the Scala source code for that class:

```scala
class Main {
  def main(args: Array[String]) = {
    println("Hello, " + args(0))
  }
}
```

I compiled this file with scalac, like this:

    $ scalac Main.scala

In a simple example like this, the scalac command creates one Java class
file named `Main.class`. Because that is a standard Java class file, I
was then able to look at the contents of the file with this javap
command:

    $ javap Main
    Compiled from "Main.scala"
    public class Main extends java.lang.Object implements scala.ScalaObject{
      public void main(java.lang.String[]);
      public Main();
    }

As you can see, the javap command slightly decompiles the Java class
files. Technically this is called *disassembling* a Java class file, as
written in the javap man page:

> The javap command disassembles a Java class file.

This is actually just a simple use of javap; please see the javap man
page for many more command line options that can be used.

Getting back to the Main.class file, you can see that my simple Scala
class created a very simple Java class file.

Comparing this to a Java class
------------------------------

Before going any farther with this, I decided to compare this to a very
similar Java source code file. To that end, I created Main.java, which
looks like this:

```java
class Main {
  public static void main(String[] args) {
    System.out.println("Hello, " + args[0]);
  }
}
```

I compiled that source code file with *javac*, like this:

    $ javac Main.java

and then disassembled the resulting Main.class file with javap. That
resulted in this output:

```java
class Main extends java.lang.Object{
  Main();
  public static void main(java.lang.String[]);
}
```

By comparing this disassembled output to the disassembled output of my
simple Main.scala class, we can already see some differences:

```java
// (1) output from javap on my compiled Main.scala class
public class Main extends java.lang.Object implements scala.ScalaObject{
  public Main();
  public void main(java.lang.String[]);
}

// (2) output from javap on my compiled Main.java class
class Main extends java.lang.Object{
  Main();
  public static void main(java.lang.String[]);
}
```

As you can see, there are a few minor differences in the disassembled
class output:

1.  The Scala class:
    1.  Is public by default
    2.  Implements scala.ScalaObject in addition to extending
        java.lang.Object

2.  The Scala constructor is created, and is public by default. In the
    Java source code I didn't define a constructor, but a no-args
    constructor is created for me, and appears to be given
    package scope.
3.  The Java class main method must be declared static

So far, so good. Now lets take a look at (a) creating a very similar
Scala object, and (b) a very similar Scala case class.

Scala to Java: A simple Scala object
------------------------------------

Next up, here's the source code for a very similar Scala object. All
I've done here is change the "class" keyword to "object":

```scala
object Main {
  def main(args: Array[String]) = {
    println("Hello, " + args(0))
  }
}
```

I then compiled this file with scalac, then disassembled it with javap.
This led to the creation of two class files:

1.  Main.class
2.  Main\$.class

Here's the javap output from Main.class:

```java
public final class Main extends java.lang.Object{
  public static final void main(java.lang.String[]);
}
```

and here's the output from javap on Main\$.class:

```java
public final class Main$ extends java.lang.Object implements scala.ScalaObject{
  public static final Main$ MODULE$;
  public static {};
  public void main(java.lang.String[]);
}
```

I know that the Scala *object* keyword creates a singleton, and these
disassembled class files show a little bit of how the scalac compiler
makes that happen. (For the time being I'm going to let the reader
interpret how this works.)

Decompiling a Scala case class
------------------------------

Next up, here's another slightly different version of this code, where I
now convert the "object" keyword to "case class", creating a Scala case
class:

```scala
case class Main {
  def main(args: Array[String]) = {
    println("Hello, " + args(0))
  }
}
```

Disassembling this code again leads to two Java class files:

1.  Main.class
2.  Main\$.class

Here's the javap output from the Main.class file:

```java
public class Main extends java.lang.Object implements scala.ScalaObject,scala.Product,scala.Serializable{
  public scala.collection.Iterator productIterator();
  public scala.collection.Iterator productElements();
  public void main(java.lang.String[]);
  public int hashCode();
  public java.lang.String toString();
  public boolean equals(java.lang.Object);
  public java.lang.String productPrefix();
  public int productArity();
  public java.lang.Object productElement(int);
  public boolean canEqual(java.lang.Object);
  public Main();
}
```

and here's the javap output from the Main\$.class file:

```java
public final class Main$ extends scala.runtime.AbstractFunction0 implements scala.ScalaObject,scala.Serializable{
  public static final Main$ MODULE$;
  public static {};
  public final java.lang.String toString();
  public boolean unapply(Main);
  public Main apply();
  public java.lang.Object readResolve();
  public java.lang.Object apply();
}
```

As you can see, there are major differences between these class files,
and the very simple class files I first started with. To the extent that
I currently understand Scala case classes, I expected a fair amount of
this output:

1.  Scala case classes automatically generate toString, equals, and
    hashCode methods.
2.  Scala case classes automatically create an *apply* method, which
    lets you skip the use of the "new" keyword when creating a new
    object reference.
3.  Had I included any fields in my class file definition, I would have
    expected to see getter and setter methods for those fields.
4.  Scala case classes do some magic to make pattern matching more
    powerful, and I assume those other methods are related to that.



Decompiling the Java class files with jad
-----------------------------------------

We can also take this process of examining the Java source code that is
generated from our Scala source code files by using a tool named "jad".
jad decompiles Java class files into Java source code.

Running jad on the first Scala source code file I showed above (the
simple "class Main" definition) results in the following Java source
code:

```java
import scala.Predef$;
import scala.ScalaObject;
import scala.collection.mutable.StringBuilder;

public class Main implements ScalaObject
{
  public void main(String args[])
  {
    Predef$.MODULE$.println((new StringBuilder()).append("Hello, ").append(args[0]).toString());
  }

  public Main()
  {
  }
}
```

As you can see, jad brings your Java class files all the way back to
Java source code.

I recently read in the O'Reilly *Programming Scala* book that if you
want to understand Scala, you should take a look at the Scala Predef
class, and this source code certainly demonstrates why you'd want to do
that.

Running jad on the Main.class and Main\$.class files that are generated
by my second and third Scala examples generates much more output, so
I'll leave that output as an exercise for the reader. (Leave a comment
below if you'd like me to include all of that file output here.)

Summary: Scala classes, object, case classes, and Java source code
------------------------------------------------------------------

I hope this exercise in generating Java source code from Scala source
code (and class files) has been helpful. As I mentioned earlier, for a
new Scala developer like myself, I find it very helpful to see what
Scala is doing under the covers. Seeing the resulting Java source code
like this helps me understand how Scala works, especially seeing the
Predef class use, and the apply() method.


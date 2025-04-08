---
layout: post
title: Scala idiom - Prefer immutable data structures
date: 2015-06-04
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [Scala idiom: Prefer immutable code (immutable data structures)](http://alvinalexander.com/scala/scala-idiom-immutable-code-functional-programming-immutability)
* Authors: Alvin Alexander


----

# Scala idiom - Prefer immutable data structures

One great thing I've learned from Scala and functional programming over
the last few months is this: 

> Make your variables immutable, unless there's a good reason not to.

"Immutable" means that you can't change your variables; you mark them as
*final* in Java, or use the *val* keyword in Scala. More important than
you not changing your variables is that other programmers can't change
your variables, and you can't change theirs.

If I write a Java method like this:

```java
public void doSomething(Foo foo) {
  // do something here
}
```

I can modify the variable `foo`, even if I have no reason to. Writing
immutable code in Java means I should write that function like this,
explicitly telling the caller of my function I won't mess with their
foo:

```java
public void doSomething(final Foo foo) {
  // do something here
}
```

The problem with Java is that you have to add the *final* keyword to
your method signature to make fields immutable, and because that
requires more typing and makes your code more verbose, most Java
developers don't bother to add the final keyword where a variable is
meant to be immutable.

Immutable code in Scala
-----------------------

In Scala, the opposite approach is taken; with functions, function
arguments are *val* by default, so no extra typing is needed.

For example, if I create a function that takes an Int and returns the
value of that Int plus one, I can write it like this:

```scala
scala> def addOne(i: Int): Int = { i + 1 }
foo: (i: Int)Int
```

In that function, the variable "i" that is passed in is assumed to be a
val. I can confirm that by trying to modify my function, like this:

```scala
scala> def addOne(i: Int): Int = { i += 1; i }
<console>:7: error: reassignment to val
         def addOne(i: Int): Int = { i += 1; i }
                                       ^
```

This brings me back to the point of this discussion, the Scala idiom of
preferring immutable code (immutable data structures):

> Prefer val over var. Only use var when you have to.

By writing your code this way, you remove the chance for subtle bugs to
creep into the system. If you think of a function signature as being a
contract, in Scala 'var' means a function may mutate a variable, and
'val' means it wont'.

It's more than just val versus var
----------------------------------

While I'm trying to keep this blog post short, I need to say that this
discussion is about much more than just val versus var. Scala takes this
much further, with a collections hierarchy that splits the collections
into "immutable" and "mutable" data structures. 

Beyond that, the Scala Predef object automatically puts the immutable
data structures (such as Map and Set) into your default environment, so
if you create a new Map or Set, you automatically get the immutable
structures. Just like using the "final" keyword in Java, if you want a
mutable Map or Set, you're going to have to type more and manually
import it.

Scala immutability - quotes from the experts
--------------------------------------------

I'll leave you with a couple of quotes from Scala books. First, from
Beginning Scala, by David Pollack:

> "Using vals in your code makes you think about alternative, immutable,
> functional code. This small example demonstrates that removing vars
> leads to refactoring. The refactoring leads to new coding patterns.
> New coding patterns leads to a shift in your approach to programming.
> This shift in approach leads to transformative code that has fewer
> defects and is easier to maintain."

From the excellent book, Programming in Scala, by Odersky, Spoon, and
Venners, there is a small section titled, "A balanced attitude for Scala
programmers":

> "Prefer vals, immutable objects, and methods without side effects.
> Reach for them first. Use vars, mutable objects, and methods with side
> effects when you have a specific need and justification for them."

Scala idiom: Prefer immutable code - Summary
--------------------------------------------

In summary, I hope this brief discussion of focusing on the Scala and
functional programming idiom of focusing on writing immutable code has
been helpful. I have only been working with Scala for a few months
myself, and already I have seen a reduction in bugs from following this
approach, and I highly recommend it.


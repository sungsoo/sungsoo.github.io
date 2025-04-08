---
layout: post
title: Concurrent Bug Patterns and How to Test Them 
date: 2013-12-26
categories: [computer science]
tags: [design patterns]

---

### Introduction
A bug taxonomy for sequential programs was used to motivate test techniques.
* Make a bug taxonomy for concurrent programs and develop test techniques based on the bug taxonomy.
* Goal  
	* describes and categorizes a detailed taxonomy of concurrent bugs in Java
		* By cause
		* By related design pattern
	* use the taxonomy to create new heuristics for testing
	
For a *concurrent program* **P**, 
*I(**P**)* : the set of interleaving runs that can occur in **P**
*C(**P**)* : the set of interleaving runs under which the program is correct.
A concurrent bug pattern can be viewed as defining runs in *I(**P**)* – *C(**P**)*.

A *concurrent event* is an accessing to an interesting shared variable or synchronization event such as lock acquiring and releasing. 

### Concurrent Bug Patterns
The following high level categories of concurrent bug patterns can be identified (by cause).

* **Code assumed to be protected bug patterns**
	* A run in *I(**P**)* – *C(**P**)* is created when *a code segment is mistakenly assumed to be undisturbed by other threads*.

* **Interleaving assumed never occur bug patterns**
	* A run in *I(**P**)* – *C(**P**)* is created as a result of the *mistaken assumption that a certain execution order of concurrent events is impossible*.

* **Blocking or dead thread bug patterns**
	* A run in *I(**P**)* – *C(**P**)* is created *when a code segment is mistakenly assumed to be non-blocking*.
	
#### Code assumed to be protected bug patterns

A code segment is protected (or undisturbed) for a concurrent program P, if for any run in I(P), no other thread executes a concurrent event while the code segment is executed.

A bug pattern occurs when a code segment is assumed to be protected but is actually not.

		- Nonatomic operations assumed to be atomic
		- Two-stage access bug pattern
		- Wrong lock or no lock
		- Double checked locking
		
#### Nonatomic operations assumed to be atomic

An operation that looks like one operation in the source code level of the programming language but actually consists of several unprotected operations at the lower abstraction levels.

For example, in Java version 1.3.1, x++ operation for a class instance field is translated to three bytecode instructions:

		  1) move the current value of x from the heap to the thread’s local area copy of x
		  2) increment the thread’s local area value by one
		  3) update the heap value of x
		  
And these three instructions are not protected.

#### Two-stage access bug pattern
For a sequence of operations that should be protected, the programmer wrongly assumes that separately protecting each operation is enough.
For example, 

		 	key = getKey(id) ;
			value = getValue(key) ;

Even though `getKey()` is protected and getValue() is  protected, the program is erroneous if these two operations are not protected.

#### Wrong lock or no lock
A shared resource is protected by a lock but there exists a thread which does not obtain the same lock instance when accessing the resource.

For example, 
First thread executes   
				synchronized(o) { x++ ; }
while the second thread executes  
				x++ ;
The possible final value for x can be 1.

#### Double-checked locking
When an object is initialized, the thread local copy of the object’s field is initialized but not all object fields are necessarily written to the heap.
This might cause the object to be partially initialized while its reference is not null.

```
class Foo {
  private Helper helper = null;
  public Helper getHelper() {
    if (helper == null) 
      synchronized(this) {
        if (helper == null) 
          helper = new Helper(); /* while Helper() is executing,
      }                          helper may not be null */
     return helper;
  }
}
```
#### Interleaving assumed never to occur
The programmer assumes that a certain execution never occurs because of
* some assumptions on the underlying hardware, or
* some order of execution forced by explicit delays (e.g. `sleep()`, `yield()` )
But such executions are possible actually.
Patterns:
* The sleep() bug pattern
* Losing a notify bug pattern

#### The sleep() bug pattern
The programmer adds sleep() operation in a parent thread right after child thread creation to wait until the child is initialized. However, there is no guarantee that the child thread finishes the initializing before the parent thread wake up. The correct solution is that the parent thread explicitly wait for the child thread.

#### Losing a notify bug pattern
If a notify() is executed before its corresponding wait(), the notify() has no effect, and the code executing wait() might not be awakened. One way of avoiding this bug pattern is to repeatedly execute the notify() operation until a condition stating that the notify() was received occurs.

#### Blocking or dead thread bug pattern
Some runs in *I(**P**) – C(**P**)* contain a blocking operation that blocks indefinitely.
Patterns:

* A blocking critical section bug pattern
	* A thread is assumed to eventually return control but it never does.
* The orphaned thread bug pattern
	* In a master-slaves system, if the master thread terminates 	abnormally, the remaining threads may continue to run, awaiting more input from the master and causing the system to hang.
		
#### Deducing Concurrent Bug Patterns from Design Patterns
Concurrent design patterns can also be used to deduce typical concurrent bug patterns.

* A bug pattern might be related to a design pattern.
	* Confinement and subclassing
	* The token design pattern
	* The fork/join design pattern
	
#### Confinement and subclassing
A confined mode is a mode where all methods are protected by a lock and leak of references to class instances other than the confined class is prevented. A subclass is incorrectly implemented that it can access the bare class both in confined mode and in nonconfined mode. This bug pattern is also belong to “*wrong lock* or *no lock*” bug pattern


#### The token design pattern
Only one thread can hold a token at any given time. If this property is destroyed, the program may occur an error. For example, after a resource transfer of the form `x.r = y.s`, 
	if the resource is a token, then it occurs an error because `y` still points to the same resource `s`. A proper transfer should look like atomic `{ x.r=y.s ; y=null ; }`
This bug is associated with “code assumed to be protected”

### Heuristics for Finding Concurrent Bug

Timing heuristics are used to increase the probability that known kinds of concurrent bugs will occur. 
* At run time, the runtime controller is given control before and after a concurrent event is executed.
* The controller can use Java primitives such as `sleep()` and `yield()` to change the order of concurrent event execution.
* Use **ConTest** tool for instrumentation and testing.

#### Example- Lost notify bug pattern

Below code is inserted in front of `o.wait()`.

```
		otherAdvancing = true ;
		while (otherAdvancing) {
			otherAdvancing = false ;
			sleep(duration) ;
		}
```
Below code is inserted in front of `o.notify()`.

```
	  otherAdvancing = true ;
```
This timing heuristic increases the chance that the lost notify bug manifest.

#### Example – The sleep() bug pattern
At run time,  the `sleep()` duration is randomly changed to manifest the bug.

### Conclusion
This article categorizes a taxonomy of concurrent bug patterns. And shows testing techniques can be enhanced and developed using the bug taxonomy.

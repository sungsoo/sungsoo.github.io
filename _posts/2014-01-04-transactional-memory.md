---
layout: post
title: Introduction to Transactional Memory
date: 2014-01-04
categories: [computer science]
tags: [parallel computing]

---

> Those are my principles. If you don’t like them I have others.  
*Groucho Marx*


The clock rate of processors used to grow exponentially. Going from below 1 MHz to around 3 GHz took the computer industry less than 40 years. However, increasing the clock rate further has become infeasible. In fact, the ubiquity of portable computers, for which power consumption is a top concern, has forced the industry to keep the clock rate of many processors much below the achievable maximum.

The demand for computational power, however, has not ceased to increase. The result is a completely new trend, which is commonly referred to as a “*multi-core revolution*”. Instead of increasing the clock speed of processors, more computing cores are put on a single chip. Multiprocessing, which used to be a feature of only high-end machines, has become commonplace in personal computers and laptops. It is possible that, in the near future, mobile phones, media players, and other small devices will become equipped with many processors.


This new trend has created a big challenge. Before, with each new processor, all existing applications would automatically get faster. Now, applications will need to get increasingly parallel in order to exploit the power of new processors. Therefore, parallel programming, which used to be the domain of a few high-performance computing experts, will now have to be mastered by common programmers.


PROBLEMS WITH EXPLICIT LOCKING
---

Creating threads is easy in any modern programming language. What is hard, however, is synchronizing their actions, especially if one wants to make those threads run truly in parallel. Consider, for example, an application in which threads operate on a *big data structure*. A simple way to en- sure thread-safety is to protect the entire structure with a single lock (*coarse-grained locking*). Then, however, all accesses to the data structure are serialized, which can severely limit the scalability of the application. Moreover, lock contention may become a problem, especially if the number of threads becomes high.


Optimally, one would use many locks, each protecting a small part of the data structure (*fine- grained locking*). But this is an engineering challenge because one has to ensure that all components of the application follow the same locking policy. If even one method acquires locks in a *wrong* order, then a *deadlock* can occur. One *missing lock* acquisition can lead to **race conditions**, which are very difficult to debug. Indeed, concurrency-related programming errors often manifest themselves only in some, possibly rare, executions, and sometimes only when the application is run with all its debugging functions turned off. Those errors can result in effects ranging from program crashes, which are directly visible, up to very subtle data corruption, which may pass undetected for a long time.


The *problem* with following a complex locking policy in a big application is that this policy exists only in the documentation (e.g., comments in the code) or in the programmers’ minds. Looking just at the code of a program, written in one of the mainstream programming languages such as Java or C++, one typically cannot tell which lock protects which objects, or in which order those locks should be acquired. Associating a monitor with each object, as in Java, does not really help in *fine-grained* locking when a single monitor or lock can protect a group of objects and, conversely, a single object can be protected by more than one lock. It thus takes a very disciplined team of programmers to do fine-grained locking right.


But even following a locking policy to the letter does not guarantee success in terms of performance on multi-core systems. Fine-grained locking involves many trade-offs. For instance, locks are not given for free, and acquiring them takes time. Hence, it might be hard to find the right balance between using too many locks, which can result in high locking overhead, and too few locks, which can lead to scalability problems. To give a concrete example, devising an efficient, scalable algorithm that implements a thread-safe queue, a data structure almost trivial in a single-thread program, is so hard that it deserved at least two papers in top computer science conferences. We cannot expect that ordinary programmers will spend so much effort in getting the last bit of parallelism from every part of their application, given how hard it is to do it right.


Obviously, modern programming languages offer libraries containing *highly-optimized* and *thread-safe* implementations of commonly used data structures. In many cases, it suffices to use those components to get a program that can make use of a few CPU cores. But here we face a problem with ***composability***: a data structure composed of thread-safe objects is not necessarily itself thread-safe. For example, consider two thread-safe sets, and a problem of removing an element from one set and then adding it to the other. Often, one wants such a composite operation involving both sets to be *atomic*. That is, the intermediate step of this operation, in which an element is removed from one of the sets but still not added to the other, should not be observed by concurrent threads. But implementing such an operation requires either adding additional locks, which protect *both* sets, or extending the locking mechanisms used by the implementations of those sets. In the former case, one effectively devises a new locking policy for the two sets, which can introduce race conditions or scalability issues. In the latter case, one has to “open” the set implementations, understand their locking policies, and extend them, which not only is challenging, but also breaks object encapsulation.

### Composability: locks

+ Composing lock-based code can be tricky
	- Requires system-wide policies to get correct
	- Breaks software modularity
+ Caught between an extra lock and a hard place
	- Fine-grain locking: good for performance, but can lead to deadlock

```
void transfer(A, B, amount)
{
    synchronized(A) {
      synchronized(B) {
        withdraw(A, amount);
        deposit(B, amount);
		} 
	}
}
```

#### Deadlock!

**Thread 0:**  

```
	transfer(x,y);
```
	
**Thread 1:**

```
	transfer(y,x);
```

![](http://sungsoo.github.com/images/deadlock.png)

Using locks *explicitly* to handle concurrency becomes even harder when threads operate on *different priority levels*, e.g., in a real-time system. If a high-priority thread wants to acquire a lock that is held by a low-priority thread, it has to wait until the lock is released. That is, *the high-priority thread has to wait for the low-priority thread*—a problem known as **priority inversion**. Synchronizing those threads using *nonblocking* mechanisms, i.e., without using any form of mutual exclusion, would solve the problem. However, designing those mechanisms is sometimes even harder than using fine- grained locking.

### Composability: transactions

+ Transactions compose gracefully
	- Programmer declares global intent (atomic transfer)
		- No need to know of global implementation strategy
	- Transaction in transfer subsumes those in withdraw & deposit   
		- Outermost transaction de#nes atomicity boundary
+ System manages concurrency as well as possible serialization
	- Serialization for transfer(A, B, 100) and transfer(B, A, 200)
	- Concurrency for transfer(A, B, 100) and transfer(C, D, 200)


```
void transfer(A, B, amount)
{
    atomic {
      withdraw(A, amount);
      deposit(B, amount);
	}
}

```
**Thread 0:**  

```
	transfer(x,y);
```
	
**Thread 1:**

```
	transfer(y,x);
```

TRANSACTIONAL MEMORY
---

Given the above challenges posed by the explicit use of locks to manage concurrency, it is not surpris- ing to see a large body of research aimed at making concurrent programming easier. One of the most appealing solutions is *transactional memory* (TM). The basic idea behind TM is to enable threads of an application to communicate by exe- cuting *lightweight*, *in-memory* **transactions**. A transaction is a sequence of operations that should be executed atomically. The purpose of a transaction is thus similar to that of a critical section. However, unlike critical sections, transactions can *abort*, in which case all their operations are rolled back and are never visible to other transactions. Also, transactions only *appear* as if they executed sequentially—a TM is free to run them concurrently, as long as the illusion of atomicity is preserved.


Using a TM is, in principle, very easy: the programmer simply converts those blocks of code that should be executed atomically into transactions. In some TMs, this can be as straightforward as annotating functions and methods with a special language keyword (usually: **atomic**), as illustrated in the following  code segement. 

```
1 atomic
2 v ← x.getVal;
3 x.setVal(v + 1);
```

The TM implementation is then responsible for executing those transactions safely and efficiently. The TM might internally use *fine-grained locking*, or some *nonblocking* mechanism, but this is hidden from the programmer and the application. Thus, if the TM is implemented correctly, which can be done once by a group of experts, the programmer is less likely to introduce concurrency bugs in the code than if he or she had to handle locks explicitly. Indeed, a transaction is a very *intuitive abstraction* that has been used with success in databases for a long time.


A TM can be implemented in hardware, in software, or as a hardware-software hybrid. The TM API usually allows for (1) *starting* a transaction, (2) *performing* operations on shared data within a transaction, and (3) *committing* or *aborting* a transaction. Such an interface can be provided, e.g., by a software library. There are also experimental TM-aware compilers for languages such as Java and C++. Those compilers automatically convert blocks of code annotated with a special keyword (e.g., **atomic**) into transactions.

Even though a TM can internally use fine-grained locking, the paradigm is free of problems that *explicit locking* (i.e., locking used directly by the programmers) creates, and which we listed above. First, transactions are *composable*. For instance, consider the problem of moving an element between two sets. If both sets are implemented using transactions, then it suffices to create another transaction that will simply remove an element from one set and add it to the other set. Indeed, most TM implementations allow transactions to be *nested*. There exists also a technique, called ***transactional boosting***, which allows transactions to use any thread- safe data structure, even one not implemented using transactions.



Second, even though transactions are not much *more difficult* to use than *coarse-grained* locking, they can execute in parallel, and so there is a hope that using a TM one can achieve perfor- mance close to that of explicit fine-grained locking. A TM also gives additional flexibility because the synchronization policy of a TM can be fine-tuned to a specific system, or even changed com- pletely. For instance, the granularity of locks used internally by a TM can be adapted to the number of CPU cores, or the locking policy can be replaced with a *nonblocking* synchronization mechanism if priority inversion becomes an issue. All those changes are local to the TM implementation and the code of the application does not have to be updated. This also means that programs that use a TM for thread synchronization should be easier to maintain than ones that use explicit locking.

####  Advantages of transactional memory

+ Easy to use synchronization construct
	- As easy to use as coarse-grain locks
	- Programmer declares need for atomicity, system implements

+ Often performs as well as fine-grained locks
	- Automatic read-read concurrency & fine-grain concurrency

+ Failure atomicity and recovery
	- No lost locks when a thread fails
	- Failure recovery = transaction abort + restart

+ Composability
	- Safe and scalable composition of software modules

#### Example integration with OpenMP

+ Example: OpenTM = OpenMP + TM 

	- OpenMP: master-slave parallel model
		- Easy to specify parallel loops & tasks 

	- TM: atomic & isolation execution
		- Easy to specify synchronization and speculation

+ OpenTM features
	- Transactions, transactional loops & sections
	- Data directives for TM (e.g., thread private data)
	- Runtime system hints for TM

+ Code example:

```
#pragma omp transfor schedule (static, chunk=50)
for (int i=0; i<N; i++) {
    bin[A[i]]++;
}

```

### Atomic { } ≠ lock() + unlock() 

+ **The difference**
	- Atomic: high-level declaration of atomicity
		- Does not specify implementation/blocking behavior
	- Lock: low-level blocking primitive
		- Does not provide atomicity or isolation on its own

+ **Keep in mind**
	- Locks can be used to implement `atomic` block but...
	- Locks can be used for purposes beyond atomicity
		- Cannot replace all lock regions with atomic regions
	- `atomic` eliminates many data races, but..
		- Programming with atomic blocks can still suffer from atomicity violations. e.g., programmer erroneous splits sequence that *should be atomic* into two atomic blocks

 
### References

[1] Rachid Guerraoui and Michał Kapałka, *Principles of Transactional Memory*, Morgan & Claypool, 2010.

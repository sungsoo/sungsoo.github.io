---
layout: post
title: Parallel Computing
date: 2014-03-29
categories: [computer science]
tags: [parallel computing]

---


# Parallel Computing


**Parallel computing** is a form of
[computation](http://en.wikipedia.org/wiki/Computing "Computing") in which many calculations
are carried out simultaneously,[[1]](#cite_note-1) operating on the
principle that large problems can often be divided into smaller ones,
which are then solved
[concurrently](http://en.wikipedia.org/wiki/Concurrency_(computer_science) "Concurrency (computer science)")
("in parallel"). There are several different forms of parallel
computing:
[bit-level](http://en.wikipedia.org/wiki/Bit-level_parallelism "Bit-level parallelism"),
[instruction
level](http://en.wikipedia.org/wiki/Instruction_level_parallelism "Instruction level parallelism"),
[data](http://en.wikipedia.org/wiki/Data_parallelism "Data parallelism"), and [task
parallelism](http://en.wikipedia.org/wiki/Task_parallelism "Task parallelism"). Parallelism has
been employed for many years, mainly in [high-performance
computing](http://en.wikipedia.org/wiki/High_performance_computing "High performance computing"),
but interest in it has grown lately due to the physical constraints
preventing [frequency
scaling](http://en.wikipedia.org/wiki/Frequency_scaling "Frequency scaling").[[2]](#cite_note-2)
As power consumption (and consequently heat generation) by computers has
become a concern in recent years,[[3]](#cite_note-3) parallel
computing has become the dominant paradigm in [computer
architecture](http://en.wikipedia.org/wiki/Computer_architecture "Computer architecture"),
mainly in the form of [multi-core
processors](http://en.wikipedia.org/wiki/Multi-core_processor "Multi-core processor").[[4]](#cite_note-View-Power-4)

Parallel computers can be roughly classified according to the level at
which the hardware supports parallelism, with
[multi-core](http://en.wikipedia.org/wiki/Multi-core "Multi-core") and
[multi-processor](http://en.wikipedia.org/wiki/Symmetric_multiprocessing "Symmetric multiprocessing")
computers having multiple processing elements within a single machine,
while [clusters](http://en.wikipedia.org/wiki/Computer_cluster "Computer cluster"),
[MPPs](http://en.wikipedia.org/wiki/Massively_parallel_(computing) "Massively parallel (computing)"),
and [grids](http://en.wikipedia.org/wiki/Grid_computing "Grid computing") use multiple
computers to work on the same task. Specialized parallel computer
architectures are sometimes used alongside traditional processors, for
accelerating specific tasks.

[Parallel computer
programs](http://en.wikipedia.org/wiki/Parallel_algorithm "Parallel algorithm") are more
difficult to write than sequential ones,[[5]](#cite_note-5) because
concurrency introduces several new classes of potential [software
bugs](http://en.wikipedia.org/wiki/Software_bug "Software bug"), of which [race
conditions](http://en.wikipedia.org/wiki/Race_condition "Race condition") are the most common.
[Communication](http://en.wikipedia.org/wiki/Computer_networking "Computer networking") and
[synchronization](http://en.wikipedia.org/wiki/Synchronization_(computer_science) "Synchronization (computer science)")
between the different subtasks are typically some of the greatest
obstacles to getting good parallel program performance.

The maximum possible [speed-up](http://en.wikipedia.org/wiki/Speedup "Speedup") of a single
program as a result of parallelization is known as [Amdahl's
law](http://en.wikipedia.org/wiki/Amdahl%27s_law "Amdahl's law").


Background
----------

Traditionally, computer software has been written for serial
computation. To solve a problem, an
[algorithm](http://en.wikipedia.org/wiki/Algorithm "Algorithm") is constructed and implemented
as a serial stream of instructions. These instructions are executed on a
[central processing
unit](http://en.wikipedia.org/wiki/Central_processing_unit "Central processing unit") on one
computer. Only one instruction may execute at a time—after that
instruction is finished, the next is
executed.[[6]](#cite_note-llnltut-6)

Parallel computing, on the other hand, uses multiple processing elements
simultaneously to solve a problem. This is accomplished by breaking the
problem into independent parts so that each processing element can
execute its part of the algorithm simultaneously with the others. The
processing elements can be diverse and include resources such as a
single computer with multiple processors, several networked computers,
specialized hardware, or any combination of the
above.[[6]](#cite_note-llnltut-6)

[Frequency scaling](http://en.wikipedia.org/wiki/Frequency_scaling "Frequency scaling") was the
dominant reason for improvements in computer performance from the
mid-1980s until 2004. The runtime of a program is equal to the number of
instructions multiplied by the average time per instruction. Maintaining
everything else constant, increasing the clock frequency decreases the
average time it takes to execute an instruction. An increase in
frequency thus decreases runtime for all
[compute-bound](http://en.wikipedia.org/wiki/CPU_bound "CPU bound")
programs.[[7]](#cite_note-7)

However, power consumption by a chip is given by the equation P = C ×
V2 × F, where P is power, C is the
[capacitance](http://en.wikipedia.org/wiki/Capacitance "Capacitance") being switched per clock
cycle (proportional to the number of transistors whose inputs change), V
is [voltage](http://en.wikipedia.org/wiki/Voltage "Voltage"), and F is the processor frequency
(cycles per second).[[8]](#cite_note-8) Increases in frequency
increase the amount of power used in a processor. Increasing processor
power consumption led ultimately to [Intel](http://en.wikipedia.org/wiki/Intel "Intel")'s May
2004 cancellation of its [Tejas and
Jayhawk](http://en.wikipedia.org/wiki/Tejas_and_Jayhawk "Tejas and Jayhawk") processors, which
is generally cited as the end of frequency scaling as the dominant
computer architecture paradigm.[[9]](#cite_note-9)

[Moore's Law](http://en.wikipedia.org/wiki/Moore%27s_Law "Moore's Law") is the empirical
observation that transistor density in a microprocessor doubles every 18
to 24 months.[[10]](#cite_note-Moore1965paper-10) Despite power
consumption issues, and repeated predictions of its end, Moore's law is
still in effect. With the end of frequency scaling, these additional
transistors (which are no longer used for frequency scaling) can be used
to add extra hardware for parallel computing.

### Amdahl's law and Gustafson's law

[![](//upload.wikimedia.org/wikipedia/commons/thumb/e/ea/AmdahlsLaw.svg/300px-AmdahlsLaw.svg.png)](http://en.wikipedia.org/wiki/File:AmdahlsLaw.svg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:AmdahlsLaw.svg "Enlarge")

A graphical representation of [Amdahl's
law](http://en.wikipedia.org/wiki/Amdahl%27s_law "Amdahl's law"). The speed-up of a program
from parallelization is limited by how much of the program can be
parallelized. For example, if 90% of the program can be parallelized,
the theoretical maximum speed-up using parallel computing would be 10x
no matter how many processors are used.

Optimally, the speed-up from parallelization would be linear—doubling
the number of processing elements should halve the runtime, and doubling
it a second time should again halve the runtime. However, very few
parallel algorithms achieve optimal speed-up. Most of them have a
near-linear speed-up for small numbers of processing elements, which
flattens out into a constant value for large numbers of processing
elements.

The potential speed-up of an algorithm on a parallel computing platform
is given by [Amdahl's law](http://en.wikipedia.org/wiki/Amdahl%27s_law "Amdahl's law"),
originally formulated by [Gene Amdahl](http://en.wikipedia.org/wiki/Gene_Amdahl "Gene Amdahl")
in the 1960s.[[11]](#cite_note-11) It states that a small portion of
the program which cannot be parallelized will limit the overall speed-up
available from parallelization.  A program solving a large mathematical
or engineering problem will typically consist of several parallelizable
parts and several non-parallelizable (sequential) parts. If
![\\alpha](//upload.wikimedia.org/math/b/c/c/bccfc7022dfb945174d9bcebad2297bb.png)
is the fraction of running time a program spends on non-parallelizable
parts, then:

![\\lim\_{P\\to\\infty}\\frac{1}{\\frac{1-\\alpha}{P}+\\alpha} =
\\frac{1}{\\alpha}](//upload.wikimedia.org/math/4/2/7/4271e63e8962f0f0e16d86bbac783a3f.png)

is the maximum speed-up with parallelization of the program. If the
sequential portion of a program accounts for 10% of the runtime
(![\\alpha=0.1](//upload.wikimedia.org/math/f/8/4/f84b789e096962c7efb22195920d4712.png)),
we can get no more than a 10× speed-up, regardless of how many
processors are added. This puts an upper limit on the usefulness of
adding more parallel execution units. "When a task cannot be partitioned
because of sequential constraints, the application of more effort has no
effect on the schedule. The bearing of a child takes nine months, no
matter how many women are assigned."[[12]](#cite_note-12)

[Gustafson's law](http://en.wikipedia.org/wiki/Gustafson%27s_law "Gustafson's law") is another
law in computing, closely related to Amdahl's
law.[[13]](#cite_note-13) It states that the speedup with
![P](//upload.wikimedia.org/math/4/4/c/44c29edb103a2872f519ad0c9a0fdaaa.png)
processors is

[![](//upload.wikimedia.org/wikipedia/commons/thumb/4/40/Optimizing-different-parts.svg/400px-Optimizing-different-parts.svg.png)](http://en.wikipedia.org/wiki/File:Optimizing-different-parts.svg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:Optimizing-different-parts.svg "Enlarge")

Assume that a task has two independent parts, A and B. B takes roughly
25% of the time of the whole computation. With effort, a
[programmer](http://en.wikipedia.org/wiki/Programmer "Programmer") may be able to make this
part five times faster, but this only reduces the time for the whole
computation by a little. In contrast, one may need to perform less work
to make part A twice as fast. This will make the computation much faster
than by optimizing part B, even though B got a greater speed-up (5×
versus 2×).

![ S(P) = P - \\alpha(P-1) \\qquad = \\alpha + P(1-\\alpha).
\\,](//upload.wikimedia.org/math/4/3/1/431be00114f39e3da31b7d4990710c1c.png)

Both Amdahl's law and Gustafson's law assume that the running time of
the sequential portion of the program is independent of the number of
processors. Amdahl's law assumes that the entire problem is of fixed
size so that the total amount of work to be done in parallel is also
*independent of the number of processors*, whereas Gustafson's law
assumes that the total amount of work to be done in parallel *varies
linearly with the number of processors*.

### Dependencies

Understanding [data
dependencies](http://en.wikipedia.org/wiki/Data_dependency "Data dependency") is fundamental in
implementing [parallel
algorithms](http://en.wikipedia.org/wiki/Parallel_algorithm "Parallel algorithm"). No program
can run more quickly than the longest chain of dependent calculations
(known as the [critical
path](http://en.wikipedia.org/wiki/Critical_path_method "Critical path method")), since
calculations that depend upon prior calculations in the chain must be
executed in order. However, most algorithms do not consist of just a
long chain of dependent calculations; there are usually opportunities to
execute independent calculations in parallel.

Let P~i~ and P~j~ be two program segments. Bernstein's
conditions[[14]](#cite_note-14) describe when the two are independent
and can be executed in parallel. For *P*~*i*~, let *I*~*i*~ be all of
the input variables and *O*~*i*~ the output variables, and likewise for
*P*~*j*~. *P* ~*i*~ and *P*~*j*~ are independent if they satisfy

-   ![ I\_j \\cap O\_i = \\varnothing, \\,
    ](//upload.wikimedia.org/math/4/9/e/49eeda6901b064a4aef55a595b744534.png)
-   ![ I\_i \\cap O\_j = \\varnothing, \\,
    ](//upload.wikimedia.org/math/6/2/5/625cbc9decad7d1bfcb8e532fc2ac8f5.png)
-   ![ O\_i \\cap O\_j = \\varnothing. \\,
    ](//upload.wikimedia.org/math/d/5/7/d57cc44bbdf2df9e2b3667b4ad79ac63.png)

Violation of the first condition introduces a flow dependency,
corresponding to the first segment producing a result used by the second
segment. The second condition represents an anti-dependency, when the
second segment (*P*~*j*~) produces a variable needed by the first
segment (*P*~*i*~). The third and final condition represents an output
dependency: When two segments write to the same location, the result
comes from the logically last executed segment.[[15]](#cite_note-15)

Consider the following functions, which demonstrate several kinds of
dependencies:

    1: function Dep(a, b)
    2: c := a·b
    3: d := 3·c
    4: end function

Operation 3 in Dep(a, b) cannot be executed before (or even in parallel
with) operation 2, because operation 3 uses a result from operation 2.
It violates condition 1, and thus introduces a flow dependency.

    1: function NoDep(a, b)
    2: c := a·b
    3: d := 3·b
    4: e := a+b
    5: end function

In this example, there are no dependencies between the instructions, so
they can all be run in parallel.

Bernstein’s conditions do not allow memory to be shared between
different processes. For that, some means of enforcing an ordering
between accesses is necessary, such as
[semaphores](http://en.wikipedia.org/wiki/Semaphore_(programming) "Semaphore (programming)"),
[barriers](http://en.wikipedia.org/wiki/Barrier_(computer_science) "Barrier (computer science)")
or some other [synchronization
method](http://en.wikipedia.org/wiki/Synchronization_(computer_science) "Synchronization (computer science)").

### Race conditions, mutual exclusion, synchronization, and parallel slowdown

Subtasks in a parallel program are often called
[threads](http://en.wikipedia.org/wiki/Thread_(computing) "Thread (computing)"). Some parallel
computer architectures use smaller, lightweight versions of threads
known as
[fibers](http://en.wikipedia.org/wiki/Fiber_(computer_science) "Fiber (computer science)"),
while others use bigger versions known as
[processes](http://en.wikipedia.org/wiki/Process_(computing) "Process (computing)"). However,
"threads" is generally accepted as a generic term for subtasks. Threads
will often need to update some
[variable](http://en.wikipedia.org/wiki/Variable_(programming) "Variable (programming)") that
is shared between them. The instructions between the two programs may be
interleaved in any order. For example, consider the following program:

  ------------------------------ ------------------------------
  Thread A                       Thread B
  1A: Read variable V            1B: Read variable V
  2A: Add 1 to variable V        2B: Add 1 to variable V
  3A: Write back to variable V   3B: Write back to variable V
  ------------------------------ ------------------------------

If instruction 1B is executed between 1A and 3A, or if instruction 1A is
executed between 1B and 3B, the program will produce incorrect data.
This is known as a [race
condition](http://en.wikipedia.org/wiki/Race_condition "Race condition"). The programmer must
use a [lock](http://en.wikipedia.org/wiki/Lock_(computer_science) "Lock (computer science)") to
provide [mutual exclusion](http://en.wikipedia.org/wiki/Mutual_exclusion "Mutual exclusion"). A
lock is a programming language construct that allows one thread to take
control of a variable and prevent other threads from reading or writing
it, until that variable is unlocked. The thread holding the lock is free
to execute its [critical
section](http://en.wikipedia.org/wiki/Critical_section "Critical section") (the section of a
program that requires exclusive access to some variable), and to unlock
the data when it is finished. Therefore, to guarantee correct program
execution, the above program can be rewritten to use locks:

  ------------------------------ ------------------------------
  Thread A                       Thread B
  1A: Lock variable V            1B: Lock variable V
  2A: Read variable V            2B: Read variable V
  3A: Add 1 to variable V        3B: Add 1 to variable V
  4A: Write back to variable V   4B: Write back to variable V
  5A: Unlock variable V          5B: Unlock variable V
  ------------------------------ ------------------------------

One thread will successfully lock variable V, while the other thread
will be [locked out](http://en.wikipedia.org/wiki/Software_lockout "Software lockout")—unable
to proceed until V is unlocked again. This guarantees correct execution
of the program. Locks, while necessary to ensure correct program
execution, can greatly slow a program.

Locking multiple variables using
[non-atomic](http://en.wikipedia.org/wiki/Atomic_operation "Atomic operation") locks introduces
the possibility of program [deadlock](http://en.wikipedia.org/wiki/Deadlock "Deadlock"). An
atomic lock locks multiple variables all at once. If it cannot lock all
of them, it does not lock any of them. If two threads each need to lock
the same two variables using non-atomic locks, it is possible that one
thread will lock one of them and the second thread will lock the second
variable. In such a case, neither thread can complete, and deadlock
results.

Many parallel programs require that their subtasks [act in
synchrony](http://en.wikipedia.org/wiki/Synchronization_(computer_science) "Synchronization (computer science)"). This
requires the use of a
[barrier](http://en.wikipedia.org/wiki/Barrier_(computer_science) "Barrier (computer science)"). Barriers
are typically implemented using a software lock. One class of
algorithms, known as [lock-free and wait-free
algorithms](http://en.wikipedia.org/wiki/Lock-free_and_wait-free_algorithms "Lock-free and wait-free algorithms"),
altogether avoids the use of locks and barriers. However, this approach
is generally difficult to implement and requires correctly designed data
structures.

Not all parallelization results in speed-up. Generally, as a task is
split up into more and more threads, those threads spend an
ever-increasing portion of their time communicating with each other.
Eventually, the overhead from communication dominates the time spent
solving the problem, and further parallelization (that is, splitting the
workload over even more threads) increases rather than decreases the
amount of time required to finish. This is known as [parallel
slowdown](http://en.wikipedia.org/wiki/Parallel_slowdown "Parallel slowdown").

### Fine-grained, coarse-grained, and embarrassing parallelism

Applications are often classified according to how often their subtasks
need to synchronize or communicate with each other. An application
exhibits fine-grained parallelism if its subtasks must communicate many
times per second; it exhibits coarse-grained parallelism if they do not
communicate many times per second, and it is [embarrassingly
parallel](http://en.wikipedia.org/wiki/Embarrassingly_parallel "Embarrassingly parallel") if
they rarely or never have to communicate. Embarrassingly parallel
applications are considered the easiest to parallelize.

### Consistency models

Main article: [Consistency
model](http://en.wikipedia.org/wiki/Consistency_model "Consistency model")

Parallel programming languages and parallel computers must have a
[consistency model](http://en.wikipedia.org/wiki/Consistency_model "Consistency model") (also
known as a memory model). The consistency model defines rules for how
operations on [computer
memory](http://en.wikipedia.org/wiki/Computer_data_storage "Computer data storage") occur and
how results are produced.

One of the first consistency models was [Leslie
Lamport](http://en.wikipedia.org/wiki/Leslie_Lamport "Leslie Lamport")'s [sequential
consistency](http://en.wikipedia.org/wiki/Sequential_consistency "Sequential consistency")
model. Sequential consistency is the property of a parallel program that
its parallel execution produces the same results as a sequential
program. Specifically, a program is sequentially consistent if "... the
results of any execution is the same as if the operations of all the
processors were executed in some sequential order, and the operations of
each individual processor appear in this sequence in the order specified
by its program".[[16]](#cite_note-16)

[Software transactional
memory](http://en.wikipedia.org/wiki/Software_transactional_memory "Software transactional memory")
is a common type of consistency model. Software transactional memory
borrows from [database
theory](http://en.wikipedia.org/wiki/Database_management_system "Database management system")
the concept of [atomic
transactions](http://en.wikipedia.org/wiki/Atomic_commit "Atomic commit") and applies them to
memory accesses.

Mathematically, these models can be represented in several ways. [Petri
nets](http://en.wikipedia.org/wiki/Petri_net "Petri net"), which were introduced in Carl Adam
Petri's 1962 doctoral thesis, were an early attempt to codify the rules
of consistency models. Dataflow theory later built upon these, and
[Dataflow
architectures](http://en.wikipedia.org/wiki/Dataflow_architecture "Dataflow architecture") were
created to physically implement the ideas of dataflow theory. Beginning
in the late 1970s, [process
calculi](http://en.wikipedia.org/wiki/Process_calculi "Process calculi") such as [Calculus of
Communicating
Systems](http://en.wikipedia.org/wiki/Calculus_of_Communicating_Systems "Calculus of Communicating Systems")
and [Communicating Sequential
Processes](http://en.wikipedia.org/wiki/Communicating_Sequential_Processes "Communicating Sequential Processes")
were developed to permit algebraic reasoning about systems composed of
interacting components. More recent additions to the process calculus
family, such as the [π-calculus](http://en.wikipedia.org/wiki/Pi_calculus "Pi calculus"), have
added the capability for reasoning about dynamic topologies. Logics such
as Lamport's
[TLA+](http://en.wikipedia.org/wiki/Temporal_logic_of_actions "Temporal logic of actions"), and
mathematical models such as [traces](http://en.wikipedia.org/wiki/Trace_theory "Trace theory")
and [Actor event
diagrams](http://en.wikipedia.org/wiki/Actor_model_theory "Actor model theory"), have also been
developed to describe the behavior of concurrent systems.

### Flynn's taxonomy

[Michael J. Flynn](http://en.wikipedia.org/wiki/Michael_J._Flynn "Michael J. Flynn") created
one of the earliest classification systems for parallel (and sequential)
computers and programs, now known as [Flynn's
taxonomy](http://en.wikipedia.org/wiki/Flynn%27s_taxonomy "Flynn's taxonomy"). Flynn classified
programs and computers by whether they were operating using a single set
or multiple sets of instructions, and whether or not those instructions
were using a single set or multiple sets of data.

[Flynn's taxonomy](http://en.wikipedia.org/wiki/Flynn%27s_taxonomy "Flynn's taxonomy")

 

Single instruction

Multiple instruction

Single data

[SISD](http://en.wikipedia.org/wiki/SISD "SISD")

[MISD](http://en.wikipedia.org/wiki/MISD "MISD")

Multiple data

[SIMD](http://en.wikipedia.org/wiki/SIMD "SIMD")

[MIMD](http://en.wikipedia.org/wiki/MIMD "MIMD")

The single-instruction-single-data (SISD) classification is equivalent
to an entirely sequential program. The single-instruction-multiple-data
(SIMD) classification is analogous to doing the same operation
repeatedly over a large data set. This is commonly done in [signal
processing](http://en.wikipedia.org/wiki/Signal_processing "Signal processing") applications.
Multiple-instruction-single-data (MISD) is a rarely used classification.
While computer architectures to deal with this were devised (such as
[systolic arrays](http://en.wikipedia.org/wiki/Systolic_array "Systolic array")), few
applications that fit this class materialized.
Multiple-instruction-multiple-data (MIMD) programs are by far the most
common type of parallel programs.

According to [David A.
Patterson](http://en.wikipedia.org/wiki/David_A._Patterson_(scientist) "David A. Patterson (scientist)")
and [John L. Hennessy](http://en.wikipedia.org/wiki/John_L._Hennessy "John L. Hennessy"), "Some
machines are hybrids of these categories, of course, but this classic
model has survived because it is simple, easy to understand, and gives a
good first approximation. It is also—perhaps because of its
understandability—the most widely used scheme."[[17]](#cite_note-17)

Types of parallelism
-----

### Bit-level parallelism

Main article: [Bit-level
parallelism](http://en.wikipedia.org/wiki/Bit-level_parallelism "Bit-level parallelism")

From the advent of [very-large-scale
integration](http://en.wikipedia.org/wiki/Very-large-scale_integration "Very-large-scale integration")
(VLSI) computer-chip fabrication technology in the 1970s until about
1986, speed-up in computer architecture was driven by doubling [computer
word size](http://en.wikipedia.org/wiki/Word_(data_type) "Word (data type)")—the amount of
information the processor can manipulate per
cycle.[[18]](#cite_note-18) Increasing the word size reduces the
number of instructions the processor must execute to perform an
operation on variables whose sizes are greater than the length of the
word. For example, where an [8-bit](http://en.wikipedia.org/wiki/8-bit "8-bit") processor must
add two [16-bit](http://en.wikipedia.org/wiki/16-bit "16-bit")
[integers](http://en.wikipedia.org/wiki/Integer "Integer"), the processor must first add the
8 lower-order bits from each integer using the standard addition
instruction, then add the 8 higher-order bits using an add-with-carry
instruction and the [carry bit](http://en.wikipedia.org/wiki/Carry_bit "Carry bit") from the
lower order addition; thus, an 8-bit processor requires two instructions
to complete a single operation, where a 16-bit processor would be able
to complete the operation with a single instruction.

Historically, [4-bit](http://en.wikipedia.org/wiki/4-bit "4-bit") microprocessors were replaced
with 8-bit, then 16-bit, then 32-bit microprocessors. This trend
generally came to an end with the introduction of 32-bit processors,
which has been a standard in general-purpose computing for two decades.
Not until recently (c. 2003–2004), with the advent of
[x86-64](http://en.wikipedia.org/wiki/X86-64 "X86-64") architectures, have
[64-bit](http://en.wikipedia.org/wiki/64-bit "64-bit") processors become commonplace.

### Instruction-level parallelism

Main article: [Instruction level
parallelism](http://en.wikipedia.org/wiki/Instruction_level_parallelism "Instruction level parallelism")

[![](//upload.wikimedia.org/wikipedia/commons/thumb/2/21/Fivestagespipeline.png/300px-Fivestagespipeline.png)](http://en.wikipedia.org/wiki/File:Fivestagespipeline.png)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:Fivestagespipeline.png "Enlarge")

A canonical five-stage pipeline in a [RISC](http://en.wikipedia.org/wiki/RISC "RISC") machine
(IF = Instruction Fetch, ID = Instruction Decode, EX = Execute, MEM =
Memory access, WB = Register write back)

A computer program, is in essence, a stream of instructions executed by
a processor. These instructions can be
[re-ordered](http://en.wikipedia.org/wiki/Out-of-order_execution "Out-of-order execution") and
combined into groups which are then executed in parallel without
changing the result of the program. This is known as instruction-level
parallelism. Advances in instruction-level parallelism dominated
computer architecture from the mid-1980s until the
mid-1990s.[[19]](#cite_note-19)

Modern processors have multi-stage [instruction
pipelines](http://en.wikipedia.org/wiki/Instruction_pipeline "Instruction pipeline"). Each
stage in the pipeline corresponds to a different action the processor
performs on that instruction in that stage; a processor with an N-stage
pipeline can have up to N different instructions at different stages of
completion. The canonical example of a pipelined processor is a
[RISC](http://en.wikipedia.org/wiki/Reduced_Instruction_Set_Computer "Reduced Instruction Set Computer")
processor, with five stages: instruction fetch, decode, execute, memory
access, and write back. The [Pentium 4](http://en.wikipedia.org/wiki/Pentium_4 "Pentium 4")
processor had a 35-stage pipeline.[[20]](#cite_note-20)

[![](//upload.wikimedia.org/wikipedia/commons/thumb/4/46/Superscalarpipeline.svg/300px-Superscalarpipeline.svg.png)](http://en.wikipedia.org/wiki/File:Superscalarpipeline.svg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:Superscalarpipeline.svg "Enlarge")

A five-stage pipelined [superscalar](http://en.wikipedia.org/wiki/Superscalar "Superscalar")
[processor](http://en.wikipedia.org/wiki/Microprocessor "Microprocessor"), capable of issuing
two instructions per cycle. It can have two instructions in each stage
of the pipeline, for a total of up to 10 instructions (shown in green)
being simultaneously executed.

In addition to instruction-level parallelism from pipelining, some
processors can issue more than one instruction at a time. These are
known as [superscalar](http://en.wikipedia.org/wiki/Superscalar "Superscalar") processors.
Instructions can be grouped together only if there is no [data
dependency](http://en.wikipedia.org/wiki/Data_dependency "Data dependency") between them.
[Scoreboarding](http://en.wikipedia.org/wiki/Scoreboarding "Scoreboarding") and the [Tomasulo
algorithm](http://en.wikipedia.org/wiki/Tomasulo_algorithm "Tomasulo algorithm") (which is
similar to scoreboarding but makes use of [register
renaming](http://en.wikipedia.org/wiki/Register_renaming "Register renaming")) are two of the
most common techniques for implementing out-of-order execution and
instruction-level parallelism.

### Task parallelism

Main article: [Task
parallelism](http://en.wikipedia.org/wiki/Task_parallelism "Task parallelism")

Task parallelism is the characteristic of a parallel program that
"entirely different calculations can be performed on either the same or
different sets of data".[[21]](#cite_note-Culler124-21) This contrasts
with data parallelism, where the same calculation is performed on the
same or different sets of data. Task parallelism does not usually scale
with the size of a problem.[[22]](#cite_note-Culler125-22)

Hardware
----

### Memory and communication

Main memory in a parallel computer is either [shared
memory](http://en.wikipedia.org/wiki/Shared_memory "Shared memory") (shared between all
processing elements in a single [address
space](http://en.wikipedia.org/wiki/Address_space "Address space")), or [distributed
memory](http://en.wikipedia.org/wiki/Distributed_memory "Distributed memory") (in which each
processing element has its own local address
space).[[23]](#cite_note-PH713-23) Distributed memory refers to the
fact that the memory is logically distributed, but often implies that it
is physically distributed as well. [Distributed shared
memory](http://en.wikipedia.org/wiki/Distributed_shared_memory "Distributed shared memory") and
[memory
virtualization](http://en.wikipedia.org/wiki/Memory_virtualization "Memory virtualization")
combine the two approaches, where the processing element has its own
local memory and access to the memory on non-local processors. Accesses
to local memory are typically faster than accesses to non-local memory.

[![](//upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Numa.svg/400px-Numa.svg.png)](http://en.wikipedia.org/wiki/File:Numa.svg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:Numa.svg "Enlarge")

A logical view of a [Non-Uniform Memory
Access](http://en.wikipedia.org/wiki/Non-Uniform_Memory_Access "Non-Uniform Memory Access")
(NUMA) architecture. Processors in one directory can access that
directory's memory with less latency than they can access memory in the
other directory's memory.

Computer architectures in which each element of main memory can be
accessed with equal [latency](http://en.wikipedia.org/wiki/Memory_latency "Memory latency") and
[bandwidth](http://en.wikipedia.org/wiki/Bandwidth_(computing) "Bandwidth (computing)") are
known as [Uniform Memory
Access](http://en.wikipedia.org/wiki/Uniform_Memory_Access "Uniform Memory Access") (UMA)
systems. Typically, that can be achieved only by a [shared
memory](http://en.wikipedia.org/wiki/Shared_memory "Shared memory") system, in which the memory
is not physically distributed. A system that does not have this property
is known as a [Non-Uniform Memory
Access](http://en.wikipedia.org/wiki/Non-Uniform_Memory_Access "Non-Uniform Memory Access")
(NUMA) architecture. Distributed memory systems have non-uniform memory
access.

Computer systems make use of
[caches](http://en.wikipedia.org/wiki/CPU_cache "CPU cache")—small, fast memories located close
to the processor which store temporary copies of memory values (nearby
in both the physical and logical sense). Parallel computer systems have
difficulties with caches that may store the same value in more than one
location, with the possibility of incorrect program execution. These
computers require a [cache
coherency](http://en.wikipedia.org/wiki/Cache_coherency "Cache coherency") system, which keeps
track of cached values and strategically purges them, thus ensuring
correct program execution. [Bus
snooping](http://en.wikipedia.org/wiki/Bus_sniffing "Bus sniffing") is one of the most common
methods for keeping track of which values are being accessed (and thus
should be purged). Designing large, high-performance cache coherence
systems is a very difficult problem in computer architecture. As a
result, shared-memory computer architectures do not scale as well as
distributed memory systems do.[[23]](#cite_note-PH713-23)

Processor–processor and processor–memory communication can be
implemented in hardware in several ways, including via shared (either
multiported or [multiplexed](http://en.wikipedia.org/wiki/Multiplexing "Multiplexing")) memory,
a [crossbar switch](http://en.wikipedia.org/wiki/Crossbar_switch "Crossbar switch"), a shared
[bus](http://en.wikipedia.org/wiki/Bus_(computing) "Bus (computing)") or an interconnect
network of a myriad of
[topologies](http://en.wikipedia.org/wiki/Network_topology "Network topology") including
[star](http://en.wikipedia.org/wiki/Star_network "Star network"),
[ring](http://en.wikipedia.org/wiki/Ring_network "Ring network"),
[tree](http://en.wikipedia.org/wiki/Tree_(graph_theory) "Tree (graph theory)"),
[hypercube](http://en.wikipedia.org/wiki/Hypercube_graph "Hypercube graph"), fat hypercube (a
hypercube with more than one processor at a node), or [n-dimensional
mesh](http://en.wikipedia.org/wiki/Mesh_networking "Mesh networking").

Parallel computers based on interconnect networks need to have some kind
of [routing](http://en.wikipedia.org/wiki/Routing "Routing") to enable the passing of messages
between nodes that are not directly connected. The medium used for
communication between the processors is likely to be hierarchical in
large multiprocessor machines.

### Classes of parallel computers

Parallel computers can be roughly classified according to the level at
which the hardware supports parallelism. This classification is broadly
analogous to the distance between basic computing nodes. These are not
mutually exclusive; for example, clusters of symmetric multiprocessors
are relatively common.

#### Multicore computing

Main article: [Multi-core
(computing)](http://en.wikipedia.org/wiki/Multi-core_(computing) "Multi-core (computing)")

A multicore processor is a processor that includes multiple [execution
units](http://en.wikipedia.org/wiki/Execution_unit "Execution unit") ("cores") on the same
chip. These processors differ from
[superscalar](http://en.wikipedia.org/wiki/Superscalar "Superscalar") processors, which can
issue multiple instructions per cycle from one instruction stream
(thread); in contrast, a multicore processor can issue multiple
instructions per cycle from multiple instruction streams.
[IBM](http://en.wikipedia.org/wiki/IBM "IBM")'s [Cell
microprocessor](http://en.wikipedia.org/wiki/Cell_(microprocessor) "Cell (microprocessor)"),
designed for use in the [Sony](http://en.wikipedia.org/wiki/Sony "Sony") [PlayStation
3](http://en.wikipedia.org/wiki/PlayStation_3 "PlayStation 3"), is another prominent multicore
processor.

Each core in a multicore processor can potentially be superscalar as
well—that is, on every cycle, each core can issue multiple instructions
from one instruction stream. [Simultaneous
multithreading](http://en.wikipedia.org/wiki/Simultaneous_multithreading "Simultaneous multithreading")
(of which Intel's
[HyperThreading](http://en.wikipedia.org/wiki/HyperThreading "HyperThreading") is the best
known) was an early form of pseudo-multicoreism. A processor capable of
simultaneous multithreading has only one execution unit ("core"), but
when that execution unit is idling (such as during a [cache
miss](http://en.wikipedia.org/wiki/Cache_miss "Cache miss")), it uses that execution unit to
process a second thread.

#### Symmetric multiprocessing

Main article: [Symmetric
multiprocessing](http://en.wikipedia.org/wiki/Symmetric_multiprocessing "Symmetric multiprocessing")

A symmetric multiprocessor (SMP) is a computer system with multiple
identical processors that share memory and connect via a
bus.[[24]](#cite_note-HP549-24) [Bus
contention](http://en.wikipedia.org/wiki/Bus_contention "Bus contention") prevents bus
architectures from scaling. As a result, SMPs generally do not comprise
more than 32 processors.[[25]](#cite_note-25) "Because of the small
size of the processors and the significant reduction in the requirements
for bus bandwidth achieved by large caches, such symmetric
multiprocessors are extremely cost-effective, provided that a sufficient
amount of memory bandwidth exists."[[24]](#cite_note-HP549-24)

#### Distributed computing

Main article: [Distributed
computing](http://en.wikipedia.org/wiki/Distributed_computing "Distributed computing")

A distributed computer (also known as a distributed memory
multiprocessor) is a distributed memory computer system in which the
processing elements are connected by a network. Distributed computers
are highly scalable.

##### Cluster computing

Main article: [Computer
cluster](http://en.wikipedia.org/wiki/Computer_cluster "Computer cluster")

[![](//upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Beowulf.jpg/170px-Beowulf.jpg)](http://en.wikipedia.org/wiki/File:Beowulf.jpg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:Beowulf.jpg "Enlarge")

A [Beowulf cluster](http://en.wikipedia.org/wiki/Beowulf_(computing) "Beowulf (computing)")

A cluster is a group of loosely coupled computers that work together
closely, so that in some respects they can be regarded as a single
computer.[[26]](#cite_note-26) Clusters are composed of multiple
standalone machines connected by a network. While machines in a cluster
do not have to be symmetric, [load
balancing](http://en.wikipedia.org/wiki/Load_balancing_(computing) "Load balancing (computing)")
is more difficult if they are not. The most common type of cluster is
the [Beowulf cluster](http://en.wikipedia.org/wiki/Beowulf_(computing) "Beowulf (computing)"),
which is a cluster implemented on multiple identical [commercial
off-the-shelf](http://en.wikipedia.org/wiki/Commercial_off-the-shelf "Commercial off-the-shelf")
computers connected with a [TCP/IP](http://en.wikipedia.org/wiki/TCP/IP "TCP/IP")
[Ethernet](http://en.wikipedia.org/wiki/Ethernet "Ethernet") [local area
network](http://en.wikipedia.org/wiki/Local_area_network "Local area network").[[27]](#cite_note-27)
Beowulf technology was originally developed by [Thomas
Sterling](http://en.wikipedia.org/wiki/Thomas_Sterling_(computing) "Thomas Sterling (computing)")
and [Donald Becker](http://en.wikipedia.org/wiki/Donald_Becker "Donald Becker"). The vast
majority of the [TOP500](http://en.wikipedia.org/wiki/TOP500 "TOP500") supercomputers are
clusters.[[28]](#cite_note-28)

##### Massive parallel processing

Main article: [Massively parallel
(computing)](http://en.wikipedia.org/wiki/Massively_parallel_(computing) "Massively parallel (computing)")

A massively parallel processor (MPP) is a single computer with many
networked processors. MPPs have many of the same characteristics as
clusters, but MPPs have specialized interconnect networks (whereas
clusters use commodity hardware for networking). MPPs also tend to be
larger than clusters, typically having "far more" than
100 processors.[[29]](#cite_note-29) In a MPP, "each CPU contains its
own memory and copy of the operating system and application. Each
subsystem communicates with the others via a high-speed
interconnect."[[30]](#cite_note-30)

[![](//upload.wikimedia.org/wikipedia/commons/thumb/a/a7/BlueGeneL_cabinet.jpg/170px-BlueGeneL_cabinet.jpg)](http://en.wikipedia.org/wiki/File:BlueGeneL_cabinet.jpg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:BlueGeneL_cabinet.jpg "Enlarge")

A cabinet from [Blue Gene](http://en.wikipedia.org/wiki/Blue_Gene "Blue Gene")/L, ranked as the
fourth fastest supercomputer in the world according to the 11/2008
[TOP500](http://en.wikipedia.org/wiki/TOP500 "TOP500") rankings. Blue Gene/L is a massively
parallel processor.

[Blue Gene/L](http://en.wikipedia.org/wiki/Blue_Gene/L "Blue Gene/L"), the fifth fastest
supercomputer in the world according to the June 2009 TOP500 ranking, is
a MPP.

##### Grid computing


Main article: [Distributed
computing](http://en.wikipedia.org/wiki/Distributed_computing "Distributed computing")

Distributed computing is the most distributed form of parallel
computing. It makes use of computers communicating over the
[Internet](http://en.wikipedia.org/wiki/Internet "Internet") to work on a given problem.
Because of the low bandwidth and extremely high latency available on the
Internet, distributed computing typically deals only with
[embarrassingly
parallel](http://en.wikipedia.org/wiki/Embarrassingly_parallel "Embarrassingly parallel")
problems. [Many distributed computing
applications](http://en.wikipedia.org/wiki/List_of_distributed_computing_projects "List of distributed computing projects")
have been created, of which [SETI@home](http://en.wikipedia.org/wiki/SETI@home "SETI@home") and
[Folding@home](http://en.wikipedia.org/wiki/Folding@home "Folding@home") are the best-known
examples.[[31]](#cite_note-31)

Most grid computing applications use
[middleware](http://en.wikipedia.org/wiki/Middleware "Middleware"), software that sits between
the operating system and the application to manage network resources and
standardize the software interface. The most common distributed
computing middleware is the [Berkeley Open Infrastructure for Network
Computing](http://en.wikipedia.org/wiki/Berkeley_Open_Infrastructure_for_Network_Computing "Berkeley Open Infrastructure for Network Computing")
(BOINC). Often, distributed computing software makes use of "spare
cycles", performing computations at times when a computer is idling.

#### Specialized parallel computers

Within parallel computing, there are specialized parallel devices that
remain niche areas of interest. While not
[domain-specific](http://en.wikipedia.org/wiki/Domain-specific_programming_language "Domain-specific programming language"),
they tend to be applicable to only a few classes of parallel problems.

##### Reconfigurable computing with field-programmable gate arrays

[Reconfigurable
computing](http://en.wikipedia.org/wiki/Reconfigurable_computing "Reconfigurable computing") is
the use of a [field-programmable gate
array](http://en.wikipedia.org/wiki/Field-programmable_gate_array "Field-programmable gate array")
(FPGA) as a co-processor to a general-purpose computer. An FPGA is, in
essence, a computer chip that can rewire itself for a given task.

FPGAs can be programmed with [hardware description
languages](http://en.wikipedia.org/wiki/Hardware_description_language "Hardware description language")
such as [VHDL](http://en.wikipedia.org/wiki/VHDL "VHDL") or [Verilog](http://en.wikipedia.org/wiki/Verilog "Verilog").
However, programming in these languages can be tedious. Several vendors
have created [C to HDL](http://en.wikipedia.org/wiki/C_to_HDL "C to HDL") languages that
attempt to emulate the syntax and semantics of the [C programming
language](http://en.wikipedia.org/wiki/C_programming_language "C programming language"), with
which most programmers are familiar. The best known C to HDL languages
are [Mitrion-C](http://en.wikipedia.org/wiki/Mitrionics "Mitrionics"), [Impulse
C](http://en.wikipedia.org/wiki/Impulse_C "Impulse C"), [DIME-C](http://en.wikipedia.org/wiki/DIME-C "DIME-C"), and
[Handel-C](http://en.wikipedia.org/wiki/Handel-C "Handel-C"). Specific subsets of
[SystemC](http://en.wikipedia.org/wiki/SystemC "SystemC") based on C++ can also be used for
this purpose.

AMD's decision to open its
[HyperTransport](http://en.wikipedia.org/wiki/HyperTransport "HyperTransport") technology to
third-party vendors has become the enabling technology for
high-performance reconfigurable computing.[[32]](#cite_note-DAmour-32)
According to Michael R. D'Amour, Chief Operating Officer of [DRC
Computer
Corporation](/w/index.php?title=DRC_Computer_Corporation&action=edit&redlink=1 "DRC Computer Corporation (page does not exist)"),
"when we first walked into AMD, they called us 'the
[socket](http://en.wikipedia.org/wiki/CPU_socket "CPU socket") stealers.' Now they call us
their partners."[[32]](#cite_note-DAmour-32)

##### General-purpose computing on graphics processing units (GPGPU)

Main article: [GPGPU](http://en.wikipedia.org/wiki/GPGPU "GPGPU")

[![](//upload.wikimedia.org/wikipedia/commons/thumb/3/32/NvidiaTesla.jpg/220px-NvidiaTesla.jpg)](http://en.wikipedia.org/wiki/File:NvidiaTesla.jpg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:NvidiaTesla.jpg "Enlarge")

Nvidia's [Tesla GPGPU card](http://en.wikipedia.org/wiki/Nvidia_Tesla "Nvidia Tesla")

General-purpose computing on [graphics processing
units](http://en.wikipedia.org/wiki/Graphics_processing_unit "Graphics processing unit")
(GPGPU) is a fairly recent trend in computer engineering research. GPUs
are co-processors that have been heavily optimized for [computer
graphics](http://en.wikipedia.org/wiki/Computer_graphics "Computer graphics")
processing.[[33]](#cite_note-33) Computer graphics processing is a
field dominated by data parallel operations—particularly [linear
algebra](http://en.wikipedia.org/wiki/Linear_algebra "Linear algebra")
[matrix](http://en.wikipedia.org/wiki/Matrix_(mathematics) "Matrix (mathematics)") operations.

In the early days, GPGPU programs used the normal graphics APIs for
executing programs. However, several new programming languages and
platforms have been built to do general purpose computation on GPUs with
both [Nvidia](http://en.wikipedia.org/wiki/Nvidia "Nvidia") and [AMD](http://en.wikipedia.org/wiki/AMD "AMD")
releasing programming environments with [CUDA](http://en.wikipedia.org/wiki/CUDA "CUDA") and
[Stream
SDK](http://en.wikipedia.org/wiki/AMD_FireStream#Software_Development_Kit "AMD FireStream")
respectively. Other GPU programming languages include
[BrookGPU](http://en.wikipedia.org/wiki/BrookGPU "BrookGPU"),
[PeakStream](http://en.wikipedia.org/wiki/PeakStream "PeakStream"), and
[RapidMind](http://en.wikipedia.org/wiki/RapidMind "RapidMind"). Nvidia has also released
specific products for computation in their [Tesla
series](http://en.wikipedia.org/wiki/Nvidia_Tesla "Nvidia Tesla"). The technology consortium
Khronos Group has released the [OpenCL](http://en.wikipedia.org/wiki/OpenCL "OpenCL")
specification, which is a framework for writing programs that execute
across platforms consisting of CPUs and GPUs. [AMD](http://en.wikipedia.org/wiki/AMD "AMD"),
[Apple](http://en.wikipedia.org/wiki/Apple_Inc. "Apple Inc."), [Intel](http://en.wikipedia.org/wiki/Intel "Intel"),
[Nvidia](http://en.wikipedia.org/wiki/Nvidia "Nvidia") and others are supporting
[OpenCL](http://en.wikipedia.org/wiki/OpenCL "OpenCL").

##### Application-specific integrated circuits

Main article: [Application-specific integrated
circuit](http://en.wikipedia.org/wiki/Application-specific_integrated_circuit "Application-specific integrated circuit")

Several [application-specific integrated
circuit](http://en.wikipedia.org/wiki/Application-specific_integrated_circuit "Application-specific integrated circuit")
(ASIC) approaches have been devised for dealing with parallel
applications.[[34]](#cite_note-34)[[35]](#cite_note-35)[[36]](#cite_note-36)

Because an ASIC is (by definition) specific to a given application, it
can be fully optimized for that application. As a result, for a given
application, an ASIC tends to outperform a general-purpose computer.
However, ASICs are created by [X-ray
lithography](http://en.wikipedia.org/wiki/X-ray_lithography "X-ray lithography"). This process
requires a mask, which can be extremely expensive. A single mask can
cost over a million US dollars.[[37]](#cite_note-37) (The smaller the
transistors required for the chip, the more expensive the mask will be.)
Meanwhile, performance increases in general-purpose computing over time
(as described by Moore's Law) tend to wipe out these gains in only one
or two chip generations.[[32]](#cite_note-DAmour-32) High initial
cost, and the tendency to be overtaken by Moore's-law-driven
general-purpose computing, has rendered ASICs unfeasible for most
parallel computing applications. However, some have been built. One
example is the peta-flop [RIKEN
MDGRAPE-3](http://en.wikipedia.org/wiki/RIKEN_MDGRAPE-3 "RIKEN MDGRAPE-3") machine which uses
custom ASICs for [molecular
dynamics](http://en.wikipedia.org/wiki/Molecular_dynamics "Molecular dynamics") simulation.

##### Vector processors

Main article: [Vector
processor](http://en.wikipedia.org/wiki/Vector_processor "Vector processor")

[![](//upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Cray_1_IMG_9126.jpg/220px-Cray_1_IMG_9126.jpg)](http://en.wikipedia.org/wiki/File:Cray_1_IMG_9126.jpg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:Cray_1_IMG_9126.jpg "Enlarge")

The [Cray-1](http://en.wikipedia.org/wiki/Cray-1 "Cray-1") is the most famous vector processor.

A vector processor is a CPU or computer system that can execute the same
instruction on large sets of data. "Vector processors have high-level
operations that work on linear arrays of numbers or vectors. An example
vector operation is *A* = *B* × *C*, where *A*, *B*, and *C* are each
64-element vectors of 64-bit
[floating-point](http://en.wikipedia.org/wiki/Floating_point "Floating point")
numbers."[[38]](#cite_note-PH751-38) They are closely related to
Flynn's SIMD classification.[[38]](#cite_note-PH751-38)

[Cray](http://en.wikipedia.org/wiki/Cray "Cray") computers became famous for their
vector-processing computers in the 1970s and 1980s. However, vector
processors—both as CPUs and as full computer systems—have generally
disappeared. Modern [processor instruction
sets](http://en.wikipedia.org/wiki/Instruction_set "Instruction set") do include some vector
processing instructions, such as with [AltiVec](http://en.wikipedia.org/wiki/AltiVec "AltiVec")
and [Streaming SIMD
Extensions](http://en.wikipedia.org/wiki/Streaming_SIMD_Extensions "Streaming SIMD Extensions")
(SSE).

Software
--------

### Parallel programming languages

Main article: [List of concurrent and parallel programming
languages](http://en.wikipedia.org/wiki/List_of_concurrent_and_parallel_programming_languages "List of concurrent and parallel programming languages")

[Concurrent programming
languages](http://en.wikipedia.org/wiki/Category:Concurrent_programming_languages "Category:Concurrent programming languages"),
[libraries](http://en.wikipedia.org/wiki/Library_(computing) "Library (computing)"),
[APIs](http://en.wikipedia.org/wiki/Application_programming_interface "Application programming interface"),
and [parallel programming
models](http://en.wikipedia.org/wiki/Parallel_programming_model "Parallel programming model")
(such as [Algorithmic
Skeletons](http://en.wikipedia.org/wiki/Algorithmic_skeleton "Algorithmic skeleton")) have been
created for programming parallel computers. These can generally be
divided into classes based on the assumptions they make about the
underlying memory architecture—shared memory, distributed memory, or
shared distributed memory. Shared memory programming languages
communicate by manipulating shared memory variables. Distributed memory
uses [message passing](http://en.wikipedia.org/wiki/Message_passing "Message passing"). [POSIX
Threads](http://en.wikipedia.org/wiki/POSIX_Threads "POSIX Threads") and
[OpenMP](http://en.wikipedia.org/wiki/OpenMP "OpenMP") are two of most widely used shared
memory APIs, whereas [Message Passing
Interface](http://en.wikipedia.org/wiki/Message_Passing_Interface "Message Passing Interface")
(MPI) is the most widely used message-passing system
API.[[39]](#cite_note-39) One concept used in programming parallel
programs is the [future
concept](http://en.wikipedia.org/wiki/Futures_and_promises "Futures and promises"), where one
part of a program promises to deliver a required datum to another part
of a program at some future time.

[CAPS
entreprise](/w/index.php?title=CAPS_entreprise&action=edit&redlink=1 "CAPS entreprise (page does not exist)")
and
[Pathscale](/w/index.php?title=Pathscale&action=edit&redlink=1 "Pathscale (page does not exist)")
are also coordinating their effort to make
[HMPP](/w/index.php?title=HMPP&action=edit&redlink=1 "HMPP (page does not exist)")
(Hybrid Multicore Parallel Programming) directives an Open Standard
called [OpenHMPP](http://en.wikipedia.org/wiki/OpenHMPP "OpenHMPP"). The
[OpenHMPP](http://en.wikipedia.org/wiki/OpenHMPP "OpenHMPP") directive-based programming model
offers a syntax to efficiently offload computations on hardware
accelerators and to optimize data movement to/from the hardware memory.
[OpenHMPP](http://en.wikipedia.org/wiki/OpenHMPP "OpenHMPP") directives describe remote
procedure call (RPC) on an accelerator device (e.g. GPU) or more
generally a set of cores. The directives annotate C or Fortran codes to
describe two sets of functionalities: the offloading of procedures
(denoted codelets) onto a remote device and the optimization of data
transfers between the CPU main memory and the accelerator memory.

One of the hottest older languages that is recently being extended from
embedded mobile and telephony to more general concurrent challenges and
projects is [Erlang (programming
language)](http://en.wikipedia.org/wiki/Erlang_(programming_language) "Erlang (programming language)").
See the wiki article for numerous references on these applications.

### Automatic parallelization

Main article: [Automatic
parallelization](http://en.wikipedia.org/wiki/Automatic_parallelization "Automatic parallelization")

Automatic parallelization of a sequential program by a
[compiler](http://en.wikipedia.org/wiki/Compiler "Compiler") is the [holy
grail](http://en.wikipedia.org/wiki/Holy_grail "Holy grail") of parallel computing. Despite
decades of work by compiler researchers, automatic parallelization has
had only limited success.[[40]](#cite_note-40)

Mainstream parallel programming languages remain either [explicitly
parallel](http://en.wikipedia.org/wiki/Explicit_parallelism "Explicit parallelism") or (at
best) [partially
implicit](http://en.wikipedia.org/wiki/Implicit_parallelism "Implicit parallelism"), in which a
programmer gives the compiler
[directives](http://en.wikipedia.org/wiki/Directive_(programming) "Directive (programming)")
for parallelization. A few fully implicit parallel programming languages
exist—[SISAL](http://en.wikipedia.org/wiki/SISAL "SISAL"), Parallel
[Haskell](http://en.wikipedia.org/wiki/Haskell_(programming_language) "Haskell (programming language)"),
[System C](http://en.wikipedia.org/wiki/System_C "System C") (for [FPGAs](http://en.wikipedia.org/wiki/FPGA "FPGA")),
[Mitrion-C](/w/index.php?title=Mitrion-C&action=edit&redlink=1 "Mitrion-C (page does not exist)"),
[VHDL](http://en.wikipedia.org/wiki/VHDL "VHDL"), and [Verilog](http://en.wikipedia.org/wiki/Verilog "Verilog").

### Application checkpointing

Main article: [Application
checkpointing](http://en.wikipedia.org/wiki/Application_checkpointing "Application checkpointing")

As a computer system grows in complexity, the [mean time between
failures](http://en.wikipedia.org/wiki/Mean_time_between_failures "Mean time between failures")
usually decreases. [Application
checkpointing](http://en.wikipedia.org/wiki/Application_checkpointing "Application checkpointing")
is a technique whereby the computer system takes a "snapshot" of the
application — a record of all current resource allocations and variable
states, akin to a [core dump](http://en.wikipedia.org/wiki/Core_dump "Core dump"); this
information can be used to restore the program if the computer should
fail. Application checkpointing means that the program has to restart
from only its last checkpoint rather than the beginning. While
checkpointing provides benefits in a variety of situations, it is
especially useful in highly parallel systems with a large number of
processors used in [high performance
computing](http://en.wikipedia.org/wiki/High_performance_computing "High performance computing").[[41]](#cite_note-41)

Algorithmic methods
------------

As parallel computers become larger and faster, it becomes feasible to
solve problems that previously took too long to run. Parallel computing
is used in a wide range of fields, from
[bioinformatics](http://en.wikipedia.org/wiki/Bioinformatics "Bioinformatics") ([protein
folding](http://en.wikipedia.org/wiki/Protein_folding "Protein folding") and [sequence
analysis](http://en.wikipedia.org/wiki/Sequence_analysis "Sequence analysis")) to economics
([mathematical
finance](http://en.wikipedia.org/wiki/Mathematical_finance "Mathematical finance")). Common
types of problems found in parallel computing applications
are:[[42]](#cite_note-42)

-   Dense [linear algebra](http://en.wikipedia.org/wiki/Linear_algebra "Linear algebra")
-   Sparse linear algebra
-   Spectral methods (such as [Cooley–Tukey fast Fourier
    transform](http://en.wikipedia.org/wiki/Cooley%E2%80%93Tukey_FFT_algorithm "Cooley–Tukey FFT algorithm"))
-   [*n*-body problems](http://en.wikipedia.org/wiki/N-body_problem "N-body problem") (such as
    [Barnes–Hut
    simulation](http://en.wikipedia.org/wiki/Barnes%E2%80%93Hut_simulation "Barnes–Hut simulation"))
-   [Structured grid](http://en.wikipedia.org/wiki/Regular_grid "Regular grid") problems (such
    as [Lattice Boltzmann
    methods](http://en.wikipedia.org/wiki/Lattice_Boltzmann_methods "Lattice Boltzmann methods"))
-   [Unstructured grid](http://en.wikipedia.org/wiki/Unstructured_grid "Unstructured grid")
    problems (such as found in [finite element
    analysis](http://en.wikipedia.org/wiki/Finite_element_analysis "Finite element analysis"))
-   [Monte Carlo
    simulation](http://en.wikipedia.org/wiki/Monte_Carlo_method "Monte Carlo method")
-   [Combinational
    logic](http://en.wikipedia.org/wiki/Combinational_logic "Combinational logic") (such as
    [brute-force cryptographic
    techniques](http://en.wikipedia.org/wiki/Brute_force_attack "Brute force attack"))
-   [Graph traversal](http://en.wikipedia.org/wiki/Graph_traversal "Graph traversal") (such as
    [sorting algorithms](http://en.wikipedia.org/wiki/Sorting_algorithm "Sorting algorithm"))
-   [Dynamic
    programming](http://en.wikipedia.org/wiki/Dynamic_programming "Dynamic programming")
-   [Branch and bound](http://en.wikipedia.org/wiki/Branch_and_bound "Branch and bound")
    methods
-   [Graphical models](http://en.wikipedia.org/wiki/Graphical_model "Graphical model") (such as
    detecting [hidden Markov
    models](http://en.wikipedia.org/wiki/Hidden_Markov_model "Hidden Markov model") and
    constructing [Bayesian
    networks](http://en.wikipedia.org/wiki/Bayesian_network "Bayesian network"))
-   [Finite-state
    machine](http://en.wikipedia.org/wiki/Finite-state_machine "Finite-state machine")
    simulation

Fault-tolerance
----------------

Further information: [Fault-tolerant computer
system](http://en.wikipedia.org/wiki/Fault-tolerant_computer_system "Fault-tolerant computer system")

Parallel computing can also be applied to the design of [fault-tolerant
computer
systems](http://en.wikipedia.org/wiki/Fault-tolerant_computer_system "Fault-tolerant computer system"),
particularly via
[lockstep](http://en.wikipedia.org/wiki/Lockstep_(computing) "Lockstep (computing)") systems
performing the same operation in parallel. This provides
[redundancy](http://en.wikipedia.org/wiki/Redundancy_(engineering) "Redundancy (engineering)")
in case one component should fail, and also allows automatic [error
detection](http://en.wikipedia.org/wiki/Error_detection "Error detection") and [error
correction](http://en.wikipedia.org/wiki/Error_correction "Error correction") if the results
differ.

History
-------

Main article: [History of
computing](http://en.wikipedia.org/wiki/History_of_computing "History of computing")

[![](//upload.wikimedia.org/wikipedia/commons/thumb/9/91/ILLIAC_4_parallel_computer.jpg/220px-ILLIAC_4_parallel_computer.jpg)](http://en.wikipedia.org/wiki/File:ILLIAC_4_parallel_computer.jpg)

[![](//bits.wikimedia.org/static-1.23wmf18/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:ILLIAC_4_parallel_computer.jpg "Enlarge")

[ILLIAC IV](http://en.wikipedia.org/wiki/ILLIAC_IV "ILLIAC IV"), "perhaps the most infamous of
Supercomputers"[[43]](#cite_note-infamous-43)

The origins of true (MIMD) parallelism go back to [Federico Luigi, Conte
Menabrea](http://en.wikipedia.org/wiki/Federico_Luigi,_Conte_Menabrea "Federico Luigi, Conte Menabrea")
and his "Sketch of the [Analytic
Engine](http://en.wikipedia.org/wiki/Analytic_Engine "Analytic Engine") Invented by [Charles
Babbage](http://en.wikipedia.org/wiki/Charles_Babbage "Charles Babbage")".[[44]](#cite_note-44)[[45]](#cite_note-PH753-45)
[IBM](http://en.wikipedia.org/wiki/IBM "IBM") introduced the [704](http://en.wikipedia.org/wiki/IBM_704 "IBM 704") in
1954, through a project in which [Gene
Amdahl](http://en.wikipedia.org/wiki/Gene_Amdahl "Gene Amdahl") was one of the principal
architects. It became the first commercially available computer to use
fully automatic [floating point](http://en.wikipedia.org/wiki/Floating_point "Floating point")
arithmetic commands.[[46]](#cite_note-46)

In April 1958, S. Gill (Ferranti) discussed parallel programming and the
need for branching and waiting.[[47]](#cite_note-47) Also in 1958, IBM
researchers [John Cocke](http://en.wikipedia.org/wiki/John_Cocke "John Cocke") and [Daniel
Slotnick](http://en.wikipedia.org/wiki/Daniel_Slotnick "Daniel Slotnick") discussed the use of
parallelism in numerical calculations for the first
time.[[48]](#cite_note-G_Wilson-48) [Burroughs
Corporation](http://en.wikipedia.org/wiki/Burroughs_Corporation "Burroughs Corporation")
introduced the D825 in 1962, a four-processor computer that accessed up
to 16 memory modules through a [crossbar
switch](http://en.wikipedia.org/wiki/Crossbar_switch "Crossbar switch").[[49]](#cite_note-49)
In 1967, Amdahl and Slotnick published a debate about the feasibility of
parallel processing at American Federation of Information Processing
Societies Conference.[[48]](#cite_note-G_Wilson-48) It was during this
debate that Amdahl's Law was coined to define the limit of speed-up due
to parallelism.

In 1969, US company [Honeywell](http://en.wikipedia.org/wiki/Honeywell "Honeywell") introduced
its first Multics system, a symmetric multiprocessor system capable of
running up to eight processors in
parallel.[[48]](#cite_note-G_Wilson-48) [C.mmp](http://en.wikipedia.org/wiki/C.mmp "C.mmp"),
a 1970s multi-processor project at [Carnegie Mellon
University](http://en.wikipedia.org/wiki/Carnegie_Mellon_University "Carnegie Mellon University"),
was "among the first multiprocessors with more than a few
processors".[[45]](#cite_note-PH753-45) "The first bus-connected
multi-processor with snooping caches was the [Synapse
N+1](/w/index.php?title=Synapse_N%2B1&action=edit&redlink=1 "Synapse N+1 (page does not exist)")
in 1984."[[45]](#cite_note-PH753-45)

SIMD parallel computers can be traced back to the 1970s. The motivation
behind early SIMD computers was to amortize the [gate
delay](http://en.wikipedia.org/wiki/Propagation_delay "Propagation delay") of the processor's
[control unit](http://en.wikipedia.org/wiki/Control_unit "Control unit") over multiple
instructions.[[50]](#cite_note-50) In 1964, Slotnick had proposed
building a massively parallel computer for the [Lawrence Livermore
National
Laboratory](http://en.wikipedia.org/wiki/Lawrence_Livermore_National_Laboratory "Lawrence Livermore National Laboratory").[[48]](#cite_note-G_Wilson-48)
His design was funded by the [US Air
Force](http://en.wikipedia.org/wiki/US_Air_Force "US Air Force"), which was the earliest SIMD
parallel-computing effort, [ILLIAC
IV](http://en.wikipedia.org/wiki/ILLIAC_IV "ILLIAC IV").[[48]](#cite_note-G_Wilson-48) The
key to its design was a fairly high parallelism, with up to
256 processors, which allowed the machine to work on large datasets in
what would later be known as [vector
processing](http://en.wikipedia.org/wiki/Vector_processor "Vector processor"). However, ILLIAC
IV was called "the most infamous of Supercomputers", because the project
was only one fourth completed, but took 11 years and cost almost four
times the original estimate.[[43]](#cite_note-infamous-43) When it was
finally ready to run its first real application in 1976, it was
outperformed by existing commercial supercomputers such as the
[Cray-1](http://en.wikipedia.org/wiki/Cray-1 "Cray-1").

See also
-------------------------------------

-   [List of important publications in concurrent, parallel, and
    distributed
    computing](http://en.wikipedia.org/wiki/List_of_important_publications_in_concurrent,_parallel,_and_distributed_computing "List of important publications in concurrent, parallel, and distributed computing")
-   [List of distributed computing
    conferences](http://en.wikipedia.org/wiki/List_of_distributed_computing_conferences "List of distributed computing conferences")
-   [Concurrency (computer
    science)](http://en.wikipedia.org/wiki/Concurrency_(computer_science) "Concurrency (computer science)")
-   [Synchronous
    programming](http://en.wikipedia.org/wiki/Synchronous_programming "Synchronous programming")
-   [Content Addressable Parallel
    Processor](http://en.wikipedia.org/wiki/Content_Addressable_Parallel_Processor "Content Addressable Parallel Processor")
-   [Transputer](http://en.wikipedia.org/wiki/Transputer "Transputer")

References
----------

1.  Gottlieb, Allan; Almasi, George S. (1989).
    [*Highly parallel
    computing*](http://dl.acm.org/citation.cfm?id=160438). Redwood City,
    Calif.: Benjamin/Cummings.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-8053-0177-1](http://en.wikipedia.org/wiki/Special:BookSources/0-8053-0177-1 "Special:BookSources/0-8053-0177-1"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
2.  S.V. Adve et al. (November 2008). ["Parallel
    Computing Research at Illinois: The UPCRC
    Agenda"](http://www.upcrc.illinois.edu/documents/UPCRC_Whitepaper.pdf)
    (PDF). Parallel@Illinois, University of Illinois at
    Urbana-Champaign. "The main techniques for these performance
    benefits – increased clock frequency and smarter but increasingly
    complex architectures – are now hitting the so-called power wall.
    The computer industry has accepted that future performance increases
    must largely come from increasing the number of processors (or
    cores) on a die, rather than making a single core go faster."
3.   Asanovic et al. Old [conventional wisdom]:
    Power is free, but transistors are expensive. New [conventional
    wisdom] is [that] power is expensive, but transistors are "free".
4.   Asanovic, Krste et al. (December
    18, 2006). ["The Landscape of Parallel Computing Research: A View
    from
    Berkeley"](http://www.eecs.berkeley.edu/Pubs/TechRpts/2006/EECS-2006-183.pdf)
    (PDF). University of California, Berkeley. Technical Report No.
    UCB/EECS-2006-183. "Old [conventional wisdom]: Increasing clock
    frequency is the primary method of improving processor performance.
    New [conventional wisdom]: Increasing parallelism is the primary
    method of improving processor performance ... Even representatives
    from Intel, a company generally associated with the 'higher
    clock-speed is better' position, warned that traditional approaches
    to maximizing performance through maximizing clock speed have been
    pushed to their limit."
5.  Hennessy, John L.; Patterson, David A., Larus,
    James R. (1999). *Computer organization and design : the
    hardware/software interface* (2. ed., 3rd print. ed.). San
    Francisco: Kaufmann.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [1-55860-428-6](http://en.wikipedia.org/wiki/Special:BookSources/1-55860-428-6 "Special:BookSources/1-55860-428-6"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
6.  Barney, Blaise. ["Introduction to
    Parallel
    Computing"](http://www.llnl.gov/computing/tutorials/parallel_comp/).
    Lawrence Livermore National Laboratory. Retrieved 2007-11-09. 
7.  Hennessy, John L.; Patterson, David A. (2002).
    *Computer architecture / a quantitative approach.* (3rd ed.). San
    Francisco, Calif.: International Thomson. p. 43.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [1-55860-724-2](http://en.wikipedia.org/wiki/Special:BookSources/1-55860-724-2 "Special:BookSources/1-55860-724-2"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
8.  Rabaey, Jan M. (1996). *Digital integrated
    circuits : a design perspective*. Upper Saddle River, N.J.:
    Prentice-Hall. p. 235.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-13-178609-1](http://en.wikipedia.org/wiki/Special:BookSources/0-13-178609-1 "Special:BookSources/0-13-178609-1"). 
9.  Flynn, Laurie J. (8 May 2004). ["Intel Halts
    Development Of 2 New
    Microprocessors"](http://www.nytimes.com/2004/05/08/business/08chip.html?ex=1399348800&en=98cc44ca97b1a562&ei=5007).
    *New York Times*. Retrieved 5 June 2012. 
10. Moore, Gordon E. (1965).
    ["Cramming more components onto integrated
    circuits"](ftp://download.intel.com/museum/Moores_Law/Articles-Press_Releases/Gordon_Moore_1965_Article.pdf)
    (PDF). *[Electronics
    Magazine](http://en.wikipedia.org/wiki/Electronics_(magazine) "Electronics (magazine)")*.
    p. 4. Retrieved 2006-11-11. 
11. Amdahl, Gene M. (1967). ["Validity of the
    single processor approach to achieving large scale computing
    capabilities"](http://dl.acm.org/citation.cfm?id=160438).
    *Proceeding AFIPS '67 (Spring) Proceedings of the April 18–20, 1967,
    spring joint computer conference*: 483–485.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1145/1465482.1465560](http://dx.doi.org/10.1145%2F1465482.1465560). 
12. Brooks, Frederick P. (1996). *The mythical
    man month essays on software engineering* (Anniversary ed., repr.
    with corr., 5. [Dr.] ed.). Reading, Mass. [u.a.]: Addison-Wesley.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-201-83595-9](http://en.wikipedia.org/wiki/Special:BookSources/0-201-83595-9 "Special:BookSources/0-201-83595-9"). 
13. Gustafson, John L. (May 1988). ["Reevaluating
    Amdahl's
    law"](http://www.scl.ameslab.gov/Publications/Gus/AmdahlsLaw/Amdahls.html).
    *Communications of the ACM* **31** (5): 532–533.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1145/42411.42415](http://dx.doi.org/10.1145%2F42411.42415). 
14. Bernstein, A. J. (1 October 1966). "Analysis
    of Programs for Parallel Processing". *IEEE Transactions on
    Electronic Computers*. EC-15 (5): 757–763.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/PGEC.1966.264565](http://dx.doi.org/10.1109%2FPGEC.1966.264565). 
15. Roosta, Seyed H. (2000). *Parallel processing
    and parallel algorithms : theory and computation*. New York, NY
    [u.a.]: Springer. p. 114.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-387-98716-9](http://en.wikipedia.org/wiki/Special:BookSources/0-387-98716-9 "Special:BookSources/0-387-98716-9"). 
16. Lamport, Leslie (1 September 1979). "How to
    Make a Multiprocessor Computer That Correctly Executes Multiprocess
    Programs". *IEEE Transactions on Computers* **C–28** (9): 690–691.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/TC.1979.1675439](http://dx.doi.org/10.1109%2FTC.1979.1675439). 
17. Patterson and Hennessy, p. 748.
18. Singh, David Culler ; J.P. (1997). *Parallel
    computer architecture* ([Nachdr.] ed.). San Francisco: Morgan
    Kaufmann Publ. p. 15.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [1-55860-343-3](http://en.wikipedia.org/wiki/Special:BookSources/1-55860-343-3 "Special:BookSources/1-55860-343-3"). 
19. Culler et al. p. 15.
20. Patt, Yale](http://en.wikipedia.org/wiki/Yale_Patt "Yale Patt")
    (April 2004). "[The Microprocessor Ten Years From Now: What Are The
    Challenges, How Do We Meet
    Them?](http://users.ece.utexas.edu/~patt/Videos/talk_videos/cmu_04-29-04.wmv)
    (wmv). Distinguished Lecturer talk at [Carnegie Mellon
    University](http://en.wikipedia.org/wiki/Carnegie_Mellon_University "Carnegie Mellon University").
    Retrieved on November 7, 2007.
21. Culler et al. p. 124.
22. Culler et al. p. 125.
23. Patterson and Hennessy, p. 713.
24. Hennessy and Patterson, p. 549.
25. Patterson and Hennessy, p. 714.
26. [What is
    clustering?](http://www.webopedia.com/TERM/c/clustering.html)
    Webopedia computer dictionary. Retrieved on November 7, 2007.
27. [Beowulf
    definition.](http://www.pcmag.com/encyclopedia_term/0,2542,t=Beowulf&i=38548,00.asp)
    *PC Magazine*. Retrieved on November 7, 2007.
28. [Architecture share for
    06/2007](http://www.top500.org/stats/list/29/archtype). TOP500
    Supercomputing Sites. Clusters make up 74.60% of the machines on the
    list. Retrieved on November 7, 2007.
29. Hennessy and Patterson, p. 537.
30. [MPP
    Definition.](http://www.pcmag.com/encyclopedia_term/0,,t=mpp&i=47310,00.asp)
    *PC Magazine*. Retrieved on November 7, 2007.
31. Kirkpatrick, Scott (2003). "COMPUTER SCIENCE:
    Rough Times Ahead". *Science* **299** (5607): 668–669.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1126/science.1081623](http://dx.doi.org/10.1126%2Fscience.1081623).
    [PMID](http://en.wikipedia.org/wiki/PubMed_Identifier "PubMed Identifier") [12560537](//www.ncbi.nlm.nih.gov/pubmed/12560537). 
32. D'Amour, Michael R., Chief
    Operating Officer, [DRC Computer
    Corporation](/w/index.php?title=DRC_Computer_Corporation&action=edit&redlink=1 "DRC Computer Corporation (page does not exist)").
    "Standard Reconfigurable Computing". Invited speaker at the
    University of Delaware, February 28, 2007.
33. Boggan, Sha'Kia and Daniel M. Pressel (August
    2007). [GPUs: An Emerging Platform for General-Purpose
    Computation](http://www.arl.army.mil/arlreports/2007/ARL-SR-154.pdf)
    (PDF). ARL-SR-154, U.S. Army Research Lab. Retrieved on November 7,
    2007.
34. Maslennikov, Oleg (2002). ["Systematic
    Generation of Executing Programs for Processor Elements in Parallel
    ASIC or FPGA-Based Systems and Their Transformation into
    VHDL-Descriptions of Processor Element Control
    Units".](http://www.springerlink.com/content/jjrdrb0lelyeu3e9/)
    *Lecture Notes in Computer Science*, **2328/2002:** p. 272.
35. Shimokawa, Y.; Y. Fuwa and N. Aramaki (18-21
    Nov 1991). ["A parallel ASIC VLSI neurocomputer for a large number
    of neurons and billion connections per second
    speed"](http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber=170708).
    *International Joint Conference on Neural Networks* **3**:
    2162–2167.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/IJCNN.1991.170708](http://dx.doi.org/10.1109%2FIJCNN.1991.170708).
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-7803-0227-3](http://en.wikipedia.org/wiki/Special:BookSources/0-7803-0227-3 "Special:BookSources/0-7803-0227-3"). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"));
    Check date values in: `|date=`
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#bad_date "Help:CS1 errors"))
36. Acken, Kevin P.; Irwin, Mary Jane; Owens,
    Robert M. (1 January 1998). *The Journal of VLSI Signal Processing*
    **19** (2): 97–113.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1023/A:1008005616596](http://dx.doi.org/10.1023%2FA%3A1008005616596). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
37. Kahng, Andrew B. (June 21, 2004) "[Scoping
    the Problem of DFM in the Semiconductor
    Industry](http://www.future-fab.com/documents.asp?grID=353&d_ID=2596)."
    University of California, San Diego. "Future design for
    manufacturing (DFM) technology must reduce design [non-recoverable
    expenditure] cost and directly address manufacturing
    [non-recoverable expenditures] – the cost of a mask set and probe
    card – which is well over \$1 million at the 90 nm technology node
    and creates a significant damper on semiconductor-based innovation."
38. Patterson and Hennessy, p. 751.
39. The [Sidney Fernbach Award given to MPI
    inventor Bill
    Gropp](http://awards.computer.org/ana/award/viewPastRecipients.action?id=16)
    refers to MPI as "the dominant HPC communications interface"
40. Shen, John Paul; Mikko H. Lipasti (2004).
    *Modern processor design : fundamentals of superscalar processors*
    (1st ed.). Dubuque, Iowa: McGraw-Hill. p. 561.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0-07-057064-7](http://en.wikipedia.org/wiki/Special:BookSources/0-07-057064-7 "Special:BookSources/0-07-057064-7").
    "However, the holy grail of such research – automated
    parallelization of serial programs – has yet to materialize. While
    automated parallelization of certain classes of algorithms has been
    demonstrated, such success has largely been limited to scientific
    and numeric applications with predictable flow control (e.g., nested
    loop structures with statically determined iteration counts) and
    statically analyzable memory access patterns. (e.g., walks over
    large multidimensional arrays of float-point data)."  Cite uses
    deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
41. *Encyclopedia of Parallel Computing, Volume
    4* by David Padua 2011 [ISBN
    0387097651](http://en.wikipedia.org/wiki/Special:BookSources/0387097651) page 265
42. Asanovic, Krste, et al. (December 18, 2006).
    [The Landscape of Parallel Computing Research: A View from
    Berkeley](http://www.eecs.berkeley.edu/Pubs/TechRpts/2006/EECS-2006-183.pdf)
    (PDF). University of California, Berkeley. Technical Report No.
    UCB/EECS-2006-183. See table on pages 17–19.
43. Patterson and Hennessy,
    pp. 749–50: "Although successful in pushing several technologies
    useful in later projects, the ILLIAC IV failed as a computer. Costs
    escalated from the \$8 million estimated in 1966 to \$31 million by
    1972, despite the construction of only a quarter of the planned
    machine ... It was perhaps the most infamous of supercomputers. The
    project started in 1965 and ran its first real application in 1976."
44. [Menabrea, L.
    F.](http://en.wikipedia.org/wiki/Federico_Luigi,_Conte_Menabrea "Federico Luigi, Conte Menabrea")
    (1842). [Sketch of the Analytic Engine Invented by Charles
    Babbage](http://www.fourmilab.ch/babbage/sketch.html). Bibliothèque
    Universelle de Genève. Retrieved on November 7, 2007.
45. Patterson and Hennessy, p. 753.
46. 46)** da Cruz, Frank (2003). ["Columbia University
    Computing History: The IBM
    704"](http://www.columbia.edu/acis/history/704.html). Columbia
    University. Retrieved 2008-01-08. 
47. 47)** Parallel Programming, S. Gill, The Computer
    Journal Vol. 1 \#1, pp2-10, British Computer Society, April 1958.
48. Wilson, Gregory V (1994). ["The
    History of the Development of Parallel
    Computing"](http://ei.cs.vt.edu/~history/Parallel.html). Virginia
    Tech/Norfolk State University, Interactive Learning with a Digital
    Library in Computer Science. Retrieved 2008-01-08. 
49. Anthes, Gry (November 19, 2001). ["The Power
    of
    Parallelism"](http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=65878).
    *[Computerworld](http://en.wikipedia.org/wiki/Computerworld "Computerworld")*. Retrieved
    2008-01-08. 
50. Patterson and Hennessy, p. 749.

Further reading
-------

-   Rodriguez, C.; Villagra, M.; Baran, B. (29 August 2008).
    ["Asynchronous team algorithms for Boolean
    Satisfiability"](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=4610083).
    *Bio-Inspired Models of Network, Information and Computing Systems,
    2007. Bionetics 2007. 2nd*: 66–69.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1109/BIMNICS.2007.4610083](http://dx.doi.org/10.1109%2FBIMNICS.2007.4610083). 

External links
-------

**Listen to this article**
([info/dl](http://en.wikipedia.org/wiki/File:En-Parallel_computing.ogg "File:En-Parallel computing.ogg"))

Sorry, your browser either has JavaScript disabled or does not have any
supported player.\
 You can [download the
clip](//upload.wikimedia.org/wikipedia/commons/3/3b/En-Parallel_computing.ogg)
or [download a
player](//www.mediawiki.orghttp://en.wikipedia.org/wiki/Extension:TimedMediaHandler/Client_download)
to play the clip in your browser.

![](//upload.wikimedia.org/wikipedia/commons/thumb/4/47/Sound-icon.svg/45px-Sound-icon.svg.png)

This audio file was created from a revision of the "Parallel computing"
article dated 2013-08-21, and does not reflect subsequent edits to the
article. ([Audio
help](http://en.wikipedia.org/wiki/Wikipedia:Media_help "Wikipedia:Media help"))

**[More spoken
articles](http://en.wikipedia.org/wiki/Wikipedia:Spoken_articles "Wikipedia:Spoken articles")**

[![Sound-icon.svg](//upload.wikimedia.org/wikipedia/commons/thumb/4/47/Sound-icon.svg/15px-Sound-icon.svg.png)](http://en.wikipedia.org/wiki/File:En-Parallel_computing.ogg "File:En-Parallel computing.ogg")

  --------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------
  ![](//upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikibooks-logo-en-noslogan.svg/40px-Wikibooks-logo-en-noslogan.svg.png)   Wikibooks has a book on the topic of: ***[Distributed Systems](//en.wikibooks.orghttp://en.wikipedia.org/wiki/Distributed_Systems "wikibooks:Distributed Systems")***
  --------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------

-   [Go Parallel: Translating Multicore Power into Application
    Performance](http://goparallel.sourceforge.net/)
-   [Parallel
    computing](http://www.dmoz.org/Computers/Parallel_Computing/) on the
    [Open Directory
    Project](http://en.wikipedia.org/wiki/Open_Directory_Project "Open Directory Project")
-   [Lawrence Livermore National Laboratory: Introduction to Parallel
    Computing](http://www.llnl.gov/computing/tutorials/parallel_comp/)
-   [Comparing programmability of Open MP and
    pthreads](http://www.futurechips.org/tips-for-power-coders/open-mp-pthreads.html)
-   [What makes parallel programming
    hard?](http://www.futurechips.org/tips-for-power-coders/parallel-programming.html)
-   [Designing and Building Parallel Programs, by Ian
    Foster](http://www-unix.mcs.anl.gov/dbpp/)
-   [Internet Parallel Computing
    Archive](http://wotug.ukc.ac.uk/parallel/)
-   [Parallel processing topic area at IEEE Distributed Computing
    Online](http://dsonline.computer.org/portal/site/dsonline/index.jsp?pageID=dso_level1_home&path=dsonline/topics/parallel&file=index.xml&xsl=generic.xsl)
-   [Parallel Computing Works Free On-line
    Book](http://www.new-npac.org/projects/cdroms/cewes-1998-05/copywrite/pcw/book.html)
-   [Frontiers of Supercomputing Free On-line Book Covering topics like
    algorithms and industrial
    applications](http://ark.cdlib.org/ark:/13030/ft0f59n73z/)
-   [Universal Parallel Computing Research
    Center](http://www.upcrc.illinois.edu/)
-   [Course in Parallel Programming at Columbia University (in
    collaboration with IBM T.J Watson X10
    project)](http://ppppcourse.ning.com/)
-   [Parallel and distributed Grobner bases computation in
    JAS](http://arxiv.org/PS_cache/arxiv/pdf/1008/1008.0011v1.pdf)
-   [Course in Parallel Computing at University of
    Wisconsin-Madison](http://sbel.wisc.edu/Courses/ME964/2011/index.htm)
-   [OpenHMPP, A New Standard for Manycore](http://www.openhmpp.org)

-   [v](http://en.wikipedia.org/wiki/Template:Parallel_computing "Template:Parallel computing")
-   [t](http://en.wikipedia.org/wiki/Template_talk:Parallel_computing "Template talk:Parallel computing")
-   [e](//en.wikipedia.org/w/index.php?title=Template:Parallel_computing&action=edit)

**Parallel computing**

General

-   [Cloud computing](http://en.wikipedia.org/wiki/Cloud_computing "Cloud computing")
-   [High-performance
    computing](http://en.wikipedia.org/wiki/High-performance_computing "High-performance computing")
-   [Cluster computing](http://en.wikipedia.org/wiki/Computer_cluster "Computer cluster")
-   [Distributed
    computing](http://en.wikipedia.org/wiki/Distributed_computing "Distributed computing")
-   [Grid computing](http://en.wikipedia.org/wiki/Grid_computing "Grid computing")

Levels

-   [Bit](http://en.wikipedia.org/wiki/Bit-level_parallelism "Bit-level parallelism")
-   [Instruction](http://en.wikipedia.org/wiki/Instruction-level_parallelism "Instruction-level parallelism")
-   [Data](http://en.wikipedia.org/wiki/Data_parallelism "Data parallelism")
-   [Task](http://en.wikipedia.org/wiki/Task_parallelism "Task parallelism")

[Multithreading](http://en.wikipedia.org/wiki/Multithreading_(computer_architecture) "Multithreading (computer architecture)")

-   [Temporal
    multithreading](http://en.wikipedia.org/wiki/Temporal_multithreading "Temporal multithreading")
-   [Simultaneous
    multithreading](http://en.wikipedia.org/wiki/Simultaneous_multithreading "Simultaneous multithreading")
    -   [Hyper-threading](http://en.wikipedia.org/wiki/Hyper-threading "Hyper-threading")

Theory

-   [Amdahl's law](http://en.wikipedia.org/wiki/Amdahl%27s_law "Amdahl's law")
-   [Gustafson's law](http://en.wikipedia.org/wiki/Gustafson%27s_law "Gustafson's law")
-   [Cost efficiency](http://en.wikipedia.org/wiki/Cost_efficiency "Cost efficiency")
-   [Karp–Flatt
    metric](http://en.wikipedia.org/wiki/Karp%E2%80%93Flatt_metric "Karp–Flatt metric")
-   [slowdown](http://en.wikipedia.org/wiki/Parallel_slowdown "Parallel slowdown")
-   [speedup](http://en.wikipedia.org/wiki/Speedup "Speedup")

Elements

-   [Process](http://en.wikipedia.org/wiki/Process_(computing) "Process (computing)")
-   [Thread](http://en.wikipedia.org/wiki/Thread_(computing) "Thread (computing)")
-   [Fiber](http://en.wikipedia.org/wiki/Fiber_(computer_science) "Fiber (computer science)")
-   [PRAM](http://en.wikipedia.org/wiki/Parallel_random-access_machine "Parallel random-access machine")
-   [Instruction window](http://en.wikipedia.org/wiki/Instruction_window "Instruction window")

Coordination

-   [Multiprocessing](http://en.wikipedia.org/wiki/Multiprocessing "Multiprocessing")
-   [Memory coherency](http://en.wikipedia.org/wiki/Memory_coherence "Memory coherence")
-   [Cache coherency](http://en.wikipedia.org/wiki/Cache_coherence "Cache coherence")
-   [Cache invalidation](http://en.wikipedia.org/wiki/Cache_invalidation "Cache invalidation")
-   [Barrier](http://en.wikipedia.org/wiki/Barrier_(computer_science) "Barrier (computer science)")
-   [Synchronization](http://en.wikipedia.org/wiki/Synchronization_(computer_science) "Synchronization (computer science)")
-   [Application
    checkpointing](http://en.wikipedia.org/wiki/Application_checkpointing "Application checkpointing")

[Programming](http://en.wikipedia.org/wiki/Computer_programming "Computer programming")

-   [Models](http://en.wikipedia.org/wiki/Parallel_programming_model "Parallel programming model")
    -   [Implicit
        parallelism](http://en.wikipedia.org/wiki/Implicit_parallelism "Implicit parallelism")
    -   [Explicit
        parallelism](http://en.wikipedia.org/wiki/Explicit_parallelism "Explicit parallelism")
    -   [Concurrency](http://en.wikipedia.org/wiki/Concurrency_(computer_science) "Concurrency (computer science)")
-   [Flynn's taxonomy](http://en.wikipedia.org/wiki/Flynn%27s_taxonomy "Flynn's taxonomy")
    -   [SISD](http://en.wikipedia.org/wiki/SISD "SISD")
    -   [SIMD](http://en.wikipedia.org/wiki/SIMD "SIMD")
    -   [MISD](http://en.wikipedia.org/wiki/MISD "MISD")
    -   [MIMD](http://en.wikipedia.org/wiki/MIMD "MIMD")
        -   [SPMD](http://en.wikipedia.org/wiki/SPMD "SPMD")
-   [Thread](http://en.wikipedia.org/wiki/Thread_(computing) "Thread (computing)")
-   [Non-blocking
    algorithm](http://en.wikipedia.org/wiki/Non-blocking_algorithm "Non-blocking algorithm")

[Hardware](http://en.wikipedia.org/wiki/Computer_hardware "Computer hardware")

-   [Multiprocessor](http://en.wikipedia.org/wiki/Multiprocessor "Multiprocessor")
    -   [Symmetric](http://en.wikipedia.org/wiki/Symmetric_multiprocessing "Symmetric multiprocessing")
    -   [Asymmetric](http://en.wikipedia.org/wiki/Asymmetric_multiprocessing "Asymmetric multiprocessing")
-   [Memory](http://en.wikipedia.org/wiki/Semiconductor_memory "Semiconductor memory")
    -   [NUMA](http://en.wikipedia.org/wiki/Non-uniform_memory_access "Non-uniform memory access")
    -   [COMA](http://en.wikipedia.org/wiki/Cache-only_memory_architecture "Cache-only memory architecture")
    -   [distributed](http://en.wikipedia.org/wiki/Distributed_memory "Distributed memory")
    -   [shared](http://en.wikipedia.org/wiki/Shared_memory "Shared memory")
    -   [distributed
        shared](http://en.wikipedia.org/wiki/Distributed_shared_memory "Distributed shared memory")
-   [MPP](http://en.wikipedia.org/wiki/Massively_parallel_(computing) "Massively parallel (computing)")
-   [Superscalar](http://en.wikipedia.org/wiki/Superscalar "Superscalar")
-   [Vector processor](http://en.wikipedia.org/wiki/Vector_processor "Vector processor")
-   [Supercomputer](http://en.wikipedia.org/wiki/Supercomputer "Supercomputer")
-   [Beowulf cluster](http://en.wikipedia.org/wiki/Beowulf_cluster "Beowulf cluster")

[APIs](http://en.wikipedia.org/wiki/Application_programming_interface "Application programming interface")

-   [Ateji PX](http://en.wikipedia.org/wiki/Ateji_PX "Ateji PX")
-   [POSIX Threads](http://en.wikipedia.org/wiki/POSIX_Threads "POSIX Threads")
-   [OpenMP](http://en.wikipedia.org/wiki/OpenMP "OpenMP")
-   [OpenHMPP](http://en.wikipedia.org/wiki/OpenHMPP "OpenHMPP")
-   [OpenACC](http://en.wikipedia.org/wiki/OpenACC "OpenACC")
-   [PVM](http://en.wikipedia.org/wiki/Parallel_Virtual_Machine "Parallel Virtual Machine")
-   [MPI](http://en.wikipedia.org/wiki/Message_Passing_Interface "Message Passing Interface")
-   [UPC](http://en.wikipedia.org/wiki/Unified_Parallel_C "Unified Parallel C")
-   [TBB](http://en.wikipedia.org/wiki/Threading_Building_Blocks "Threading Building Blocks")
-   [Boost.Thread](http://en.wikipedia.org/wiki/Boost_(C%2B%2B_libraries)#Multithreading_.E2.80.93_Boost.Thread "Boost (C++ libraries)")
-   [Global Arrays](http://en.wikipedia.org/wiki/Global_Arrays "Global Arrays")
-   [Charm++](http://en.wikipedia.org/wiki/Charm%2B%2B "Charm++")
-   [Cilk](http://en.wikipedia.org/wiki/Cilk "Cilk")/[Cilk Plus](http://en.wikipedia.org/wiki/Cilk_Plus "Cilk Plus")
-   [Coarray Fortran](http://en.wikipedia.org/wiki/Coarray_Fortran "Coarray Fortran")
-   [OpenCL](http://en.wikipedia.org/wiki/OpenCL "OpenCL")
-   [CUDA](http://en.wikipedia.org/wiki/CUDA "CUDA")
-   [Dryad](http://en.wikipedia.org/wiki/Dryad_(programming) "Dryad (programming)")
-   [C++ AMP](http://en.wikipedia.org/wiki/C%2B%2B_AMP "C++ AMP")
-   [PLINQ](http://en.wikipedia.org/wiki/Parallel_LINQ "Parallel LINQ")
-   [TPL](http://en.wikipedia.org/wiki/Parallel_Extensions#Task_Parallel_Library "Parallel Extensions")

Problems

-   [Embarrassingly
    parallel](http://en.wikipedia.org/wiki/Embarrassingly_parallel "Embarrassingly parallel")
-   [Software lockout](http://en.wikipedia.org/wiki/Software_lockout "Software lockout")
-   [Scalability](http://en.wikipedia.org/wiki/Scalability "Scalability")
-   [Race condition](http://en.wikipedia.org/wiki/Race_condition#Computing "Race condition")
-   [Deadlock](http://en.wikipedia.org/wiki/Deadlock "Deadlock")
-   [Livelock](http://en.wikipedia.org/wiki/Deadlock#Livelock "Deadlock")
-   [Starvation](http://en.wikipedia.org/wiki/Resource_starvation "Resource starvation")
-   [Deterministic
    algorithm](http://en.wikipedia.org/wiki/Deterministic_algorithm "Deterministic algorithm")
-   [Parallel slowdown](http://en.wikipedia.org/wiki/Parallel_slowdown "Parallel slowdown")

-   ![Category](//upload.wikimedia.org/wikipedia/en/thumb/4/48/Folder_Hexagonal_Icon.svg/16px-Folder_Hexagonal_Icon.svg.png) [Category:
    parallel
    computing](http://en.wikipedia.org/wiki/Category:Parallel_computing "Category:Parallel computing")
-   ![](//upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/12px-Commons-logo.svg.png)
    Media related to [parallel
    computing](//commons.wikimedia.orghttp://en.wikipedia.org/wiki/Category:parallel_computing "commons:Category:parallel computing")
    at Wikimedia Commons



References
---
[1] [Parallel computing](http://en.wikipedia.orghttp://en.wikipedia.org/wiki/Parallel_computing), From Wikipedia, the free encyclopedia, 2014.


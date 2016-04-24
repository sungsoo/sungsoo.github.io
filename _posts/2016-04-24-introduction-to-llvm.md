---
layout: post
title: Introduction to LLVM
date: 2016-04-24
categories: [computer science]
tags: [data management]

---

## Article Source
* Title: [LLVM for Grad Students](http://adriansampson.net/blog/llvm.html)

---

Introduction to LLVM 
----------------------

This is an introduction to doing research with the
[LLVM](http://llvm.org/) compiler infrastructure. It should be enough
for a grad student to go from *mostly uninterested in compilers* to
*excited to use LLVM to do great work*.

What is LLVM?
-------------

LLVM is a compiler. It’s a *really nice*, hackable, ahead-of-time
compiler for “native” languages like C and C++.

Of course, since LLVM is so awesome, you will also hear that it is much
more than this (it can also be a JIT; it powers a great diversity of
un-C-like languages; it is [the new delivery format for the App
Store](https://developer.apple.com/library/prerelease/watchos/documentation/IDEs/Conceptual/AppDistributionGuide/AppThinning/AppThinning.html#//apple_ref/doc/uid/TP40012582-CH35-SW2);
etc.; etc.). These are all true, but for our purposes, the above
definition is what matters.

A few huge things make LLVM different from other compilers:

-   LLVM’s intermediate representation (IR) is its great innovation.
    LLVM works on a representation of programs that you can *actually
    read* if you can read assembly. This may not seem like a great
    revelation, but it is: other compilers’ IRs tend to be in-memory
    structures so complicated that you can’t really write them down.
    This makes other compilers harder to understand and messier
    to implement.
-   LLVM is nicely written: its architecture is *way* more modular than
    other compilers. Part of the reason for this niceness comes from its
    original implementor, who is [one of us](http://nondot.org/sabre/).
-   Despite being the [research tool of
    choice](http://awards.acm.org/award_winners/lattner_5074762.cfm) for
    squirrelly academic hackers like us, LLVM is also an
    industrial-strength compiler backed by the largest company on Earth.
    This means you don’t have to compromise between a *great* compiler
    and a *hackable* compiler, as you do in Javaland when you choose
    between [HotSpot](http://java.com/en/download/) and
    [Jikes](http://www.jikesrvm.org/).

Why Would a Grad Student Care About LLVM?
-----------------------------------------

LLVM is a great compiler, but who cares if you don’t do compilers
research?

A compiler infrastructure is useful whenever you need to *do stuff with
programs*. Which, in my experience, is a lot. You can analyze programs
to see how often they do something, transform them to work better with
your system, or change them to pretend to use your hypothetical new
architecture or OS without actually fabbing a new chip or writing a
kernel module. For grad students, a compiler infrastructure is more
often the right tool than most people give it credit for. I encourage
you to reach for LLVM by default before hacking any of these tools
unless you have a really good reason:

-   an [architectural
    simulator](http://research.cs.wisc.edu/vertical/papers/2014/wddd-sim-harmful.pdf)
-   a dynamic binary instrumentation tool like
    [Pin](http://www.pintool.org/)
-   source-level transformation (from simple stuff like
    `sed` to more complete tools involving AST
    parsing and serialization)
-   hacking the kernel to intercept system calls
-   anything resembling a hypervisor

Even if a compiler doesn’t seem like a *perfect* match for your task, it
can often get you 90% of the way there far easier than, say, a
source-to-source translation.

Here are some nifty examples of research projects that used LLVM to do
things that are not all that compilery:

-   [Virtual
    Ghost](http://sva.cs.illinois.edu/pubs/VirtualGhost-ASPLOS-2014.pdf)
    from UIUC showed you could use a compiler pass to protect processes
    from compromised OS kernels.
-   [CoreDet](http://homes.cs.washington.edu/~djg/papers/asplos10-coredet.pdf)
    from UW makes multithreaded programs deterministic.
-   In our approximate computing work, we use an LLVM pass to inject
    errors into programs to simulate error-prone hardware.

I’ll reemphasize: LLVM is not just for implementing new compiler
optimizations!

The Pieces
----------

Here’s a picture that shows the major components of LLVM’s architecture
(and, really, the architecture of any modern compiler):

![Front End, Passes, Back End](http://adriansampson.net/media/llvm/compiler-arch.svg)



There are:

-   The *front end*, which takes your source code and turns it into an
    *intermediate representation* or IR. This translation simplifies the
    job of the rest of the compiler, which doesn’t want to deal with the
    full complexity of C++ source code. You, an intrepid grad student,
    probably do not need to hack this part; you can use
    [Clang](http://clang.llvm.org/) unmodified.
-   The *passes*, which transform IR to IR. In ordinary circumstances,
    passes usually optimize the code: that is, they produce an IR
    program as output that does the same thing as the IR they took as
    input, except that it’s faster. *This is where you want to hack.*
    Your research tool can work by looking at and changing IR as it
    flows through the compilation process.
-   The *back end*, which generates actual machine code. You almost
    certainly don’t need to touch this part.

Although this architecture describes most compilers these days, one
novelty about LLVM is worth noting here: programs use *the same IR*
throughout the process. In other compilers, each pass might produce code
in a unique form. LLVM opts for the opposite approach, which is great
for us as hackers: we don’t have to worry much about when in the process
our code runs, as long as it’s somewhere between the front end and back
end.

Getting Oriented
----------------

Let’s start hacking.

## Get LLVM

You’ll need to need to install LLVM. Linux distributions often have LLVM
and Clang packages you can use off the shelf. But you’ll need to ensure
you get a version that includes all the headers necessary to hack with
it. The OS X build that comes with
[Xcode](https://developer.apple.com/xcode/), for example, is not
complete enough. Fortunately, it’s not hard to [build LLVM from
source](http://llvm.org/docs/CMake.html) using CMake. Usually, you only
need to build LLVM itself: your system-provided Clang will do just fine
as long as the versions match (although there are [instructions for
building Clang](http://clang.llvm.org/get_started.html) too).

On OS X in particular, [Brandon
Holt](http://homes.cs.washington.edu/~bholt/) has [good instructions for
doing it
right](http://homes.cs.washington.edu/~bholt/posts/building-llvm.html).
There’s also a [Homebrew
formula](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/llvm.rb).

## RTFM

You will need to get friendly with the documentation. I find these links
in particular are worth coming back to:

-   The [automatically generated Doxygen
    pages](http://llvm.org/doxygen/) are *super important*. You will
    need to live inside these API docs to make any progress at all while
    hacking on LLVM. Those pages can be hard to navigate, though, so I
    recommend going through Google. If you append “LLVM” to any function
    or class name, Google [usually finds the right Doxygen
    page](https://google.com/search?q=basicblock+llvm). (If you’re
    diligent, you can even train Google to give you LLVM results first
    even without typing “LLVM”!) I realize this sounds ridiculous, but
    you really need to jump around LLVM’s API docs like this to
    survive—and if there’s a better way to navigate the API, I haven’t
    found it.
-   The [language reference manual](http://llvm.org/docs/LangRef.html)
    is handy if you ever get confused by syntax in an LLVM IR dump.
-   The [programmer’s
    manual](http://llvm.org/docs/ProgrammersManual.html) describes the
    toolchest of data structures peculiar to LLVM, including efficient
    strings, STL alternatives for maps and vectors, etc. It also
    outlines the fast type introspection tools
    (`isa`, `cast`, and
    `dyn_cast`) that you’ll run into everywhere.
-   Read the [*Writing an LLVM
    Pass*](http://llvm.org/docs/WritingAnLLVMPass.html) tutorial
    whenever you have questions about what your pass can do. Because
    you’re a researcher and not a day-to-day compiler hacker, this
    article disagrees with that tutorial on some details. (Most
    urgently, ignore the Makefile-based build system instructions and
    skip straight to the CMake-based [“out-of-source”
    instructions](http://llvm.org/docs/CMake.html#cmake-out-of-source-pass).)
    But it’s nonetheless the canonical source for answers about passes
    in general.
-   The [GitHub mirror](https://github.com/llvm-mirror/llvm) is
    sometimes convenient for browsing the LLVM source online.

Let’s Write a Pass
------------------

Productive research with LLVM usually means writing a custom pass. This
section will guide you through building and running a simple pass that
transforms programs on the fly.

## A Skeleton

I’ve put together a [template
repository](https://github.com/sampsyo/llvm-pass-skeleton) that contains
a useless LLVM pass. I recommend you start with the template: when
starting from scratch, getting the build configuration set up can be
painful.

Clone the [`llvm-pass-skeleton` repository](https://github.com/sampsyo/llvm-pass-skeleton) from GitHub:

    $ git clone https://github.com/sampsyo/llvm-pass-skeleton.git

The real work gets done in `skeleton/Skeleton.cpp`,
so open up that file. Here’s where the business happens:



``` 
virtual bool runOnFunction(Function &F) {
  errs() << "I saw a function called " << F.getName() << "!\n";
  return false;
}
```



There are several kinds of LLVM pass, and we’re using one called a
[*function
pass*](http://llvm.org/docs/WritingAnLLVMPass.html#the-functionpass-class)
(it’s a good place to start). Exactly as you would expect, LLVM invokes
the method above with every function it finds in the program we’re
compiling. For now, all it does is print out the name.

Details:

-   That `errs()` thing is an LLVM-provided C++
    output stream we can use to print to the console.
-   The function returns `false` to indicate that it
    didn’t modify `F`. Later, when we actually
    transform the program, we’ll need to return
    `true`.

## Build It

Build the pass with [CMake](http://www.cmake.org/):



```
$ cd llvm-pass-skeleton
$ mkdir build
$ cd build
$ cmake ..  # Generate the Makefile.
$ make  # Actually build the pass.
```



If LLVM isn’t installed globally, you will need to tell CMake where to
find it. You can do that by giving it the path to the
`share/llvm/cmake/` directory inside wherever LLVM
resides in the `LLVM_DIR` environment variable.
Here’s an example with the path from Homebrew:

    $ LLVM_DIR=/usr/local/opt/llvm/share/llvm/cmake cmake ..

Building your pass produces a shared library. You can find it at
`build/skeleton/libSkeletonPass.so` or a similar
name, depending on your platform. In the next step, we’ll load this
library to run the pass on some real code.

## Run It

To run your new pass, invoke `clang` on some C
program and use some freaky flags to point at the shared library you
just compiled:

    $ clang -Xclang -load -Xclang build/skeleton/libSkeletonPass.* something.c
    I saw a function called main!

That `-Xclang -load -Xclang path/to/lib.so` dance is
all you need to [load and activate your pass in
Clang](http://adriansampson.net/blog/clangpass.html). So if you need to
process larger projects, you can just add those arguments to a
Makefile’s `CFLAGS` or the equivalent for your build
system.

(You can also run passes one at a time, independently from invoking
`clang`. This way, which uses LLVM’s
`opt` command, is the [official
documentation-sanctioned
way](http://llvm.org/docs/WritingAnLLVMPass.html#running-a-pass-with-opt),
but I won’t cover it here.)

Congratulations; you’ve just hacked a compiler! In the next steps, we’ll
extend this hello-world pass to do something interesting to the program.

Understanding LLVM IR
---------------------

![Module, Function, BasicBlock,
Instruction](http://adriansampson.net/media/llvm/llvm-containers.svg)
[Module](http://llvm.org/docs/doxygen/html/classllvm_1_1Module.html)s
contain
[Function](http://llvm.org/docs/doxygen/html/classllvm_1_1Function.html)s,
which contain
[BasicBlock](http://llvm.org/docs/doxygen/html/classllvm_1_1BasicBlock.html)s,
which contain
[Instruction](http://www.llvm.org/docs/doxygen/html/classllvm_1_1Instruction.html)s.
Everything but Module descends from
[Value](http://www.llvm.org/docs/doxygen/html/classllvm_1_1Value.html).
To work with programs in LLVM, you need to know a little about how the
IR is organized.

## Containers

Here’s on overview of the most important components in an LLVM program:

-   A
    [Module](http://llvm.org/docs/doxygen/html/classllvm_1_1Module.html)
    represents a source file (roughly) or a *translation
    unit* (pedantically). Everything else is contained in a Module.
-   Most notably, Modules house
    [Function](http://llvm.org/docs/doxygen/html/classllvm_1_1Function.html)s,
    which are exactly what they sound like: named chunks of
    executable code. (In C++, both functions and methods correspond to
    LLVM Functions.)
-   Aside from declaring its name and arguments, a Function is mainly a
    container of
    [BasicBlock](http://llvm.org/docs/doxygen/html/classllvm_1_1BasicBlock.html)s.
    The [basic block](https://en.wikipedia.org/wiki/Basic_block) is a
    familiar concept from compilers, but for our purposes, it’s just a
    contiguous chunk of instructions.
-   An
    [Instruction](http://www.llvm.org/docs/doxygen/html/classllvm_1_1Instruction.html),
    in turn, is a single code operation. The level of abstraction is
    roughly the same as in
    [RISC](https://en.wikipedia.org/wiki/Reduced_instruction_set_computing)-like
    machine code: an instruction might be an integer addition, a
    floating-point divide, or a store to memory, for example.

Most things in LLVM—including Function, BasicBlock, and Instruction—are
C++ classes that inherit from an omnivorous base class called
[Value](http://www.llvm.org/docs/doxygen/html/classllvm_1_1Value.html).
A Value is any data that can be used in a computation—a number, for
example, or the address of some code. Global variables and constants
(a.k.a. literals or immediates, like 5) are also Values.

## An Instruction

Here’s an example of an Instruction in the human-readable text form of
LLVM IR:



``` 
%5 = add i32 %4, 2
```



This instruction adds two 32-bit integer values (indicated by the type
`i32`). It adds the number in register 4 (written
`%4`) and the literal number 2 (written
`2`) and places its result in register 5. This is
what I mean when I say LLVM IR looks like idealized RISC machine code:
we even use the same terminology, like *register*, but there are
infinitely many registers.

That same instruction is represented inside the compiler as an instance
of the
[Instruction](http://www.llvm.org/docs/doxygen/html/classllvm_1_1Instruction.html)
C++ class. The object has an opcode indicating that it’s an addition, a
type, and a list of operands that are pointers to other Value objects.
In our case, it points to a
[Constant](http://www.llvm.org/docs/doxygen/html/classllvm_1_1Constant.html)
object representing the number 2 and another
[Instruction](http://www.llvm.org/docs/doxygen/html/classllvm_1_1Instruction.html)
corresponding to the register %4. (Since LLVM IR is in [static single
assignment](https://en.wikipedia.org/wiki/Static_single_assignment_form)
form, registers and Instructions are actually one and the same. Register
numbers are an artifact of the text representation.)

By the way, if you ever want to see the LLVM IR for your program, you
can instruct Clang to do that:

    $ clang -emit-llvm -S -o - something.c

## Inspecting IR in Our Pass

Let’s get back to that LLVM pass we were working on. We can inspect all
of the important IR objects using a common convenience method named
`dump()`. It just prints out the human-readable
representation of an object in the IR. Since our pass gets handed
Functions, let’s use it to iterate over each Function’s BasicBlocks, and
then over each BasicBlock’s set of Instructions.

Here’s some code to do that. You can get it by checking out [the
`containers`
branch](https://github.com/sampsyo/llvm-pass-skeleton/tree/containers)
of the `llvm-pass-skeleton` git repository:



``` 
errs() << "Function body:\n";
F.dump();

for (auto& B : F) {
  errs() << "Basic block:\n";
  B.dump();

  for (auto& I : B) {
    errs() << "Instruction: ";
    I.dump();
  }
}
```



Using [C++11](https://en.wikipedia.org/wiki/C%2B%2B11)’s fancy
`auto` type and foreach syntax makes it easy to
navigate the hierarchy in LLVM IR.

If you build the pass again and run a program through it, you should now
see the various parts of the IR split out as we traverse them.

Now Make the Pass Do Something Mildly Interesting
-------------------------------------------------

The real magic comes in when you *look for patterns* in the program and,
optionally, *change the code* when you find them. Here’s a really simple
example: let’s say we want to replace the first binary operator
(`+`, `-`, etc.) in every
function with a multiply. Sounds useful, right?

Here’s the code to do that. This version, along with an example program
to try it on, is available in [the `mutate`
branch](https://github.com/sampsyo/llvm-pass-skeleton/tree/mutate) of
the `llvm-pass-skeleton` git repository:



``` 
for (auto& B : F) {
  for (auto& I : B) {
    if (auto* op = dyn_cast<BinaryOperator>(&I)) {
      // Insert at the point where the instruction `op` appears.
      IRBuilder<> builder(op);

      // Make a multiply with the same operands as `op`.
      Value* lhs = op->getOperand(0);
      Value* rhs = op->getOperand(1);
      Value* mul = builder.CreateMul(lhs, rhs);

      // Everywhere the old instruction was used as an operand, use our
      // new multiply instruction instead.
      for (auto& U : op->uses()) {
        User* user = U.getUser();  // A User is anything with operands.
        user->setOperand(U.getOperandNo(), mul);
      }

      // We modified the code.
      return true;
    }
  }
}
```



### Details:

-   That `dyn_cast<T>(p)` construct is an
    [LLVM-specific introspection
    utility](http://llvm.org/docs/ProgrammersManual.html#isa). It uses
    some conventions from the LLVM codebase to made dynamic type tests
    efficient, because compilers have to use them all the time. This
    particular construct returns a null pointer if
    `I` is not a
    `BinaryOperator`, so it’s perfect for
    special-casing like this.
-   The
    [IRBuilder](http://llvm.org/docs/doxygen/html/classllvm_1_1IRBuilder.html)
    is for constructing code. It has a million methods for creating any
    kind of instruction you could possibly want.
-   To stitch our new instruction into the code, we have to find all the
    places it’s used and swap in our new instruction as an argument.
    Recall that an Instruction is a Value: here, the multiply
    Instruction is used as an operand in another Instruction, meaning
    that the product will be fed in as an argument.
-   We should probably also remove the old instruction, but I left bit
    that off for brevity.

Now if we compile a program like this
([`example.c`](https://github.com/sampsyo/llvm-pass-skeleton/blob/mutate/example.c)
in the repository):



``` 
#include <stdio.h>
int main(int argc, const char** argv) {
    int num;
    scanf("%i", &num);
    printf("%i\n", num + 2);
    return 0;
}
```



Compiling it with an ordinary compiler does what the code says, but our
plugin makes it double the number instead of adding 2:

    $ cc example.c
    $ ./a.out
    10
    12
    $ clang -Xclang -load -Xclang build/skeleton/libSkeletonPass.so example.c
    $ ./a.out
    10
    20

Like magic!

Linking With a Runtime Library
------------------------------

When you need to instrument code to do something nontrivial, it can be
painful to use
[IRBuilder](http://llvm.org/docs/doxygen/html/classllvm_1_1IRBuilder.html)
to generate the LLVM instructions to do it. Instead, you probably want
to write your run-time behavior in C and link it with the program you’re
compiling. This section will show you how to write a runtime library
that logs the results of binary operators instead of silently changing
them.

Here’s the LLVM pass code, which is in [the `rtlib`
branch](https://github.com/sampsyo/llvm-pass-skeleton/tree/rtlib) of the
`llvm-pass-skeleton` repository:



``` 
// Get the function to call from our runtime library.
LLVMContext& Ctx = F.getContext();
Constant* logFunc = F.getParent()->getOrInsertFunction(
  "logop", Type::getVoidTy(Ctx), Type::getInt32Ty(Ctx), NULL
);

for (auto& B : F) {
  for (auto& I : B) {
    if (auto* op = dyn_cast<BinaryOperator>(&I)) {
      // Insert *after* `op`.
      IRBuilder<> builder(op);
      builder.SetInsertPoint(&B, ++builder.GetInsertPoint());

      // Insert a call to our function.
      Value* args[] = {op};
      builder.CreateCall(logFunc, args);

      return true;
    }
  }
}
```



The tools you need are
[`Module::getOrInsertFunction`](http://llvm.org/docs/doxygen/html/classllvm_1_1Module.html#a66057011b4f824c8a8d04de9697c194a)
and
[`IRBuilder::CreateCall`](http://llvm.org/docs/doxygen/html/classllvm_1_1IRBuilder.html#aa6912a2a8a62dbd8706ec00df02c4b8a).
The former adds a *declaration* for your runtime function
`logop`, which is analogous to declaring
`void logop(int i);` in the program’s C source
without a function body. The instrumentation code pairs with a run-time
library
([`rtlib.c`](https://github.com/sampsyo/llvm-pass-skeleton/blob/rtlib/rtlib.c)
in the repository) that defines that `logop`
function:



``` 
#include <stdio.h>
void logop(int i) {
  printf("computed: %i\n", i);
}
```



To run an instrumented program, link it with your runtime library:

    $ cc -c rtlib.c
    $ clang -Xclang -load -Xclang build/skeleton/libSkeletonPass.so -c example.c
    $ cc example.o rtlib.o
    $ ./a.out
    12
    computed: 14
    14

If you like, it’s also possible to stitch together the program and
runtime library *before compiling to machine code*. The
[llvm-link](http://llvm.org/docs/CommandGuide/llvm-link.html) utility,
which you can think of as the rough IR-level equivalent of
[ld](https://sourceware.org/binutils/docs/ld/), can help with that.

Annotations
-----------

Most projects eventually need to interact with the programmer. You’ll
eventually wish for *annotations:* some way to convey extra information
from the program to your LLVM pass. There are several ways to build up
annotation systems:

-   The practical and hacky way is to use *magic functions*. Declare
    some empty functions with special, probably-unique names in a
    header file. Include that file in your source and call those
    do-nothing functions. Then, in your pass, look for
    [`CallInst`
    instructions](http://llvm.org/docs/doxygen/html/classllvm_1_1CallInst.html)
    that invoke your functions and use them to trigger your magic. For
    example, you might use calls like
    `__enable_instrumentation()` and
    `__disable_instrumentation()` to let the program
    confine your code-munging to specific regions.
-   If you need to let programmers add markers to function or variable
    declarations, Clang’s
    `__attribute__((annotate("foo")))` syntax will
    emit [metadata](http://llvm.org/docs/LangRef.html#metadata) with an
    arbitrary string that you can process in your pass. Brandon Holt
    again has [some background on this
    technique](http://homes.cs.washington.edu/~bholt/posts/llvm-quick-tricks.html).
    If you need to mark expressions instead of declarations, the
    undocumented and sadly limited
    [`__builtin_annotation(e, "foo")`
    intrinsic](https://github.com/llvm-mirror/clang/blob/master/test/Sema/annotate.c)
    might work.
-   You can jump in full dingle and modify Clang itself to interpret
    your new syntax. I don’t recommend this.
-   If you need to annotate *types*—and I believe people often do, even
    if they don’t realize it—I’m developing a system called
    [Quala](https://github.com/sampsyo/quala). It patches Clang to
    support custom type qualifiers and pluggable type systems, à la
    [JSR-308](http://types.cs.washington.edu/jsr308/) for Java. [Let me
    know](mailto:asampson@cornell.edu) if you’re interested in
    collaborating on this project!

I hope to expand on some of these techniques in future posts.

And More
--------

LLVM is enormous. Here are a few more topics I didn’t cover here:

-   Using the vast array of classic compiler analyses available in
    LLVM’s junk drawer.
-   Generating any special machine instructions, as architects often
    want to do, by hacking the back end.
-   Exploiting [debug
    info](http://llvm.org/docs/SourceLevelDebugging.html), so you can
    connect back to the source line and column corresponding to a point
    in the IR.
-   Writing [frontend plugins for
    Clang](http://clang.llvm.org/docs/ClangPlugins.html).

I hope this gave you enough background to make something awesome.
Explore, build, and [let me know](mailto:asampson@cornell.edu) if this
helped!

------------------------------------------------------------------------

*Thanks to the UW [architecture](http://sampa.cs.washington.edu) and
[systems](http://syslab.cs.washington.edu) groups, who sat through an
out-loud version of this post and asked many shockingly good questions.*

*Addenda, courtesy of kind readers:*

-   [Emery Berger](http://emeryberger.com) pointed out that dynamic
    binary instrumentation tools, like [Pin](http://www.pintool.org/),
    are still the right choice if you need to observe architecture
    specifics: registers, the memory hierarchy, instruction
    encoding, etc.
-   [Brandon Holt](http://homes.cs.washington.edu/~bholt/) just posted
    [tips for debugging in
    LLVM](http://homes.cs.washington.edu/~bholt/posts/llvm-debugging.html),
    including how to draw control flow graphs with GraphViz.
-   [John Regehr](http://www.cs.utah.edu/~regehr/) [mentioned in a
    comment](https://news.ycombinator.com/item?id=10000611) a drawback
    to hitching your software wagon to LLVM’s star: API instability.
    LLVM internals change a lot from release to release, so maintaining
    a project means keeping up with the project. [Alex
    Bradbury](http://asbradbury.org/)’s [*LLVM Weekly*
    newsletter](http://llvmweekly.org/) is a great resource for
    following the LLVM ecosystem.




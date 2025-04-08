---
layout: post
title: Task-based parallelism
date: 2014-08-29 
categories: [computer science]
tags: [parallel computing]

---

Task-based parallelism
---

If we look at a typical operating system, we see it exploit a type of parallelism called *task parallelism*. The processes are diverse and unrelated. A user might be reading an article on a website while playing music from his or her music library in the background. More than one CPU core can be exploited by running each application on a different core.

In terms of parallel programming, this can be exploited by writing a program as a number of sections that “pipe” (send via messages) the information from one application to another. The Linux pipe operator (the j symbol) does just this, via the operating system. The output of one program, such as grep, is the input of the next, such as sort. Thus, a set of input files can be easily scanned for a certain set of characters (the grep program) and that output set then sorted (the sort program). Each program can be scheduled to a separate CPU core.

This pattern of parallelism is known as *pipeline parallelism*. The output on one program provides the input for the next. With a diverse set of components, such as the various text-based tools in Linux, a huge variety of useful functions can be performed by the user. As the programmer cannot know at the outset everyone’s needs, by providing components that operate together and can be connected easily, the programmer can target a very wide and diverse user base.

This type of parallelism is very much geared toward *coarse-grained parallelism*. That is, there are a number of powerful processors, each of which can perform a significant chunk of work.

In terms of GPUs we see coarse-grained parallelism only in terms of a GPU card and the execution of GPU kernels. GPUs support the pipeline parallelism pattern in two ways. First, kernels can be pushed into a single stream and separate streams executed concurrently. Second, multiple GPUs can work together directly through either passing data via the host or passing data via messages directly to one another over the PCI-E bus. This latter approach, the peer-to-peer (P2P) mechanism, was intro- duced in the CUDA 4.x SDK and requires certain OS/hardware/driver-level support.


One of the issues with a pipeline-based pattern is, like any production line, it can only run as fast as the slowest component. Thus, if the pipeline consists of five elements, each of which takes one second, we can produce one output per second. However, if just one of these elements takes two seconds, the throughput of the entire pipeline is reduced to one output every two seconds.

The approach to solving this is twofold. Let’s consider the production line analogy for a moment. Fred’s station takes two seconds because his task is complex. If we provide Fred with an assistant, Tim, and split his task in half with Tim, we’re back to one second per stage. We now have six stages instead of five, but the throughput of the pipeline is now again one widget per second.

You can put up to four GPUs into a desktop PC with some thought and care about the design. Thus, if we have a single GPU and it’s taking too long to process a particular workflow, we can simply add another one and increase the overall processing power of the node. However, we then have to think about the division of work between the two GPUs. There may not be an easy 50/50 split. If we can only extract a 70/30 split, clearly the maximum benefit will be 7/10 (70%) of the existing runtime. If we could introduce another GPU and then maybe move another task, which occupied say 20% of the time, we’d end up with a 50/30/20 split. Again the speedup compared to one GPU would be 1/2 or 50% of the original time. We’re still left with the worst-case time dominating the overall execution time.

The same issue applies to providing a speedup when using a single CPU/GPU combination. If we move 80% of the work off the CPU and onto the GPU, with the GPU computing this in just 10% of the time, what is the speedup? Well the CPU now takes 20% of the original time and the GPU 10% of the original time, but in parallel. Thus, the dominating factor is still the CPU. As the GPU is running in parallel and consumes less time than the CPU fraction, we can discount this time entirely. Thus, the maximum speedup is one divided by the fraction of the program that takes the longest time to execute.

This is known as Amdahl’s law and is often quoted as the limiting factor in any speedup. It allows you to know at the outset what the maximum speedup achievable is, without writing a single line of code. Ulti- mately, you will have serial operations. Even if you move everything onto the GPU, you will still have to use the CPU to load and store data to and from storage devices. You will also have to transfer data to and from the GPU to facilitate input and output (I/O). Thus, maximum theoretical speedup is determined by the fraction of the program that performs the computation/algorithmic part, plus the remaining serial fraction.

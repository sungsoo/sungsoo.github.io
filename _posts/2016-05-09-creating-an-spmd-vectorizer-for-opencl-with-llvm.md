---
layout: post
title: Creating an SPMD Vectorizer for OpenCL with LLVM 
date: 2016-05-09
categories: [computer science]
tags: [parallel computing]

---


## Article Source
* Title: [2015 LLVM Developers’ Meeting: Pierre-Andre Saulais “Creating an SPMD Vectorizer..."](https://www.youtube.com/watch?v=ePu6c4FLc9I)

---

# Creating an SPMD Vectorizer for OpenCL with LLVM 

Processors such as CPUs or DSPs often feature SIMD instructions, but are not designed to efficiently support Single Program Multiple Data (SPMD) execution models such as OpenCL. The design of a compiler for such a target therefore needs some form of vectorization to generate the most optimal code for this kind of data-parallel execution model. This is because SPMD programs are most often written in scalar form with the implicit assumption that many instances of the program are executed in parallel. On CPU-like architectures, SIMD vector units can be leveraged for parallelism, such that each SIMD lane is loosely mapped to a program instance. 

This tutorial looks at how to create an SPMD vectorizer that targets CPU-like architectures for use with heterogeneous compute frameworks. OpenCL is used as an example but the concepts should translate to other frameworks such as CUDA, RenderScript or Vulkan Compute. While there are other possible approaches, we have chosen to present one that works at the LLVM IR level and that is essentially an IR pass that creates vectorized functions from the original scalar SPMD function. This allows targetting multiple architectures with very little architecture-specific code. 

We will start by briefly introducing the SPMD execution model, describing how it is used in OpenCL and giving an overview of what a SPMD vectorizer should do and how it differs from other kinds such as LLVM's loop vectorizer and SLP vectorizer. Then we will look at a possible vectorizer design, including the different vectorization stages (analysis, control-flow to data-flow, scalarization, packetization/instantiation and optimization/cleanup). Finally, we will look at some possible optimizations as well as other aspects that do not fit the 'stage-by-stage' presentation (e.g. vectorizing and scalarizing calls to builtin functions, SIMD width detection, interleaved memory access optimizations, SoA to AoS conversions, etc).

<iframe width="600" height="400" src="https://www.youtube.com/embed/ePu6c4FLc9I" frameborder="0" allowfullscreen></iframe>

Creating an SPMD Vectorizer for OpenCL with LLVM - Pierre-Andre Saulais, Codeplay Software

Slides: [http://llvm.org/devmtg/2015-10/slides...](http://llvm.org/devmtg/2015-10/slides/Saulais-CreatingSPMDVectorizerOpenCL.pdf)

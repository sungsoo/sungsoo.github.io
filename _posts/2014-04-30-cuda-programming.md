---
layout: post
title: GPU Accelerated Computing with C and C++
date: 2014-04-30
categories: [computer science]
tags: [parallel programming]

---
# Article Source
* Title: [GPU Accelerated Computing with C and C++](https://developer.nvidia.com/how-to-cuda-c-cpp)
* Source: NVIDIA CUDA Zone


[![](http://sungsoo.github.com/images/cuda.png)](http://sungsoo.github.com/images/cuda.png)

GPU Accelerated Computing with C and C++ 
========================================

![](https://developer.nvidia.com/sites/default/files/imagecache/250-250/akamai/cuda/images/product_logos/nvidia_cuda_bw.jpg)

With the [CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit) from
NVIDIA, you can accelerate your C or C++ code by moving the
computationally intensive portions of your code to an NVIDIA GPU.  In
addition to providing drop-in library acceleration, you are able to
efficiently access the massive parallel power of a GPU with a few new
syntactic elements and calling functions from the CUDA Runtime API.

The CUDA toolkit from NVIDIA is free and includes:

-   Visual and command-line debugger
-   Visual and command-line GPU profiler
-   Many GPU optimized libraries
-   The CUDA C/C++ compiler
-   GPU management tools
-   Lots of other features

Getting Started:
----------------

1.  Make sure you have an understanding of [what CUDA
    is](http://blogs.nvidia.com/blog/2012/09/10/what-is-cuda-2/).
    -   Read through the Introduction to CUDA C/C++
        [series](http://devblogs.nvidia.com/parallelforall/easy-introduction-cuda-c-and-c)
        on Mark Harris’ Parallel Forall blog.

2.  Try CUDA by taking a self-paced lab on
    [nvidia.qwiklab.com](http://nvidia.qwiklab.com). These labs only
    require a supported web browser and a network that allows Web
    Sockets. [Click here](http://websocketstest.com) to verify that your
    network & system support Web Sockets in section "Web Sockets (Port
    80)", all check marks should be green.
3.  Download and install the [CUDA Toolkit](/cuda-toolkit).
    -   You can watch a quick how-to video for Windows showing this
        process:

	-   Also see Getting Started Guides for
        [Windows](http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-microsoft-windows/index.html),
        [Mac](http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-mac-os-x/index.html),
        and
        [Linux](http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-linux/index.html).

4.  See how to quickly write your first CUDA C program by watching the
    following video:

<iframe width="600" height="400" src="//www.youtube.com/embed/pB6h_hFpRGo" frameborder="0" allowfullscreen></iframe>

<iframe width="600" height="400" src="//www.youtube.com/embed/Ed_h2km0liI" frameborder="0" allowfullscreen></iframe>

Learning CUDA:
--------------

1.  Take the easily digestible, high-quality,
    and **free** Udacity [Intro to Parallel
    Programming](https://www.udacity.com/course/cs344) course which uses
    CUDA as the parallel programming platform of choice.
2.  Visit [docs.nvidia.com](http://docs.nvidia.com/cuda/index.html) for
    CUDA C/C++ documentation.
3.  Work through hands-on examples:
    -   [Adding two vectors
        together ](http://developer.download.nvidia.com/compute/developertrainingmaterials/samples/cuda_c/VectorAdd.zip)

4.  Look through the code
    [samples](http://docs.nvidia.com/cuda/cuda-samples/index.html#samples-reference)
    that come installed with the CUDA Toolkit.
5.  If you are working in C++, you should definitely check out the
    [Thrust](http://docs.nvidia.com/cuda/thrust/index.html) parallel
    template library.
6.  Browse and ask questions on
    [stackoverflow.com](http://teams.nvidia.com/sites/marketing/cuda/External%20CUDA%20Training%20Materials/DevZone/Programming/stackoverflow.com/questions/tagged/cuda)
    or NVIDIA’s DevTalk
    [forum](https://devtalk.nvidia.com/default/board/57/cuda-programming-and-performance/).
7.  Learn more by:
    -   Reading the [CUDA C Programming
        Guide](http://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html)
    -   Reading the [CUDA C Best Practices
        Guide](http://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html)
    -   Watching the many hours of [recorded
        sessions](http://www.gputechconf.com/gtcnew/on-demand-gtc.php)
        from the gputechconf.com site.
    -   d.Participating in trainings provided at conferences, such as
        [Supercomputing](http://supercomputing.org/), [International
        Supercomputing](http://www.isc-events.com/), [GPU Technology
        Conference](http://www.gputechconf.com/page/home.html), any may
        others.
    -   Browsing [here](/get-started-cuda-cc) for more learning
        opportunities.

8.  Look at the following for more advanced hands-on examples:
    -   A 1D Stencil
        [example](http://developer.download.nvidia.com/compute/developertrainingmaterials/samples/cuda_c/1DStencil.zip),
        including shared memory and synchronized threads.
    -   Optimizing a [Jacobi Point Iterative
        method](http://developer.download.nvidia.com/compute/developertrainingmaterials/samples/cuda_c/Jacobi_Optimization.zip).

**So, now you’re ready to deploy your application?**
 You can [register today](http://bit.ly/RegDevPages) to have **FREE**
access to **NVIDIA TESLA K40 GPUs**.
 Develop your codes on the fastest accelerator in the world. Try a Tesla
K40 GPU and accelerate your development.

Availability
------------

The [CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit) is a free
download from NVIDIA and is supported on Windows, Mac, and most standard
Linux distributions.

-   Starting with CUDA 5.5, CUDA also
    [supports](http://www.youtube.com/watch?v=2_BXJ-VtH3Y) the ARM
    architecture
-   For the host-side code in your application, the
    [nvcc](http://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html)
    compiler will use your default host compiler. 
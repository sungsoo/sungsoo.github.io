---
layout: post
title: PBRT Installation on macOS
date: 2016-12-30
categories: [computer science]
tags: [computer graphics]

---

## Article Source
* Title: [Setting up pbrt on Linux/Mac OSX](http://joeylitalien.github.io/computer-graphics/2016/08/25/configuring-pbrt.html)
* Authors: Joey Litalien

---

PBRT Installation on macOS 
=====

Working with the code
=====================

Building pbrt 
-------------

To check out pbrt together with all dependencies, be sure to use the
`--recursive` flag when cloning the repository, i.e.

    $ git clone --recursive https://github.com/mmp/pbrt-v3/

If you accidentally already cloned pbrt without this flag (or to update
an pbrt source tree after a new submodule has been added, run the
following command to also fetch the dependencies:

    $ git submodule update --init --recursive

pbrt uses [cmake](http://www.cmake.org/) for its build system. On Linux
and OS X, cmake is available via most package management systems. For
Windows, or to build it from source, see the [cmake downloads
page](http://www.cmake.org/download/).

-   For command-line builds on Linux and OS X, once you have cmake
    installed, create a new directory for the build, change to that
    directory, and run `cmake [path to pbrt-v3]`. A Makefile will be
    created in that current directory. Run `make -j4`, and pbrt, the
    obj2pbrt and imgtool utilities, and an executable that runs pbrt’s
    unit tests will be built.
-   To make an XCode project file on OS X, run
    `cmake -G Xcode [path to pbrt-v3]`.
-   Finally, on Windows, the cmake GUI will create MSVC solution files
    that you can load in MSVC.

If you plan to edit the lexer and parser for pbrt’s input files
(`src/core/pbrtlex.ll` and `src/core/pbrtparase.y`), you’ll also want to
have [bison](https://www.gnu.org/software/bison/) and
[flex](http://flex.sourceforge.net/) installed. On OS X, note that the
version of flex that ships with the developer tools is extremely old and
is unable to process `pbrtlex.ll`; you’ll need to install a more recent
version of flex in this case.


Debug and release builds 
------------------------

By default, the build files that are created that will compile an
optimized release build of pbrt. These builds give the highest
performance when rendering, but many runtime checks are disabled in
these builds and optimized builds are generally difficult to trace in a
debugger.

To build a debug version of pbrt, set the `CMAKE_BUILD_TYPE` flag to
`Debug` when you run cmake to create build files to make a debug build.
For example, when running cmake from the command lne, provide it with
the argument `-DCMAKE_BUILD_TYPE=Debug`. Then build pbrt using the
resulting build files. (You may want to keep two build directories, one
for release builds and one for debug builds, so that you don’t need to
switch back and forth.)

Debug versions of the system run much more slowly than release builds.
Therefore, in order to avoid surprisingly slow renders when debugging
support isn’t desired, debug versions of pbrt print a banner message
indicating that they were built for debugging at startup time.


### Build configurations

There are two configuration settings that must be set at compile time.
The first controls whether pbrt uses 32-bit or 64-bit values for
floating-point computation, and the second controls whether tristimulus
RGB values or sampled spectral values are used for rendering. (Both of
these aren’t amenable to being chosen at runtime, but must be determined
at compile time for efficiency).

To change them from their defaults (respectively, 32-bit and RGB), edit
the file `src/core/pbrt.h`.

To select 64-bit floating point values, remove the comment symbol before
the line:

    //#define PBRT_FLOAT_AS_DOUBLE

and recompile the system.

To select full-spectral rendering, comment out the first of these two
typedefs and remove the comment from the second one:

    typedef RGBSpectrum Spectrum;
    // typedef SampledSpectrum Spectrum;

Again, don’t forget to recompile after making this change.


Porting to different targets 
----------------------------

pbrt should compute out of the box for semi-modern versions of Linux,
FreeBSD, OpenBSD, OS X, and Windows. A C++ compiler with good support
for C++11 is required. (Therefore, pbrt definitely won’t compile with
any versions of MSVC earlier than 2013, any versions of g++ before 4.8,
or any versions of clang before 3.1).

We have tried to keep as much of the system-dependent code as possible
in the files `src/core/port.h` and `CMakeLists.txt`; ideally, only those
will need to be modified to get the system running on a new target.

We are always happy to receive patches that make it possible to build
pbrt on other targets; if you get the system buliding on a target that
you think would be useful for others, please open a pull request on
github with the changes. (Before doing so, however, please first ensure
that all of the tests run by `pbrt_test` pass on your system.)

Note that if extensive changes to pbrt are required to build it on a new
target, we may not accept the pull request, as it’s also important that
the source code on github be as close as possible to the source code in
the physical book. Thus, for example, we wouldn’t be interested in a
pull request that removed most of the usage of C++11 to get the system
to build with MSVC 2012 or earlier.


## Downloading the source code

Firstly, you need to clone to actual source code. The latest version
([v3](https://github.com/mmp/pbrt-v3/)) is currently available online,
but is meant to be used with the [3rd
edition](https://www.amazon.com/Physically-Based-Rendering-Third-Implementation/dp/0128006455)
of the book that is scheduled for November 2016. Therefore, we’ll stick
with the 2nd version which can be directly downloaded
[here](https://github.com/mmp/pbrt-v2/archive/master.zip).

    cd ~/path/to/project/dir
    git clone https://github.com/mmp/pbrt-v2.git

## Getting OpenEXR

pbrt uses OpenEXR library to read and write EXR format images, so you
need to get that as well.

    sudo apt-get install libopenexr-dev

For Mac users, you can simply use [Homebrew](http://brew.sh/):

    brew install openexr

If you decide to get OpenEXR [directly from their
website](http://www.openexr.com/downloads.html), you’ll have to install
both
[IlmBase](http://download.savannah.nongnu.org/releases/openexr/ilmbase-2.2.0.tar.gz)
and the [zlib](http://www.zlib.net/) library before building.

## Building pbrt

Nothing more than

    cd pbrt-v2/src && make

## Rendering a scene

To launch pbrt, navigate inside `bin`{.highlighter-rouge} and render a
simple test scene.

    cd bin && pbrt ../../scenes/bunny.pbrt

If everything was neatly installed, you should see the following splash
code followed by a progress bar.

    pbrt version 2.0.0 of Aug 25 2016 at 20:00:00 [Detected 8 core(s)]
    Copyright (c)1998-2014 Matt Pharr and Greg Humphreys.
    The source code to pbrt (but *not* the book contents) is covered by the BSD License.
    See the file LICENSE.txt for the conditions of the license.
    Rendering: [+++++++++++++++++++++++++++++++++++++++++++]  (1.6s)

## Displaying the rendered image

If you’re on Mac, Preview already offers EXR support so you only have to
run

    open pbrt.exr

For Linux users, the process requires a special EXR viewer.

    sudo apt-get install openexr-viewers
    exrdisplay pbrt.exr

If you didn’t get any rendering errors, you should see this magnificent
beast (resized for display here).

![Bunny](http://joeylitalien.github.io/assets/bunny.png)

**Figure.** Rendering the Stanford bunny in pbrt.

## Exporting path (optional)

For convenience, you can export your path by modifying
`~/.bash_rc`{.highlighter-rouge} or `~/.profile`{.highlighter-rouge} as
follows.

    export PATH="path/to/project/dir/pbrt-v2/src/bin:${PATH}"

Don’t forget to source your file if you plan to use pbrt before
restarting your shell.

    source ~/.profile

You can now run pbrt from anywhere inside the terminal by typing
`pbrt`{.highlighter-rouge}. Note that by doing so, your output image
will automatically be saved in your working directly (i.e. where you
call pbrt).

That’s it, you’re set and ready to render some dope images!


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


---
layout: post
title: Building LuxRender on OS X
date: 2015-12-10
categories: [computer science]
tags: [big data]

---

Building LuxRender on OS X
===

#Prerequisites


* OS X El Capitan has new feature called [System Integrity Protection](https://en.wikipedia.org/wiki/System_Integrity_Protection) aka "rootless". Either it needs to be turned off, as Qt installation will fail (we use older Qts, but even the newest is not SIP ready and puts itself into `/usr/bin`), or the installations will have to be altered. As we are using package installations, it isn't _that easy_, therefore we will disable SIP. See [this](https://forums.developer.apple.com/thread/3981) on how-to.
* Install _[Xcode](https://developer.apple.com/xcode/download/)_ (you can use App Store version or one found in [developer downloads](https://developer.apple.com/downloads/)) Open Xcode for OS X to verify it and auto install components on first run. Quit it.
* Install _[Command Line Tools for XCode](https://developer.apple.com/downloads/)_ for command line action
* Install _[Mercurial](https://mercurial.selenic.com/downloads)_ for checking out the source code
* Install _[CMake](http://cmake.org/download/)_, 2.8-8 or newer. Install for command line usage (check _Tools : How to Install For Commad Line Use_ for instructions). You can use the GUI.app for convenience. Important: Use cmake version less or equal than 2.8-9 or greater or equal 2.8-12.2 with OSX 10.9/Xcode 5.1.1 to avoid a bug not finding pthreads.
* Install _[Qt](http://download.qt.io/archive/qt/)_. LuxRender is 64bit only thus use 4.8.5, newer versions have not been tested. 4.7.3 may be used for universal builds, make sure to get the cocoa-version.
 
As of writing this following versions were used:

* OS X El Captain 10.11.1 Public Beta
* Xcode 7.1 beta 2
* Command Line Tools OS X 10.10 for Xcode 7.1 beta 2
* Mercurial 3.5.1 for MacOS X 10.10
* cmake-3.3.2-Darwin-x86_64
* qt-mac-opensource-4.8.5

#Get the source

* Create a folder that will contain the source of  _macos_ (`macos`) (OS X build dependencies), _LuxRays_ (`luxrays`) and _LuxRender_ (`lux`).
* Then open a terminal, change directory to that folder and clone the repos:

```bash
mkdir src-lux && cd src-lux
hg clone https://bitbucket.org/luxrender/macos
hg clone https://bitbucket.org/luxrender/luxrays
hg clone https://bitbucket.org/luxrender/lux
```

_NOTE: Cloning luxrays is only required if you are building luxrays separately, see below._

#Add OpenCL 1.2 C++ bindings

OS X OpenCL framework does not come with OpenCL C++ bindings that LuxRender uses. You will have to manually add them in the SDK that the product will be built against. Change `<Version>` placeholder further down to match your SDK version. After updating Xcode a repetition of this procedure might be needed.

* Navigate to the dependency `cd macos/include/cl_hpp_1.2.6`
* Copy the dependency to the SDK and set correct permissions. This assumes your Xcode (4.3+) is in the default location under `/Applications`

```bash
sudo cp cl.hpp /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX<Version>.sdk/System/Library/Frameworks/OpenCL.framework/Versions/A/Headers
sudo chmod 644 /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX<Version>.sdk/System/Library/Frameworks/OpenCL.framework/Versions/A/Headers/cl.hpp
```

For older Xcode the SDK is located in

```bash
/Developer/SDKs/MacOSX<Version>.sdk/System/Library/Frameworks/OpenCL.framework/Versions/A/Headers
```

The C++ header file called _cl.hpp_ can be found at [Khronos Group Registry](https://www.khronos.org/registry/cl/api/).

As of writing this following SDK and `cl.hpp` versions were used:

* `/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks/OpenCL.framework/Versions/A/Headers`
* LuxRender uses version 1.2.6 as in `macos` dependencies, this version was used.
* Note that Khronos Group latest version for 1.2 API is 1.2.7

#Compile macos dependencies

_Note: You can skip this point and go on to compiling LuxRays, LuxRender as dependency headers and precompiled libs are in macos repo._
_See also MACOS dependencies section below_

TODO


#Compile LuxRays

_Note: Compiling LuxRays separately is necessary if you would like the latest version of the library (such as having the latest smallluxgpu) which is probably the case why you are here and reading this how-to. However, you can skip this point and go on to compiling LuxRender as 3rd party dependencies and LuxRays headers and libs are now in macos dependency directory._

##Automatic build

If you (as I do) prefer to use the command-line or you want to automate the build using a build system here are the necessary steps:

* Inside Terminal go to the `luxrays` directory. This is where you cloned the LuxRays repository. `cd luxrays`
* Create a build subdirectory and go into it `mkdir build && cd build`
* Execute CMake to generate Xcode project. `cmake -G Xcode -DOSX_UPDATE_LUXRAYS_REPO=TRUE ..`
* Build LuxRays `cmake --build . --config Release --target ALL_BUILD`

##Interactive build

If you prefer to use the GUI, the following steps show how to build LuxRays interactively.

Open the CMake.app and go through the following steps:

* Fill in the "Where is the source code" field, using the folder where you put the LuxRays source code
* Fill in the "Where to build the binaries" field
* Click the "Configure" button, select Xcode from the dropdown menu and select the "Use default native compiler" option
* Click the "Configure" button once more; boost should now be found
* Click the "Generate" button
* Launch Xcode, open the XCode project _LuxRays.xcodeproj_ that has been generated by CMake.
* Set your preferred architecture by going to the Project menu (Xcode <4.3) or Scheme "ALL_BUILD"( Xcode 4.3+ ), also set "Release" there (you can also choose "Debug").
* Start build (Cmd-B)


##Copy newly built LuxRays products and headers to `macos` dependencies

* Copy `luxrays/include/*` to `macos/include/LuxRays/`
* Copy `luxrays/build/lib/Release/*.a` to `macos/lib/LuxRays/` (libluxcore.a, libluxrays.a, libsmallluxgpu.a)
* Copy `luxrays/build/lib/Release/libembree.2.4.0.dylib` to `macos/lib/embree2/`

You can use script `luxrays/scripts/copy_products_to_macos.sh` for that.

#Compile LuxRender

##Automatic procedure

* Inside Terminal go to the `lux` directory. This is where you cloned the LuxRender repository. `cd lux`
* Create a build subdirectory and go into it `mkdir build && cd build`
* Detect where Qt is installed `which qmake`
* Execute CMake to generate Xcode project, supplying path to qmake `cmake -G Xcode -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake ..`
* Build LuxRender `cmake --build . --config Release --target ALL_BUILD`
* You will need to package the executable with the Qt libs. This is done by running
	* `cd lux/build/Release`
	* `macdeployqt LuxRender.app`
	* `open LuxRender.app`
_Note that you might need to prefix macdeployqt with the full path where you have Qt installed. To find the path execute `which macdeployqt`_

##Interactive build

If you prefer to use the GUI, the following steps show how to build LuxRender interactively.
Open the CMake.app and go through the following steps:

* Fill in the "Where is the source code" field, using the folder where you put the Lux source code
* Fill in the "Where to build the binaries" field ( can be in source or a dedicated build directory)
* Click the "Configure" button, select Xcode from the dropdown menu and select the "Use default native compiler" option
* From the OSX_options choose how you want to compile, options are ( default ):
	* option(OSX_OPTION_PYLUX "Build a blender compatible pylux" ON)
	* option(OSX_OPTION_CLANG "Build with CLANG compiler ( XCODE4 )" ON) _Good with Xcode 4 or higher_
	* option(OSX_OPTION_LTO "Build with LINK TIME OPTIMISATION ( MAY BREAK NON-SSE4 MACS COMPATIBILITY )" ON) _Performs LTO on all binaries except LuxRender ( due Qt )_
	* option(OSX_OPTION_UNIVERSAL "Force compile universal" OFF)
	* option(OSX_OPTION_USE_MAX_SSE ""Build with highest SSE available on machine" OFF) _Checks for max sse-type available on machine and uses it._
* Press configure once more.
* Press generate. An Xcode project file will be created.
* Launch Xcode, open the XCode project _lux.xcodeproj_ that has been generated by CMake.
* Build target DYNAMIC_BUILD (set to Release or Debug ). If you are using Xcode 4, you can quickly launch a debug build by selecting Product > Build. The proper target will most likely not be the active target when you open the Xcode project, therefore select in manually.

_Hint: If you want to deploy LuxRender complete "dependency-less", use macdeployqt for bundling used Qt-frameworks into the app-bundle. You can find this option in cmake/macosx_bundle.cmake file_

#Compile LuxMark

* Go into folder that contains source of _macos_ (OS X build dependencies), _LuxRays_ and _LuxRender_ `cd src-lux`
* Then clone the repo `hg clone https://bitbucket.org/luxrender/luxmark`
* Go to the `luxmark` directory. This is where you cloned the LuxMark repository. `cd luxmark`
* Create a build subdirectory and go into it `mkdir build && cd build`
* Detect where Qt is installed `which qmake`
* Execute CMake to generate Xcode project, supplying path to qmake `cmake -G Xcode -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake ..`
* Build LuxMark `cmake --build . --config Release --target ALL_BUILD`
* Launch LuxMark `open bin/Release/LuxMark.app`
* Copy all scenes found [here](https://bitbucket.org/luxrender/luxmark/downloads) into `LuxMark.app/Contents/scenes` directory



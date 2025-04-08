---
layout: post
title: MonetDB Source compilation on OS X
date: 2016-01-13
categories: [computer science]
tags: [big data]

---


# MonetDB Source compilation on OS X

## Install Xcode

To be able to build (almost) any software package on OS X, one needs to
have Apple Xcode installed, or at least the Xcode command-line tools.
Xcode comes with a C/C++ compiler toolset, which (as of the more recent
versions) is based on Clang/LLVM and not GCC.

If you want the most recent version of Xcode you can only obtain it from
the [Apple Developer
Website](https://developer.apple.com/downloads/index.action) (if you are
a registered Apple developer) or directly from the Apple Mac App Store
[here](https://itunes.apple.com/en/app/xcode/id497799835).

Run the following command in Terminal in order to install the Xcode
command-line tools:

`xcode-select --install`

Beware, OS X usually ships with a BSD toolset, unlike most Linux
distribution that make use of the GNU toolset. This affects not only the
compiler, but also tools (such as `make`, `pkgconfig`, `aws`, `sed)`
used in the build scripts of MonetDB.

## Installing required packages

There are two community supported package managers that one can use to
install the dependencies for building MonetDB on OS X:
[Homebrew](http://brew.sh) or [MacPorts](https://www.macports.org). At
this point you would need to pick which package manager to use and
install **only one** of them.

### Using Homebrew

To install Homebrew please follow the up-to-date instructions for your
OS X version. You can find these on their website found
[here](http://brew.sh).

#### Minimal modules build-set

After Homebrew is installed, you should install the required packages
for building MonetDB absolute minimal set of modules. Run the command
below to install the required packages (and their dependencies in the
brackets): `pkg-config; pcre`

`brew install pkg-config pcre openssl`

#### Default modules build-set

Keep reading/installing if you want to build the other MonetDB modules
included in the default build-set.

* JDBC & control
 Install JDK 7, which you can get from the [Oracle
website](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
Note: You need the JDK, not the JRE.
 After JDK in installed, set the `JAVA_HOME` variable and add the JDK
bin directory to your shell's `PATH`. To do this, add the lines below to
your `.profile`, `.bashrc` or `.bash_profile` (or the corresponding
config file for your shell).

`export JAVA_HOME=$(/usr/libexec/java_home) export PATH=${JAVA_HOME}/bin:$PATH`

Install Apache Ant

`brew install ant`

* ODBC
 Install unixODBC

`brew install unixodbc`

* GEOM
 Install geos

`brew install geos`

Other

* sphinxclient
 Install libsphinxclient

`brew install libsphinxclient`

* GSL
 Install gsl

`brew install gsl`

* FITS
 Install cfitsio

`brew install cfitsio`

#### Before building

You most likely need to install automake, autoconf, libtool, gettext and
readline  from Homebrew as well. These will also be required to run the
bootstrap script (see below).

`brew install autoconf automake libtool gettext readline`

#### Putting it all together

`brew install autoconf automake libtool gettext readline pkg-config pcre openssl unixodbc geos gsl cfitsio`

### Using MacPorts

As an alternative to Homebrew, you can also use MacPorts to obtain the
required packages. To install MacPorts please follow the up-to-date
instructions for your OS X version. You can find these on their
website [here](https://www.macports.org/install.php). Do not forget to
restart your command prompt shell (since MacPorts will add new
extensions to your `PATH`) and run:

`sudo port -v selfupdate`

#### Minimal modules build-set

After MacPorts is installed, you should install the required packages
for building MonetDB absolute minimal set of modules. Run the command
below to install the required packages (and their dependencies in the
brackets): `pkgconfig` (libiconv); `openssl` (zlib); `pcre` (bzip2,
ncurses, libedit); `libxml2` (expat, gettext, xz).

`sudo port install pkgconfig openssl pcre libxml2`

#### Default modules build-set

Keep reading/installing if you want to build the other MonetDB modules
included in the default build-set.

* JDBC & control
 Install JDK 7, which you can get from the [Oracle
website](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
Note: You need the JDK, not the JRE.
 After JDK in installed, set the `JAVA_HOME` variable and add the JDK
bin directory to your shell's `PATH`. To do this, add the lines below to
your `.profile`, `.bashrc` or `.bash_profile` (or the corresponding
config file for your shell).

`export JAVA_HOME=$(/usr/libexec/java_home) export PATH=${JAVA_HOME}/bin:$PATH`

Install Apache Ant, which can be downloaded its website
[https://ant.apache.org/bindownload.cgi]. Unpack the package in a
directory in your home space, e.g. in
`/Users/<username>/tools/apache-ant`. After that set the
`ANT_HOME` variables and update the `PATH` like this:

`export ANT_HOME=/Users/<username>/tools/apache-ant export PATH=${ANT_HOME}/bin:$PATH`

* ODBC
 Install unixODBC (libtool, readline)

`sudo port install unixodbc`

Add the line below when configuring the build to point the tool to the
library (see Configuring below).

`--with-unixodbc =/opt/local --with-readline=/opt/local`

* GEOM
 Install geos

`sudo port install geos`

Other

* curl
 Install curl (curl-ca-bundle, libind)

`sudo port install curl`

* libmicrohttpd
 Install libmicrohttpd (gmp, libtasn1, nettle, libffi, glib2, popt,
desktop-file-utils, libxslt, p11-kit, gnutls, libgpg-error, libgcrypt)

`sudo port install libmicrohttpd`

* liburiparser
 Install uriparser

`sudo port install uriparser`

* sphinxclient

Install libsphinxclient

`sudo port install libsphinxclient`

Add the line below when configuring the build to point the tool to the
library (see Configuring below).

`--with-sphinxclient=/opt/local`

* GSL
 Install gsl

`sudo port install gsl`

* FITS
 Install cfitsio

`sudo port install cfitsio`

#### Before building

You will probably need to install automake (gdbm, perl5.16, perl5) and
autoconf from MacPorts as well. These will also be required to run the
bootstrap script (see below).

`sudo port install automake autoconf`

#### Putting it all together

`sudo port install automake autoconf pkgconfig openssl pcre libxml2 unixodbc bison geos gsl cfitsio curl libmicrohttpd uriparser libsphinxclient`

Obtaining sources and bootstrapping
-----------------------------------

Sources of the latest released and testing versions on MonetDB can be
obtained from the repository:
[released](https://www.monetdb.org/downloads/sources/Latest/)
or [testing](https://www.monetdb.org/downloads/testing/sources/Latest/).
Download the selected file and unpack it in a directory.

### Cloning MonetDB Mercurial repository

**Optionally**, bleeding egde sources can be directly obtained from the
MonetDB Mercurial repository. To do that make sure you have Mercurial
installed on your system first - latest version available
[here](http://mercurial.selenic.com). The clone the MonetDB repository.
Note this can take some time and a lot of data will be transferred.

`hg clone http://dev.monetdb.org/hg/MonetDB/`

### Bootstrapping

Sources check-out from Mercurial need to be bootstrapped first, before
configure can be run. To do that, go in the directory you in check you
cloned the repository and run:

`./bootstrap`

* If you are using Homebrew, you will also need to set `M4DIRS` to the
directory where the Homebrew gettext M4 macros are in. The same holds
for the OpenSSL libs and includes:

`export M4DIRS=/usr/local/opt/gettext/share/aclocal`
 `export LDFLAGS=-L/usr/local/opt/openssl/lib`
 `export CPPFLAGS=-I/usr/local/opt/openssl/include`

Configuring build
-----------------

### With Homebrew

Before starting the configure tool, go in the directory where the
MonetDB sources are, and create a subdirectory `BUILD`. Go in the
`BUILD` directory and run the following command, where `prefix` is the
location where you would like MonetDB installed.

`../configure --prefix=<full-path>`

### With MacPorts

Before starting the configure tool, go in the directory where the
MonetDB sources are, and create a subdirectory `BUILD`. Go in
the `BUILD` directory and run the following command, where `prefix` is
the location where you would like MonetDB installed.

`../configure --prefix=<full-path> --with-libiconv-prefix=/opt/local`

* If you want to build the ODBC driver or enable sphinxclient support,
do not forget to add the appropriate arguments, e.g.:

`../configure --prefix=<full-path> --with-libiconv-prefix=/opt/local --with-sphinxclient=/opt/local --with-unixodbc =/opt/local --with-readline=/opt/local`

Note: If you don't have root/admin permission for your system you will
not be able to deploy the RubyGem. If you don't need the RubyGem simply
disable with with the option `--without-rubygem`

Building
--------

To build the configured modules, simply run from the
<tt>`BUILD`</tt> directory, using the `-j<number>` argument for a
parallel build. E.g.

`make -j4`

Once the build process finishes, install MonetDB in the prefix location
set during the configure process.

`make install`

Note: If you have built the RubyGem, on OS X you will need to use
`sudo make install` to deploy it.




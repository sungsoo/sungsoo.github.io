---
layout: post
title: How to fix “System program problem detected” error on Ubuntu
date: 2014-08-29
categories: [computer science]
tags: [design patterns]

---


## Article Source

* Title: [How to fix “System program problem detected” error on Ubuntu](http://www.binarytides.com/ubuntu-fix-system-program-problem-error/)


How to fix “System program problem detected” error on Ubuntu
==========

The error "System program problem detected" comes up when a certain
application crashes. Ubuntu has a program called Apport that is
responsible for detecting such crashes and upon user consent, report
these crashes to developers. This process intends to get the problem
fixed by the developers.


However it can be very annoying to common users, and there is no point
in showing errors to users when they cannot do anything about it
themselves. So you might want to disable them.

![system program problem detected
ubuntu](http://www.binarytides.com/blog/wp-content/plugins/jquery-image-lazy-loading/images/grey.gif)

![system program problem detected
ubuntu](http://www.binarytides.com/blog/wp-content/uploads/2014/04/system-program-problem-detected.png)

## Remove crash report files

The apport system creates crash report files in the /var/crash
directory. These crash report files cause the error message to appear
everytime Ubuntu boots.

``` 
$ cd /var/crash
$ ls
_opt_google_chrome_chrome.1000.crash
_usr_lib_chromium-browser_chromium-browser.1000.crash
_usr_sbin_ulatencyd.0.crash
_usr_share_apport_apport-gtk.1000.crash
```

Just remove the crash report files

``` 
$ sudo rm /var/crash/*
```

After removing all the crash report files, the error message should stop
popping up. However if a new crash takes place then it would appear
again in future.

## Turn off apport

After removing the old crash reports, if you still get the same error
message, then you can completely turn off apport to get rid. Edit the
configuration file at /etc/default/apport.

``` 
$ gksudo gedit /etc/default/apport
```

The file would contain something like this

``` 
# set this to 0 to disable apport, or to 1 to enable it
# you can temporarily override this with
# sudo service apport start force_start=1
enabled=1
```

Just set the value of enabled to 0, and this will disable apport.

``` 
enabled=0
```

Save the file and close it. From the next boot onwards, there should be
no error messages ever. If you do not want to restart the system then
restart apport from the command line.

``` 
$ sudo restart apport
```

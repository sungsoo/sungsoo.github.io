---
layout: post
title: Stanford Compilers Course
date: 2015-11-07
categories: [computer science]
tags: [design patterns]

---


# Cool Compiler [Stanford Compilers Course]
## VirtualBox VM setup    

<a data-coursera-admin-helpwidget-link="" rel="help" href="https://class.coursera.org/mooc/help/pages/setup" title="Course Page Setup" style="display:none;">Learn more.</a>
</h2>


If you have not used a VM before, the idea is that you will be running an entire operating system on inside a program (VirtualBox) that looks to the virtual guest operating system like real hardware. We provide downloadable image of the guest OS with
    everything installed, so that you only need to do minimal setup to get started.

Note that since a VM contains a whole second operating system, the system requirements are high. **The VM will take a bit over 512MB of ram (so you will probably want to have 2GB of total ram to keep Windows or Mac OS X running smoothly), plus a bit over 2GB of hard disk space.** 


### Getting VirtualBox



* First, download Oracle's VirtualBox, either from the VirtualBox website at <a href="https://www.virtualbox.org/wiki/Downloads">https://www.virtualbox.org/wiki/Downloads</a>, or from Oracle's download page at <a href="http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html">http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html</a>.       Choose the version for the operating system you are running on your computer.

* Once the download completes, run the installer to install VirtualBox. You will need administrator access on your computer to do so.


### Getting our VM image



* Download our linux virtual machine image from <a href="http://d2bk0s8yylvsxl.cloudfront.net/stanford-compilers/vm/compilers-vm.zip">http://d2bk0s8yylvsxl.cloudfront.net/stanford-compilers/vm/compilers-vm.zip</a>, or if you have a BitTorrent client
        installed, you can use the torrent at <a href="http://spark-university.s3.amazonaws.com/stanford-compilers/vm/compilers-vm.zip?torrent">http://spark-university.s3.amazonaws.com/stanford-compilers/vm/compilers-vm.zip?torrent</a>. Note that this
        download is approximately 750MB.

* Unzip the file into a convenient directory. The unzipped files are about 2GB, so make sure you have enough disk space available. If you are a Windows XP user and have trouble opening the zip file, try WinZip (shareware) or 7-Zip (free, open source)
        instead of the built-in zip support in Windows.

* Once you have unzipped the VM, double-click on the file "Compilers.vbox" This should open the VM in VirtualBox.

### Using the VM

**The provided account is "compilers" and the password is "cool"**.

* To start the VM, click the green "Start" button. This should make the VM boot.

* To shut down the VM, click on the round "Bodhi" button at the bottom left and click System. Then choose Power Off.

* We have installed what you need to do the assignments, plus a few other programs, such as vim and emacs. If you want to install other packages, you can use the Aptitude graphical package manager (under the Bodhi menu-&gt;Applications-&gt;Preferences)
        or the apt-get command line tool. If you are not familiar with these, there are many tutorials online that you can find through a quick Google search.

* To get a terminal, click on the terminal icon at the bottom of the screen. This should get you to the point where you can start the assignments.

This VM is based on Bodhi Linux, which is itself based on the popular linux distribution Ubuntu. We used Bodhi Linux in order to keep the download size more manageable, since a full Ubuntu install is quite large. However, since it is based on Ubuntu,
    most Ubuntu software packages can be installed on Bodhi Linux as well.

If you have a problem that you cannot solve, please post on the <a href="https://class.coursera.org/compilers-004/forum/list?forum_id=9">Coursera forums</a>. Unfortunately the TAs cannot always provide personalized help to students in the public class, but we do monitor the forums, so we will
    try to post solutions to common problems when they come up as soon as possible.
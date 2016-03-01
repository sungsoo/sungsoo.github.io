---
layout: post
title: Transactional Memory in Practice
date: 2016-03-02
categories: [computer science]
tags: [data management]

---

# Transactional Memory in Practice

*Transactional memory* has been held up as a panacea for concurrent programming in some quarters. The C++ standardization committee is even looking at including it in the standard. But is it really a panacea? Has anyone used it in a shipping piece of software? There are scattered examples, mostly from the high-performance and super-computing realms. On the other end of the spectrum, at Wyatt Technology we've been using transactional memory in a desktop application that does data acquisition and analysis for the light-scattering instruments we build. That application is called Dynamics and we've been using a software transactional memory system in it for four years now. This talk will detail how our system works, how well it worked, and what pitfalls we've run into. Prior experience with transactional memory will not be assumed, though it would help if you have experience programming threads with locks and an open mind about alternatives and why we're looking for them.

<iframe width="600" height="400" src="https://www.youtube.com/embed/k20nWb9fHj0" frameborder="0" allowfullscreen></iframe>

---

Brett is the lead developer on Dynamics, a data collection and analysis package developed at Wyatt Technology([http://www.wyatt.com/](http://www.wyatt.com/)) for use with their light scattering instruments. He holds a PhD in Physics from the University of California, Santa Barbara. Previous to joining Wyatt, Brett worked in the game industry, remote sensing, and web development. He also blogs about C++, among other things, at [backwardsincompatibilities.wordpress.com](backwardsincompatibilities.wordpress.com)­.

---

Videos Filmed & Edited by Bash Films: [http://www.BashFilms.com](http://www.BashFilms.com)
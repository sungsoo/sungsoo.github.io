---
layout: post
title: Deep Reinforcement Learning
date: 2018-04-10
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [CS 294: Deep Reinforcement Learning, Fall 2017](http://rll.berkeley.edu/deeprlcourse/)
* Authors: Sergey Levine

---

Deep Reinforcement Learning
===========================


Fall 2017 Materials 
===================

Lecture Videos
--------------

The course lectures are available below. The course is **not** being
offered as an online course, and the videos are provided only for your
personal informational and entertainment purposes. They are not part of
any course requirement or degree-bearing university program.
For all videos, **[click
here](https://www.youtube.com/playlist?list=PLkFD6_40KJIznC9CDbVTjAF2oyt8_VAe3)**.
For live stream, **[click
here](https://www.youtube.com/c/CalESG/live)**.

Lectures, Readings, and Assignments 
-----------------------------------

Below you can find an outline of the course. Slides and references will
be posted as the course proceeds.

-   Aug 23: Introduction and course overview (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_1_introduction.pdf)
-   Aug 28: Supervised learning and imitation (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_2_behavior_cloning.pdf)
    -   **Homework 1 is out: [Imitation
        Learning](http://rll.berkeley.edu/deeprlcourse/f17docs/hw1fall2017.pdf)**
-   Aug 30: Reinforcement learning introduction (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_3_rl_intro.pdf)
-   Sep 4: Holiday - no class.
-   Sep 6: Policy gradients introduction (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_4_policy_gradient.pdf)
    -   **Homework 1 milestone due**
-   Sep 8: Neural networks review (Achiam)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/tf_review_session.pdf)
-   Sep 11: Actor-critic introduction (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_5_actor_critic_pdf.pdf)
    -   **Homework 1 is due, Homework 2 is out: [Policy
        Gradients](http://rll.berkeley.edu/deeprlcourse/f17docs/hw2_final.pdf)**
-   Sep 13: Value functions introduction (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_6_value_functions.pdf)
-   Sep 18: Advanced Q-learning algorithms (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_7_advanced_q_learning.pdf)
-   Sep 20: Optimal control and planning (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_8_model_based_planning.pdf)
    -   **Homework 2 is due, Homework 3 is out: [DQN](http://rll.berkeley.edu/deeprlcourse/f17docs/hw3.pdf)**
-   Sep 25: Learning dynamical systems from data (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_9_model_based_rl.pdf)
-   Sep 27: Learning policies by imitating optimal controllers (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_10_imitating_optimal_control.pdf)
-   Oct 2: Advanced model learning and images (Guest lecture:
    Chelsea Finn)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/advanced_model_learning.pdf)
-   Oct 4: Connection between inference and control (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_11_control_and_inference.pdf)
    -   **Homework 3 is due, Homework 4 is out: [Model Based
        RL](http://rll.berkeley.edu/deeprlcourse/f17docs/hw4.pdf)**
-   Oct 9: Inverse reinforcement learning (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_12_irl.pdf)
    -   **Project proposal is due**
-   Oct 11: Advanced policy gradients (natural gradient,
    importance sampling) (Achiam)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_13_advanced_pg.pdf)
-   Oct 16: Exploration (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_13_exploration.pdf)
-   Oct 18: Exploration (part 2) and transfer learning (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_14_transfer.pdf)
    -   **Homework 4 is due**
-   Oct 23: Multi-task learning and transfer (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_15_multi_task_learning.pdf)
-   Oct 25: Meta-learning and parallelism (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_16_meta_learning.pdf)
-   Oct 30: Advanced imitation learning and open problems (Levine)
    -   [Slides](http://rll.berkeley.edu/deeprlcourse/f17docs/lecture_17_challenges.pdf)
-   Nov 1: Guest lecture: Igor Mordatch, OpenAI
-   Nov 6: Guest lecture: Mohammad Norouzi, Google
    -   **Project milestone**
-   Nov 8: Guest lecture: Pieter Abbeel, UC Berkeley and OpenAI
-   Nov 13: Guest lecture: Emma Brunskill, Stanford University
-   Nov 15: Guest lecture: Aviv Tamar, UC Berkeley
-   Nov 20: Guest lecture: John Schulman, OpenAI
-   Nov 22: Holiday - no class
-   Nov 27: Final project presentations 1
-   Nov 29: Final project presentations 2

Previous Offerings 
------------------

A full version of this course was offered in [Spring
2017](http://rll.berkeley.edu/deeprlcoursesp17/). Lecture videos from
Spring 2017, are available
**[here](https://www.youtube.com/playlist?list=PLkFD6_40KJIwTmSbCv9OVJB3YaO4sFwkX)**

An abbreviated version of this course was offered in [Fall
2015](http://rll.berkeley.edu/deeprlcourse-fa15/).

Prerequisites
-------------

CS189 or equivalent is a prerequisite for the course. This course will
assume some familiarity with reinforcement learning, numerical
optimization and machine learning. Students who are not familiar with
the concepts below are encouraged to brush up using the references
provided right below this list. We’ll review this material in class, but
it will be rather cursory.

-   Reinforcement learning and MDPs
    -   Definition of MDPs
    -   Exact algorithms: policy and value iteration
    -   Search algorithms
-   Numerical Optimization
    -   gradient descent, stochastic gradient descent
    -   backpropagation algorithm
-   Machine Learning
    -   Classification and regression problems: what loss functions are
        used, how to fit linear and nonlinear models
    -   Training/test error, overfitting.

For introductory material on RL and MDPs, see

-   [CS188 EdX course](http://ai.berkeley.edu), starting with *Markov
    Decision Processes I*
-   [Sutton &
    Barto](http://webdocs.cs.ualberta.ca/~sutton/book/the-book.html), Ch
    3 and 4.
-   For a concise intro to MDPs, see Ch 1-2 of [Andrew Ng’s
    thesis](docs/ng-thesis.pdf)
-   David Silver’s course, [links below](#related-materials)

For introductory material on machine learning and neural networks, see

-   [Andrej Karpathy’s course](http://cs231n.github.io)
-   [Geoff Hinton on
    Coursera](https://www.coursera.org/course/neuralnets)
-   [Andrew Ng on
    Coursera](https://www.coursera.org/learn/machine-learning/)
-   [Yaser Abu-Mostafa’s
    course](https://work.caltech.edu/telecourse.html)

Related Materials
-----------------

### John's lecture series at MLSS 

-   [Lecture 1](https://www.youtube.com/watch?v=aUrX-rP_ss4): intro,
    derivative free optimization
-   [Lecture 2](https://www.youtube.com/watch?v=oPGVsoBonLM): score
    function gradient estimation and policy gradients
-   [Lecture 3](https://www.youtube.com/watch?v=rO7Dx8pSJQw): actor
    critic methods
-   [Lecture 4](https://www.youtube.com/watch?v=gb5Q2XL5c8A): trust
    region and natural gradient methods, open problems

### Courses

-   [Dave Silver’s course on reinforcement
    learning](http://www0.cs.ucl.ac.uk/staff/D.Silver/web/Teaching.html)
    / [Lecture
    Videos](http://www.machinelearningtalks.com/tag/rl-course)
-   [Nando de Freitas’ course on machine
    learning](https://www.cs.ox.ac.uk/people/nando.defreitas/machinelearning/)
-   [Andrej Karpathy’s course on neural
    networks](http://cs231n.github.io/)

### Relevant Textbooks 

-   [Deep Learning](http://www.deeplearningbook.org/)
-   [Sutton & Barto, Reinforcement Learning: An
    Introduction](http://webdocs.cs.ualberta.ca/~sutton/book/the-book.html)
-   [Szepesvari, Algorithms for Reinforcement
    Learning](http://www.ualberta.ca/~szepesva/RLBook.html)
-   [Bertsekas, Dynamic Programming and Optimal Control, Vols I and
    II](http://www.athenasc.com/dpbook.html)
-   [Puterman, Markov Decision Processes: Discrete Stochastic Dynamic
    Programming](http://www.wiley.com/WileyCDA/WileyTitle/productCd-0471727822.html)
-   [Powell, Approximate Dynamic Programming](http://adp.princeton.edu/)

### Misc Links

-   [A collection of deep learning
    resources](http://www.jeremydjacksonphd.com/?cat=7)



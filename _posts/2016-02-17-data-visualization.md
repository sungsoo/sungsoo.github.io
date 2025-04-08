---
layout: post
title: Data Visualization
date: 2016-02-17
categories: [computer science]
tags: [computer graphics]

---

# Data Visualization

## Why data visualization?

Our information age more often feels like an era of information overload. Excess amounts of information are overwhelming; raw data becomes useful only when we apply methods of deriving insight from it.

Fortunately, we humans are intensely visual creatures. Few of us can detect patterns among rows of numbers, but even young children can interpret bar charts, extracting meaning from those numbers’ visual representations. For that reason, data visualization is a powerful exercise. Visualizing data is the fastest way to communicate it to others.

Of course, visualizations, like words, can be used to lie, mislead, or distort the truth. But when practiced honestly and with care, the process of visualization can help us see the world in a new way, revealing unexpected patterns and trends in the otherwise-hidden information around us. At its best, data visualization is expert storytelling.

More literally, visualization is a process of *mapping* information to visuals. We craft rules that interpret data and express its values as visual properties. For example, this humble bar chart is generated from a very simple rule: Larger values are *mapped* as taller bars.

![](http://sungsoo.github.com/images/bar-graph.png)

More complex visualizations are generated from data sets more complex than the sequence of numbers above and more complex sets of mapping rules.

## Why write code?

Mapping data by hand can be satisfying, yet is slow and tedious. So we usually employ the power of computation to speed things up. The increased speed enables us to work with much larger data sets of thousands or millions of values; what would have taken years of effort by hand can be mapped in a moment. Just as important, we can rapidly experiment with alternate mappings, tweaking our rules and seeing their output re-rendered immediately. This loop of write/render/evaluate is critical to the iterative process of refining a design.

Sets of mapping rules function as *design systems*. The human hand no longer executes the visual output; the computer does. Our human role is to conceptualize, craft, and write out the rules of the system, which is then finally executed by software.

Unfortunately, software (and computation generally) is extremely bad at understanding what, exactly, people want. (To be fair, many humans are also not good at this challenging task.) Because computers are binary systems, everything is either on or off, yes or no, this or that, there or not there. Humans are mushier, softer creatures, and the computers are not willing to meet us halfway — we must go to them. Hence the inevitable struggle of learning to write software, in which we train ourselves to communicate in the very limited and precise syntax that the computer can understand.

Yet we continue to write code because seeing our visual creations come to life is so rewarding. We practice data visualization because it is exciting to see what has never before been seen. It is like summoning a magical, visual genie out of an inscrutable data bottle.

## Why interactive?

Static visualizations can offer only pre-composed "*views*" of data, so multiple static views are often needed to present a variety of perspectives on the same information. The number of dimensions of data are limited, too, when all visual elements must be present on the same surface at the same time. Representing multidimensional data sets fairly in static images is notoriously difficult. A fixed image is ideal when alternate views are neither needed nor desired, and required when publishing to a static medium, such as print.

Dynamic, interactive visualizations can empower people to explore the data for themselves. The basic functions of most interactive visualization tools have changed little since 1996, when Ben Shneiderman of the University of Maryland first proposed a "Visual Information-Seeking Mantra": *Overview first, zoom and filter, then details-on-demand*.

* Shneiderman, Ben. *The Eyes Have It: A Task by Data Type Taxonomy for Information Visualizations*, July 1996, Department of Computer Science Human-Computer Interaction Laboratory, and Institute for Systems Research University of Maryland, College Park, Maryland

This design pattern is found in most interactive visualizations today. The combination of functions is successful because it makes the data accessible to different audiences, from those who are merely browsing or exploring the data set, to those who approach the visualization with a specific question in search of an answer. An interactive visualization that offers an overview of the data alongside tools for "*drilling down*" into the details, may successfully fulfill many roles at once, addressing the different concerns of different audiences, from those new to the subject matter to those already deeply familiar with the data.

Of course, interactivity can also encourage engagement with the data in ways that static images cannot. With animated transitions and well-crafted interfaces, some visualizations can make exploring data feel more like playing a game. Interactive visualization can be a great medium for reaching those who don’t consider learning to be a *fun* task.


## Why on the web?

Visualizations aren’t truly visual unless they are *seen*. Getting your work out there for others to see is critical, and publishing on the web is the quickest way to reach a global audience.

Best of all, everything covered in this book can be done with freely accessible tools, so the only investment required is your time. And everything we’ll talk about uses open-source, web-standard technologies. By avoiding proprietary software and plug-ins, you can ensure that your projects are accessible on the widest possible range of devices, from typical desktop computers to tablets and even phones. The more accessible your visualization, the greater your audience and your impact.
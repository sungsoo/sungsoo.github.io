---
layout: post
title:  Semantic Scene Completion from a Single Depth Image
date: 2017-04-24
categories: [computer science]
tags: [computer graphics, machine learning]

---


Semantic Scene Completion from a Single Depth Image 
=======================================================

The paper "Semantic Scene Completion from a Single Depth Image" is available here:
[http://sscnet.cs.princeton.edu/](http://sscnet.cs.princeton.edu/)

Recommended for you:

* [How Does Deep Learning Work?](https://www.youtube.com/watch?v=He4t7Zekob0)
* [Artificial Neural Networks and Deep Learning](https://www.youtube.com/watch?v=rCWTOOgVXyE)


<iframe width="600" height="400" src="https://www.youtube.com/embed/8YWgar0uCF8" frameborder="0" allowfullscreen></iframe>

![](http://sscnet.cs.princeton.edu/teaser.jpg)

Abstract
--------

This paper focuses on *semantic scene completion*, a task for producing a complete 3D voxel representation of *volumetric occupancy* and *semantic labels* for a scene from a single-view depth map observation. Previous work has considered scene completion and semantic labeling of depth maps *separately*. However, we observe that these two problems are tightly intertwined. To leverage the coupled nature of these two tasks, we introduce the *semantic scene completion network* (**SSCNet**), an end-to-end 3D convolutional network that takes a single depth image as input and simultaneously outputs occupancy and semantic labels for all voxels in the camera view frustum. Our network uses a dilation-based 3D context module to efficiently expand the receptive field and enable 3D context learning. 

To train our network, we construct SUNCG - a manually created large-scale dataset of synthetic 3D scenes with dense volumetric annotations. Our experiments demonstrate that the joint model outperforms methods addressing each task in isolation and outperforms alternative approaches on the semantic scene completion task.

Paper
-----

SUNCG Dataset
-------------

-   If you are a researcher and would like to get access to the data, please print and sign this [**\[agreement\]**](http://suncg.cs.princeton.edu/form.pdf) and email it to Shuran Song: shurans \[at\] princeton \[dot\] edu.
-   To explore the dataset, you can visit the [**\[SUNCG dataset webpage\]**](http://suncg.cs.princeton.edu/).
-   We provide a simple C++ based toolbox for the SUNCG dataset. You can obtain the toolbox from this [**\[GitHub     repository\]**](http://github.com/shurans/SUNCGtoolbox).

![](http://sscnet.cs.princeton.edu/data.jpg)

Video
-----

<iframe width="600" height="400" src="https://www.youtube.com/embed/Yjpmouaap6M" frameborder="0" allowfullscreen></iframe>


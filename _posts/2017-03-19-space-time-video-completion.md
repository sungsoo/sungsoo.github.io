---
layout: post
title: Space-Time Video Completion
date: 2017-03-19
categories: [computer science]
tags: [computer graphics]

---


## Article Source
* Title: [Space-Time Video Completion](https://www.youtube.com/watch?v=YWK-bnyXvbg)


---


Space-Time Video Completion
====================================

The paper "Space-Time Video Completion" is available here:

[http://www.wisdom.weizmann.ac.il/~vision/VideoCompletion.html](http://www.wisdom.weizmann.ac.il/~vision/VideoCompletion.html)

<iframe width="600" height="400" src="https://www.youtube.com/embed/YWK-bnyXvbg" frameborder="0" allowfullscreen></iframe>

Unofficial implementation:

[https://www.patreon.com/TwoMinutePapers](https://www.patreon.com/TwoMinutePapers)

## Abstrct

We present a method for *space-time completion* of large space-time holes in video sequences of complex dynamic scenes. The missing portions are filled-in by sampling spatio-temporal patches from the available parts of the video, while enforcing global spatio-temporal consistency between all patches in and around the hole. This is obtained by posing the task of video completion and synthesis as a global optimization problem with a well-defined objective function.The consistent completion of static scene parts simultaneously with dynamic behaviors leads to realistic looking video sequences. Space-time video completion is useful for a variety of tasks, including, but not limited to:

* Sophisticated video removal (of undesired static or dynamic objects) by completing the appropriate static or dynamic background information.
* Correction of missing/corrupted video frames in old movies
* Synthesis of new video frames to add a visual story, modify it, or generate a new one. Some examples of these are shown in the paper.
* Video texture synthesis
* Full field-of-view stabilized video.

An implementation inspired by this work for filling images is available [here](http://www2.mta.ac.il/~tal/ImageCompletion/). 


NEW: This method is now part of the Content Aware Fill feature in Adobe Photoshop CS5.

* A journal preprint from TPAMI March 2007, can be found [here](http://www.wisdom.weizmann.ac.il/~vision/VideoCompletion/SpaceTimeCompletion_PAMI07.pdf) (pdf, 30MB). 
* A shorter version from CVPR 2004 is [here](http://www.wisdom.weizmann.ac.il/~vision/VideoCompletion/SpaceTimeCompletion.pdf) (pdf, 3.5MB). 
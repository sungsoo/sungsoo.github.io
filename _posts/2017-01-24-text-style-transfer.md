---
layout: post
title: Text Style Transfer
date: 2017-01-24
categories: [computer science]
tags: [computer graphics, machine learning]

---


Text Style Transfer
========


### Abstract

In this work, we explore the problem of generating fantastic special-effects for the typography. It is quite challenging due to the model diversities to illustrate varied text effects for different characters. To address this issue, our key idea is to exploit the *analytics on the high regularity* of the spatial distribution for text effects to guide the synthesis process. Specifically, we characterize the stylized patches by their normalized positions and the optimal scales to depict their style elements. Our method first estimates these two features and derives their correlation statistically. They are then converted into soft constraints for texture transfer to accomplish *adaptive multi-scale texture synthesis* and to make style element distribution uniform. It allows our algorithm to produce artistic typography that fits for both local texture patterns and the global spatial distribution in the example. Experimental results demonstrate the superiority of our method for various text effects over conventional style transfer methods. In addition, we validate the effectiveness of our algorithm with extensive artistic typography library generation.


<iframe width="600" height="400" src="https://www.youtube.com/embed/MtWtY4DdiWs" frameborder="0" allowfullscreen></iframe>

The paper "*Awesome Typography: Statistics-Based Text Effects Transfer*" is available here:

* [Paper](https://arxiv.org/abs/1611.09026)
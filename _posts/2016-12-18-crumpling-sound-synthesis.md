---
layout: post
title: Crumpling Sound Synthesis
date: 2016-12-18
categories: [computer science]
tags: [computer graphics]

---

# Crumpling Sound Synthesis

## Abstract

Crumpling a thin sheet produces a characteristic sound, comprised of distinct clicking sounds corresponding to buckling events. We propose a physically based algorithm that automatically synthesizes crumpling sounds for a given thin shell animation. The resulting sound is a superposition of individually synthesized clicking sounds corresponding to visually significant and insignificant buckling events. We identify visually significant buckling events on the dynamically evolving thin surface mesh, and instantiate visually insignificant buckling events via a stochastic model that seeks to mimic the power-law distribution of buckling energies observed in many materials. 

In either case, the synthesis of a buckling sound employs linear modal analysis of the deformed thin shell. Because different buckling events in general occur at different deformed configurations, the question arises whether the calculation of linear modes can be reused. We amortize the cost of the linear modal analysis by dynamically partitioning the mesh into nearly rigid pieces: the modal analysis of a rigidly moving piece is retained over time, and the modal analysis of the assembly is obtained via Component Mode Synthesis (CMS). We illustrate our approach through a series of examples and a perceptual user study, demonstrating the utility of the sound synthesis method in producing realistic sounds at practical computation times.


<iframe width="600" height="400" src="https://www.youtube.com/embed/PMSV7CjBuZI" frameborder="0" allowfullscreen></iframe>

## Downloads

* [Paper](http://www.cs.columbia.edu/cg/crumpling/crumpling-sound-synthesis-siggraph-asia-2016-cirio-et-al.pdf) / [Paper (low resolution)](http://www.cs.columbia.edu/cg/crumpling/crumpling-sound-synthesis-siggraph-asia-2016-cirio-et-al-compressed.pdf) 
* Perceptual Study: [Github](https://github.com/dingzeyuli/perceptual-study) / [live demo](http://www.cs.columbia.edu/cg/crumpling/perceptual-study/) / [supplemental analysis](http://www.cs.columbia.edu/cg/crumpling/crumpling-sound-synthesis-suppl-perceptual-study.pdf) 
* [Recorded and Simulated Sounds](http://www.cs.columbia.edu/cg/crumpling/crumpling_sounds.zip)
* [Video (100MB)](http://www.cs.columbia.edu/cg/crumpling/crumpling-sound-synthesis-siggraph-asia-2016.mp4)/ [Youtube](https://youtu.be/Gue12UjXd5U) 
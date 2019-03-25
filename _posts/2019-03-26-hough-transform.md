---
layout: post
title: Hough Transform for Lines
date: 2019-03-26
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Hough Space](https://www.youtube.com/watch?v=MA1f9FsrCco&list=PLAwxTw4SYaPnbDacyrK_kB_RUkuxQBlCm&index=99)

---

# Hough Transform

The Hough transform is an incredible tool that lets you identify lines. Not just lines, but other shapes as well. In this article, I'll talk about the mechanics behind the Hough transform. It will involve a bit of math, but just elementary concepts you learned in school. In this article, we'll work with lines only, though the technique can be easily extended to other shapes.


## Why the Hough Transform?
Lets say you take the snapshot of pole. You figure out edge pixels (using the Canny edge detector, the Sobel edge detector, or any other thing). Now you want a geometrical representation of the pole's edge.You want to know its slope, its intercept, etc. But right now the "edge" is just a sequence of pixels.

You can loop through all pixels, and some how figure out the slope and intercept. But that is one difficult task. Images are never perfect.

So you want some mechanism that give more weightage to pixels that are already in a line. This is exactly what the Hough Transform does.

It lets each point on the image "vote". And because of the mathematical properties of the transform, this "voting" allows us to figure out prominent lines in the image.

## Hough Space

<iframe width="600" height="400" src="https://www.youtube.com/embed/MA1f9FsrCco" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Polar Representation for Lines
<iframe width="600" height="400" src="https://www.youtube.com/embed/wh_at1O_WFI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Basic Hough Transform Algorithm
<iframe width="600" height="400" src="https://www.youtube.com/embed/2oGYGXJfjzw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Complexity of the Hough Transform
<iframe width="600" height="400" src="https://www.youtube.com/embed/2L3Cr-fzoxU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
## Hough Example
<iframe width="600" height="400" src="https://www.youtube.com/embed/V1jBp6f8AfY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
## Hough Demo Intro
<iframe width="600" height="400" src="https://www.youtube.com/embed/Qd9x614pHaA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
## Hough Demo
<iframe width="600" height="400" src="https://www.youtube.com/embed/EcHNuzvdZHk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
## Hough on a Real Image
<iframe width="600" height="400" src="https://www.youtube.com/embed/oEMxjHTJB9Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Impact of Noise on Hough
<iframe width="600" height="400" src="https://www.youtube.com/embed/yOsMh1NFK9k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Extensions
<iframe width="600" height="400" src="https://www.youtube.com/embed/dbNCn0ZpJVg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## End
<iframe width="600" height="400" src="https://www.youtube.com/embed/JC1GAIH3TSs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
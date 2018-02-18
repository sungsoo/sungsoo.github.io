
---
layout: post
title: This Autonomous Robot Models Your House Interior
date: 2018-02-18
categories: [computer science]
tags: [machine learning]

---


# This Autonomous Robot Models Your House Interior

## Autonomous Reconstruction of Unknown Indoor Scenes Guided by Time-varying Tensor Fields

### Abstract

Autonomous reconstruction of unknown scenes by a mobile robot inherently poses the question of balancing between exploration efficacy and reconstruction quality. We present a *navigation-by-reconstruction approach* to address this question, where moving paths of the robot are planned to account for both global efficiency for fast exploration and local smoothness to obtain high-quality scans. An RGB-D camera, attached to the robot arm, is dictated by the desired reconstruction quality as well as the movement of the robot itself. Our key idea is to harness a *time-varying tensor field* to guide robot movement, and then solve for 3D camera control under the constraint of the 2D robot moving path. The tensor field is updated in real time, conforming to the progressively reconstructed scene. We show that tensor fields are well suited for guiding autonomous scanning for two reasons: first, they contain sparse and controllable singularities that allow generating a locally smooth robot path, and second, their topological structure can be used for globally efficient path routing within a partially reconstructed scene. We have conducted numerous tests with a mobile robot, and demonstrate that our method leads to a fluent exploration and high-quality reconstruction of unknown indoor scenes.

<iframe width="600" height="400" src="https://www.youtube.com/embed/fTBeNAu18_s" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The paper "Autonomous Reconstruction of Unknown Indoor Scenes Guided by Time-varying Tensor Fields" and its source code is available here:

[http://vcc.szu.edu.cn/research/2017/tfnav/](http://vcc.szu.edu.cn/research/2017/tfnav/)


---
layout: post
title: Spatial Hash Grids & Tales from Game Development
date: 2022-07-29
categories: [computer science]
tags: [machine learning, graph mining]

---

### Article Source

* [Spatial Hash Grids & Tales from Game Development](https://www.youtube.com/watch?v=sx4IIQL0x7c)


---

# Spatial Hash Grids & Tales from Game Development

* Github: https://github.com/simondevyoutube/


## Abstract

In this project we're covering spatial hash grids, or spatial hashing, people seem to call it all sorts of different names. Anyway, we'll be covering a spatial hash grid implementation in JavaScript, working through it line by line. We'll walk through the code step by step, explaining it as we go, and as an added bonus, I've implemented a small scene in Three.js with hundreds of moving agents that we can use to visualize what's visible from the perspective of any given agent.

I'll also tell a small but interesting little story from way back when I was working on xbox/playstation games. Somewhat related to the topic.

Having a comprehensive understanding of data structures is fundamental to being a solid game developer. You need to understand the trade-offs, not just in time complexity. Questions like memory consumption, implementation and on-going maintenance costs, these all factor in. Sometimes simple solutions, implemented well, that get you 95% of the way there but at a fraction of the developer cost, are the way to go.

The three.js library is available in JavaScript for cross-browser 3d graphics, wrapping webgl and making high level functionality available in the web browser. It’s an extremely mature and well maintained library that I use for many of these videos.

In the video, we cover:
* What problem are we trying to solve? We'll look at examples from major games to understand their needs in different situations.
* We'll touch on alternative spatial data structures, and discuss the tradeoffs.
* I'll talk about an instance in my career that's relevant to this problem
* Step by step walk through for the full implementation of a basic spatial hash grid.

<iframe width="600" height="400" src="https://www.youtube.com/embed/sx4IIQL0x7c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
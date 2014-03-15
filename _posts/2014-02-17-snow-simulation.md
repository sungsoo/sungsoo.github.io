---
layout: post
title: A Material Point Method For Snow Simulation
date: 2014-02-17 
categories: [computer science]
tags: [computer graphics]

---

Making of Disney’s Frozen Snow Simulation
---

<iframe width="600" height="400" src="//www.youtube.com/embed/O0kyDKu8K-k" frameborder="0" allowfullscreen></iframe>

Snow is a challenging natural phenomenon to visually simulate. While the graphics community has previously considered accumulation and rendering of snow, animation of snow dynamics has not been fully addressed. Additionally, existing techniques for solids and fluids have difficulty producing convincing snow results.

![](http://sungsoo.github.com/images/frozen01.png)

Specifically, wet or dense snow that has both solid- and fluid-like properties is difficult to handle. Consequently, this paper presents a novel snow simulation method utilizing a usercontrollable elasto-plastic constitutive model integrated with a hybrid Eulerian/Lagrangian Material Point Method [1]. The method is continuum based and its hybrid nature allows us to use a regular Cartesian grid to automate treatment of self-collision and fracture. It also naturally allows us to derive a grid-based semi-implicit integration scheme that has conditioning independent of the number of Lagrangian particles. We demonstrate the power of our method with a variety of snow phenomena including complex character interactions.

![](http://sungsoo.github.com/images/frozen02.png)

Because of this unique set of circumstances, the snow resulted in a new kind of collaboration between the effects team and creative team on the film that was closer than any Disney film before it. Effects supervisors Dale Mayeda and Marlon West their work bringing Disney’s latest animated film to life, one snowflake at a time, and what it meant to let the character of Elsa control the weather and make it snow in Disney’s Frozen.

![](http://sungsoo.github.com/images/frozen03.png)

The team behind the scenes used math, physics, and a lot of computational horsepower to create a simulator that depicted realistic snow in a virtual environment. They call the tool Matterhorn, and it’s responsible for laying down the foundation for many of the snow effects you see in Frozen. From snowfall to the snow collected on the landscape and characters, Matterhorn’s designers were tasked with starting at a place of simulated reality, which they could then tweak and modify in order to get the perfect look. However, that’s only part of Frozen’s snow story.

![](http://sungsoo.github.com/images/frozen04.png)

Elsa’s magic, which also takes the form of snow and ice, is a unique effect unrelated to Matterhorn; it was designed and implemented in a much different way, starting with a pencil and a lot of paper. “For Elsa’s magic,” Marlon explained, “there was a lot of hand drawn exploration, that our 2D animator Dan Lund did, and our directors really liked that look.” But transitioning the effect into CG wasn’t easy, so the Frozen team called in a pinch hitter in Big Hero 6’s lead effects animator Michael Kaschalk. After 8 weeks of work, they had a breakthrough.

![](http://sungsoo.github.com/images/frozen05.png)

“There is definitely a tone that Mike Giaimo, the art director, really wanted to set in terms of everything about the film having a sense of elegance,” Dale said of Frozen’s look. “When we were trying to figure out what Elsa’s magic was, Michael Kaschalk had really tried to dive in and understand ‘What is her magic?’ That sense of elegance is what he tried to capture and once we got that and the directors saw it they said ‘That’s her magic!’ We very meticulously sculpted curves so that they flow and make these [Norwegian decorative] rosemaling shapes. In the Animated iPad app, I know that the team who worked on it spent time with our artists that created our Elsa’s snow animation rig and he went node by node, exactly so that it was accurate. When you play with it, it feels very much like what we used on this movie.”

![](http://sungsoo.github.com/images/frozen06.png)

“As far as effects animation, it’s definitely a combination of art and science,” pointed out Dale during our discussion of the two types of snow in Frozen. “So much of what we do on a daily basis is not just doing simulations but also making sure the composition is great and the timing is beautiful, and a lot of design as well.”


This is what separates CG effects in an animated film from the similar work done in the live-action filmmaking world. As Marlon explained it, “Unlike live action effects that have to look real and have to go into a live action scene, what we do is really in support of character animation performance and art direction. So we really have to study what our characters are doing; we can’t just develop an effect that appears alone. You really have to ask what the scene is about. Our effects have to be scary, they have to get laughs, they have to be funny, they have to look beautiful; they have to support the story and the performance at any time.”

![](http://sungsoo.github.com/images/frozen07.png)

In the case of Frozen, the snow had to do all of those things and one more: it had to originate in the heart, mind, and occasionally the fingertips of the character Elsa, whose control of the weather is a mixture of direct and indirect will. “She doesn’t just point her hand and snow comes shooting out of it; she’s actually affecting the environment in the way that she creates her magic and the snow is totally based on the performance and the place she is emotionally at any given time.” All the snow except for one scene in the film, Marlon revealed, is tied to Elsa’s feelings.

Even with an effects crew of more than forty, it was never easy. The team had to develop a visual glossary of all the different terminology like frosty and flurry, and some travelled to Jackson Hole, WY to experience deep snow in person. They also had to take up a production schedule unlike any Disney project that has come before, reformatting their typical proess to tackle the unique interplay of characters and effects. “Every week there was some discussion about combinations of Elsa’s magic or how her performance would affect an effect,” said Dale. “On this film we had tons of meetings with all of the departments and it was a lot more of a free-flowing collaborative nature as opposed to a linear one.” Marlon added, “I really hope that continues to be the way we do things going forward. You can see the benefits of it in the film we produced.”


![](http://sungsoo.github.com/images/frozen08.png)

Behind The Scenes of Disney's "Frozen"
---

<iframe width="600" height="400" src="//www.youtube.com/embed/MoH3NtT4els" frameborder="0" allowfullscreen></iframe>

References
---

[1] Alexey Stomakhin, Craig Schroeder, Lawrence Chai, Joseph Teran, and Andrew Selle. 2013. *A material point method for snow simulation*. [ACM Trans. Graph. 32, 4, Article 102](http://dl.acm.org/citation.cfm?id=2461948) (July 2013)
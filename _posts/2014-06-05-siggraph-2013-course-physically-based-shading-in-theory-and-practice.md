---
layout: post
title: Physically Based Shading in Theory and Practice
date: 2014-06-05
categories: [computer science]
tags: [computer graphics]

---

## Article Source
* Title: [SIGGRAPH 2013 Course: Physically Based Shading in Theory and Practice](http://blog.selfshadow.com/publications/s2013-shading-course/)
* Authors: Stephen Hill

[![](http://sungsoo.github.com/images/pbr.png)](http://sungsoo.github.com/images/pbr.png)

---

# SIGGRAPH 2013 Course: Physically Based Shading in Theory and Practice 

![](http://sungsoo.github.com/images/title.jpg)

*© Disney/Pixar 2013.*

Course Description
------------------

Physically based shading is increasingly important in both film and game
production. By adhering to physically based, energy-conserving shading
models, one can easily create high-quality, realistic materials that
maintain their quality in a variety of lighting environments.
Traditional ad hoc models have required extensive tweaking to achieve
the same result, so it’s no surprise that physically based models have
increased in popularity, particularly because they are often no more
difficult to implement or evaluate. Since last year’s course
([*Practical Physically Based Shading in Film and Game
Production*](/publications/s2012-shading-course/), SIGGRAPH 2012), many
advances have been made in this field, and once again game and film
studios present their latest research and production-proven techniques.

Syllabus
--------

* 09:00–09:05 **Introduction** (Stephen Hill)
* 09:05–09:20 **Background: Physics and Math of Shading** (Naty Hoffman)[[slides]](http://blog.selfshadow.com/publications/s2013-shading-course/hoffman/s2013_pbs_physics_math_slides.pdf) [[course notes]](http://blog.selfshadow.com/publications/s2013-shading-course/hoffman/s2013_pbs_physics_math_notes.pdf) ![](http://sungsoo.github.com/images/new.png) [notebook: [mathematica](http://blog.selfshadow.com/publications/s2013-shading-course/hoffman/s2013_pbs_physics_math_notebook.nb),[pdf](http://blog.selfshadow.com/publications/s2013-shading-course/hoffman/s2013_pbs_physics_math_notebook.pdf)]![](http://sungsoo.github.com/images/new.png)
* 09:20–09:40 **Getting More Physical in Call of Duty: Black Ops II** (Dimitar Lazarov) [slides: [ppt](http://blog.selfshadow.com/publications/s2013-shading-course/lazarov/2013_pbs_black_ops_2_slides_v2.pptx), [pdf](http://blog.selfshadow.com/publications/s2013-shading-course/lazarov/s2013_pbs_black_ops_2_slides_v2.pdf)] [[course notes]](http://blog.selfshadow.com/publications/s2013-shading-course/lazarov/s2013_pbs_black_ops_2_notes.pdf) [[notebook]](http://blog.selfshadow.com/publications/s2013-shading-course/lazarov/mathematica.zip)
* 09:40–10:00 **Real Shading in Unreal Engine 4** (Brian Karis) [slides:
* [ppt](http://blog.selfshadow.com/publications/s2013-shading-course/karis/s2013_pbs_epic_slides.pptx), [pdf](http://blog.selfshadow.com/publications/s2013-shading-course/karis/s2013_pbs_epic_slides.pdf)] [[course notes]](http://blog.selfshadow.com/publications/s2013-shading-course/karis/s2013_pbs_epic_notes_v2.pdf)
* 10:00–10:30 **Crafting a Next-Gen Material Pipeline for The Order: 1886** (David Neubelt and Matt Pettineo) [slides:[ppt](http://blog.selfshadow.com/publications/s2013-shading-course/rad/s2013_pbs_rad_slides.pptx), [pdf](http://blog.selfshadow.com/publications/s2013-shading-course/rad/s2013_pbs_rad_slides.pdf)] [[course notes]](http://blog.selfshadow.com/publications/s2013-shading-course/rad/s2013_pbs_rad_notes.pdf) [[video]](http://vimeo.com/70992723)
* [[code]](https://mjp.codeplex.com/releases/view/109905)
* 10:30–10:45 *Break*
* 10:45–11:10 **Everything You Always Wanted to Know About mia_material** (Zap Andersson) [slides: [ppt](http://blog.selfshadow.com/publications/s2013-shading-course/andersson/s2013_pbs_mia_slides_v2.pptx), [pdf](http://blog.selfshadow.com/publications/s2013-shading-course/andersson/s2013_pbs_mia_slides_v2.pdf)] [[course notes]](http://blog.selfshadow.com/publications/s2013-shading-course/andersson/s2013_pbs_mia_notes.pdf)
* 11:10–11:35 **OSL The Great and Powerful** (Adam Martinez) [[slides]](http://blog.selfshadow.com/publications/s2013-shading-course/martinez/s2013_pbs_osl_slides.pdf)
* 11:35–12:15 **Physically Based Shading at Pixar** (Christophe Hery and Ryusuke Villemin) [[slides]](http://blog.selfshadow.com/publications/s2013-shading-course/pixar/s2013_pbs_pixar_slides.pdf) [[course notes]](http://blog.selfshadow.com/publications/s2013-shading-course/pixar/s2013_pbs_pixar_notes.pdf)

**Note**: please direct any corrections or general questions to:
s2013course @ selfshadow . com.

Organisers
----------

**Stephen Hill** is a 3D Technical Lead at Ubisoft Montreal, where his
current focus is on physically based methodologies. He previously held
this role on *Splinter Cell Conviction*, where he helped steer
development of the renderer over the entire (five year) development
period. During that time, he developed novel systems for dynamic ambient
occlusion and visibility.

**Stephen McAuley** is a senior 3D programmer at Ubisoft Montreal,
recently shipping *Far Cry 3*, where he spearheaded the switch to
physically based lighting and materials. Previously he spent five years
at Bizarre Creations, where he worked on games such as *Blood Stone*,
*Blur* and *Project Gotham Racing*, focusing on rendering architecture,
physically based shading and deferred lighting.

Presenters
----------

**Håkan “Zap” Andersson** is a rendering developer at Autodesk. He
previously worked at mental images—where his official title was “Shader
Wizard”—and created many of the most commonly used mental ray shaders in
existence today. Zap is a native of Sweden, with an engineering degree
in electronics and a CAD industry background. He wrote his first
renderer around 1986 for the Swedish ABC80 computer, with a graphics
card he hand-wired himself.

**Christophe Hery** joined Pixar in June 2010, where he holds the
position of Senior Scientist. He wrote new lighting models and rendering
methods for *Monsters University* and *The Blue Umbrella*, and continues
to spearhead research in the rendering arena. An alumnus of Industrial
Light & Magic, Christophe previously served as a research and
development lead, supporting the facility’s shaders and providing
rendering guidance. He was first hired by ILM in 1993 as a senior
technical director. During his career at ILM, he received two Technical
Achievement Awards from the Academy of Motion Pictures Arts and
Sciences.

**Naty Hoffman** is Vice President of Technology at 2K. Previously he
was employed at Activision (working on graphics R&D for various
titles, including the Call of Duty series), SCEA Santa Monica Studio
(coding graphics technology for *God of War III*), Naughty Dog
(developing PS3 first-party libraries), Westwood Studios (leading
graphics development on *Earth and Beyond*) and Intel (driving Pentium
pipeline modifications and assisting the SSE / SSE2 instruction set
definition).

**Brian Karis** is a Senior Graphics Programmer at Epic Games, where he
works on the renderer for Unreal Engine 4. Prior to joining Epic in
2012, he was employed at Human Head Studios and created the renderer for
*Prey 2*, focusing on systems for virtual texturing, lighting and
visibility.

**Dimitar Lazarov** is the Lead Graphics Engineer at Treyarch, where he
worked on the *Call of Duty: Black Ops* and *Call of Duty: Black Ops II*
titles. He has over a decade of experience in game development and has
contributed to a diverse portfolio of games, ranging from kids friendly
titles such as *Casper Spirit Dimensions* and *Kung Fu Panda*, to action
blockbusters such as *Medal of Honor: European Assault*, *True Crime:
New York City* and *Transformers: Revenge of the Fallen*. Dimitar’s main
expertise is graphics programming and performance optimizations, and he
is often involved in system and core engineering, tools programming and
other areas that need his attention to detail.

**Adam Martinez** is a Shader Writer for Sony Pictures Imageworks and a
member of the Shading Department, which oversees all aspects of shader
writing and production rendering at Imageworks. He is a pipeline
developer, look development artist, and technical support liaison for
productions at the studio. He was also one of the primary architects of
Imageworks’ rendering strategy behind *2012* and *Alice In Wonderland*.

**David Neubelt** has served as a Lead Graphics and Engine programmer at
Ready at Dawn Studios since 2005, where he has shipped multiple PSP *God
of War* titles, *Daxter*, and *God Of War: Origins Collection* for PS3.
Most recently, he has helped shape their next-generation engine from its
inception, contributing in many areas, including the development of
production BRDFs and their 3D material scanning pipeline.

**Matt Pettineo** is a Lead Graphics and Engine programmer at Ready at
Dawn Studios, where he has worked since 2009, helping to develop a
physically based shading model and material authoring pipeline for use
in their upcoming title. He also focuses on hardware development and
optimization for next-generation consoles.

**Ryusuke Villemin** began his career at BUF Compagnie in 2001, where he
co-developed BUF’s inhouse raytracing renderer. He later moved to Japan
at Square-Enix as a rendering lead to develop a full package of
physically based shaders and lights for mental ray. After working
freelance for several Japanese studios, he joined Pixar in 2011 as a TD.
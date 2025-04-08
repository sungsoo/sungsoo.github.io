---
layout: post
title: Visualization for Data-Intensive Science
date: 2014-03-22
categories: [computer science]
tags: [big data, computer graphics]

---

### Summary

* Article Source: Visualization for Data-Intensive Science  
* Author: Charles Hansen, Chris R. Johnson, Valero Pascucci, Claudio T. Silva

# Introduction

Since the advent of computing, the world has experienced an information “*big bang*”: an *explosion* of data. The amount of information being created is increasing at an exponential rate. Since 2003, digital information has accounted for 90 percent of all information produced [1], vastly exceeding the amount of information on paper and on film. One of the greatest scientific and engineering challenges of the 21st century will be to understand and make effective use of this growing body of information. *Visual data analysis*, facilitated by *interactive* interfaces, enables the detection and validation of expected results while also enabling unexpected discoveries in science. It allows for the validation of new theoretical models, provides comparison between models and datasets, enables quantitative and qualitative querying, improves interpretation of data, and facilitates decision making. Scientists can use visual data analysis systems to explore “what if” scenarios, define *hypotheses*, and examine data using multiple perspectives and assumptions. They can identify *connections* among large numbers of attributes and quantitatively assess the *reliability* of hypotheses. In essence, **visual data analysis** is an integral part of scientific discovery and is far from a solved problem. Many avenues for future research remain open. In this article, we describe visual data analysis topics that will receive attention in the next decade [2, 3].

# VISUS: Progressive Streaming for Scalable Data Exploration

In recent years, computational scientists with access to the world’s largest supercomputers have successfully simulated a number of natural and man-made phenomena with unprecedented levels of detail. Such simulations routinely produce massive amounts of data. For example, hydrodynamic instability simulations performed at Lawrence Livermore National Laboratory (LLNL) in early 2002 produced several tens of terabytes of data, as shown in **Figure 1**. 

![](http://sungsoo.github.com/images/interactive-visualization.png)

<iframe width="600" height="400" src="//www.youtube.com/embed/R_8R6XzqoUM" frameborder="0" allowfullscreen></iframe>

This data must be visualized and analyzed to verify and validate the underlying model, understand the phenomenon in detail, and develop new *insights* into its *fundamental physics*. Therefore, both *visualization* and *data analysis* algorithms require new, advanced designs that enable high performance when dealing with large amounts of data.

**Data-streaming techniques** and **out-of-core computing** specifically address the issues of algorithm redesign and data layout restructuring, which are necessary to enable scalable processing of massive amounts of data. For example, *space-filling curves* have been used to develop a *static indexing scheme* called **ViSUS**, which produces a data layout that enables the hierarchical traversal of ndimensional regular grids. Three features make this approach particularly attractive: 

1. the order of the data is independent of the parameters of the physical hardware (a cache-oblivious approach)  
2. conversion from Z-order used in classical database approaches is achieved using a simple sequence of bit-string manipulations   
3. it does not introduce any data replication. 

This approach has been used for *direct streaming* and *real-time monitoring* of large-scale simulations during execution [4].

**Figure 2** shows the ViSUS streaming infrastructure streaming LLNL simulation codes and visualizing them in real time on the Blue Gene/L installation at the Supercomputing 2004 exhibit (where Blue Gene/L was introduced as the new fastest supercomputer in the world). The extreme scalability of this approach allows the use of the same code base for a large set of applications while exploiting a wide range of devices, from large powerwall displays to workstations, laptop computers, and handheld devices such as the iPhone.

![](http://sungsoo.github.com/images/scalability-visus.png)

Generalization of this class of techniques to the case of *unstructured meshes* remains a major problem. More generally, the fast evolution and growing diversity of hardware pose a major challenge in the design of software infrastructures that are intrinsically scalable and adaptable to a variety of computing resources and running conditions. This poses theoretical and practical questions that future researchers in *visualization* and *analysis* for *data-intensive* applications will need to address.

# References
[1] C. R. Johnson, R. Moorhead, T. Munzner, H. Pfister, P. Rheingans, and T. S. Yoo, Eds., *NIH-NSF Visualization Research Challenges Report*, IEEE Press, ISBN 0-7695-2733-7, 2006, [http://vgtc.org/ wpmu/techcom/national-initiatives/nihnsf-visualization-research-challenges-reportjanuary-2006](http://vgtc.org/ wpmu/techcom/national-initiatives/nihnsf-visualization-research-challenges-reportjanuary-2006), doi: 10.1109/MCG.2006.44.  
[2] NSF Blue Ribbon Panel Report on Simulation-Based Engineering Science (J. T. Oden,
T. Belytschko, J. Fish, T. Hughes, C. R. Johnson, D. Keyes, A. Laub, L. Petzold, D. Srolovitz, and S. Yip), “*Simulation-Based Engineering Science*,” 2006, [www.nd.edu/~dddas/References/ SBES_Final_Report.pdf](http://www.nd.edu/~dddas/References/ SBES_Final_Report.pdf).  
[3] *NIH-NSF Visualization Research Challenges*, [http://erie.nlm.nih.gov/evc/meetings/vrc2004](http://erie.nlm.nih.gov/evc/meetings/vrc2004).  
[4] V. Pascucci, D. E. Laney, R. J. Frank, F. Gygi, G. Scorzelli, L. Linsen, and B. Hamann, “*Real-time
monitoring of large scientific simulations*,” SAC, pp. 194–198, ACM, 2003, doi: 10.1.1.66.9717.  
[5] S. B. Davidson and J. Freire, “*Provenance and scientific workflows: challenges and opportunities*,” Proc. ACM SIGMOD, pp. 1345–1350, 2008, doi: 10.1.1.140.3264.  
[6] J. Freire, D. Koop, E. Santos, and C. Silva, “*Provenance for computational tasks: A survey*,”
Comput. Sci. Eng, vol. 10, no. 3, pp. 11–21, 2008, doi: 10.1109/MCSE.2008.79.  
[7] J. Freire, C. T. Silva, S. P. Callahan, E. Santos, C. E. Scheidegger, and H. T. Vo, “*Managing rapidly-evolving scientific workflows*,” International Provenance and Annotation Workshop
(IPAW), LNCS 4145, pp. 10–18, 2006, doi: 10.1.1.117.5530.  
[8] C. Silva, J. Freire, and S. P. Callahan, “*Provenance for visualizations: Reproducibility and beyond*,” IEEE Comput. Sci. Eng., 2007, doi: 10.1109/MCSE.2007.106.  
[9] G.-S. Li, X. Tricoche, D. Weiskopf, and C. Hansen, “*Flow charts: Visualization of vector fields on arbitrary surfaces*,” IEEE Trans. Visual. Comput. Graphics, vol. 14, no. 5, pp. 1067–1080, 2008,
doi: 10.1109/TVCG.2008.58.  
[10] G.-S. Li, C. Hansen, and X. Tricoche, *Physically-based dye advection for flow visualization*. Comp. Graphics Forum J., vol. 27, no. 3, pp. 727–735, 2008, doi: 10.1111/j.1467-8659.2008.01201.x.  
[11] “*Visualization and Knowledge Discovery: Report from the DOE/ASCR Workshop on Visual Analysis and Data Exploration at Extreme Scale*,” C. R. Johnson, R. Ross, S. Ahern, J. Ahrens, W. Bethel, K. L. Ma, M. Papka, J. van Rosendale, H. W. Shen, and J. Thomas, [www.sci.utah.edu/vaw2007/DOE-Visualization-Report-2007.pdf](http://www.sci.utah.edu/vaw2007/DOE-Visualization-Report-2007.pdf), 2007.
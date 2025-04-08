---
layout: post
title: Operational Challenges of Predictive Policing
date: 2014-03-06
categories: [computer science]
tags: [big data]

---

Operational Challenges of Predictive Policing
---

**Crime analysis** is a multi-step process that involves both officers and analysts. Several models have been developed to describe this process, though all identify a similar set of steps necessary to *translate raw data into crime-solving actions*. Figure 1 displays the key components of a crime analysis model and the direction of the relationship between them. There are, however, significant hurdles to executing the process described in Figure 1 effectively. After outlining a model of crime analysis in this post, a model of *crime analysis* is presented, followed by *five* commonly encountered challenges.

![model of crime analysis](http://sungsoo.github.com/images/model-of-crime-analysis.png) 

### Question Formulation


The first step requires a police agency to *formulate a question*. The question can be *tactical*, such as predicting the likely locations of auto thefts during a shift; or *strategic*, such as forecasting personnel needs over the next 10 years. 

### Data Identification and Acquistion

After the question has been formulated, the **crime analyst** must determine whether the organization has the *data* needed to answer it. In some cases, the analyst may need to acquire additional data to answer the question. In other instances, the question may need to be modified to accommodate the existing data or the data that can be acquired. 

### Data Processing

After the necessary data have been identified, the data must be processed to be ready for analysis. This may require *cleaning*, *recoding variables*, *inputting missing data*, *validating data*, and *matching observations*. 

### Data Analysis

Once the data have been processed, it is time for analysis. At this stage, the analyst employs one or more of the techniques, such as clustering or social network analysis.  
The purpose of the analysis is to answer the research question and generate operationally relevant recommendations. 

### Actionable Recommendation

The recommendations, when appropriate, are then communicated to officers and integrated into real-time decision-making. 

### Officer Action and Evaluation of Action

After action has been taken, evaluations are conducted to determine if the process resulted in a favorable outcome.

---

The crime analysis process can flow in either a *linear* or *iterative* fashion. The recommendations that result from a data analysis, for example, might surprise the analyst and cause them to revise the data or methods used. In discussing the conclusions from an analysis with officers, the analyst may come to realize that the recommendations cannot be implemented and further analysis is needed to determine a feasible way to proceed. Regular, open, and informed communication between analysts and officers fuels the healthy, and often circular, functioning of the crime analysis process.

The process described above is subject to a number of challenges that warrant special attention by agencies considering implementing a *predictive policing* program.

**Challenge One: Collecting and managing large volumes of accurate data.** Data used by police agencies come from a host of sources, including state governments, the federal government, and private organizations. Assembling, storing, and protecting the security of these data require an investment of time and resources. Moreover, much of the raw information available to police agencies must be translated into useful data. Records relating to *financial transactions, telephone calls, criminal incidents,* and *Internet use*, for example, are **often not collected** and stored for the purpose of *statistical analysis* and must therefore be appropriately formatted [8].


**Challenge Two: Ensuring analysts possess sufficient domain knowledge.** Crime analysis works best when analysts have training in both *methodology* and *substance*. One of the most frequent disruptions in the crime analysis process occurs between the *data analysis* and *developing of actionable recommendations*. If the information provided by analysts fails to assist with actual police operations, the crime analysis process breaks down. To mitigate this problem, analysts should develop an understanding of crime, criminals, and police response [9]. For civilian analysts in particular, this will likely require participation with officers in field police work.

**Challenge Three: Maintaining adequate analytical resources.** To maintain an effective crime analysis unit, an agency must provide adequate *training* and *software*. Because of the evolving nature of analytical tools and methods, analysts need regular training opportunities. In addition, agencies should ensure that analysts have access to necessary software, including databases, statistical programs, and geographical information systems (GIS).


**Challenge Four: Fostering productive communication between analysts and officers.** As Figure 1 depicts, the links between analysis, recommendations, and action are *interactive*. Analysts should modify analyses and recommendations following conversations with officers about the practicality and effectiveness of various courses of action. Further, *regular conversations* between officers and analysts promote mutual understanding of each other’s work and enable all involved to ask better questions and better identify areas of concern.

**Challenge Five: Ensuring officer follow-up on recommendations.** The best recommendations are useless without *follow-up*. Agencies should establish guidelines for how recommendations from crime analysts should be incorporated into *officer decision-making*. Officers should also be empowered to receive *real-time information* from analysts and act on this information.


References
---
[1] Jennifer Bachner, *Predictive Policing; Preventing Crime with Data and Analytics*, Improving Performance Series, [IBM Center for The Business of Government](http://www.businessofgovernment.org), 2013.  
[2] Ned Levine & Associates and the National Institute of Justice, *CrimeStat III: A Spatial Statistics Program*.
[3] Graham Farrell and William Sousa, “*Repeat Victimization and Hot Spots: The Overlap and its Implications for Crime Control and
Problem-Oriented Policing*,” Crime Prevention Studies 12 (2001): 221–240.  
[4] Tony H. Grubesic, “On the Application of Fuzzy Clustering for Crime Hot Spot Detection,” *Journal of Quantitative Criminology* 22 (2006): 77–105.  
[5] Leslie Kennedy, Joel Caplan and Eric Piza, “Risk Clusters, Hotspots, and Spatial Intelligence: Risk Terrain Modeling as an Algorithm for Police Resource Allocation Strategies,” *Journal of Quantitative Criminology* 27 (2011): 339–362.  
[6] Patricia Brantingham and Paul Brantingham, “Criminality of Place,” *European Journal on Criminal Policy & Research* 3–3 (1995): 5–26.  
[7] Joel Caplan, Leslie Kennedy, and Joel Miller, “Risk Terrain Modeling: Brokering Criminological Theory and GIS Methods for Crime Forecasting,” *Justice Quarterly* 28:2 (2011): 360–381.  
[8] Colleen McCue, “Data Mining and Predictive Analytics in Public Safety and Security,” *IT Professional* 8 (2006): 12–18.
[9] Christopher Bruce, “Closing the Gap between Analysis and Response,” *Police Chief Magazine* (2008).
￼￼
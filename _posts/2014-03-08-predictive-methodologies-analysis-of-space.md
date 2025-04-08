---
layout: post
title: Predictive Methodologies - Analysis of Space
date: 2014-03-08
categories: [computer science]
tags: [big data]

---

Predictive Methodologies
---

There are three categories of analysis techniques that police departments use to predict crime:

* Analysis of space

* Analysis of time and space

* Analysis of social networks


These categories are not intended to be all-inclusive, as the number of methodologies available to analysts is large and increasing. Instead, the following provides an overview of the different types of analysis commonly undertaken and the advantages and disadvantages of each.


Predictive Methodology One: Analysis of Space
---

One of the original uses of crime mapping is the *identification of criminal hot spots*, namely areas in which there is a greater likelihood of crime than in the surrounding areas. In a retrospective context, hot spot detection has increased our understanding of the characteristics
associated with high-crime areas, such as transportation routes, entertainment establishments, and a high population density. In terms of predictive policing, hot spot detection can inform short-term decision-making about resource allocation and long-term policies related to crime reduction.

It is important to keep in mind that *a hot spot is a perceptual construct* [2]. Because geographical space is inherently *continuous*, the placement of a boundary to delineate a hot spot is somewhat *arbitrary*. The final location, size, and shape of a hot spot are influenced by *judgments made by the analysts*, such as:


* Which criminal incidents are included in the *analysis*

* Whether the hot spots are determined by the concentration of *past criminal incidents, environmental characteristics* associated with crime, or both

* The *amount* of time captured by the analysis (e.g., one year of crime data vs. five years of crime data)

* The *weighting* scheme applied to past criminal incidents

There are *six* different types of *hot spot detection methods*. Each is briefly described below:


* **Point (or offense) locations.** Point locations are specific addresses on a map that have experienced elevated levels of crime in the past and are therefore expected to experience crime in the future. To detect point locations, sometimes referred to as *hot points*, criminal incidents are temporally aggregated and plotted on a map. *Heat maps* or *dot distribution maps* (where dots are graduated in size according to the amount of criminal activity) are used to display the distribution of point locations.


	The use of point locations is based on the *theory of repeat victimization*, which states that individuals or places that have been victimized once have a much higher likelihood of being victimized again [3]. The concern with using point locations in a predictive framework is twofold. First, the *probability* that an individual or location will be re-victimized decays at an exponential rate following the last incident. This means that point locations quickly lose their predictive value over time. Second, we know that crime is more likely to occur *near* locations that have experienced crime in the past, a phenomenon not captured (directly) by mapping the density of crimes at specific locations.


* **Hierarchical clusters.** The purpose of hierarchical clustering is to *group crime incidents into hot spots*. To generate the clusters using a nearest-neighbor technique, incidents are first compared to one another and the distance between each pair of incidents is calculated. Two or more incidents are then grouped together if the distance between them is less than a threshold distance (defined *a priori*). This process creates *first-order clusters*. The process is repeated to create *higher-order clusters* until a criterion has been met, such as:
	- all clusters contain a *minimum* number of incidents
	- all *lower-order* clusters have converged into a *single* cluster
	- the *distance* between all clusters exceeds the *threshold distance* [4]  
	
	After clustering, the researcher determines *how to display the clusters spatially*. This involves selecting the number of clusters (e.g., **first-order** vs. **second-order**) to display and the method of *delineating* the clusters (e.g., ellipses, convex hulls). An *ellipse* is generated based on the *distribution of the incidents* in a cluster and, by definition, includes geographical space around each incident, which may comport best with the theory that future crime incidents will occur in the vicinity of past incidents. A *convex hull*, in contrast, is the *smallest* amount of geographical space that includes all incidents in a cluster. Imagine that incidents in a cluster were pins on a map and you placed a rubber band around the pins— the geographical space enclosed by the rubber band is the *convex hull*. A convex hull is *denser* (in terms of incidents) than an ellipse, but several of the incidents in the cluster will reside on the boundary line of the hot spot.

	One of the biggest downsides with hierarchical clustering is that the resulting map is highly sensitive to arbitrary choices made by the researcher, such as the *threshold distance*, *number of clusters to map*, and *the shape to draw around clusters of incidents*. Altering one of these choices can substantially alter the resulting map and thereby the decisions made using the **hot spot map**.

* **Partitioned clusters.** In contrast with hierarchical clustering, partitioning involves dividing incidents into clusters by *optimizing a criterion* over all possible partitions. The researcher selects the number of partitions (*k*) a *priori*, and each incident is assigned to one (and only one) cluster.  

	One of the **key challenges** with partitioning is *identifying the most appropriate number of clusters*. Although there are several techniques for *determining k*, they often yield different numbers and *no theoretical justification* for choosing one over the other. A second concern with partitioning is the constraint that all incidents must be assigned to a cluster and that no incident can be assigned to multiple clusters. In some instances, an incident might not reasonably belong in any cluster. In other instances, an incident might equally belong in two (or more) clusters.  

* **Fuzzy clusters.** This category of methods relaxes several of the assumptions required by traditional partitioning techniques [4]. Although the researcher must define the number of **clusters** (*k*) *a priori*, incidents can be members of multiple clusters or no clusters. This *reduces* the bias associated with outliers and multi-cluster incidents. For each incident, a *fuzzy clustering algorithm* generates a *probability* that the incident is a member of each cluster. Each incident is there assigned *k* probabilities, which sum to one.

* **Density mapping.** Density mapping is a category of methods that involve *statistically smoothing* over individual crime incidents. A computer algorithm places a *symmetrical distribution* (known as a *kernel function*) over points, such as the locations of crime incidents. The individual distributions are then added together to create a *single density distribution*. The resulting map looks similar to a topography map; *areas with a higher “elevation” have a higher density of crime* [2].  

	As with the other clustering methods, the analyst must make an *a priori* decision that influences the results. With *density estimation*, the analyst selects a bandwidth for the *kernel function*. The bandwidth is the distance from the points, such as crime incidents, to the edge of the distribution. A *larger bandwidth* results in a smoother final density distribution, but may mask important variation. A *smaller bandwidth* preserves the variation in crime density, but may prevent the analyst from uncovering big-picture patterns.
	
* **Risk-terrain modeling (RTM) clusters.** This (comparatively) *new* category of clustering methods, also referred to as *risk-based clusters*, incorporates *multiple variables* into the detection of hot spots. Rather than relying solely on past crime data, risk terrain models incorporate *geocoded* data about numerous aspects of a location; this type of data is increasingly available in vast quantities. RTM is the frontier of predictive policing, as it allows analysts to leverage decades of *criminological*, *sociological*, and *psychological* research:  
	> While hotspot mapping has allowed police to address the concentration of crime, it has generally turned attention away from the **social contexts** in which crime occurs. Predictions about crime occurrence are then based on what happened before in locations rather than on the behavioral or physical characteristics of places within communities. This has detached crime analysis from early work done in criminology on the effects that different factors had on the social disorganization of communities, and, in turn, on crime [5].  

	The theory of RTM is that each geographical location has a different *propensity* for crime based on its *spatial environmental characteristics*, including those listed in Table 1. Some of these characteristics, such as stadiums and shopping malls, are crime generators, as they create crime opportunities at specific points in time because of the large concentration of people that pass through. Other characteristics, such as a concentration of bars or liquor stores, are referred to as crime attractors, as they appeal to criminals looking for opportune locations [6]. Both categories of characteristics, however, contribute to the risk level of a location.

	RTM requires the analyst to identify those characteristics that *predict the risk of a certain type of crime*, such as *shootings*, *burglaries*, or *robberies*. The process of identification is subjective, but should be informed by *criminological theories*, *existing empirical research*, and *practitioner knowledge* [7]. After identification, each risk factor is operationalized and linked to a specific unit of geography. The risk factors are then incorporated, in layers, onto a composite map using GIS. Each location on the composite map is assigned a level of risk based on the included risk factors, where a higher risk level indicates a higher probability that the particular crime under analysis will occur in that area. Police departments can then allocate resources based on the distribution of risk in its jurisdiction.  

	Although academic research has demonstrated the efficacy of RTM, few police departments have adopted this approach to law enforcement. On-the-ground policing requires dynamic response, which can be better achieved through more user-friendly and easily accessible *crime mapping programs* (in which *hot spots are detected using patterns of past crime events*). At the time of this writing, RTM requires a substantial amount of time and analytical skill to *develop risk layers* and *generate risk-composite maps*. Until this analysis can be performed in (close to) real time and the results translated into actionable recommendations, police departments will be reluctant to embrace this method of crime prediction.

	Just as with the other clustering methods, *the final map is sensitive to analyst judgment*. With RTM, the analyst must determine which risk layers to include in the composite map and which to exclude. If the risk distribution in the composite map is highly sensitive to changes in the risk layers, decision-making based on the map becomes exceedingly difficult.

![variables used in predictive policing](http://sungsoo.github.com/images/variables-used-in-predictive-policing.png)  


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
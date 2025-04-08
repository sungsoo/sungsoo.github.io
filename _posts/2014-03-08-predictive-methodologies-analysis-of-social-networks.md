---
layout: post
title: Predictive Methodologies - Analysis of Social Networks
date: 2014-03-08
categories: [computer science]
tags: [big data, analytics, graph mining]

---

Predictive Methodology Three: Analysis of Social Networks
---

The chief purpose of the previous two categories of methods discussed is the targeting of geographic locations in which to focus time and resources. **Social network analysis (SNA)** is a third category of methods on the *cutting edge of crime analysis*, but it is primarily used to *detect persons of interest*, as opposed to *locations of interest*. Through SNA, police can identify individuals that are central to criminal organizations, such as *gangs* and *drug networks*, and develop effective interdiction strategies.

The relevance of social networks to *criminological analysis* is well-established. Organized crime, such as drug trafficking, gang violence, and serial robbery, requires the creation and maintenance of various relationships. A *drug-dealing network*, for example, may include suppliers, distributors, smugglers, buyers, and money-launderers. Further, criminal networks are embedded in the social context in which they operate; they are nourished by, and victimize, members of the community, including family, friends, and retailers. SNA is a tool police agencies can use to map these numerous *interpersonal connections* and *mine them* for *actionable information*.


*The building blocks of a social network are relationships between two actors (either individuals or entities)*. Actors are referred to as nodes and the relationships between them are termed links or edges. The **relationship** that connects nodes is defined by the research question; it can take the form of an exchange, communication, familial connection, affiliation with an organization, connection to a criminal act (either as an offender or victim), or something else. Once an analyst has identified a set of nodes for potential inclusion and defined the relationship of interest, they can generate a visual display of the social network and statistics to summarize the network. One statistic of interest may be a measure of **network density**. In a complete network, every node is connected to every other node. *The density of a network decreases as the number of links decreases*.

In *crime-fighting applications*, social network analysis is frequently used to *identify central nodes*—individuals who have a *high level of connectivity* within the network. There are multiple *measures of centrality*, including *degree*, *closeness*, and *betweenness*, which are calculated for each node [8]. Analysts can then rank all nodes in the data set. *Degree centrality* is defined as the number of links possessed by a node, *closeness centrality* is the total distance (measured in links) from a node to all other nodes in the network, and *betweenness centrality* is the number of instances a given node appears in the shortest path between other nodes. Measures of centrality indicate a node’s level of connectedness (**degree**), ease of obtaining information from the network (**closeness**), and relevance to the passage of information within the network (**betweenness**) [9].


Using *centrality* measures, an analyst can i*dentify individuals of interest* in the context of a given problem. If a police agency seeks to acquire information about a network without dismantling it, contacting an actor with a high level of closeness might be effective. Alternatively, a goal of inserting information into a network might best be achieved using an actor with a *high betweenness* measure. If an agency’s mission is to take custody of a network’s leaders or central actors, the measure of degree may be most useful.


The Richmond Police Department (RPD), in conjunction with researchers at Virginia Commonwealth University, developed a successful pilot program to integrate social network analysis into its crime-solving approaches. The program was initially used to understand why violence had erupted between two groups of males. Using the betweenness measure, analysts identified males who were central connectors to the various sub-networks embedded in the overall social network of the two groups of males. A visualization of the network revealed that these central males were connected, through aggravated assault, to key females in the network; corroborating work by police detectives confirmed that the victimization of female friends explained the outbreak of violence.

In a predictive context, Richmond has solved cases through the identification of likely perpetrators. In a homicide case, analysts developed a social network visualization to determine potential points of entry for obtaining access to a critical witness. The social network analysis allowed the detective on the case “*to efficiently and effectively move his personnel resources to strategically navigate the suspect into the hands of the police.*”


In another case, police used SNA to link a person of interest in several convenience store robberies to incidents in other jurisdictions. The social network analysis revealed a connection between 16 robberies previously unknown to be linked.41 More complete information greatly improves an agency’s ability to make optimal tactical choices and solve crimes.


The *effectiveness of SNA*, as with all other forms of analysis, is partially dependent upon the decisions made by the analyst. When defining a network, the analyst makes a series of specification decisions:


* Which initial members (*seeds*) to include in the network

* Which *types of relationships* to include

* The *number of steps* removed from the seeds to include

* How to *identify the population* of possible nodes for inclusion


The decisions above define the boundary of a social network. If a mapped network is too small or too large, the key actors or points of entry will not emerge. Specification decisions should be guided by the nature of the crime under investigation and general domain knowledge.


While social networking analysis can be a powerful tool, and is used widely in the commercial sector for marketing and other initiatives, it needs to be used appropriately, and within *legal constraints*, when used in *law enforcement*. Appropriate safeguards and procedures will need to be put in place to ensure the public that such analyses are not misused, to either undermine the *privacy of individuals* who are not under suspicion, or undercut the due process rights of individuals who are under surveillance.


A February 2013 report for the U.S. Department of Justice’s Global Justice Information Sharing Initiative recognized the importance of addressing privacy across all forms of analysis impacting social networks conducted by law enforcement. This report, [*Developing a Policy on the Use of Social Media in Intelligence and Investigative Activities*](http://it.ojp.gov/docdownloader.aspx%3Fddid=1826), draws lessons from the practices of a variety of local police authorities, and makes a series of recommendations for how to protect privacy in investigative settings.

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
[8] Evelien Otte and Ronald Rousseau, “Social Network Analysis: A Powerful Strategy, Also for the Information Sciences,” *Journal of Information Science* 28 (2002): 441–453.  
[9] Jennifer Johnson and John David Reitzel, “*Social Network Analysis in an Operational Environment: Defining the Utility of a Network Approach for Crime Analysis Using the Richmond City Police Department as a Case Study*,” International Police Executive Symposium, Geneva Centre for the Democratic Control of Armed Forces (November 2011).
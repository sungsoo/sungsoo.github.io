---
layout: post
title: Data Used in Predictive Policing
date: 2014-03-07
categories: [computer science]
tags: [big data, analytics, graph mining]

---

Data Used in Predictive Policing
---

The amount of data available to police is growing at an exponential rate. In fact, the amount of data in the world is estimated to double every 20 months, as data are generated through every transaction, recorded event, and even transfers of electricity [2]. As predictive policing evolves over the next decade, more data will be available to optimize public safety efforts.


The most basic predictive models rely on past crime data. This has roots in the theory of repeat victimization, which is well-established. Individuals, businesses, and residences that are victimized once are likely to be the targets of crime again. Analysts therefore use incident variables, such as the type of offense, the time of day it was committed, and the day of the week it was committed to generate predictions about the locations of future crimes of that same type.

Emerging predictive methods, however, can incorporate data from a far wider range of sources to generate predictions about where crime is likely to occur and where suspected criminals are likely to be located. These variables can be divided into three categories:

* **Spatial**
* **Temporal**
* **Social network**

Table 1 presents examples of variables in each of these categories.

![variables used in predictive policing](http://sungsoo.github.com/images/variables-used-in-predictive-policing.png)

**Spatial variables include variables that capture physical aspects of geographical spaces**. This category is further divided into indicators of the following:

* Areas with potential victims  
* Escape routes  
* Criminal residences


The first of these three subcategories includes variables that predict the presence of potential victims. Population density, the presence of luxury items (expensive cars), and the presence of distracted individuals (tourists) are all indicators of areas targeted by criminals. The second subcategory includes indicators of areas with desirable escape routes. Areas in close proximity to features such as interstate highways, bridges, and tunnels are more desirable crime locations than areas away from these key geographical connectors. Lastly, the third subcategory includes variables frequently correlated with criminals’ residences, such as bars and liquor stores. Once again, analysts must be creative when considering which data may be appropriate for this category. Public health data, for example, often provide geocoded statistics on drug overdoses, which may serve as useful predictors.

**Temporal variables include variables that vary across time (as opposed to geographical space)**. Seasonal weather patterns, for example, have substantial predictive power for a variety of crimes, such as suicide and auto thefts [3]. Two theories dominate the literature to explain *why crime rates shift with seasons*.

* **The aggression theory** states that high temperatures induce feelings of anger, frustration, and irritation, which lead to aggressive behavior. This theory has been linked to violent crime, as it is often an expression of human aggression.  

* **The social behavior theory** focuses instead on the change in human activities associated with a change in seasons. According to this theory, warmer temperatures cause people to spend more time outside their homes. When people are away from their homes, they are more likely to be the victims of crime and their homes are more likely to be burglarized.
The social behavior theory, therefore, predicts an increase in both violent and property crime during warmer weather [4].

Through rigorous tests of these two theories using crime and weather data from all 50 states, researchers have found strong support for the social behavior theory; seasonal variation in our routine activities is positively related to higher rates of violent and property crime.18 In addition, the aggression-violent crime relationship is evident in states that experience exceptionally high temperatures, such as Texas.

**Social network analysis variables describe the relationship between two individuals**. When conducting a social network analysis, the research must specify which types of social interactions will define which individuals are included. Individuals can be linked through kinship, friendship, enmity, affiliation with an organization, or participation in a financial transaction or crime (offender/victim relationship). These interactions can be positive or negative. The decision about which interactions to include is driven by the research question. If analysts seek to predict the hideout of a suspected offender, they could diagram the individual’s social resources, which might include positive ties to family members, friends, and business associates.

Potentially, a separate table could be designed for each type of crime (burglaries, homicides, sexual assaults) as the occurrence of each is best predicted by a different set of variables. Whereas some crimes are most likely to occur in densely populated areas (pickpocketing), other crimes (sexual assault) are most likely to occur in secluded areas. The presence of a shopping mall might therefore be a strong predictor of pickpocketing but not of sexual assault. On the other hand, analysts may be hesitant to exclude variables when developing predictive models for a particular type of crime, as it is easy to overlook the relevance of a variable. Returning to the shopping mall example, secluded areas such as stairwells and parking lots abound in shopping malls; therefore, excluding this variable from a predictive model of sexual assault crimes would be unwise. In short, one of the key benefits of predictive policing is that previously unknown or overlooked patterns emerge, and police departments can facilitate this process by marshaling as much potentially relevant data as can be handled by analysts and software.

References
---
[1] Jennifer Bachner, *Predictive Policing; Preventing Crime with Data and Analytics*, Improving Performance Series, [IBM Center for The Business of Government](http://www.businessofgovernment.org), 2013.  
[2] Colleen McCue and Andre Parker, “*Connecting the Dots: Data Mining and Predictive Analytics in Law Enforcement and Intelligence Analysis*,” Police Chief Magazine, July 2012.  
[3] Sociologist Emile Durkheim, in *Suicide*, 1951.  
[4] John Hipp, Patrick Curran, and Kenneth Bollen, “*Crimes of Opportunity or Crimes of Emotion? Testing Two Explanations of Seasonal Change in Crime*,” Social Forces 82:4 (2004), pp. 1333–1372.
---
layout: post
title: Traffic Prediction
date: 2018-03-07
categories: [computer science]
tags: [design patterns]

---


## Article Source
* Title: [Traffic Prediction](https://www.ibm.com/support/knowledgecenter/en/SSTMV4_1.6.0/transport/ov_tp.html)

---

# Traffic Prediction

The Traffic Prediction feature of IBM® Intelligent Operations for Transportation provides traffic prediction capabilities for transportation authorities. The Traffic Prediction feature uses the *historical* and *real-time* traffic data that is collected by the **Traffic Awareness system** to predict future traffic levels of a geographical area, up to an hour in advance.

Traffic Prediction is an optional feature that enhances the IBM Intelligent Transportation solution by providing the following benefits:

* Geographical visibility of predicted traffic levels at selected time intervals ahead of the current time *up to one hour ahead* of the current time. For example, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, or 60 minutes
* Listed view of details that are related to the predicted traffic levels at selected time intervals ahead of the current time, as selected with the Prediction interval slider. For example, 5, 10, 15, 30, 45, or 60 minutes
* Executive reports for traffic prediction that are based on *speed* and *volume*
* *Accuracy reports* analyzing traffic prediction data


The *Traffic Prediction predictive analytics* perform estimate and mean calculations that are required by the algorithm to generate near future traffic levels. Three months of historical traffic speed or volume data is required for the generation of future traffic levels.

The following table describes the detailed subsystems that are provided by the Traffic Prediction feature.

<div class="tablenoborder"><table class="defaultstyle ibm-grid margin-bottom-1"><tbody><tr><th id="d2527154e77" class="thleft thbot">Subsystems</th>
<th id="d2527154e79" class="thleft thbot">Provides</th>
</tr>
<tr><td headers="d2527154e77">Predictive analytics</td>
<td headers="d2527154e79">Complex algorithms and processes that generate predictions
of the traffic levels of a geographical area, one hour from the current
time. The predictions are based on historical traffic speed and volume
data from the previous three months. You can also provide the holiday
data for your transportation network to further improve the accuracy
of the predicted traffic levels.</td>
</tr>
<tr><td headers="d2527154e77">Traffic prediction visualization</td>
<td headers="d2527154e79">Processes and a graphical user interface to display the traffic
prediction data. The predicted traffic levels are displayed on a GIS
map and a table.</td>
</tr>
<tr><td headers="d2527154e77">Traffic prediction reports</td>
<td headers="d2527154e79">A graphical user interface to analyze and display summary
reports of traffic predictions. The reports are based on speed and
volume.</td>
</tr>
<tr><td headers="d2527154e77">Accuracy reports</td>
<td headers="d2527154e79">A graphical user interface to analyze and display reports
that summarize the accuracy of traffic predictions.</td>
</tr>
<tr><td headers="d2527154e77">Administrative and operational interfaces</td>
<td headers="d2527154e79">A browser-based graphical user interface that includes an
administration view to facilitate traffic prediction. The interface
also includes role-based administrative features, providing the capability
to configure traffic prediction settings so that it can correctly
operate within a particular customer environment. The Traffic IT Administrator
has the permission to configure the settings for the traffic prediction
calculations in the <span class="ph"><span class="ph uicontrol" id="ov_tp__d25637e79">Administration</span></span> view
of the solution interface.</td>
</tr>
<tr><td headers="d2527154e77">Programming and client interfaces</td>
<td headers="d2527154e79">REST services that provide outbound subscription and publishing
capabilities to retrieve current and predicted traffic data from the
solution into XML format. Extends the <span class="keyword cmdname">LinkStatus</span> REST
service that is provided by the <span class="ph">Traffic Awareness</span> feature.</td>
</tr>
</tbody></table></div>


The information from the traffic management subsystem is presented in the **IBM Intelligent Transportation portal solution interface**. The Operator: Traffic view displays the current and the forecasted traffic situation.
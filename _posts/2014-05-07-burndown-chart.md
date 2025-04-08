---
layout: post
title: Burndown Chart
date: 2014-05-07
categories: [computer science]
tags: [design patterns]

---

## Article Source
* Title: [Burn down chart](http://en.wikipedia.orghttp://en.wikipedia.org/wiki/Burn_down_chart)
* Authors:  *Wikipedia, the free encyclopedia*


[![](http://sungsoo.github.com/images/burndown-chart.png)](http://sungsoo.github.com/images/burndown-chart.png)

# Burn down chart 

[![](http://upload.wikimedia.org/wikipedia/commons/thumb/0/05/SampleBurndownChart.png/220px-SampleBurndownChart.png)](http://en.wikipedia.org/wiki/File:SampleBurndownChart.png)

[![](http://bits.wikimedia.org/static-1.24wmf1/skins/common/images/magnify-clip.png)](http://en.wikipedia.org/wiki/File:SampleBurndownChart.png "Enlarge")

A sample burn down chart for a completed iteration, showing remaining
effort and tasks for each of the 21 work days of the 1-month iteration.

A **burn down chart** is a graphical representation of work left to do
versus time. The outstanding work (or backlog) is often on the vertical
axis, with time along the horizontal. That is, it is a [run
chart](http://en.wikipedia.org/wiki/Run_chart "Run chart") of outstanding work. It is useful
for predicting when all of the work will be completed. It is often used
in [agile software
development](http://en.wikipedia.org/wiki/Agile_software_development "Agile software development")
methodologies such as
[Scrum](http://en.wikipedia.org/wiki/Scrum_(development) "Scrum (development)"). However, burn
down charts can be applied to any project containing measurable progress
over time.

Outstanding work can be represented in terms of either time or story
points.[[1]](#cite_note-1)

Contents
--------

-   [1 Reading burn down charts](#Reading_burn_down_charts)
-   [2 Measuring performance](#Measuring_performance)
-   [3 Removing variability in time
    estimates](#Removing_variability_in_time_estimates)
-   [4 References](#References)
-   [5 Further reading](#Further_reading)

<a name="Reading_burn_down_charts"></a>
## Reading burn down charts

[![](http://upload.wikimedia.org/wikipedia/commons/8/8c/Burn_down_chart.png)](http://en.wikipedia.org/wiki/File:Burn_down_chart.png)

A project burn down chart generated from a google docs
template[[2]](#cite_note-2)

A burn down chart for a completed iteration is shown above and can be
read by knowing the following.

<table class="wikitable">
<tr>
<td style="min-width: 10em">X-Axis</td>
<td>The project/iteration timeline</td>
</tr>
<tr>
<td>Y-Axis</td>
<td>The work that needs to be completed for the project. The time or story point estimates for the work remaining will be represented by this axis.</td>
</tr>
<tr>
<td>Project Start Point</td>
<td>This is the farthest point to the left of the chart and occurs at day 0 of the project/iteration.</td>
</tr>
<tr>
<td>Project End Point</td>
<td>This is the point that is farthest to the right of the chart and occurs on the predicted last day of the project/iteration</td>
</tr>
<tr>
<td>Ideal Work Remaining Line</td>
<td>This is a straight line that connects the start point to the end point. At the start point, the ideal line shows the sum of the estimates for all the tasks (work) that needs to be completed. At the end point, the ideal line intercepts the x-axis showing that there is no work left to be completed. Some people take issue with calling this an "ideal" line, as it's not generally true that the goal is to follow this line. This line is a mathematical calculation based on estimates, and the estimates are more likely to be in error than the work. The goal of a burn down chart is to display the progress toward completion and give an estimate on the likelihood of timely completion.</td>
</tr>
<tr>
<td>Actual Work Remaining Line</td>
<td>This shows the actual work remaining. At the start point, the actual work remaining is the same as the ideal work remaining but as time progresses, the actual work line fluctuates above and below the ideal line depending on how effective the team is. In general, a new point is added to this line each day of the project. Each day, the sum of the time or story point estimates for work that was recently completed is subtracted from the last point in the line to determine the next point.</td>
</tr>
</table>

<a name="Measuring_performance"></a>
## Measuring performance

<table class="wikitable">
<tr>
<td>Actual Work Line is above the Ideal Work Line</td>
<td>If the actual work line is above the ideal work line, it means that there is more work left than originally predicted and the project is behind schedule.</td>
</tr>
<tr>
<td>Actual Work Line is below the Ideal Work Line</td>
<td>If the actual work line is below the ideal work line, it means that there is less work left than originally predicted and the project is ahead of schedule.</td>
</tr>
</table>

The above table is only one way of interpreting the shape of the burn
down chart. There are others.[[3]](#cite_note-3)

<a name="Removing_variability_in_time_estimates"></a>

## Removing variability in time estimates

One issue that may be noticed in burn down charts is that whether or not
the Actual Work line is above or below the Ideal Work line depends on
how accurate the original time estimates are. This means that if your
team constantly overestimates time requirements, the progress will
always appear ahead of schedule. If they constantly underestimate time
requirements, they will always appear behind schedule. This issue is
corrected by incorporating an efficiency factor into the burn down
chart. After the first iteration of a project, the efficiency factor can
be recalculated to allow for more accurate estimates during the next
iteration. Some templates automatically calculate the efficiency as a
project progresses. This can be used to identify areas/phases where
inaccurate estimates consistently occur.[[4]](#cite_note-4)

<a name="References"></a>
# References

1.  <a name="cite_ref-1"></a>["Feel The Burn, Getting the Most out of Burn
    Charts"](http://idiacomputing.com/pub/BetterSoftware-BurnCharts.pdf).
    July 2009.  Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
2.  <a name="cite_ref-2"></a>["Agile Burn Chart - Release Burndown
    Charts"](http://www.mountaingoatsoftware.com/agile/scrum/release-burndown). 
3.  <a name="cite_ref-3"></a>["Feel The Burn, Getting the Most out of Burn
    Charts"](http://idiacomputing.com/pub/BetterSoftware-BurnCharts.pdf).
    July 2009.  Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
4.  <a name="cite_ref-4"></a>["Burn Down Chart Tutorial: Simple Agile
    Project
    Tracking"](http://joel.inpointform.net/software-development/burn-down-charts-tutorial-simple-agile-project-tracking/).
    December 2010. 

<a name="Further_reading"></a>
# Further reading

-   [Burn Down Chart Tutorial: Simple Agile Project
    Tracking](http://joel.inpointform.net/software-development/burn-down-charts-tutorial-simple-agile-project-tracking/)
-   [Release
    Burndown](http://www.mountaingoatsoftware.com/release_burndown)
-   [Earned Value and burn
    charts](http://alistair.cockburn.us/Earned-value+and+burn+charts)
-   [Feel The Burn, Getting the Most out of Burn Charts, Better
    Software, July/August 2009, Volume 11, Issue 5, pp.
    26-31](http://idiacomputing.com/pub/BetterSoftware-BurnCharts.pdf)


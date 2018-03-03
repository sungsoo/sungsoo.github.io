---
layout: post
title: Processing 100 Billion IoT Events
date: 2018-03-15
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Traffic in London episode II: Predicting congestion with Tensorflow](http://blog.datatonic.com/2016/10/traffic-in-london-episode-i-live.html)
* Authors: Matthias Baetens

---

# Traffic in London episode I: processing 100 billion IoT events

A couple of weeks ago we - the Datatonic UK team - participated in a
hackathon organised by Transport for London. At the kick-off session, we
received background information on all the challenges Transport for
London (TfL), and by extension London, is facing: firstly, congestion on
the wider transport network (managing 30 million journeys daily),
secondly, air pollution throughout London, and thirdly, more
specifically, congestion on the roads.


The hackathon
-------------

After the general introduction, the datasets were specified, and one of
them immediately grabbed our attention: the data originating from the
Urban Traffic Control system (UTC-data) spanning 3 months, registering
car activity all over London using more then 14 000 sensors. The whole
dataset amounted to over *120 billion lines*, and we were curious about
the challenge of processing this data and putting it to good use.

The goals
---------

After some discussions and brainstorming, we came up with the 2 goals.
We would direct our efforts at:

1. **Visualising** this vast amount of data in a cool and interactive
    way;
2. **Analysing** the data in a more aggregated way and try to predict
    the future state of the traffic - with the ultimate goal of **predicting
    congestion**. This included trying to become traffic experts in a very
    short amount of time... (if you want to become one yourself, have a look
    [here](http://www.paulbennett.id.au/trafeng.php) and [here](https://en.wikipedia.org/wiki/Traffic_flow))
  
[![](https://2.bp.blogspot.com/-Kiv4o7Ttcrw/WA-asQu5rNI/AAAAAAAAADM/WHcjWffiCnsE17KG5QiHkto6gzpYPiRnACLcB/s400/hackweek-1-of-8.jpg)](https://2.bp.blogspot.com/-Kiv4o7Ttcrw/WA-asQu5rNI/AAAAAAAAADM/WHcjWffiCnsE17KG5QiHkto6gzpYPiRnACLcB/s1600/hackweek-1-of-8.jpg)

*Transport for London Hackweek: kick-off session*

The data 
--------

Let us give you a quick introduction to the data. London is divided into
5 zones (NORTH, SOUTH, CENTER, OUTER and EAST). All the files were
stored as zipped CSVs on [Google Cloud
Storage](https://cloud.google.com/storage/) (GCS), a total of about
*5TB*, every file containing 5 minutes of data per zone. Every line in
the file contained a timestamp (measurements are taken every quarter of
a second), a certain amount of sensors (up to 8) specified with a sensor
ID , a bitstring and some less important information.


The part we are interested in, is the bitstring. This represents the
presence or absence of a car; for example: for timestamp 26-10-2016
16:38:02 and bitstring "0010" this would mean a car was present on top
of the sensor at 16:38:02.500 today and no car was present on top of the
sensor for the timestamps 16:38:02.000, 16:38:02.250 and 16:38:02.750.

The architecture 
----------------

When we hear "5TB of data" and "processing, analysing and transforming
data" in one sentence, we immediately think [Apache
Beam](http://beam.incubator.apache.org/) (running as "[Google
Dataflow](https://cloud.google.com/dataflow/)"). So we got to the
drawing board and starting drafting an architecture for all this. You
can see the result below:

[![](https://1.bp.blogspot.com/-NTrkLqFYPx8/WA-pT4qUTNI/AAAAAAAAADg/OGMIJsLXzbAJYjzBVwVf8l5N7Rf6YZUlQCLcB/s1600/pipeline.png)](https://1.bp.blogspot.com/-NTrkLqFYPx8/WA-pT4qUTNI/AAAAAAAAADg/OGMIJsLXzbAJYjzBVwVf8l5N7Rf6YZUlQCLcB/s1600/pipeline.png)

*Processing 120 billion rows using Google Dataflow*
  
The pipeline includes a look-up to a file containing the coordinates of
each sensor, some windowing (to get an aggregated view over 5 minutes)
and some grouping and combining  by sensorID. We won't go into too much
detail here, because that might lead us too far (and you guys might stop
reading). 

Take-away is that Dataflow poses a rather **easy way to write processing
logic and can scale with the click of a button**: we ran the pipeline
using 150 machines, in order to get the resulting data written to
BigQuery overnight, so we could keep up with the high pace of the
hackweek. 

We should mention though that the pipeline we constructed here is just a
proof of concept. Optimisation is certainly possible (and recommended)
and could improve the efficiency of the pipeline by several factors.
This would in turn reduce the computation time needed and/or reduce the
number of machines used. This puts the time you see in each block in
perspective: the *ReadFromStorage-step *for example did not last 1 day 2
hr 33 min in real life but is merely the combined computation time of
all the machines running the code and processing the data. If you were
to time this step while it is running, it would most likely last about
10 minutes!

We didn't rest on our laurels while the Dataflow job was running though.
Instead, we went back to the drawing board and came up with the full
architecture for our problem. Reading the files from GCS (and in the
future maybe from [Google
PubSub](https://cloud.google.com/pubsub/docs/overview), when TfL
provides the data as a streaming service), processing with Dataflow,
writing to BigQuery for Tableau analysis and predictions and to PubSub
for live visualisation and predictions).
  
[![](https://4.bp.blogspot.com/-rc8V0pPSOdk/WA-tNB6ad6I/AAAAAAAAADs/YZl0O6MVH5UkSwakZO_F3CKzZNe4XgWLQCK4B/s640/London%2BDiagram.png)](http://4.bp.blogspot.com/-rc8V0pPSOdk/WA-tNB6ad6I/AAAAAAAAADs/YZl0O6MVH5UkSwakZO_F3CKzZNe4XgWLQCK4B/s1600/London%2BDiagram.png)

*Overview of the full architecture*

The results
-----------

For this blogpost we left the prediction part out of scope (but it gives
you a sneak peak into what our next blogpost might be about ;)). For the
live visualisation we used [Processing](https://processing.org/), an
open-source programming language aimed at programming in a visual
context and largely based on Java.
  
[![](https://2.bp.blogspot.com/-lohclCQ4bXY/WA-0kO3UtZI/AAAAAAAAAEE/xKb6sQA0mYUIvyv6KieMX1yeyPEnMzdggCK4B/s640/screen-0092.png){width="640" height="366"}](http://2.bp.blogspot.com/-lohclCQ4bXY/WA-0kO3UtZI/AAAAAAAAAEE/xKb6sQA0mYUIvyv6KieMX1yeyPEnMzdggCK4B/s1600/screen-0092.png)

*Screenshot of the visualisation*

Some more context on what you see might be interesting:

* In the box on the left you can see:
    * The selected sensor.
    * The location of the sensor.
    * The date and timestamp of the window we're looking at.
    * Some calculated measures relevant for traffic engineers: flow, occupancy and average speed estimation.
    * The raw data: a box is white when a car is on top of the sensor, blue when no car is on top of the sensor.
    * The current timestamp.

* The map itself shows:
   + All the sensors in their exact locations.
   + The sensor lights up (white) when a burst of 1's (consecutive white boxes in the grid on the left) starts.

The takeaways
-------------

Apart from looking very cool, this tool might be useful to people
**monitoring traffic** or learning about traffic engineering.  Moreover,
it's useful as a first step into **analysing** this type of
**sensordata**. Technically, we see that **Google Dataflow** is capable
of **scaling up easy and fast**, and is able to meet our large
processing requirements. A nice add-on to this, is that the **Apache
Beam SDK is future proof**: this code can be re-used completely, with
very few changes, to process data from a real-time live stream instead
of batch file input (one of the key benefits of Apache Beam).

To be continued... read our next blog post about how we use this
processed data to do congestion predictions one hour ahead.

*Thanks to the great team at TfL for organising the demo and providing
the data. Watch this space for an interactive demo for you to play
with!*

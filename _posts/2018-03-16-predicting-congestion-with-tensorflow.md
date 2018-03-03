---
layout: post
title: Predicting Congestion with Tensorflow
date: 2018-03-16
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [Traffic in London episode II: Predicting congestion with Tensorflow](http://blog.datatonic.com/2016/11/traffic-in-london-episode-ii-predicting.html)
* Title: [Transport for London demo: live traffic visualisation](https://www.youtube.com/watch?v=4X_p_zXnpMA)
* Authors: Oliver Gindele

---

# Traffic in London episode II: Predicting congestion with Tensorflow

A few weeks ago Datatonic took part in a hackathon organised by
Transport for London (TfL). At the hackathon we received data from road
sensors in London which allowed us to build a nice real-time traffic
visualisation which you can find in this blog
post [here](http://blog.datatonic.com/2016/10/traffic-in-london-episode-i-live.html).
 You can also find more information about the hackathon in that post and
some details on how we processed the raw sensor data with Dataflow
(Apache Beam).

## Live Traffic Visualisation

This demo was build for a Transport for London hackathon. 

Live traffic is visualised and key parameters related to traffic analysis are calculated on the fly using Google Dataflow. 

<iframe width="600" height="400" src="https://www.youtube.com/embed/4X_p_zXnpMA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

In this post we use the traffic data and build something quite
different: A deep learning model that predicts congestion!

## Visualising road traffic

The TfL data we use stems from sensors placed at traffic junctions all
over London. These sensors detect if a car is above them or not every
quarter second (see [Episode
I](http://blog.datatonic.com/2016/10/traffic-in-london-episode-i-live.html)).
As for the real-time analysis we use Dataflow to convert the raw
bitstream from the sensors into two commonly used measures in traffic
engineering: occupancy and flow. Occupancy simply tells us how often a
sensor detects a car. It can be further divided by the average car
length (around 4.5 m) to obtain the traffic density of a sensor. Flow on
the other hand is a measure of the number of cars passing over a
detector in a given time. Combining these two measures allows us to
calculate the average speed per car (as flow/density), which we will use
later to determine congestion.  If you want to learn more about traffic
flow have a look [here](https://en.wikipedia.org/wiki/Traffic_flow).

Before we attempt to model the congestion in London, we will first
visualise some of the sensor data. This will give us an overview of the
key measures and it will also help us to define and quantify congestion.
Tableau is a great choice for this task since it offers convenient and
great looking map views.

[![](https://2.bp.blogspot.com/-MLAL80onqss/V_esfCUc5sI/AAAAAAAAADI/n08CeADllK8RJHkSS77-ab79lP6tYx8gACK4B/s1600/Key%2BIndicators.jpg)](http://2.bp.blogspot.com/-MLAL80onqss/V_esfCUc5sI/AAAAAAAAADI/n08CeADllK8RJHkSS77-ab79lP6tYx8gACK4B/s1600/Key%2BIndicators.jpg)

The figure above shows some of the traffic indicators plotted against
each other. You can also track the time behaviour by looking at the
colours. Overall, the figures agree nicely with the theoretical
behaviour found [here](http://www.paulbennett.id.au/trafeng.php). We see
for example that the speed decreases as the density increases (more cars
on the road -&gt; slower traffic).

## Defining Congestion

To find out if a road is congested or not we need a single, robust
quantity that describes the traffic state on that road. Finding such a
measure is far from simple as we can illustrate by looking at flow: Flow
is small for small values of density, but also for large values of
density. This means zero flow can either mean a free road with no
traffic or total congestions. To resolve this ambiguity we settled for
speed as our congestions measure after some testing. In more detail we
use **speed/max(speed)** as a congestion measure, since the absolute
speed can vary largely between roads. Here, the max(speed) value is the
maximum speed of a road, which will be usually achieved if there is very
little traffic.

A relative speed value of 0 then means complete congestion and a value
of 1 means the road is free. We plotted this congestion measure for
small group of sensors in the map view of the above figure (top left).
Such a congestion measure based on relative speed has been previously
used by traffic engineers. However, it is worth noting that there is no
ideal measure of congestion and many different definitions can be found
in the literature.

## Predicting traffic with the LSTM network

Now that we have a good measure for congestion we can try and predict
its value using historic data. For this we build a deep learning model
which uses the past 40 minutes of traffic data (relative speed) as input
and which will then predict the congestion measure 40 minutes from now.

For the model we selected a LSTM recurrent neural network (RNN) which
performs exceptionally well on time series data. We won't go into detail
here about how the neural network works and how it is setup up, but you
find a great article explaining LSTM networks
[here](http://colah.github.io/posts/2015-08-Understanding-LSTMs/).  Our
implementation of the model was done in TensorFlow which has built in
functions for RNNs and the LSTM network. To simplify the problem we
selected a small group of around 300 sensors out of the 12'000 sensors
in London (the group can be seen in the map view above). 

[![](https://3.bp.blogspot.com/-qHzZp2QbepM/WBpiTEzO1zI/AAAAAAAAAEg/OfnMIv2YfLQYgiqcmkIFskclp-gLZCfnACK4B/s400/TfL-TF%2Bdiagram.jpg)](http://3.bp.blogspot.com/-qHzZp2QbepM/WBpiTEzO1zI/AAAAAAAAAEg/OfnMIv2YfLQYgiqcmkIFskclp-gLZCfnACK4B/s1600/TfL-TF%2Bdiagram.jpg)

We trained the model on a small set of only 8 days of traffic, but the
results are already promising. The model can forecast the traffic 40
minutes into the future with good accuracy and it predicts the morning
and afternoon rush hours nicely. The image below shows the predicted vs.
actual speed for a few different sensors.

[![](https://1.bp.blogspot.com/-c7vWb5vCME4/WCWiab7eesI/AAAAAAAAAHM/vLr2Ecg5dLgSUm2x9_ts7qIWmYaM30D7ACLcB/s1600/Sensor%2BPanel.png)](https://1.bp.blogspot.com/-c7vWb5vCME4/WCWiab7eesI/AAAAAAAAAHM/vLr2Ecg5dLgSUm2x9_ts7qIWmYaM30D7ACLcB/s1600/Sensor%2BPanel.png)

You can see how the neural network captures the different daily
behaviour of each sensor individually. However, looking closely at the
above graph you will find that some of the details of the time series
data are not well reproduced. We also found that there are a few sensors
that show a large overall prediction error. In order to increase the
accuracy of the LSTM network it could be trained on much more data than
just 8 days. Further, including more sensors might help training and of
course all the sensors needed for a congestion prediction system for the
whole of Greater London. Still, the model we have developed has a lot of
potential and might help to do the following after some more tuning:

+ predict future traffic state
+ predict congested areas so they can be avoided or reduced
+ detect incidents quickly

## Final thoughts

The road sensor data we received from TfL is fascinating for two
reasons: First, it is highly relevant as most us have to deal with some
sort of road traffic during their everyday lives. Second, it allows us
to analyse it in various different ways. In these two blog posts we
leveraged the streaming capabilities of Dataflow (Apache Beam) to power
a live visualisation and we forecasted congestion. Both are great use
cases of the data and we hope that we are going to see more such
datasets from TfL in the future.

*Thanks to the great team at TfL for organising the demo and providing
the data. *

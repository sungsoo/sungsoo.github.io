---
layout: post
title: Lightning Fast Social Media Analytics
date: 2016-03-12
categories: [computer science]
tags: [big data]

---

The MapD Gpu-Powered Interactive Tweetmap: Lightning Fast Social Media Analytics 
---------

![The MapD Gpu-Powered Interactive Tweetmap: Lightning Fast Social Media
Analytics](http://www.mapd.com/blog/content/images/2016/03/britain_france_tweets.png)

While we love datasets of all shapes and sizes at MapD, Twitter holds a
special place in our hearts. This is perhaps because we find Twitter
data to be almost peerless among public datasets in its ability to
provide a glimpse into the human experience - revealing what people are
saying when and where. Twitter is powerful in that it provides insight
into a wide variety of social phenomena both at the level of individual
tweets as well as rolled up by user, geography or topic/hashtag.

Twitter is also meaningful to me personally in that my graduate work
involved using Twitter to examine the Arab Spring in Egypt, and it was
the inability of existing tools to allow interactive analysis of
hundreds of millions of tweets that spurred me to start building the GPU
database that would become MapD. Waiting for hours for my batch jobs to
finish, I dreamed of a tool that would allow for real-time hypothesis
generation, testing and iteration. The tool would need to allow both
roll-ups over billions of data points and drill-downs to individual
records - and would need to accomplish this over high-throughput
streaming data. The only way to achieve these goals was to harness the
massive parallelism and memory bandwidth of graphics processors, or GPUs
- essentially bringing supercomputing to data analytics.

So today we are proud to announce the unveil MapD's new [Tweetmap
demo](http://www.mapd.com/demos/tweetmap). This demo leverages the power
of MapD’s visual analytics platform in the following ways:

1.  All charts are driven by MapD’s lightning fast GPU-powered SQL
    engine that delivers response times measured in milliseconds across
    multi-billion row datasets and hence immersive interactivity.
2.  While most of the charts are rendered on the frontend (from the
    results of SQL queries processed on the backend), the map itself is
    rendered directly by the backend GPUs. It would be essentially
    impossible to transfer the data needed to render millions of points
    between the backend server and the client web-browser, but by
    executing the requisite SQL query and rendering the result all on
    the backend GPUs, all that needs to be sent to the client is a
    compressed PNG.
3.  The charts themselves are generated via our frontend charting API.
    This means that a customer could create their own
    presentation-quality interactive dashboard in a few hours of
    programming time (we also provide a drag-and-drop interface, MapD
    Immerse, that will be covered in another post).

Now on to the demo itself.

First: the dataset. You are looking at approximately 60 million geocoded
tweets from November 2014 to February 2015. Geocoded tweets make up
approximately 1-2% of the entire Twitter feed, and are typically sent
from smartphones with the geolocation turned on. The geocoded tweets
shown in the demo are themselves from a 10% sample of the entire Twitter
stream (or “firehose”) – so this demo showcases less than 0.2% of all
tweets sent during the time period. This should give you an idea of how
big the Twitter stream is.

[![European tweets colored by
language](http://www.mapd.com/blog/content/images/2016/02/europe_tweets_lang2.png)](http://bit.ly/20BlPSX)

European tweets colored by language.

While MapD can scale to much bigger datasets (think many billions of
records on a single server) – we wanted to start off with a relatively
small public demo and work up. MapD can run on up to 8 Nvidia K80 GPUs
per server (which actually comprises 16 GPUs, with 192GB combined VRAM),
but the demo here is running on a single GPU. Soon we plan to increase
the size of the dataset many-fold and even ingest the Twitter feed in
real-time.

The first thing you might notice when looking at the demo is the map
covered with millions of multi-colored points. Each point symbolizes a
tweet, with the color mapping to the language the tweet was sent in (see
the legend at the bottom of the screen). Note that you can click on one
or more of the legend items to only see the tweets from those languages.
You can also change the coloring scheme to color by the phone OS or the
program that the tweet was sent from by clicking on the Language menu
item and selecting “Source”. You can have a lot of fun exploring the
geographical popularity for each OS/platform. For example, here are maps
showing tweets sent from Ios vs. Android, Windows Phone vs Blackberry,
and Foursquare vs. Instagram. We invite you to click on any of the
images to be taken to the demo with the same filters applied to explore
the data for yourself.

[![Tweets colored by OS - Android vs
ios](http://www.mapd.com/blog/content/images/2016/03/tweets_ios_vs_android.png)](http://bit.ly/1p445E3)

Tweets sent from Android (green) vs ios (blue). Note the relative
popularity of ios in the US, France, Britain and Japan.

[![Tweets colored by OS - Blackberry vs
Windows](http://www.mapd.com/blog/content/images/2016/03/tweets_blackberry_vs_windows.png)](http://bit.ly/1LNR9wt)

Tweets sent from Blackberry (purple) vs Windows phones (green). Note the
continued dominance of Blackberry in places like Central America,
Venezuela, Nigeria, South Africa, Saudi Arabia and Indonesia.

[![Tweets colored by OS - Foursquare vs
Instagram](http://www.mapd.com/blog/content/images/2016/03/tweets_foursquare_vs_instagram.png)](http://bit.ly/1p45hXW)

Tweets sent from Fourquare (pink) vs Instagram (orange). Notice the
worldwide popularity of Instagram and the relative popularity of
Foursquare in Eastern Europe, Turkey and Japan.

You can zoom into the map at any point and the rest of the charts will
update according to the filter applied by the map's bounding box. For
example, if you zoom into Manilla in the Phillipines you will now see
the top hashtags for tweets from Manilla, the current total number of
tweets around Manilla and the number of tweets per 6 hour period on the
time chart. Everything is “cross-filtered”, in that applying a filter to
one chart will apply that filter to all other charts. Crossfiltering is
a powerful paradigm for data exploration – allowing users to easily
drill down on anomalies as well as explore correlations between data
attributes.

[![Manilla](http://www.mapd.com/blog/content/images/2016/02/manilla_tweets_platform.png)](http://bit.ly/20BkMCA)

Tweets colored by OS/Platform from Manilla, Phillipines.

We’ll use this crossfiltering ability to now check out activity around a
given hashtag. If we look on the right we’ll see the top hashtags for
tweets from Manilla. Let’s click on \#popefrancisph. You should see
everything update – the map now showing tweets with this hashtag and the
timechart showing a spike in tweets with the hashtag around January 15,
2015. If we scroll down the list of tweets on the right or hover over
any of the points on the map it is clear that the tweets were sent
around [Pope Francis’
visit](https://en.wikipedia.org/wiki/Pope_Francis%27_visit_to_the_Philippines)
to the Phillipines.

[![Tweets containing
\#popefrancisph](http://www.mapd.com/blog/content/images/2016/02/manilla_tweets_popefrancisph.png)](http://bit.ly/1oGuqbo)

Tweets with hashtag \#popefrancisph.

We can also use the tweetmap to search for arbitrary terms. First, zoom
to New York City by typing “nyc” in the “Go to Location” box on the
left. Then type “parade” in the search box at the top of the map. You’ll
then see a spike of tweets around the Macy’s parade held at Thanksgiving
every year.

[![New York
City](http://www.mapd.com/blog/content/images/2016/02/nyc_tweets_platform2.png)](http://bit.ly/1QYK9gZ)

Tweets colored by OS/Platform from NYC.

[![New York City
Parade](http://www.mapd.com/blog/content/images/2016/02/nyc_tweets_platform_parade2.png)](http://bit.ly/1QFwnO3)

Tweets mentioning "parade" from NYC.

Looking at individual tweets is quite illuminating but it is also
powerful to roll up by various geographical levels. To do this, click on
the “choropleth” button to the left of the map. You’ll see a map of the
countries of the world colored by the number of tweets from each
country, with darker blue signifying a greater number of tweets.

[![World
Choropleth](http://www.mapd.com/blog/content/images/2016/02/world_tweets_choropleth.png)](http://bit.ly/20BikvX)

Countries colored by number of tweets - dark blue is more.

If we search for anything the map will change to color by the percentage
of tweets from each country mentioning that term. We find that coloring
by the percentage of tweets rather than the raw number is much more
powerful for spotting geographical trends. For example, if you type in
“kfc” you get the following map suggesting that Kentucky Fried Chicken
is quite popular in Asia and Southeastern Africa. If you change to
coloring by just the number of tweets containing kfc (by clicking on “%
Tweets” in the lower left), the result is much less informative since
the most populated countries tend to dominate merely due to the sheer
number of tweets being sent from those countries.

[![% Tweets with "KFC" by
Country](http://www.mapd.com/blog/content/images/2016/02/percent_tweets_kfc_country.png)](http://bit.ly/1LrNlLO)

Percent of tweets containing "KFC" by country.

[![\# Tweets with "KFC" by
Country](http://www.mapd.com/blog/content/images/2016/02/number_tweets_kfc_country.png)](http://bit.ly/1on6IB5)

Number of tweets containing "KFC" by country - note this map is less
informative than when we look at percentages.

We can compare KFC to McDonalds, and we get the following map:

[![% Tweets with "McDonalds" by
Country](http://www.mapd.com/blog/content/images/2016/02/percent_tweets_mcdonalds_country.png)](http://bit.ly/1LrOymp)

Percent of tweets containing "McDonalds" by country. Note the chain's
seeming popularity in Eastern Europe.

What’s the spike around Feburary 1st? If we narrow the time filter to
focus on the spike, we can see it relates to an [ad
campaign](https://youtu.be/RsogFwyDACY) McDonalds ran around the
Superbowl (“\#paywithlovin”). Looking at the tweets – people seemed to
enjoy the ad!

[!["McDonalds" Spike Feb
1st](http://www.mapd.com/blog/content/images/2016/02/percent_tweets_mcdonalds_feb_1_spike.png)](http://bit.ly/1on8Okl)

Spike in tweets containing "McDonalds" around Feb 1st, 2015.

[![McDonald's \#paywithlovin
tweets](http://www.mapd.com/blog/content/images/2016/02/mcdonalds_paywithlovin_tweets.png)](http://bit.ly/1onbNsW)

People were lovin McDonald's \#paywithlovin campaign.

We can click on any country to zoom in on that country and see the data
rolled up at the state/province level. For example, zooming into Turkey,
we see the number of tweets by province:

[![\# Tweets by Turkish
Province](http://www.mapd.com/blog/content/images/2016/03/turkey_choropleth.png)](http://bit.ly/1QDdf4R)

Number of tweets by Turkish province.

Focusing closer at home, it can be interesting to examine regional
trends in the US. MapD Tweetmap is great for examining how various slang
terms are popular in different areas of the country. For example, let’s
look compare the following: yall, hella and wicked.

[![% tweets with "yall" by
state](http://www.mapd.com/blog/content/images/2016/03/yall_choropleth.png)](http://bit.ly/1p42kGO)

Percent tweets containing "yall" by state. Very Southern.

[![% tweets with "hella" by
state](http://www.mapd.com/blog/content/images/2016/03/hella_choropleth.png)](http://bit.ly/1LNPsiv)

Percent tweets containing "hella" by state. Solidly western.

[![% tweets with "wicked" by
state](http://www.mapd.com/blog/content/images/2016/03/wicked_choropleth.png)](http://bit.ly/1p42C0n)

Percent tweets containing "wicked" by state. Seems wicked is both
popular in New England as well as parts of the Western US.

Here are a few additional interesting regional trends we found.

[![% tweets with "church" by
state](http://www.mapd.com/blog/content/images/2016/03/church_choropleth.png)](http://bit.ly/20ZC9is)

Percent tweets containing "church" by state. Note the concentration in
the southern US and Utah as well as the weekly spikes on Sundays, as
well as the larger spike for Christmas.

[![% tweets with "Patriots" by
state](http://www.mapd.com/blog/content/images/2016/03/patriots_choropleth.png)](http://bit.ly/1LNPG9p)

Percent tweets containing "Patriots" by state. If we drill in on the
spike we see that the top hashtag is \#sb49, showing that the associated
event is the Patriots winning the Superbowl. We see an obvious
concentrations in tweets about the Patriots in New England as well as in
Arizona where the game was actually held. The MapD Tweetmap is very good
for exploring where the fan bases for various teams are located.

These are just a few of the many interesting phenomena you can uncover
using MapD Tweetmap, all made possible by the incredible parallelism and
rendering abilities of the GPUs we run on. If you find interesting
trends of your own, we invite you to post them below in the comments
section. Or learn more about MapD and our GPU database and analytics
product at <http://www.mapd.com>. Happy exploring!


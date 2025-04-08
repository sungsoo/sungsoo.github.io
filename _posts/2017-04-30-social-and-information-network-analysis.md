---
layout: post
title: Social and Information Network Analysis
date: 2017-04-30
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Social and Information Network Analysis](http://web.stanford.edu/class/cs224w/handouts.html)
* Authors:  [Jure Leskovec](http://cs.stanford.edu/~jure/), Stanford University

---




# Social and Information Network Analysis

<h2>Lecture notes and further reading</h2>

<h2>Introduction and the Bowtie Structure of the Web  <a href="http://web.stanford.edu/class/cs224w/slides/01-intro.pdf">[Slides]</a></h2>

### Reading:

* Chapter 1: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch01.pdf">Overview</a>
* A. Broder, R. Kumar, F. Maghoul, P. Raghavan, S. Rajagopalan, R. Stata, A. Tomkins, J. Wiener. <a href="http://snap.stanford.edu/class/cs224w-readings/broder00bowtie.pdf"><i>Graph structure in the Web</i></a>. Computer Networks, 33, 2000.


<h2>Basic Network Properties and the Random Graph Model <a href="http://web.stanford.edu/class/cs224w/slides/02-gnp.pdf">[Slides]</a> </h2>

### Reading:
* Chapter 2: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch02.pdf">Graphs</a>


### Optional Readings:
* P. Erdos, A. Renyi. <a href="http://snap.stanford.edu/class/cs224w-readings/erdos59random.pdf"><i>On Random Graphs I</i></a>. Publ. Math. Debrecen, 1959.
* P. Erdos, A. Renyi. <a href="http://snap.stanford.edu/class/cs224w-readings/erdos60random.pdf"><i>On the evolution of random graphs</i></a>. Magyar Tud. Akad. Mat. Kutato Int. Koezl., 1960.
* B. Bollobas. <a href="http://books.google.com/books/about/Random_Graphs.html?id=o9WecWgilzYC"><i>Random Graphs</i></a>. Cambridge University Press.
* M.E.J. Newman, S. H. Strogatz and D.J. Watts. <a href="http://snap.stanford.edu/class/cs224w-readings/newman01random.pdf"><i>Random graphs with arbitrary degree distributions and their applications.</i></a> Phys. Rev. E 64, 026118, 2001.
*  R. Milo, N. Kashtan, S. Itzkovitz, M.E.J. Newman, U. Alon. <a href="http://snap.stanford.edu/class/cs224w-readings/milo04random.pdf"><i>On the uniform generation of random graphs with prescribed degree sequences</i></a>. Arxiv, 2004.
* D. Ellis. <a href="http://snap.stanford.edu/class/cs224w-readings/ellis11expansion.pdf"><i>The expansion of random regular graphs</i></a>. Lecture notes from Algebraic methods in combinatorics, Cambridge University, 2011.
* S. Arora, S. Rao and U. Vazirani. <a href="http://snap.stanford.edu/class/cs224w-readings/arora04expansion.pdf"><i>Expander Flows, Geometric Embeddings and Graph Partitioning</i></a>. In proc. STOC '04, 2004.
 	

<h2>The Small World Phenomena <a href="http://web.stanford.edu/class/cs224w/slides/03-smallworld.pdf">[Slides]</a> </h2>

### Reading:
	
*  Chapter 20: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch20.pdf">The Small-World Phenomena</a>
* D. J. Watts and S. H. Strogatz. <a href="http://snap.stanford.edu/class/cs224w-readings/watts98smallworld.pdf">Collective dynamics of 'small-world' networks.</a> Nature 393:440-42, 1998.
	
### Optional Readings:
	
*  Demo: <a href="http://ccl.northwestern.edu/netlogo/models/GiantComponent">Erdos-Renyi random graph</a>
*  Demo: <a href="http://www.ladamic.com/netlearn/NetLogo4/SmallWorldWS.html">Watts-Strogatz small-world model</a>
* S. Milgram. <a href="http://snap.stanford.edu/class/cs224w-readings/milgram67smallworld.pdf"><i>The small world problem</i></a>. Psychology Today 1(1967).
* J. Travers and S. Milgram. <a href="http://snap.stanford.edu/class/cs224w-readings/travers69smallworld.pdf"><i>An experimental study of the small world problem</i></a>. Sociometry 32, 1969.
* P. S. Dodds, R. Muhamad, D. J. Watts. <a href="http://snap.stanford.edu/class/cs224w-readings/dodds03search.pdf"><i>An Experimental Study of Search in Global Social Networks.</i></a> Science 301(2003), 827.
* J. Leskovec, E. Horvitz. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec08planetary.pdf"><i>Worldwide Buzz: Planetary-Scale Views on an Instant-Messaging Network</i></a>. Proc. International WWW Conference, 2008.
* P. Killworth and H. Bernard, <a href="http://snap.stanford.edu/class/cs224w-readings/killworth78smallworld.pdf"><i>Reverse small world experiment</i></a>. Social Networks 1, 1978.
* J. Kleinfeld. <a href="http://www.cs.princeton.edu/~chazelle/courses/BIB/big-world.htm"><i>Could it be a Big World After All? The `Six Degrees of Separation' Myth.</i></a>  Society, 2002.
* P. Killworth, C. McCarty, H.R. Bernard, M. House. <a href="http://snap.stanford.edu/class/cs224w-readings/killworth09smallworld.pdf"><i>The accuracy of small-world chains in social networks.</i></a> Social Networks 28, 85-96, 2006.
* F. Menczer. <a href="http://snap.stanford.edu/class/cs224w-readings/Menczer02Navigating.pdf">Growing and Navigating the Small World Web by Local Content.</a> Proc. Natl. Acad. Sci., 99(22): 14014-14019, 2002.
* L. Backstrom, P. Boldi, M. Rosa, J. Ugander, S. Vigna. <a href="http://snap.stanford.edu/class/cs224w-readings/backstrom12four.pdf"><i>Four Degrees of Separation.</i></a> ACM Web Science Conference. 2012.
* J. Ugander, B. Karrer, L. Backstrom, C. Marlow. <a href="http://snap.stanford.edu/class/cs224w-readings/backstrom12fb.pdf"><i>The Anatomy of the Facebook Social Graph.</i></a> Arxiv 2012.
  

<h2>Decentralized search in small-world and P2P networks <a href="http://web.stanford.edu/class/cs224w/slides/04-navigation.pdf">[Slides]</a> </h2>

### Reading:
	
* J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/kleinberg99smallworld.pdf">The small-world phenomenon: An algorithmic perspective.</a> Proc. ACM Symposium on Theory of Computing, 2000.
	
### Optional Readings:
  
* M. E. J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/newman00smallworld.pdf">Models of the Small World: A Review.</a>, J. Stat. Physics 2000.
* J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/kleinberg01smallworld.pdf">Small-World Phenomena and the Dynamics of Information.</a> Advances in Neural Information Processing Systems (NIPS), 2001.
* D. J. Watts, P. S. Dodds, M. E. J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/watts02identity.pdf">Identity and Search in Social Networks.</a> Science, 296, 1302-1305, 2002.
* L. A. Adamic, R. M. Lukose, A. R. Puniyani, B. A. Huberman. <a href="http://snap.stanford.edu/class/cs224w-readings/adamic2001powerlaw.pdf">Search in Power-Law Networks.</a> Phys. Rev. E, 64 46135, 2001.
* A. Clauset and C. Moore. <a href="http://snap.stanford.edu/class/cs224w-readings/clauset03navigable.pdf">How Do Networks Become Navigable?</a> arXiv:cond-mat/0309415v2, 2003.
* L. A. Adamic, E. Adar. <a href="http://snap.stanford.edu/class/cs224w-readings/adamic05search.pdf">How to search a social network.</a> Social networks, 27 3, 187-203, 2005.
* D. Liben-Nowell, J. Novak, R. Kumar, P. Raghavan, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/doreian08signed.pdf">Geographic routing in social networks.</a> In Proc. Natl. Acad. Sci., 102, 2005.
* R. West, J. Leskovec. <a href="http://snap.stanford.edu/class/cs224w-readings/west12wayfinding.pdf">Human Wayfinding in Information Networks</a>. In Proc. WWW, 2012.
* R. West, J. Leskovec. <a href="http://snap.stanford.edu/class/cs224w-readings/west12navigation.pdf">Automatic versus Human Navigation in Information Networks</a>. In Proc. ICWSM, 2012.
* G. Manku, M. Naor, U. Wieder. <a href="http://snap.stanford.edu/class/cs224w-readings/manku05neighbor.pdf">Know thy Neighbor's Neighbor: The Power of Lookahead in Randomized P2P Networks.</a> Proc. STOC 2004.
* E-K Lua, J. Crowcroft, M. Pias, R. Sharma and S. Lim. <a href="http://snap.stanford.edu/class/cs224w-readings/lua04p2p.pdf">A Survey and Comparison of Peer-to-Peer Overlay Network Schemes.</a> IEEE Communications Surveys and Tutorials, 2005.
* O. Sandberg and I. Clarke. <a href="http://snap.stanford.edu/class/cs224w-readings/Evolution06Sandberg.pdf">The Evolution of Navigable Small-World Networks.</a> arxiv cs.DS/0607025, 2006.
* I. Clarke, O. Sandberg, B. Wiley, T. Hong. <a href="http://snap.stanford.edu/class/cs224w-readings/clarke00freenet.pdf">Freenet: A Distributed Anonymous Information Storage and Retrieval System.</a> International Workshop on Design Issues in Anonymity and Unobservability, 2000.
* I. Stoica, R. Morris, D. Karger, F. Kaashoek, H. Balakrishnan. <a href="http://snap.stanford.edu/class/cs224w-readings/stoica01chord.pdf">Chord: A Scalable Peer-to-peer Lookup Service for Internet Applications.</a> Proc. SIGCOMM, 2001.
* H. Zhang, A. Goel, R. Govindan. <a href="http://snap.stanford.edu/class/cs224w-readings/zhang02smallworld.pdf">Using the small-world model to improve freenet performance.</a> Computer Networks, 2004.
  

 
<h2>User Evaluations in Social Media <a href="http://web.stanford.edu/class/cs224w/slides/05-evals.pdf">[Slides]</a> </h2>

### Reading:
	
* J. Leskovec, D. Huttenlocher, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec10positivenegative.pdf">Predicting Positive and Negative Links in Online Social Networks</a>. In Proc. WWW, 2010.
* A. Anderson, D. Huttenlocher, J. Kleinberg, J. Leskovec. <a href="http://snap.stanford.edu/class/cs224w-readings/similarity-wsdm12.pdf">Effects of User Similarity in Social Media.</a> In Proc. WSDM, 2012.
	
### Optional Readings:
	
* A. Anderson, D. Huttenlocher, J. Kleinberg, J. Leskovec. <a href="http://snap.stanford.edu/class/cs224w-readings/sof-kdd12.pdf">Discovering Value from Community Activity on Focused Question Answering Sites: A Case Study of Stack Overflow .</a> In Proc. KDD, 2012.
* J. Leskovec, D. Huttenlocher, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec10governance.pdf">Governance in Social Media: A case study of the Wikipedia promotion process.</a>  In Proc. ICWSM, 2010.
* C. Danescu-Niculescu-Mizil, G. Kossinets, J. Kleinberg, L. Lee. <a href="http://snap.stanford.edu/class/cs224w-readings/Danescu09OpinionHelpfulness.pdf">How opinions are received by online communities: A case study on Amazon.com helpfulness votes.</a> In Proc. ACM WWW, 2009.
* R. Guha, R. Kumar, P. Raghavan, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/guha04trust.pdf">Propagation of trust and distrust.</a> In Proc. WWW, 2004.
* L. A. Adamic, J. Zhang, E. Bakshy, and M. S. Ackerman. <a href="http://snap.stanford.edu/class/cs224w-readings/adamic08knowledge.pdf">Knowledge sharing and yahoo answers: everyone knows something.</a> In Proc. 17th International World Wide Web Conference, 2008.
* M. Burke and R. Kraut. <a href="http://snap.stanford.edu/class/cs224w-readings/burke08ModlingWikpediaPromotion.pdf">Mopping up: Modeling wikipedia promotion decisions</a>. In Proc. CSCW '08: ACM Conference on Computer-Supported Cooperative Work, 2008.
* D. Lauterbach, H. Truong, T. Shah, L. A. Adamic. <a href="http://snap.stanford.edu/class/cs224w-readings/lauterbach09trust.pdf">Surfing a Web of Trust: Reputation and Reciprocity on CouchSurfing.com</a>. International Symposium on Social Intelligence and Networking, 2009.
* C. Y. Teng, D. Lauterbach, L. A. Adamic. <a href="http://snap.stanford.edu/class/cs224w-readings/TengTrustWOSN2010.pdf">I rate you. You rate me. Should we do so publicly?</a> In Proc. WOSN, 2010.
* L. Muchnik, S. Aral, S. J. Taylor. <a href="http://snap.stanford.edu/class/cs224w-readings/muchnik13bias.pdf">Social Influence Bias: A Randomized Experiment</a>. Science, Vol. 341 no. 6146 pp. 647-651, 2013.
  

<h2>Networks with Signed Edges <a href="http://web.stanford.edu/class/cs224w/slides/06-signed.pdf">[Slides]</a> </h2>

### Reading:
	
*  Chapter 5:  <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch05.pdf">Positive and negative relationships</a>.
* J. Leskovec, D. Huttenlocher, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec10signednetwork.pdf">Signed Networks in Social Media.</a> In Proc. CHI, 2010.
	
### Optional Readings:
	
* D. Cartwright, F. Harary. <a href="http://snap.stanford.edu/class/cs224w-readings/cartwright56balance.pdf">Structural balance: A generalization of Heider's theory.</a> Psychological review, 1956.
* F. Heider. <a href="http://snap.stanford.edu/class/cs224w-readings/heider49balance.pdf">Attitudes and cognitive organization.</a> Journal of Psychology. 21, 107-112, 1946.
* J. Leskovec, D. Huttenlocher, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec10positivenegative.pdf">Predicting Positive and Negative Links in Online Social Networks</a>. In Proc. WWW, 2010.
* R. Guha, R. Kumar, P. Raghavan, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/guha04trust.pdf">Propagation of trust and distrust.</a> In Proc. WWW, 2004.
* T. Antal, P. Krapivsky, S. Redner. <a href="http://snap.stanford.edu/class/cs224w-readings/antal05balance.pdf">Dynamics of Social balance on Networks.</a> Phys. Rev. E, 2005.
* S. Marvel, S. Strogatz, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/marvel09banlance.pdf">Energy landscape of social balance.</a> Physical Review Letters, 103, 2009.
* S. Marvel, J. Kleinberg, R. Kleinberg, S. Strogatz. <a href="http://snap.stanford.edu/class/cs224w-readings/Marvel10StructuralBalance.pdf">Continuous-Time Model of Structural Balance.</a> Proc. National Academy of Sciences, 2011.
* J.A. Davis. <a href="http://snap.stanford.edu/class/cs224w-readings/davis63balance.pdf">Structural balance, mechanical solidarity, and interpersonal relations.</a> American Journal of Sociology, 68:444-62, 1963.
* P. Doreian, A. Mrvar. <a href="http://snap.stanford.edu/class/cs224w-readings/doreian09partition.pdf">A partitioning approach to structural balance.</a> Social. Networks 18, 1996.
* M. J. Brzozowski, T. Hogg, G. Szabo. <a href="http://snap.stanford.edu/class/cs224w-readings/brzozowskl08friendsandfoes.pdf">Friends and foes: ideological social networking.</a> In Proc. CHI, 2008.
* P. Doreian. <a href="http://snap.stanford.edu/class/cs224w-readings/dorean04evolution.pdf">Evolution of human signed networks.</a> In Metodološki zvezki, 2004.
* C. J. Hsieh, K Chiang, and I. S. Dhillon. <a href="http://snap.stanford.edu/class/cs224w-readings/hsieh12signed.pdf">Low-Rank Modeling of Signed Networks.</a> In Proc. KDD, 2012.
* K. Chiang, I. S. Dhillon, N. Natarajan, and A. Tewari. <a href="http://snap.stanford.edu/class/cs224w-readings/chiang11signed.pdf">Exploiting Longer Walks for Link Prediction in Signed Network.</a> In Proc. CIKM, 2011.
* G. Facchetti, G. Iacono, C Altafini. <a href="http://snap.stanford.edu/class/cs224w-readings/facchetti11signed.pdf">Computing global structural balance in large-scale signed social networks.</a> In Proc. National Academy of Sciences, 2011.
* M. Szell, R. Lambiotte, S. Thurner. <a href="http://snap.stanford.edu/class/cs224w-readings/szell10multirelational.pdf">Multirelational Organization of Large-scale Social Networks in an Online World.</a> Proc. National Academy of Sciences, 2010.
* J. Kunegis, A. Lommatzsch, C. Bauckhage. <a href="http://snap.stanford.edu/class/cs224w-readings/kunegis09slashdot.pdf">The Slashdot Zoo: Mining a social network with negative edges.</a> In Proc. WWW, 2009.
	


<h2>Cascading Behavior: Decision Based Models of Cascades <a href="http://web.stanford.edu/class/cs224w/slides/07-cascading.pdf">[Slides]</a> </h2>

### Reading:
	
*  Chapter 19: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch19.pdf">Cascading Behavior in Networks</a>
	
### Optional Readings:
	
* S. Morris. <a href="http://snap.stanford.edu/class/cs224w-readings/morris98contagion.pdf">Contagion.</a> Review of  Economic Studies 67, 57-78, 2000.
* N. Immorlica, J. Kleinberg, M. Mahdian, T. Wexler. <a href="http://snap.stanford.edu/class/cs224w-readings/immorlica07compat.pdf">The Role of Compatibility in the Diffusion of Technologies Through Social Networks. </a> In Proc. ACM EC, 2007.
* E. Berger. <a href="http://snap.stanford.edu/class/cs224w-readings/berger99monopolies.pdf">Dynamic Monopolies of Constant Size.</a> Journal of Combinatorial Theory Series B 83, 191-200, 2001.
* D. Centola, M. Macy. <a href="http://snap.stanford.edu/class/cs224w-readings/centola10behavior.pdf">Complex Contagions and the Weakness of Long Ties.</a> American Journal of Sociology, 2007.
* M. Jackson, L. Yariv. <a href="http://snap.stanford.edu/class/cs224w-readings/jackson07behavior.pdf">Diffusion of Behavior and Equilibrium Properties in Network Games.</a> American Economic Review , Vol 97, No. 2, 2007. 
* S. Bikhchandani, D. Hirshleifer, I. Welch. <a href="http://snap.stanford.edu/class/cs224w-readings/bikhchandani92fads.pdf">A theory of fads, fashion, custom and cultural change as information cascades.</a> Journal of Political Economy. Vol. 100, pp. 992-1026, 1992.
* T. Schelling. <a href="http://snap.stanford.edu/class/cs224w-readings/schelling78segregation.pdf">Micromotives and Macrobehavior.</a> Norton, 1978.
* D. Strang, S. Soule. <a href="http://snap.stanford.edu/class/cs224w-readings/strang98diffusion.pdf">Diffusion in organizations and social movements: From hybrid corn to poison pills.</a> Annual Review of Sociology, 24:265--290, 1998.
* D. Watts. <a href="http://snap.stanford.edu/class/cs224w-readings/watts02randomnetworks.pdf">A simple model of global cascades on random networks.</a> Proc. Natl. Acad. Sci.,  vol. 99 no. 9, 5766-5771, 2002.
* H. P. Young. <a href="http://snap.stanford.edu/class/cs224w-readings/young00diffusion.pdf">The Diffusion of Innovations in Social Networks.</a> Santa Fe Institute Working Paper 02-04-018.
* P. Dodds and D. J. Watts. <a href="http://snap.stanford.edu/class/cs224w-readings/dodds04generalized.pdf">Universal Behavior in a Generalized Model of Contagion.</a> Phyical Review Letters, 2004.
* E. Lieberman, C. Hauert, M. A. Nowak. <a href="http://snap.stanford.edu/class/cs224w-readings/lieberman05evolutionary.pdf">Evolutionary Dynamics on Graphs.</a>  Nature 433: 312-316, 2005.
* D. Centola, M. Macy, V. Eguiluz. <a href="http://snap.stanford.edu/class/cs224w-readings/centola05cascade.pdf">Cascade Dynamics of Multiplex Propagation.</a>  Physica A 374, 449-456, 2007.
* D. Centola. <a href="http://snap.stanford.edu/class/cs224w-readings/centola07contagions.pdf">The Spread of Behavior in an Online Social Network Experiment.</a> Science, 2010.
* M. Granovetter. <a href="http://snap.stanford.edu/class/cs224w-readings/granovetter78threshold.pdf">Threshold models of collective behavior.</a> American Journal of Sociology 83(6):1420-1443, 1978.
* A. V. Banerjee. <a href="http://snap.stanford.edu/class/cs224w-readings/banerjee92herd.pdf">A Simple Model of Herd Behavior.</a> The Quarterly Journal of Economics, Vol. 107, No. 3, pp. 797-817, 1992.
	

<h2>Cascading Behavior: Probabilistic Models of Information Flow <a href="http://web.stanford.edu/class/cs224w/slides/08-cascades.pdf">[Slides]</a> </h2>

### Reading:
	
*  Chapter 21: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch21.pdf">Epidemics</a>
* D. Romero, B. Meeder, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/romero11hashtags.pdf">Differences in the Mechanics of Information Diffusion Across Topics: Idioms, Political Hashtags, and Complex Contagion on Twitter.</a> In Proc. WWWW, 2011.
* S. Myers, J. Leskovec. <a href="http://snap.stanford.edu/class/cs224w-readings/myers12clash.pdf">Clash of the Contagions: Cooperation and Competition in Information Diffusion</a>. In Proc. ICDM 2012.
	
### Optional Readings:
	
* S. Myers, C. Zhu, J. Leskovec. <a href="http://snap.stanford.edu/class/cs224w-readings/myers12influence.pdf">Information Diffusion and External Inﬂuence in Networks</a>. In Proc. KDD, 2012.
* A. Goyal, F. Bonchi, L.V.S. Lakshmanan. <a href="http://snap.stanford.edu/class/cs224w-readings/goyal10influence.pdf">Learning influence probabilities in social networks.</a> In Proc. WSDM, 2010.
* D. Cosley, D. Huttenlocher, J. Kleinberg, X. Lan, S. Suri.<a href="http://snap.stanford.edu/class/cs224w-readings/cosley10sequential.pdf">Sequential Influence Models in Social Networks.</a> In Proc. ICWSM, 2010.
* J. Leskovec, A. Singh, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec06recommendation.pdf">Patterns of Influence in a Recommendation Network</a> In Proc PAKDD, 2006.
* L. Backstrom, D. Huttenlocher, J. Kleinberg, X. Lan. <a href="http://snap.stanford.edu/class/cs224w-readings/backstrom06groupformation.pdf">Group Formation in Large Social Networks: Membership, Growth, and Evolution.</a> In Proc. KDD, 2006.
* E. Adar, L. Adamic. <a href="http://snap.stanford.edu/class/cs224w-readings/adar05epidemics.pdf">Tracking information epidemics in blogspace.</a> In Proc. Wed intelligence, 2005.
* J. Leskovec, M. McGlohon, C. Faloutsos, N. Glance, M. Hurst. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec07cascading.pdf">Cascading Behavior in Large Blog Graphs.</a> In Proc. SIAM International Conference on Data Mining, 2007.
* D. Gruhl, R. Guha, D. Liben-Nowell, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/gruhl04diffusion.pdf">Information Diffusion through Blogspace.</a> In Proc. International WWW Conference, 2004.
* M. Goetz, J. Leskovec, M. Mcglohon, C. Faloutsos. <a href="http://snap.stanford.edu/class/cs224w-readings/gotz09blog.pdf">Modeling blog dynamics,</a> In AAAI Conference on Weblogs and Social Media (ICWSM), 2009.
* M. Miller, C. Sathi, D. Wiesenthal, J. Leskovec, C. Potts. <a href="http://snap.stanford.edu/class/cs224w-readings/miller11sentiment.pdf">Sentiment Flow Through Hyperlink Networks</a>. In Proc. ICWSM, 2011.
* J. Ugander, L. Backstrom, C. Marlow, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/ugander12contagion.pdf">Structural Diversity in Social Contagion.</a> In Proc. National Academy of Sciences, 2012.
  

<h2>Influence Maximization <a href="http://web.stanford.edu/class/cs224w/slides/09-influence.pdf">[Slides]</a> <a href="http://web.stanford.edu/class/cs224w/slides/handout-influence_maximization.pdf">[Handout]</a></h2>
### Reading:
	
* D. Kempe, J. Kleinberg, E. Tardos. <a href="http://snap.stanford.edu/class/cs224w-readings/kempe03influence.pdf">Maximizing the Spread of Influence through a Social Network.</a> In Proc. KDD 2003.
	
### Optional Readings:
	
* M. Richardson, P. Domingos. <a href="http://snap.stanford.edu/class/cs224w-readings/richardson02knowledge.pdf">Mining Knowledge-Sharing Sites for Viral Marketing.</a>  In Proc. KDD, 2002.
* M. Richardson, P. Domingos. <a href="http://snap.stanford.edu/class/cs224w-readings/domingos01networkvalue.pdf">Mining the Network Value of Customers.</a> In Proc. KDD, 2001.
* S. Hill, F. Provost, C. Volinsky. <a href="http://snap.stanford.edu/class/cs224w-readings/hill06marketing.pdf">Network-Based Marketing: Identifying Likely Adopters via Consumer Networks.</a> Statistical Sciece, 2006.
* J. Leskovec, L. Adamic, B. Huberman. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec07viral.pdf">The Dynamics of Viral Marketing.</a> TWEB, 2007.
* E. Bakshy, J. M. Hofman, W. A. Mason, and D. J. Watts, <a href="http://snap.stanford.edu/class/cs224w-readings/bakshy11influencers.pdf">Everyone’s an inﬂuencer: quantifying inﬂuence on twitter</a>. In Proc. WSDM, 2011.
* S. Aral, L. Muchnik, A. Sundararajan. <a href="http://snap.stanford.edu/class/cs224w-readings/aral09influence.pdf">Distinguishing inﬂuence-based contagion from homophily-driven diffusion in dynamic networks</a>. In Proc. National Academy of Sciences, 2009.
* A. Goyal, W. Lu, L. S.V. Lakshmanan. <a href="http://snap.stanford.edu/class/cs224w-readings/goyal11influence.pdf">SIMPATH: An Efﬁcient Algorithm for Inﬂuence Maximization under the Linear Threshold Model.</a> In Proc. ICDM, 2011.
* W. Chen, Y. Wang, S. Yang. <a href="http://snap.stanford.edu/class/cs224w-readings/chen09influence.pdf">Efficient Influence Maximization in Social Networks.</a> In Proc. KDD, 2009.
* W. Chen, Y. Yuan, L. Zhang. <a href="http://snap.stanford.edu/class/cs224w-readings/chen10influence.pdf">Scalable Influence Maximization in Social Networks under the Linear Threshold Model.</a> In Proc. ICDM, 2010.
* C. Lerman, R. Ghosh. <a href="http://snap.stanford.edu/class/cs224w-readings/lerman10digg.pdf">Information Contagion: Empirical Study of the Spread of News on Digg and Twitter Social Networks.</a> In Proc. ICWSM, 2010.
* Y. Singer. <a href="http://snap.stanford.edu/class/cs224w-readings/singer12influence.pdf">How to win friends and influence people, truthfully: Influence maximization mechanisms for social networks</a>. In Proc. WSDM, 2012.
* A. Gionis, E. Terzi, P. Tsaparas. <a href="http://snap.stanford.edu/class/cs224w-readings/gionis13opinion.pdf">Opinion maximization in social networks</a>. In Proc. SDM, 2013.
	

<h2>Outbreak Detection <a href="http://web.stanford.edu/class/cs224w/slides/10-outbreak.pdf">[Slides]</a> </h2>
### Reading:
	
* J. Leskovec, A. Krause, C. Guestrin, C. Faloutsos, J. VanBriesen, N. Glance. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec07outbreak.pdf">Cost-effective Outbreak Detection in Networks.</a>  In Proc. KDD, 2007.
	
### Optional Readings:
	
* E. Mossel and S. Roch. <a href="http://snap.stanford.edu/class/cs224w-readings/mossel09submodularity.pdf">On the Submodularity of Influence in Social Networks.</a> In Proc. STOC, 2007.
* N. Agarwal, H. Liu, L. Tang, P. Yu. <a href="http://snap.stanford.edu/class/cs224w-readings/agarwal08bloggers.pdf">Identifying the Influential Bloggers in a Community</a> In Proc. WSDM, 2008.
* A. Krause, J. Leskovec, C. Guestrin, J. VanBriesen, C. Faloutsos. <a href="http://snap.stanford.edu/class/cs224w-readings/krause08sensor.pdf">Efficient Sensor Placement Optimization for Securing Large Water Distribution Networks.</a> Journal of Water Resources Planning and Management, 2008.
* A. Krause, C. Guestrin, <a href="http://snap.stanford.edu/class/cs224w-readings/krause05note.pdf">A Note on the Budgeted Maximization on Submodular Functions</a>. Technical report, Carnegie Mellon University, no. CMU-CALD-05-103, 2005.
* A. Ostfeld et al. <a href="http://snap.stanford.edu/class/cs224w-readings/ostfeld09sensor.pdf">The Battle of the Water Sensor Networks (BWSN): A Design Challenge for Engineers and Algorithms.</a> Journal of Water Resources Planning and Management, 2009.
* M. Cha, H. Haddadi, F. Benevenuto, K.P. Gummadi. <a href="http://snap.stanford.edu/class/cs224w-readings/cha10influence.pdf">Measuring user influence in Twitter: The million follower fallacy.</a> In Proc. ICWSM, 2010.
* A. Goyal, W. Lu, L. V.S. Lakshmanan. <a href="http://snap.stanford.edu/class/cs224w-readings/goyal11celf.pdf">Celf++: optimizing the greedy algorithm for influence maximization in social networks</a>. In Proc. WWW, 2011.
* R. Pastor-Satorras, A. Vespignani. <a href="http://snap.stanford.edu/class/cs224w-readings/pastorsatorras02immunization.pdf">Immunization of complex networks</a>. Physical Review E, 2002.
* T. Lappas, E. Terzi, D. Gunopoulos, H. Mannila. <a href="http://snap.stanford.edu/class/cs224w-readings/lattanzi09affiliation.pdf">Finding Effectors in Social Networks</a>. In Proc. KDD, 2010.
	

<h2>Power-laws and Preferential attachment <a href="http://web.stanford.edu/class/cs224w/slides/11-powerlaws.pdf">[Slides]</a> <a href="http://web.stanford.edu/class/cs224w/slides/handout-powerlaws.pdf">[Handout]</a></h2>

### Reading:
	
*  Chapter 18: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch18.pdf">Power Laws and Rich-Get-Richer Phenomena</a>
	
### Optional Readings:
	
* M. Mitzenmacher. <a href="http://snap.stanford.edu/class/cs224w-readings/mitzenmacher10generative.pdf">A Brief History of Generative Models for Power Law and Lognormal Distributions.</a> Internet Mathematics, vol 1, No. 2, pp. 226-251, 2004.
* A. Clauset, C.R. Shalizi, and M.E.J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/clauset09powerlaw.pdf">Power-law distributions in empirical data.</a> SIAM Review 51(4), 661-703, 2009.
* M.E.J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/newman06powerlaws.pdf">Power laws, Pareto distributions and Zipf's law.</a> Contemporary Physics 46(5), 323-351, 2005.
* M. Faloutsos, P. Faloutsos, C. Faloutsos. <a href="http://snap.stanford.edu/class/cs224w-readings/faloutsos99powerlaw.pdf">On Power-Law Relationships of the Internet Topology.</a> In Proc. SIGCOMM, 1999.
* A.L Barabasi, R. Albert. <a href="http://snap.stanford.edu/class/cs224w-readings/barabasi99scaling.pdf">Emergence of scaling in random networks.</a> Science, 286, 1999.
* B.A. Huberman, L. A. Adamic. <a href="http://snap.stanford.edu/class/cs224w-readings/Huberman99webgrowth.pdf">Growth dynamics of the World-Wide Web.</a> Nature, 399, 1999.
* H.A. Simon. <a href="http://snap.stanford.edu/class/cs224w-readings/Simon55Skewdistribution.pdf">On a class of skew distribution functions.</a> Biometrika 42, 425-440, 1955
* D.J. de S. Price. <a href="http://snap.stanford.edu/class/cs224w-readings/price76cumulativeprocess.pdf">A general theory of bibliometric and other cumulative advantage processes.</a> J. Amer. Soc. Inform. Sci. 27: 292-306, 1976.
* A.L. Barabasi, R. Albert, H. Jeong. <a href="http://snap.stanford.edu/class/cs224w-readings/Barabasi99Meanfield.pdf">Mean-field theory for scale-free random networks.</a> Physica A 272 173-187, 1999.
* R. Kumar, P. Raghavan, S. Rajagopalan, D. Sivakumar, A. Tomkins, E. Upfal. <a href="http://snap.stanford.edu/class/cs224w-readings/kumar00stochastic.pdf">Stochastic models for the Web graph.</a> In Proc. FOCS 2000.
* W. Aiello, F. Chung, L. Lu. <a href="http://snap.stanford.edu/class/cs224w-readings/aiello01evolution.pdf">Random evolution of massive graphs.</a> Handbook of Massive Data Sets, Kluwer, pages 97-122, 2002.
* B. Bollobas, C. Borgs, J. Chayes, O. Riordan. <a href="http://snap.stanford.edu/class/cs224w-readings/bollobas03scalefree.pdf">Directed scale-free graphs.</a> In Proc. SODA 2003.
* R. Kleinberg, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/kleinberg05infinite.pdf">Isomorphism and Embedding Problems for Infinite Limits of Scale-Free Graphs.</a> In Proc. SODA, 2005.
* A. Fabrikant, E. Koutsoupias, C. Papadimitriou. <a href="http://snap.stanford.edu/class/cs224w-readings/fabrikan02powerlaw.pdf">Heuristically Optimized Trade-offs: A New Paradigm for Power Laws in the Internet.</a> In Proc. ICALP, 2002.
* N. Berger, C. Borgs, J. Chayes, R. D'Souza, R. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/berger04preferential.pdf">Competition-Induced Preferential Attachment.</a> In Proc. ICALP 2004.
* M. Molloy and B. Reed. <a href="http://snap.stanford.edu/class/cs224w-readings/Molloy95CriticalPoint.pdf">A Critical Point for Random Graphs with a Given Degree Sequence.</a> Random Structures and Algorithms 6, 161-180, 1995.
* J. Carlson and J. Doyle. <a href="http://snap.stanford.edu/class/cs224w-readings/carlson99tolerance.pdf">Highly Optimized Tolerance: A Mechanism for Power Laws in Designed Systems.</a>  Physical Review E 60:2, 1999.
* M.E.J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/newman08firstmover.pdf">The first-mover advantage in scientific publication.</a> European Physics Letters 86, 68001, 2009.
* S. Redner. <a href="http://snap.stanford.edu/class/cs224w-readings/redner05citation.pdf">Citation statistics from 110 years of Physical Review.</a> Physics Today 58, 49-54, 2005.
* S. Goel, A. Broder, E. Gabrilovich, B. Pang. <a href="http://snap.stanford.edu/class/cs224w-readings/goel10longtail.pdf">Anatomy of the Long Tail: Ordinary People with Extraordinary Tastes.</a> In Proc. WSDM, 2010.
* D. Pennock, G. Flake, S. Lawrence, E. Glover, C. Lee Giles. <a href="http://snap.stanford.edu/class/cs224w-readings/pennock02competition.pdf">Winners don't take all: Characterizing the competition for links on the web.</a> PNAS 99(8), 2002.
	

<h2>Models of evolving networks  <a href="http://web.stanford.edu/class/cs224w/slides/12-evolution.pdf">[Slides]</a></h2>

### Reading:
	
* J. Leskovec, L. Backstrom, R. Kumar, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/lesovec08microscopic.pdf">Microscopic Evolution of Social Networks.</a> In Proc. KDD 2008.
	
### Optional Readings:
	
* J. Leskovec, J. Kleinberg, C. Faloutsos. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec07evolution.pdf">Graph Evolution: Densification and Shrinking Diameters.</a> ACM TKDD, 2007.
* R. Kumar, J. Novak, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/kumar06evolution.pdf">Structure and evolution of online social networks.</a> In Proc. KDD, 2006.
* A.L. Barabasi, H. Jeong, Z. Neda, E. Ravasz, A. Schubert, T. Vicsek. <a href="http://snap.stanford.edu/class/cs224w-readings/barabasi01evolution.pdf">Evolution of the social network of scientific collaborations.</a> Physica A: Statistical, 2002.
* G. Kossinets, D.J. Watts. <a href="http://snap.stanford.edu/class/cs224w-readings/kossinets06evolving.pdf">Empirical Analysis of an Evolving Social Network.</a> Science, 2006.
* D. Fetterly, M. Manasse, M. Najork, J.L. Wiener. <a href=" http://snap.stanford.edu/class/cs224w-readings/Fetterfly03PageEvolution.pdf">A large-scale study of the evolution of web pages.</a> In Proc. WWW, 2003.
* A. Ntoulas, J. Cho, C. Olston. <a href="http://snap.stanford.edu/class/cs224w-readings/ntoulas04evolution.pdf">What's new on the web? The evolution of the web from a search engine perspective.</a> In Proc. WWW, 2004.
* A.L. Barabasi. <a href="http://www.nd.edu/~networks/HumanDynamics_20Oct05/human_dynamics_.htm">The origin of bursts and heavy tails in human dynamics.</a> Nature 435, 207-211, 2005.
* J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/kleinberg02streams.pdf">Bursty and Hierarchical Structure in Streams.</a> In Proc. KDD, 2002.
* R. Kumar, J. Novak, P. Raghavan, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/kumar03bursty.pdf">On the bursty evolution of Blogspace.</a> In Proc. WWW, 2003.
* M. Dubinko, R. Kumar, J. Magnani, J. Novak, P. Raghavan, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/dubinko06visualizing.pdf">Visualizing Tags over Time.</a> In Proc. WWW, 2006.
* S. Lattanzi, D. Sivakumar. <a href="http://snap.stanford.edu/class/cs224w-readings/lattanzi09affiliation.pdf">Afﬁliation Networks.</a> In Proc. STOC, 2009.
  

<h2>Kronecker graphs <a href="http://web.stanford.edu/class/cs224w/slides/13-kronecker.pdf">[Slides]</a> </h2>

### Reading:
	
* J. Leskovec, D. Chakrabarti, J. Kleinberg, C. Faloutsos, Z. Ghahramani. <a href="http://cs.stanford.edu/people/jure/pubs/kronecker-jmlr10.pdf">Kronecker Graphs: An approach to modeling networks</a>. Journal of Machine Learning Research (JMLR) 11(Feb):985-1042, 2010.
  	
### Additional readings:
	
* J. Leskovec, D. Chakrabarti, J. Kleinberg, C. Faloutsos. <a href="http://cs.stanford.edu/people/jure/pubs/kronecker-pkdd05.pdf">Realistic, Mathematically Tractable Graph Generation and Evolution, Using Kronecker Multiplication.</a> European Conference on Principles and Practice of Knowledge Discovery in Databases (ECML/PKDD), 2005.
* M. Kim, J. Leskovec.<a href="http://cs.stanford.edu/people/jure/pubs/mag-im12.pdf">Multiplicative attribute graph model of real-world networks.</a> Internet Mathematics, 2012.
* C. Seshadhri, A. Pinar and T. G. Kolda. <a href="http://snap.stanford.edu/class/cs224w-readings/kolda11kronecker.pdf">An In-Depth Analysis of Stochastic Kronecker Graphs.</a> Journal of the ACM, 2013.
* D. Chakrabarti, Y. Zhan and C. Faloutsos. <a href="http://snap.stanford.edu/class/cs224w-readings/chakrabarti04rmat.pdf">R-MAT: A Recursive Model for Graph Mining.</a> SIAM Data Mining, 2004.
* J. Leskovec, C. Faloutsos. <a href="http://cs.stanford.edu/people/jure/pubs/kronFit-icml07.pdf">Scalable Modeling of Real Graphs using Kronecker Multiplication.</a> International Conference on Machine Learning (ICML), 2007.
* M. Kim, J. Leskovec.<a href="http://cs.stanford.edu/people/jure/pubs/magfit-uai11.pdf">Modeling Social Networks with Node Attributes using the Multiplicative Attribute Graph Model.</a> In Proc. UAI, 2011.
* M. Kim, J. Leskovec.<a href="http://cs.stanford.edu/people/jure/pubs/lmmg-icml12.pdf">Latent Multi-group Membership Graph Model.</a> In Proc. ICML, 2012.
* M. Mahdian, Y. Xu. <a href="http://theory.stanford.edu/~xuying/papers/kronecker3.pdf">Stochastic Kronecker Graphs.</a> 5th Workshop on Algorithms and Models for the Web Graph (WAW), 2007.
* G. Palla, L. Lovasz, T. Vicsek. <a href="http://arxiv.org/abs/1004.5225">Multifractal Network Generator.</a> PNAS, 2010.
* S. Moreno, S. Kirshner, J. Neville, S.V.N. Vishwanathan. <a href="http://www.cs.purdue.edu/homes/neville/papers/moreno-allerton2010.pdf">Tied Kronecker Product Graph Models to Capture Variance in Network Populations.</a> In Proceedings of the 48th Annual Allerton Conference on Communications, Controland Computing, 2010.
* E. Bodine, B. Hassibi, A. Wierman. <a href="http://www.cs.caltech.edu/~adamw/papers/generalized_kronecker.pdf">Distance-dependent Kronecker Graphs for Modeling Social Networks.</a>  IEEE THEMES, 2010.
* A. Pinar, C. Seshadhri and T. G. Kolda. <a href="http://snap.stanford.edu/class/cs224w-readings/kolda12kronecker.pdf">The Similarity between Stochastic Kronecker and Chung-Lu Graph Models.</a> In Proc. SDM, 2012.
* H. Yun, S. V. N. Vishwanathan. <a href="http://snap.stanford.edu/class/cs224w-readings/yun12kronecker.pdf">Quilting Stochastic Kronecker Product Graphs to Generate Multiplicative Attribute Graphs.</a> In Proc. AISTATS, 2012.
* M. Kim, J. Leskovec.<a href="http://cs.stanford.edu/people/jure/pubs/kronEM-sdm11.pdf">The Network Completion Problem: Inferring Missing Nodes and Edges in Networks.</a> In Proc. SDM, 2011.
	

<h2>Link Analysis: HITS and PageRank <a href="http://web.stanford.edu/class/cs224w/slides/14-pagerank.pdf">[Slides]</a><a href="http://web.stanford.edu/class/cs224w/slides/page_rank.pdf">[Handout]</a></h2>

### Reading:
  
*  Chapter 14: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch14.pdf">Link Analysis and Web Search</a>.
  
### Optional Readings:
	
* S. Brin and L. Page. <a href="http://snap.stanford.edu/class/cs224w-readings/Brin98Anatomy.pdf">The Anatomy of a Large-Scale Hypertextual Web Search Engine.</a> Proc. 7th International World Wide Web Conference, 1998.
* J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/kleinberg98authoritative.pdf">Authoritative sources in a hyperlinked environment.</a> Proc. 9th ACM-SIAM Symposium on Discrete Algorithms, 1998.
* P. Berkhin. <a href="http://snap.stanford.edu/class/cs224w-readings/berkhin05pagerank.pdf">A Survey of PageRank Computing.</a> Internet Mathematics, 2005.
* S. Chakrabarti, B. Dom, D. Gibson, J. Kleinberg, S.R. Kumar, P. Raghavan, S. Rajagopalan, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/chakrabarti99link.pdf">Mining the link structure of the World Wide Web.</a> IEEE Computer, August 1999.
* A. Arasu, J. Cho, H. Garcia-Molina, A. Paepcke, S. Raghavan. <a href="http://snap.stanford.edu/class/cs224w-readings/Arasu01Websearch.pdf ">Searching the Web.</a> ACM Transactions on Internet Technology 1(1): 2-43, 2001.
* A. Borodin, J. S. Rosenthal, G. O. Roberts, P. Tsaparas,<a href="http://snap.stanford.edu/class/cs224w-readings/borodin10authorities.pdf">Finding Authorities and Hubs From Link Structures on the World Wide Web.</a> 10th International World Wide Web Conference, May 2001.
* D. Achlioptas, A. Fiat, A. Karlin, F. McSherry. <a href="http://snap.stanford.edu/class/cs224w-readings/achlioptas01websearch.pdf">Web Search via Hub Synthesis.</a>  42nd IEEE Symposium on Foundations of Computer Science, p.611-618, 2001.
* D. Rafiei, A. Mendelzon. <a href="http://snap.stanford.edu/class/cs224w-readings/Rafiei00Pagereputation.pdf">What is this Page Known for? Computing Web Page Reputations.</a>  Proc. WWW Conference, 2000.
* P. Domingos, M. Richardson. <a href="http://snap.stanford.edu/class/cs224w-readings/Richardson02Intelligentsurfer.pdf">The Intelligent Surfer: Probabilistic Combination of Link and Content Information in PageRank.</a> In Proc. NIPS, 2002.
* T. H. Haveliwala. <a href="http://snap.stanford.edu/class/cs224w-readings/Haveliwala02Topicsenitive.pdf">Topic-Sensitive PageRank.</a>  11th International World Wide Web Conference, 2002.
* A. Altman, M. Tennenholtz. <a href="http://snap.stanford.edu/class/cs224w-readings/altman04pagerank.pdf">Ranking Systems: The PageRank Axioms.</a> In Proc. of ACM EC, 2005.
* Z. Gyongyi, H. Garcia-Molina, J. Pedersen. <a href="http://snap.stanford.edu/class/cs224w-readings/gyongyi04trustrank.pdf">Combating Web Spam with TrustRank.</a> In Proc. of VLDB, 2004.
* Z. Gyongyi, P. Berkhin, H. Garcia-Molina, J. Pedersen. <a href="http://snap.stanford.edu/class/cs224w-readings/gyongyi06trustrank.pdf">Link Spam Detection Based on Mass Estimation.</a> In Proc. of VLDB, 2006.
* A. Borodin, G. O. Roberts, J. S. Rosenthal, P Tsaparas. <a href="http://snap.stanford.edu/class/cs224w-readings/borodin05pagerank.pdf">Link Analysis Ranking: Algorithms, Theory, and Experiments.</a> ACM TOIT, 2005.
* A. Ntoulas, J. Cho, C. Olston. <a href="http://snap.stanford.edu/class/cs224w-readings/ntoulas04evolution.pdf">What’s New on the Web? The Evolution of the Web from a Search Engine Perspective.</a> In Proc. WWW, 2004.
* M. A. Najork. <a href="http://snap.stanford.edu/class/cs224w-readings/najork05salsa.pdf">Comparing the eﬀectiveness of HITS and SALSA.</a> In Proc. CIKM, 2007.
* B. Bahmani, A. Chowdhury, A. Goel. <a href="http://snap.stanford.edu/class/cs224w-readings/bahmani10pagerank.pdf">Fast Incremental and Personalized PageRank.</a> In Proc. of VLDB, 2010.
  

		
<h2>Strength of weak ties and Community structure in networks  <a href="http://web.stanford.edu/class/cs224w/slides/15-weakties.pdf">[Slides]</a></h2>

### Reading:
  
*  Chapter 3: <a href="http://snap.stanford.edu/class/cs224w-readings/kleinber00book_ch03.pdf">Strong and Weak Ties</a>.
  
### Optional Readings:
	
* M. Granovetter. <a href="http://snap.stanford.edu/class/cs224w-readings/granovetter73weakties.pdf">The strength of weak ties.</a> American Journal of Sociology, 78(6):1360-1380, 1973.
* J.-P. Onnela, J. Saramaki, J. Hyvonen, G. Szabo, D. Lazer, K. Kaski, J. Kertesz, A.L. Barabasi. <a href="http://snap.stanford.edu/class/cs224w-readings/Onnela07Tiestrength.pdf">Structure and tie strengths in mobile communication networks.</a> PNAS, 2007
* M. Girvan and M.E.J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/girvan01community.pdf">Community structure in social and biological networks.</a>  Proc. Natl. Acad. Sci. 99, 8271-8276, 2002.
* M.E.J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/Newman02Modularity.pdf">Modularity and community structure in networks.</a>, Proc. Natl. Acad. Sci., 2002.
* C. Marlow, L. Byron, T. Lento, I. Rosenn. <a href="http://overstated.net/2009/03/09/maintained-relationships-on-facebook">Maintained relationships on Facebook.</a> 2009.
* B.A. Huberman, D.M. Romero, F. Wu. <a href="http://snap.stanford.edu/class/cs224w-readings/huberman09twitter.pdf">Social networks that matter: Twitter under the microscope.</a> First Monday, 14(1), 2009.
* L. Backstrom, D. Huttenlocher, J. Kleinberg, X. Lan. <a href="http://snap.stanford.edu/class/cs224w-readings/backstrom06groupformation.pdf">Group Formation in Large Social Networks: Membership, Growth, and Evolution.</a> In Proc. KDD, 2006.
* P.S. Bearman, J. Moody. <a href="http://snap.stanford.edu/class/cs224w-readings/bearman04suicide.pdf">Suicide and Friendships Among American Adolescents.</a> Am J Public Health, 94(1): 89-95, 2004.
* R. Burt. <a href="http://snap.stanford.edu/class/cs224w-readings/burt00capital.pdf">Structural Holes versus Network Closure as Social Capital.</a> Chapeter in Social Capital: Theory and Research, 2001.
* R. Burt. <a href="http://snap.stanford.edu/class/cs224w-readings/Burt04StructureHole.pdf">Structural Holes and Good Ideas.</a> American Journal of Sociology, Vol. 110, No. 2 2004.
* G. Flake, S. Lawrence, C.L. Giles, F. Coetzee. <a href="http://snap.stanford.edu/class/cs224w-readings/Lawrence02webcommunities.pdf">Self-Organization and Identification of Web Communities.</a> IEEE Computer, 35:3, 2002.
* G. Flake, K. Tsioutsiouliklis, R.E. Tarjan. <a href="http://snap.stanford.edu/class/cs224w-readings/Flake02GraphClustering.pdf">Graph Clustering Techniques based on Minimum Cut Trees.</a> Technical Report 2002-06, NEC, Princeton, NJ, 2002.
* S. Fortunato <a href="http://snap.stanford.edu/class/cs224w-readings/fortunato10community.pdf">Community detection in graphs</a>, Arxiv 2009.
* A. Clauset, M.E.J. Newman, C. Moore. <a href="http://snap.stanford.edu/class/cs224w-readings/clauset04community.pdf">Finding community structure in very large networks.</a>  Phys. Rev. E 70, 066111, 2004
* M.E.J. Newman, M. Girvan. <a href="http://snap.stanford.edu/class/cs224w-readings/newman03community.pdf">Finding and evaluating community structure in networks.</a> Phys. Rev. E 69, 026113, 2004.
* U. Brandes. <a href="http://snap.stanford.edu/class/cs224w-readings/brandes01centrality.pdf">A faster algorithm for betweenness centrality.</a> Journal of Mathematical Sociology, 2001.
* J. Reichardt, S. Bornholdt. <a href="http://snap.stanford.edu/class/cs224w-readings/reichardt06community.pdf">Statistical Mechanics of Community Detection.</a>,  Phys. Rev. E 74 016110, 2006.
* S. Fortunato, S. Barthelemy. <a href="http://snap.stanford.edu/class/cs224w-readings/fortunato06community.pdf">Resolution limit in community detection</a>. Proc. Natl. Acad. Sci., 2007.
* U. Brandes, D. Delling, M. Gaertler, R. Goerke, M. Hoefer, Z. Nikoloski, D. Wagner. <a href="http://snap.stanford.edu/class/cs224w-readings/brandes07modularity.pdf">On Modularity Clustering.</a> IEEE TKDE, 2007.
  
<h2>Network community detection: Modularity optimization and Spectral Clustering <a href="http://web.stanford.edu/class/cs224w/slides/16-spectral.pdf">[Slides]</a><a href="http://web.stanford.edu/class/cs224w/slides/clustering.pdf">[Handout]</a></h2>

### Reading:
  
A. Rajaraman, J. Ullman, J. Leskovec. <a href="http://infolab.stanford.edu/~ullman/mmds/ch10.pdf">Chapter 10.4</a> of Mining Massive Datasets. 2013.
  
### Additional readings:
  
* J. Shi, J. Malik. <a href="http://snap.stanford.edu/class/cs224w-readings/shi99normalizedcuts.pdf">Normalized Cuts and Image Segmentation.</a> IEEE Transactions On Pattern Analysis And Machine Intelligence, vol. 22, no. 8, 2000.
* R. Kannan, S. Vempala, A. Vetta. <a href="http://snap.stanford.edu/class/cs224w-readings/kannan00clustering.pdf">On clusterings: Good, bad and spectral.</a> Journal of the ACM, 51(3):497-515, 2004.
* M. Fiedler. <a href="http://snap.stanford.edu/class/cs224w-readings/fiedler73connectivity.pdf">Algebraic connectivity of graphs.</a> Czechoslovak Mathematical Journal, 1973.
* A. Pothen, H.D. Simon, K.P. Liou. <a href="http://snap.stanford.edu/class/cs224w-readings/Pothen89Partition.pdf ">Partitioning sparse matrices with egenvectors of graph.</a> SIAM Journal of Matrix Anal. Appl., 11:430--452, 1990.
* L. Hagen, A.B. Kahng. <a href="http://snap.stanford.edu/class/cs224w-readings/hagen91spectral.pdf">New spectral methods for ratio cut partitioning and clustering.</a> IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems, 1992.
* A. Ng, M. Jordan, Y. Weiss. <a href="http://snap.stanford.edu/class/cs224w-readings/ng01spectralcluster.pdf">On spectral clustering: Analysis and an algorithm.</a> NIPS, 2001.
* U. von Luxburg. <a href="http://arxiv.org/PS_cache/arxiv/pdf/0711/0711.0189v1.pdf">Tutorial on spectral clustering.</a> Arxiv 2009.
* S. Dill, R. Kumar, K. McCurley, S. Rajagopalan, D. Sivakumar, A. Tomkins. <a href="http://snap.stanford.edu/class/cs224w-readings/Dill01SelfSim.pdf">Self-similarity in the Web.</a>  In Proc. VLDB, 2001.
  

<h2>Overlapping communities in networks <a href="http://web.stanford.edu/class/cs224w/slides/17-overlapping.pdf">[Slides]</a></h2>

### Reading:
  
* G. Palla, I. Derenyi, I. Farkas, T. Vicsek. <a href="http://snap.stanford.edu/class/cs224w-readings/palla05overlapping.pdf">Uncovering the overlapping community structure of complex networks in nature and society.</a> Nature 435, 814-818, 2005.
	
### Additional readings:
  
* E. Tomita, A. Tanaka, H. Takahashi. <a href="http://snap.stanford.edu/class/cs224w-readings/tomita06cliques.pdf">The worst-case time complexity for generating all maximal cliques and computational experiments.</a> Theoretical Computer Science, Volume 363, Issue 1, 2006.
* G. Palla, A.L. Barabasi, T. Vicsek. <a href="http://snap.stanford.edu/class/cs224w-readings/palla07evolution.pdf">Quantifying social group evolution.</a> Nature 446, 664-667, 2007.
* J. Leskovec, K. Lang, A. Dasgupta, M. Mahoney. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec08ncp.pdf">Statistical Properties of Community Structure in Large Social and Information Networks.</a> In Proc. WWW, 2008.
* J. Leskovec, K. Lang, M. Mahoney. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec10communitydetection.pdf">Empirical Comparison of Algorithms for Network Community Detection.</a> In Proc. WWW, 2010.
* J. Leskovec, K. Lang, A. Dasgupta, M. Mahoney. <a href="http://snap.stanford.edu/class/cs224w-readings/leskovec08community.pdf">Community Structure in Large Networks: Natural Cluster Sizes and the Absence of Large Well-Defined Clusters.</a> Internet Mathematics, 2009.
* G. Karypis, V. Kumar. <a href="http://snap.stanford.edu/class/cs224w-readings/Karypis08multilevel.pdf">Multilevel k-way Partitioning Scheme for Irregular Graphs.</a> J. Parallel Distrib. Comput, 48(1): 96-129, 1998.
* I. Dhillon, Y. Guan, and B, Kulis. <a href="http://snap.stanford.edu/class/cs224w-readings/dhillon05multilevel.pdf">A Fast Kernel-based Multilevel Algorithm for Graph Clustering.</a> In Proc. KDD, 2005.
* R. Andersen, F. Chung, K. Lang. <a href="http://snap.stanford.edu/class/cs224w-readings/andersen06localgraph.pdf">Local graph partitioning using pagerank vectors.</a> In Proc. FOCS, 2006.
* T. Leighton, S. Rao. <a href="http://snap.stanford.edu/class/cs224w-readings/leighton99mincut.pdf">Multicommodity max-flow min-cut theorems and their use in designing approximation algorithms.</a> Journal of the ACM, 1999.
  

<h2>Link Prediction and Network Inference <a href="http://web.stanford.edu/class/cs224w/slides/18-linkpred.pdf">[Slides]</a></h2>

### Readings:
	
* L. Backstrom, J. Leskovec. <a href="http://snap.stanford.edu/class/cs224w-readings/backstrom11randomwalk.pdf">Supervised Random Walks: Predicting and Recommending Links in Social Networks.</a> In Proc. WSDM, 2011.
	
### Additional readings:
  
* D. Liben-Nowell, J. Kleinberg. <a href="http://snap.stanford.edu/class/cs224w-readings/nowell04linkprediction.pdf">The Link Prediction Problem for Social Networks.</a> Proc. CIKM, 2003.
* S. A. Myers, J. Leskovec. <a href="http://cs.stanford.edu/people/jure/pubs/connie-nips10.pdf">On the Convexity of Latent Social Network Inference.</a> Neural Information Processing Systems (NIPS), 2010.
* M. Gomez-Rodriguez, D. Balduzzi, B. Schoelkopf. <a href="http://www.stanford.edu/~manuelgr/pubs/netrate-icml11.pdf">Uncovering the Temporal Dynamics of Diffusion Networks.</a> In Proc. ICML 2011.
* A. Clauset, C. Moore, M.E.J. Newman. <a href="http://snap.stanford.edu/class/cs224w-readings/clauset08hierarchical.pdf">Hierarchical structure and the prediction of missing links in networks.</a> Nature, 2008.
* M. Kim, J. Leskovec. <a href="http://cs.stanford.edu/people/jure/pubs/kronEM-sdm11.pdf">The Network Completion Problem: Inferring Missing Nodes and Edges in Networks.</a> In Proc. SDM, 2010.
* F. Chierichetti, J. Kleinberg, D. Liben-Nowell. <a href="http://www.cs.cornell.edu/home/kleinber/nips11-tree.pdf"> Reconstructing Patterns of Information Diffusion from Incomplete Observations.</a> Neural Information Processing Systems (NIPS), 2011.
* B. Taskar, M.F. Wong, P. Abbeel, D. Koller. <a href="http://books.nips.cc/papers/files/nips16/NIPS2003_AP12.pdf">Link prediction in relational data.</a> Neural Information Processing Systems (NIPS), 2006.
* P. D’haeseleer, S. Liang2, R. Somogyi. <a href="http://arbor.ee.ntu.edu.tw/~brdai/papercollection/Bioinfo/dhaegn00.pdf">Genetic network inference: from co-expression clustering to reverse engineering. </a> Bioinformatics, vol. 16, 2000.
  


<h2>Biological networks <a href="http://web.stanford.edu/class/cs224w/slides/19-bionets.pdf">[Slides]</a><a href="http://web.stanford.edu/class/cs224w/slides/handout-bionets.pdf">[Handout]</a></h2>

### Readings:
	
* S.D. Ghiassian, J. Menche, A-L. Barabási. <a href="http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004120">A DIseAse MOdule Detection (DIAMOnD) Algorithm Derived from a Systematic Analysis of Connectivity Patterns of Disease Proteins in the Human Interactome.</a> PLoS Computational Biology, 2015.
* A-L. Barabási, N. Gulbahce, J. Loscalzo. <a href="http://www.nature.com/nrg/journal/v12/n1/abs/nrg2918.html">Network Medicine: a Network-Based Approach to Human Disease.</a> Nature Reviews Genetics, 2011.
	
### Additional readings:
  
* S.D. Himmelstein, S.E. Baranzini. <a href="http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004259">Heterogeneous Network Edge Prediction: a Data Integration Approach to Prioritize Disease-Associated Genes.</a> PLoS Computational Biology, 2015.
* M. Costanzo, et al. <a href="http://science.sciencemag.org/content/327/5964/425">The Genetic Landscape of a Cell.</a> Science, 2010.
* A. Baryshnikova. <a href="http://www.cell.com/cell-systems/fulltext/S2405-4712(16)30148-X">Systematic Functional Annotation and Visualization of Biological Networks.</a> Cell Systems, 2016.
* J.X. Hu, C.E. Thomas, S. Brunak. <a href="http://www.nature.com/nrg/journal/v17/n10/full/nrg.2016.87.html">Network Biology Concepts in Complex Disease Comorbidities.</a> Nature Reviews Genetics, 2016.
* J. Menche, et al. <a href="http://science.sciencemag.org/content/347/6224/1257601">Uncovering Disease-Disease Relationships Through the Incomplete Interactome.</a> Science, 2015.
* A.B. Jensen, et al. <a href="http://www.nature.com/articles/ncomms5022?cmpid=newscred">Temporal Disease Trajectories Condensed from Population-Wide Registry Data Covering 6.2 Million Patients.</a> Nature Communications, 2014.
* S. Mostafavi, et al. <a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2008-9-s1-s4">GeneMANIA: a Real-Time Multiple Association Network Integration Algorithm for Predicting Gene Function.</a> Genome Biology, 2008.
* M. Hofree, et al. <a href="http://www.nature.com/nmeth/journal/v10/n11/full/nmeth.2651.html">Network-Based Stratification of Tumor Mutations.</a> Nature Methods, 2013.
* H. Yu, et al. <a href="http://science.sciencemag.org/content/322/5898/104">High-Quality Binary Protein Interaction Map of the Yeast Interactome Network.</a> Science, 2008.
* X. Zhou, et al. <a href="http://www.nature.com/articles/ncomms5212">Human Symptoms-Disease Network</a>. Nature Communications, 2014.
* A. Mazza, K. Klockmeier, E. Wanker, R. Sharan. <a href="http://bioinformatics.oxfordjournals.org/content/32/12/i271.short">An Integer Programming Framework for Inferring Disease Complexes from Network Data.</a> Bioinformatics, 2016.
* D.M. Leiserson, et al. <a href="http://www.nature.com/ng/journal/v47/n2/abs/ng.3168.html">Pan-Cancer Network Analysis Identifies Combinations of Rare Somatic Mutations Across Pathways and Protein Complexes.</a> Nature Genetics, 2015.
* C.S. Greene, et al. <a href="http://www.nature.com/ng/journal/v47/n6/abs/ng.3259.html">Understanding Multicellular Function and Disease with Human Tissue-Specific Networks.</a> Nature Genetics, 2015.
* M. Kramer, et al. <a href="http://bioinformatics.oxfordjournals.org/content/30/12/i34.short">Inferring Gene Ontologies from Pairwise Similarity Data.</a> Bioinformatics, 2014.
* Y. Hulovatyy, H. Chen, T. Milenkovic. <a href="http://bioinformatics.oxfordjournals.org/content/31/12/i171.short">Exploring the Structure and Function of Temporal Networks with Dynamic Graphlets.</a> Bioinformatics, 2015.
* S. Lee, S. Kong, E.P. Xing. <a href="http://bioinformatics.oxfordjournals.org/content/32/12/i164.short">A Network-Driven Approach for Genome-Wide Association Mapping.</a> Bioinformatics, 2016.
* Y. Li, et al. <a href="http://www.cell.com/cell/fulltext/S0092-8674(14)00720-X">Expansion of Biological Pathways Based on Evolutionary Inference.</a> Cell, 2014.
* E. Guney, et al. <a href="http://www.nature.com/articles/ncomms10331">Network-Based in Silico Drug Efficacy Screening.</a> Nature Communications, 2016.
  

<h2>Networks: Two Fun Topics <a href="http://web.stanford.edu/class/cs224w/slides/20-review.pdf">[Slides]</a></h2>

### Readings:

* C. Danescu-Niculescu-Mizil, R. West, D. Jurafsky, J. Leskovec, C. Potts. <a href="http://cs.stanford.edu/people/jure/pubs/language-www13.pdf">No Country for Old Members: User lifecycle and linguistic change in online communities</a>  ACM International Conference on World Wide Web (WWW), 2013
* A. Anderson, D. Huttenlocher, J. Kleinberg, J. Leskovec. <a href="http://cs.stanford.edu/people/jure/pubs/badges-www13.pdf">Steering User Behavior With Badges</a>. ACM International Conference on World Wide Web (WWW), 2013.
* J. Kleinberg. <a href="http://www.cs.cornell.edu/home/kleinber/cacm08.pdf">The convergence  of social and  technological  networks.</a> CACM, 2008.
	
### Additional readings:
	
* D. Lazer et al. <a href="http://jhfowler.ucsd.edu/computational_social_science.pdf">Life in the network: the coming age of computational social science.</a> Science, 2009.
* L.-A. Barabasi. <a href="http://www.amazon.com/Linked-Everything-Connected-Else-Means/dp/0452284392">Linked: How Everything Is Connected to Everything Else and What It Means.</a> Plume, 2003.
* N. Christakis, J.H. Fowler. <a href="http://www.amazon.com/Connected-Surprising-Networks-Friends-Everything/dp/0316036137">Connected: The Surprising Power of Our Social Networks and How They Shape Our Lives.</a> Back Bay Books, 2011.
* D.J. Watts. <a href="http://www.amazon.com/Six-Degrees-Science-Connected-Market/dp/0393325423">Six Degrees: The Science of a Connected Age.</a>  W. W. Norton &amp; Company, 2004.

		
<h2>Homeworks</h2>

*  <a href="homeworks/hw0/hw0.pdf">Homework 0</a> (Due at 11:59pm Oct. 6, 2016). Submission Template for HW0 [<a href="homeworks/hw0/submission_template_hw0.pdf">pdf</a> | <a href="homeworks/hw0/submission_template_hw0.tex">tex</a>]. Solutions:  [<a href="homeworks/hw0/hw0_solutions.pdf">PDF</a>][<a href="homeworks/hw0/hw0_sol_code.zip">Code</a>].
*  <a href="homeworks/hw1/hw1.pdf">Homework 1</a> (Due at 11:59pm
  Oct. 13, 2016). Submission Template for HW1 [<a href="homeworks/hw1/submission_template_hw1.pdf">pdf</a> | <a href="homeworks/hw1/submission_template_hw1.tex">tex</a>]. Solutions:  [<a href="homeworks/hw1/hw1_sol.pdf">PDF</a>].
*  <a href="homeworks/hw2/hw2.pdf">Homework 2</a> (Due at 11:59pm Oct. 27, 2016).  Submission Template for HW2 [<a href="homeworks/hw2/submission_template_hw2.pdf">pdf</a> | <a href="homeworks/hw2/submission_template_hw2.tex">tex</a>] Solutions: [<a href="homeworks/hw2/hw2_sol.pdf">PDF</a>]. 
*  <a href="homeworks/hw3/hw3.pdf">Homework 3</a> (Due at 11:59pm Nov. 10, 2016).  Submission Template for HW3 [<a href="homeworks/hw3/submission_template_hw3.pdf">pdf</a> | <a href="homeworks/hw3/submission_template_hw3.tex">tex</a>]. Solutions [<a href="homeworks/hw3/hw3_sol.pdf">PDF</a>]. 
*  <a href="homeworks/hw4/hw4.pdf">Homework 4</a> (Due at 11:59pm Dec. 1, 2016).  Submission Template for HW4 [<a href="homeworks/hw4/submission_template_hw4.pdf">pdf</a> | <a href="homeworks/hw4/submission_template_hw4.tex">tex</a>]. Solutions [<a href="homeworks/hw4/hw4_sol.pdf">PDF</a>]. 

<h2>Recitations</h2>

* Introduction to <a href="recitation/SnapRecitationSlides.pdf">SNAP.PY</a>: Friday, 9/30, 12:30-1:20pm in Huang 18
* <a href="recitation/proof_techniques.pdf">Probability, Linear Algebra and Proof Techniques review</a>: Monday, 10/03, 3:00-3:50pm in Gates B03

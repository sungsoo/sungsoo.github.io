---
layout: post
title: Structural Analysis and Visualization of Networks
date: 2017-04-29
categories: [computer science]
tags: [big data]

---

## Article Source
* Title: [Structural Analysis and Visualization of Networks](http://www.leonidzhukov.net/hse/2015/networks/)
* Authors:  Prof. Leonid Zhukov, National Research University Higher School of Economics

---

# Structural Analysis and Visualization of Networks 

## Outline

<ol>
<li>Introduction to network science</li>
<li>Power laws</li>
<li>Models of network formation</li>
<li>Structure, nodes and links analysis</li>
<li>Network communities</li>
<li>Evolving networks and link prediction</li>
<li>Diffusion and random walks</li>
<li>Epidemics on networks</li>
<li> Diffusion of information</li>
<li>Influence propagation</li>
</ol>


<h2>Module 3</h2>


<h2>Lectures </h2>
<ol>
<li>[15.01.2015] <b>Introduction to network science.</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture1.pdf">Lecture 1</a>] [<a href="https://youtu.be/UHnmPu8Zevg">Video</a>]<br>
Introduction to the complex network theory. Network properties and metrics.
  </li>
<li>[20.01.2015] <b> Power laws.</b>
[<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture2.pdf">Lecture 2</a>] [<a href="http://youtu.be/9JkWtaVCqs0">Video</a>] <br>
Power law distribution. Scale-free networks.Pareto distribution,
  noramlization, moments. Zipf law. Rank-frequency plot.  
</li>
<li>[27.01.2015] <b>Random graphs.</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture3.pdf">Lecture 3</a>] [<a href="http://youtu.be/AmZ_MOQ-XwA">Video</a>]<br>
Erdos-Reni random graph model. Poisson and Bernulli
distributions. Distribution of node degrees. Phase transition,
gigantic connected component. Diameter and cluster
coefficient. Configuration model 
</li>
<li>[03.02.2015] <b>Small world and dynamical growth
models.</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture4.pdf">Lecture 4</a>] [<a href="http://youtu.be/sjF_-s5Xzwg">Video</a>] <br>
Barabasi-Albert model. Preferential attachement. Time evolition of node degrees. Node degree
distribution. Average path length and clustering coefficient. Small
world model. Watts-Strogats model. Transition from ragular to
random. Clustering coefficient and ave path lenght.
</li>
<li>[10.02.2015] <b>Centrality measures.</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture5.pdf">Lecture 5</a>]
[<a href="http://youtu.be/DfV-pjRTlLg">Video</a>]
<br>
Node centrality metrics, degree centrality, closeness centrality,
betweenness centrality, eigenvector centrality. Katz status index and Bonacich centrality, alpha centrality 
Spearman rho and Kendall-Tau ranking distance.
</li>

<li>[17.02.2015] <b>Link analysis.</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture6.pdf">Lecture 6</a> ]
[<a href="http://youtu.be/57IooJ71FTs">Video</a>]<br>
Directed graphs. PageRank, Perron-Frobenius
theorem and algorithm convergence. Power iterations. Hubs and Authorites. HITS
algorithm. 
</li>

<li>[24.02.2015] <b>Structural equivalence.</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture7.pdf">Lecture 7</a>]
[<a href="http://youtu.be/d5RUMz1gBeo">Video</a>]<br>
Structural and regular equivalence. Similarity metrics. Correlation coefficient and cosine similarity.
Assortative mixing and homophily. Modularity. Assortativity coefficient. Mixing by node degree. Assortative and disassortative networks.

</li>
<li>[03.03.2015] <b> Network communitites.</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture8.pdf">Lecture 8</a>] [<a href="http://youtu.be/lU1QEUH0nNc">Video</a>]  <br>
Cohesive subgroups. Graph cliques, k-plexes, k-cores.  Network communities.  Vertex similarity matrix. Similarity based clustering.
Agglomerative clustering. Graph partitioning. Repeated bisection. Edge Betweenness. Newman-Girvin algorithm. 
</li>

<li>[10.03.2015] <b>Graph partitioning algorithms.
</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture9.pdf">Lecture 9</a>] [<a href="http://youtu.be/4jGcDq_ZFoA">Video</a>] <br>
Graph density. Graph pertitioning. Min cut, ratio cut, normalized
and quotient cuts metrics. Spectral graph partitioning (normalized cut).
Direct (spectral) modularity maximization. Multilevel recursive partitioning
</li>

<li>[17.03.2015] <b>Community detection.
</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture10.pdf">Lecture 10</a>] [<a href="http://youtu.be/jIS5pZ8doH8">Video</a>]  <br>

Community detection algorithms. Overlapping communities. Clique percolation method.
 Heuristic methods. Label propagation. Fast community unfolding. Random walk based methods. 
 Walktrap. Nibble.
</li>

<!--
<li>[17.03.2015] <b> Special classes of  networks
</b> [<a href =lectures/lecture10.pdf></a>Lecture 10</a>]  <br>
Bi-partite graphs and affiliation networks. Networks with signed edges
</li>
-->
<li>[24.03.2015] <b>Student midterm exam presentations.</b> [<a href="https://youtu.be/tW4MQ3ntKGE">Video</a>] <br>
</li>
</ol>

<a name="labs3"></a>
<h2>Labs </h2>
iPython <a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/table_of_contents.ipynb" notebooks=""> notebooks</a>:
<ol>
<li>
Introduction to iPython enviroment and NetworkX.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/setting_envrmt.ipynb"> Lab 1</a>
</li>
<li>
Power laws.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/power_law.ipynb"> Lab 2 </a>
</li>
<li>
Random graphs.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/rand_graph.ipynb"> Lab 3</a>
</li>
<li>
Small world models.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/small_world_model.ipynb"> Lab 4</a>
</li>
<li>
Node centralities.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/centralities.ipynb"> Lab 5</a>
</li>
<li>
PageRank and HITS.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/page_rank_hits.ipynb">Lab 6</a>
</li>
<li>
Structural similarity.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/struct_sim.ipynb">Lab 7</a>
</li>
<li>
Dense Subgroups in Networks, Communities and Motif counting.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/dense_motifs.ipynb">Lab 8</a>
</li>
<li>
Community detection algorithms.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/communities.ipynb">Lab 9</a>
</li>
<li>
Community detection algorithms, part 2.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/communities_2.ipynb">Lab 10</a>
</li>
</ol>



<a name="homeworks3"></a>

<h2>Homeworks</h2>
<ol>
<li>[20.01.2015, due: 28.01.2015]. 
Power laws. 
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/networks_ha1.ipynb">
Homework 1 </a>
</li>

<li>[10.02.2015, due: 18.02.2015].
Network models.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/networks_ha2.ipynb">
Homework 2</a>
</li>

<li>[27.02.2015, due: 09.03.2015].
Centralities and assortativitiy coefficients.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/table_of_contents.ipynb">
Homework 3</a>
</li>


<li>[11.03.2015, due: 19.03.2015].
Community Detection Algorithms.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/networks_ha4.ipynb"> Homework 4</a>
</li>

<li>[17.03.2015, due: 24.03.2015].
FB or VK personal graph analysis. Midterm exam presentation.
</li>
</ol>



<h2>Module 4</h2>

<h2>Lectures </h2>
<ol>
<li>[31.03.2015] <b>Diffusion on networks </b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture11.pdf">Lecture 11</a>] 
[<a href="http://youtu.be/reTP7XAJztU">Video</a>] 
 <br>
Random walks on graph. Stationary distribution. 
Physical diffusion. Diffusion equation. Diffusion on networks.
Discrete Laplace operator, Laplace matrix. Solution of the diffusion
equation. Normalized Laplacian.
</li>
<li>[07.04.2015] <b> Epidemics</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture12.pdf">Lecture 12</a>]
[<a href="http://youtu.be/Pf-5FbH-x74">Video</a>] 
<br>
Epidemic models: SI, SIS, SIR. Limiting cases. Basic reproduction number.  Branching Galton-Watson process. Probability of epidemics.
</li>


<li>[14.04.2015] <b> Epidemics on networks</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture13.pdf">Lecture 13</a>] 
[<a href="https://youtu.be/6pneK0tN1-I">Video</a>] 
.<br>
Spread of epidemics on network. SI, SIS, SIR models. Epidemic threshold. Simulations of infection propagation.
</li>


<li>[21.04.2015] <b>Social contagion and spread of information</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture14.pdf">Lecture 14</a>] [<a href="http://youtu.be/HFix0j5OOFo">Video</a>] <br>
Information diffusion. Rumor spreading models. Homogenous and mean field models. 
Examples. Cascades and information propagation trees. 
</li>


<li>[28.04.2015] <b>Diffusion of innovation and influence maximization</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture15.pdf">Lecture 15</a>] [<a href="http://youtu.be/JAfA5nkvHaM">Video</a>]  <br>
Diffusion of innovation. Independent cascade model. Linear threshold model. Influence maximization. 
Submodular functions. Finding most influential nodes in networks.
</li>


<li>[12.05.2015] <b> Social learning</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture16.pdf">Lecture 16</a>] 
[<a href="http://youtu.be/GrIToRd2TmI">Video</a>] <br>
Social learning in networks. DeGroot model. Reaching consensus. Influence vector. Social influence networks
</li>


<li>[19.05.2015] <b>Label propagation on graph</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture17.pdf">Lecture 17</a>] 
[<a href="https://youtu.be/hmashUPJwSQ">Video1</a>] [<a href="http://youtu.be/F4f247IyOTs">Video2</a>]<br>
Node labeling. Label propagation. Iterative classification. Semi-supervised learning. Regularization on graphs
</li>


<li>[26.05.2015] <b>Link prediction</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture18.pdf">Lecture 18</a>] [<a href="http://youtu.be/2M77Hgy17cg">Video</a>]<br>
Link prediction problem. Proximity measures. Scoring algorithms. 
Prediction by supervised learning. Performance evaluation.
</li>

<!--
<li>[02.06.2015] <b>Time evolution of networks</b>[<a href = lectures/lecture19.pdf><a>Lecture 19</a>] <br>
</li>
-->

<li>[02.06.2015] <b>Spatial
segregation</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture19.pdf">Lecture 19</a>] [<a href="http://youtu.be/XeizyVYk0lg">Video</a>]<br>
Schelling's segregation model. Spatial segregation. Agent based modelling. Segregation in networks

</li><li>[09.06.2015] <b>Strategic network formation</b> [<a href="http://www.leonidzhukov.net/hse/2015/networks/lectures/lecture20.pdf">Lecture 20</a>] <br>
Economic models of networks. Course summary.
</li>
</ol>

<h2>Labs</h2>
iPython <a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/table_of_contents.ipynb" notebooks=""> notebooks</a>:
<ol>
<li>Random walk modeling.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/random_walk.ipynb">Lab 1</a>
</li>
<li>Epidemics
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/epidemics.ipynb">Lab 2</a>
</li>
<li>Epidemics on networks.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/epidemics_ntwrks.ipynb">Lab 3</a>
</li>
<li>
Threshold models.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/threshold.ipynb">Lab 4</a>
</li>
<li>
Social learning.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/social_learning.ipynb">Lab 5 </a>
</li>
<li>
Node label and link prediction.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/prediction.ipynb">Lab 6</a>
</li>
<li>
Segregation models.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/segregation.ipynb">Lab 7</a>
</li>
</ol>


<h2> Projects</h2>
<ol>
<li>Information and influence propagation in networks.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/networks_project1.ipynb">Course Project 1</a>
</li>
<li> Link prediction.
<a href="http://nbviewer.ipython.org/github/shestakoff/social_ntwks/blob/master/networks_project2.ipynb">Course Project 2</a>

</li>

</ol>


<a name="reading3"></a> 
<h2>Reading material</h2>


<ul>
<b>Lecture 1:</b>  
<li> Albert-Laszlo Barabasi and Eric Bonabeau.
  <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/ScaleFreeNetworks_ScientificAmerican_Barabasi.pdf">Scale
  Free Networks</a>. Scientific American, p 50-59, 2003
</li>
<li> Mark Newman.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/newman-physicsToday.pdf">The physics of networks</a>. Physics Today,2008
</li>
<li>
Stanley Milgram. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/milgram67smallworld.pdf">The Small-World Problem</a>. Psychology
Today, Vol 1, No 1, pp 61-67, 1967
</li>
<li> J. Travers and S. Milgram.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/travers69smallworld.pdf">An Experimental Study of the Small World
Problem</a>. Sociometry, vol 32, No 4, pp 425-433, 1969
<!--
<li> Mark Granovetter. <a href = papers/granovetter73weakties.pdf> The strengtth of weak
ties </a>, American Journal of Sociology, 78(6):1360-1380, 1973.
</li>
-->
</li><li>
J. Leskovec and E. Horvitz. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/leskovec_horvitz_www2008.pdf"> Planetary-Scale Views on a Large Instant-Messaging Network. </a>
 Proceedigs  WWW 2008
</li><li>
 L. Backstrom, P. Boldi, M. Rosa, J. Ugander,  S. Vigna.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/websci12-fourdegrees.pdf"> Four Degrees of Separation. </a> 
WebSci '12 Procs. 4th ACM Web Science Conference,
pp 33-42, 2012 
</li>




<br>
<b>Lecture 2:</b>
<li>
M. E. J. Newman.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/newman-power_law_zipf.pdf">
Power laws, Pareto distributions and Zipf’s law</a>. Contemporary Physics 46(5), 323-351, 2005
</li>
<li>A. Clauset, C.R. Shalizi, M.E.J. Newman.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/Clauset_Shalizi_Newman_09.pdf">
Power-law distributions in empirical data</a>. SIAM Review 51(4), 661-703, 2009
</li>
<li>
 M. Mitzenmacher.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/mitzenmacher2003a.pdf">
A brief history of generative models for power law and lognormal
distributions</a>. Internet Mathematics, vol 1, No. 2, pp. 226-251, 2004.
</li>
<li>
M.L. Goldstein, S.A. Morris, and G.G. Yen. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/goldstein2004.pdf"> Problems with fitting to
the power-law distribution </a>, Eur. Phys. J. B 41, pp 255–258, 2004. 
</li>
<li>
Chapter 18. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/networks-book-ch05.pdf"></a>Power Laws and
Rich-Get-Richer Phenomena. D. Easley and J. Kleinberg. "Networks, Crowds, and Markets: Reasoning About a Highly Connected
World".
</li>


<br>
<b>Lecture 3:</b>
<li>P. Erdos and A. Renyi.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/erdos-1959-11.pdf">
On random graphs I</a>. Publ. Math. Debrecen, 1959.
</li>
<li>P. Erdos and A. Renyi.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/erdos-1960-10.pdf">
On the evolution of random graphs</a>. Magyar Tud. Akad. Mat. Kutato Int. Koezl., 1960.
</li>
<li> Chapter 12. Random graphs. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>


<br>
<b>Lecture 4:</b>
<li>Duncan J. Watts  and Steven H. Strogatz.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/watts-collective_dynamics-nature_1998.pdf">
Collective dynamics of ‘small-world’ networks. 
</a>. Nature 393:440-42, 1998. 
</li>
<li>AL Barabasi and R. Albert.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/barabsi-emerging_scaling-science-1999.pdf">
Emergence of Scaling in Random Networks</a>. Science, 286, 1999.
</li>
<li>Chapter 14. Models of network formation. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>
<li>
Chapter 20. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/networks-book-ch05.pdf"></a>The Small-World
Phenomenon. D. Easley and J. Kleinberg. "Networks, Crowds, and Markets: Reasoning About a Highly Connected
World".
</li>



<br>
<b>Lecture 5:</b>
<li>Linton C. Freeman.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/freeman79-centrality.pdf">
Centrality in Social Networks. Conceptual Clarification</a>.
Social Networks, Vol 1, pp 215-239, 1978
</li>
<li>Phillip Bonacich.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/Bonacich-Centrality.pdf">
Power and Centrality: A Family of Measures</a>. American journal of sociology, Vol.92,  pp 1170-1182, 1987.
</li>
<li> Leo Katz
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/katz-1953.pdf">
A new status index derived from sociometric analysis </a>. Psychometrika, 19, 39-43, 1953.
</li>
<li>Phillip Bonacich, Paulette Lloyd,
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/bonacich2001.pdf">
Eigenvector-like measures of centrality for asymmetric relations </a>.
Social Networks 23, 191–201, 2001

</li><li> Chapter 7. Measures and metrics. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>
<li>Chapter 5. Centrality and Prestige. S. Wasserman
and K. Faust.
"Social Network Analysis. Methods and Applications". Cambridge University Press, 1994
</li>



<br>
<b>Lecture 6:</b>
<li>Sergey Brin, Larry Page.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/brin_page1998.pdf">
The Anatomy of a Large-Scale Hypertextual Web Search Engine,
</a>,1998.
</li>
<li>
John M. Kleinberg.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/hubs-auth-kleinberg.pdf">
Authoritative Sources in a Hyperlinked Environment</a>. Proc. 9th ACM-SIAM Symposium on Discrete Algorithms, 1998.
</li>
<li>
Andrei Broder et all. 
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/broder2000">Graph structure in the Web.</a> Procs of the 9th international World Wide Web conference,
2000
</li>
<li>
Amy N. Langville and Carl D. Meyer,
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/ALangville_Survey.pdf"> A Survey of Eigenvector Methods of Web Information Retrieval.</a> 2004
</li>
<li>
David F. Gleich.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/DGleich_pagerank">PageRank beyond the Web</a> arXiv:1407.5107, 2014
</li>
<li> Chapter 7. Measures and metrics. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>
<li>
Chapter 14. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/networks-book-ch05.pdf"></a>Link Analysis
and Web Search. D. Easley and J. Kleinberg. "Networks, Crowds, and Markets: Reasoning About a Highly Connected
World".
</li>


<br>
<b>Lecture 7:</b>
<li>
White, D., Reitz, K.P. Measuring role distance: structural, regular and relational
equivalence. Technical report, University of California, Irvine, 1985
</li>
<li>
S. Borgatti, M. Everett. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/borgatti_1989_equivalences.pdf"> The class of all regular equivalences: algebraic structure 
and computations.</a> Social Networks, v 11, p65-68, 1989
</li>
<li>
E. A. Leicht, P.Holme, and M. E. J. Newman. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/VertexSimilarity_Newman.pdf">Vertex similarity in networks. </a>Phys. Rev. E 73, 026120, 200
</li>
<li>
 G. Jeh and J. Widom. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/simrank.pdf">SimRank: A Measure of Structural-Context Similarity.</a>  
 Proceedings of the eighth ACM SIGKDD , p 538-543. ACM Press, 2002
</li>
<li>
M. McPherson, L. Smith-Lovin, and
J. Cook. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/McPherson_HomophilyInSocialNetworks.pdf"> Birds of a Feather: Homophily in Social Networks</a>, Annu. Rev. Sociol,  27:415-44, 2001.
</li>
<li> M. Newman.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/mixing_patterns.pdf"> Mixing patterns in
networks</a>. Phys. Rev. E, Vol. 67, p 026126, 2003
</li>
<li>
M. D. Conover, J. Ratkiewicz, et al. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/Conover_PoliticalPolarizationTwitter.pdf"> Political Polarization on Twitter.</a>  
Fifth International AAAI Conference on Weblogs and Social Media, 2011
</li>
<li>
N. Christakis and J. Fowler. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/nejmsa066082.pdf"> The spread of obesity in a large social network over 32 years. </a>  Engl J Med v 357:370-379, 2007
</li>
<li>Chapter 9. Structural Equivalence. S. Wasserman
and K. Faust.
"Social Network Analysis. Methods and Applications". Cambridge University Press, 1994
</li>
<li>Chapter 12. Network Positions and Roles. S. Wasserman
and K. Faust.
"Social Network Analysis. Methods and Applications". Cambridge University Press, 1994
</li>
<li> Chapter 7. Measures and metrics. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>
<br>


<b>Lecture 8:</b>

<li> S. E. Schaeffer.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/GraphClustering_Schaeffer07.pdf"> Graph
clustering</a>. Comp. Sci. Rev., Vol. 1, p 27-64, 2007 
</li>
<li> S. Fortunato.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/fortunato_review.pdf">
Community detection in graphs </a>. Physics Reports,
Vol. 486, pp. 75-174, 2010
</li>
<li>
V. Batagelj, M. Zaversnik. 
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/k-cores_Batagelj.pdf"> An O(m) Algorithms for Cores
Decomposition of Networks</a>. 2003
</li>
<li>M.E.J. Newman.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/PNAS-2006-Newman-8577-82.pdf">
Modularity and community structure in networks</a>. PNAS Vol. 103, N 23, pp 8577-8582, 2006
</li>
<li> Chapter 7. Matrix algorithms and graph partitioning. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>



<br>
<b>Lecture 9:</b>
<li>
M. Fiedler. Algebraic connectivity of graphs, Czech. Math. J, 23, pp 298-305, 1973
</li>
<li>
A. Pothen, H. Simon and K. Liou. Partitioning sparse matrices with eigenvectors of graphs,
 SIAM Journal of Matrix Analysis, 11, pp 430-452, 1990
</li>
<li>
Bruce Hendrickson and Robert Leland. A Multilevel Algorithm for Partitioning Graphs, Sandia National Laboratories, 199
</li>
<li>
Jianbo Shi and Jitendra Malik. Normalized Cuts and Image Segmentation, 
IEEE Transactions on Pattern Analysis and Machine Intelligence,  vol. 22, N 8, pp 888-905,  2000
</li>
<li>M.E.J. Newman, M. Girvan.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/newman_community_struct_networks_phys_rev.pdf">
Finding and evaluating community structure in networks</a>. Phys. Rev. E 69, 026113, 2004. 
</li>
<li>
B. Good, Y.-A. de Montjoye, A. Clauset. Performance of modularity maximization in practical contexts, Physical Review E 81, 046106, 2010
</li>
<li> Chapter 11. Matrix algorithms and graph partitioning. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>




<br>
<b>Lecture 10:</b>
<li>
G. Palla, I. Derenyi, I. Farkas, T. Vicsek, Uncovering the overlapping community structure
 of complex networks in nature and society, Nature 435, 814-818, 2005.
 </li>
<li>
U.N. Raghavan, R. Albert, S. Kumara, Near linear time algorithm to detect community 
structures in large-scale networks, Phys. Rev. E 76 (3), 036106, 2007.
</li>
<li>
P. Pons and M. Latapy, Computing communities in large networks using random walks,
 Journal of Graph Algorithms and Applications, 10, 191-218, 2006.
</li>
<li>
V.D. Blondel, J.-L. Guillaume, R. Lambiotte, E. Lefebvre, Fast unfolding 
of communities in large networks, J. Stat. Mech. P10008, 2008.
</li>
<li>Daniel A. Spielman, Shang-Hua Teng.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/LocalClustering.pdf">A Local Clustering Algorithm for
Massive Graphs and Its Application to Nearly Linear Time Graph
Partitioning</a>. SIAM Journal on
computing, Vol. 42, p. 1-26, 2013
</li>
<li>R. Andersen, F. Chung, K. Lang. 
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/andersen06localgraph.pdf">Local graph partitioning
using pagerank vectors</a>. In Proc. FOCS, 2006.
</li>
<li>
J. Leskovec, K.J. Lang, A. Dasgupta, and M.W. Mahoney. Statistical properties of 
community structure in large social and information networks. In WWW 08: Procs. of the
 17th Int. Conf. on World Wide Web, pages 695-704, 2008.
</li>



<!--
<li>L. da F. Costa, F. A. Rodrigues, et. al.
<a href ="papers/CharacterizationComplexNetworks.pdf">
Characterization of complex networks: A survey of measurements</a>.Advances in Physics, Vol. 56,
pp. 167-242, 2007
</li>
<li>
R. Milo, S. Shen-Orr, S. Itzkovitz et al.
<a href = papers/milo02networkMotifs.pdf> Network motifs: simple building blocks of complex networks</a>. Science 298 (5594): 824–827, 2002
</li>
-->



<br>
<b>Lecture 11:</b>
<li> Lovasz, L.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/LovaszRadnomWalks93.pdf">Random walks on graphs: a survey</a>. In Combinatorics,
Paul Erdos is eighty. pp. 353 – 397. Budapest: Janos Bolyai Math. Soc., 1993
</li>
<li>  
Chung, Fan R.K. Spectral graph theory (2ed.). Chapter 1. Providence, RI:
American Math. Soc., 1997 
</li>
<li>
Daniel A. Spielman. Spectral Graph theory. Combinatorial Scientific Computing. Chapman and Hall/CRC Press. 2011
</li>
<li> Chapter 6. Mathematics of networks. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>
  

<br>
 <b> Lecture 12: </b>
<li>H.W. Hethcote.  
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/2000SiamRev.pdf"> The Mathematics of Infections
  Diseases</a>. SIAM Review, Vol. 42, No. 4, pp. 599-653, 2000
</li>
<li> Chapter 17. Epidemics on networks. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>


<br><b> Lecture 13:</b>
<li>Matt. J. Keeling and Ken.T.D. Eames.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/rsif20050051.pdf">  
Networks and Epidemics models</a> Journal R. Soc. Interface, Vol 2, pp
295-307, 2005
</li>
<li>
G. Witten and G. Poulter
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/witten-poulter-2006.pdf">Simulations of infections diseases on networks</a>
Computers in Biology and Medicine, Vol 37, No. 2, pp 195-205, 2007
</li>
<li>
M. Kuperman and G. Abramson
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/swepi.pdf">
Small World Effect in an Epidemiological Model</a>., Phys. Rev. Lett., Vol 86, No 13, pp 2909-2912, 2001
</li>
<li>
Manitz J, Kneib T, Schlather M, Helbing D, Brockmann D. Origin Detection During Food-borne Disease Outbreaks - 
A Case Study of the 2011 EHEC/HUS Outbreak in Germany. PLoS Currents. 2014
</li>
<li> Chapter 17. Epidemics on networks. Mark Newman.
"Networks: An Introduction". Oxford University Press, 2010.
</li>
<li>
Chapter 21. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/networks-book-ch21.pdf">Epidemics</a>. D. Easley and J. Kleinberg. "Networks, Crowds, and Markets: Reasoning About a Highly Connected
World". 
</li>


<br><b>Lecture 14:</b>
<li>
D.J. Daley and D.G. Kendall. Stochastic Rumours.  J. Inst. Maths. Applics 1, 42-45, 1965.
</li>
<li>
 A. Barrat, M. Barthelemy, A. Vespignani Eds. Dynamical processes on complex networks, Cambridge University Press 2008
</li>
<li>
Y. Moreno, M. Nekovee, A. Pacheco. Dynamics of rumor spreading in complex networks.  Phys. Rev. E 69, 066130, 2004
</li>
<li>
M. Nekovee, Y. Moreno, G. Biaconi, M. Marsili. Theory of rumor spreading in complex social networks. Physica A 374, pp 457-470, 2007.
</li>
<li>
Luis M.A. Bettencours, A. Cintron-Arias, D.I. Kaiser, C. Castillo-Chavez. The power of a good idea: Quantitative modeling of the spread of ideas from epidemiological models. Physica A, 364, pp 513-536, 2006.
</li>
<li>
D. Liben-Nowell, Jon Kleinberg. Tracing in formation flow on a global scale using Internet chain-letter data. , PNAS vol 105, n 12, pp 4633-4638, 2008
</li>
<li>
J.L. Iribarren, E. Moro, <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/iribarrenPRL09.pdf"> Impact
of Human Activity Patterns on the Dynamics of Information
Diffusion</a>, Phys. Rev. Letters, Vol 103,  038702, 2009
</li>
<li>
J. Leskovec, L. Adamic, B. Huberman, <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/viral-ec06.pdf"> The Dynamics of Viral Marketing</a>,
EC 2006
</li>





<br><b>Lecture 15:</b>
<li>Mark S. Granovetter.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/Granovetter-threshold_models.pdf">
Threshold Models of Collective Behavior</a>. American Journal of Sociology Vol. 83, No. 6, pp. 1420-1443, 1978.
</li>
<li>
 H. Peyton Young.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/young03diffusion.pdf">
The Diffusion of Innovations in Social Networks</a>. In L. E. Blume and S. N. Durlauf (eds.), The Economy as an Evolving Complex System III (2003)
</li>
<li>D. Kempe, J. Kleinberg, E. Tardos.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/kdd03-inf.pdf"> Maximizing the Spread of Influence
through a Social Network</a>. In Proc. KDD 2003.
</li>
<li>
D. Watts. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/watts02randomnetworks.pdf"> A simple model of global cascades on random networks</a>. Proc. Natl. Acad. Sci., vol. 99 no. 9, 5766-5771, 2002.
</li>
<!--
<li>
M. Richardson, P. Domingos. Mining Knowledge-Sharing Sites for Viral
Marketing. In Proc. KDD, 2002.
</li>
<li>
M. Richardson, P. Domingos. Mining the Network Value of Customers. In Proc. KDD, 2001.
</li>
-->
<li>
D. Kempe, J. Kleinberg, E. Tardos.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/icalp05-inf.pdf"> Influential Nodes in a Diffusion
Model for Social Networks</a>. Lecture Notes in Computer Science, Eds
C. Luis, I.Giuseppe et.al, 2005
</li><li>
S. Morris. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/morris00Contagion.pdf"> Contagion</a>. Review of Economic Studies 67, 57-78, 2000.
</li>
<li>
L.Backstrom, D. Huttenlocher, J. Kleinbrg, X. Lan,  <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/backstrom06groupformation.pdf"> Group Formation in Large Social Networks:
Membership, Growth and Evolution</a>, In Proc. KDD 2006.
</li>
<li>
Chapter 19. <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/networks-book-ch19.pdf">Cascading Behavior
in Neworks</a>. D. Easley and J. Kleinberg. "Networks, Crowds, and Markets: Reasoning About a Highly Connected
World". 
</li>
<li>
Chapter 7. Diffusion through Networks. Matthew O. Jackson. "Social and Economic Networks". 
</li>



<br> <b>Lecture 16:</b>
<li>
M.H. DeGroot.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/DeGroot-Reaching_a_concensus.pdf">
Reaching a Consensus</a>.
Journal of the American Statistical Association, 1974, Vol 69, No 345
</li>
<li>
Roger L. Berger.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/degroot_method-berger_jasa81.pdf">
A Necessary and Sufficient Condition for Reaching a Consensus Using
DeGroot's Method</a>. Journal of the American Statistical Association,
Vol. 76, No 374, 1981, pp 415-418
</li>
<li>
Noah Friedkin, and Eugene C. Johnsen,
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/AGPSinet.pdf">Social Influence Networks and Opinion Change</a>  Advances in Group Processes 16:1-29, 1999
</li>
<li>
B. Golub and M. Jackson
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/naivelearning.pdf">Naive Learning in Social Networks and the Wisdom of
Crowds</a>,  Amer. Econ. J. Microeconomics, 2:1, pp 112-149,  2010
</li>
<li>
Chapter 8. Learning and Networks. Matthew O. Jackson. "Social and Economic Networks". 
</li>



<br> <b>Lecture 17:</b>
<li>
S. A. Macskassy, F. Provost, Classification in Networked Data: A Toolkit and a Univariate Case Study. Journal of Machine Learning Research 8, 935-983, 2007
</li>
<li>
Bengio Yoshua, Delalleau Olivier, Roux Nicolas Le. Label Propagation and Quadratic Criterion. Chapter in Semi-Supervised Learning, Eds. O. Chapelle, B. Scholkopf, and A. Zien, MIT Press 2006
</li>
<li>
Smriti Bhagat, Graham Cormode, S. Muthukrishnan. Node classification in social networks. Chapter in Social Network Data Analytics, Eds. C. Aggrawal,
2011, pp 115-148
</li>
D. Zhou, O. Bousquet, T. Lal, J. Weston, and B. Scholkopf. Learning with local and global consistency. In NIPS, volume 16, 2004.
<li>
X. Zhu, Z. Ghahramani, and J. Lafferty. Semi-supervised learning using Gaussian fields and harmonic functions. In ICML, 2003.
</li>
<li>
M. Belkin, P. Niyogi, V. Sindhwani.  Manifold regularization: A geometric framework for learning from labeled and unlabeled examples.
 J. Mach. Learn. Res., 7, 2399-2434, 2006
</li>



<br> <b>Lecture 18:</b>
<li>
D. Liben-Nowell and J. Kleinberg. The link prediction problem for social networks. Journal of the American Society for Information Science and Technology, 58(7):1019–1031, 2007
</li>
<li>
R. Lichtenwalter, J.Lussier, and N. Chawla. New perspectives and methods in link prediction. KDD 10: Proceedings of the 16th ACM SIGKDD, 2010
</li>
<li>
M. Al Hasan, V. Chaoji, S. Salem, M. Zaki, Link prediction using supervised learning. Proceedings of SDM workshop on link  analysis, 2006
</li>
<li>
M. Rattigan, D. Jensen. The case for anomalous link discovery.  ACM SIGKDD Explorations Newsletter.  v 7, n 2, pp 41-47, 2005
</li>
<li>
M. Al. Hasan, M. Zaki. A survey of link prediction in social networks. In Social Networks Data Analytics, Eds  C. Aggarwal, 2011.
</li>






<!--
<br><b> Lecture 16: </b>

<li>
A. V. Banerjee.  <a href = papers/banerjee92herd.pdf> A Simple Model of Herd Behavior</a>. The Quarterly Journal of Economics, Vol. 107, No. 3, pp. 797-817, 1992.
</li>



<li>S. Bikhchandani, D Hirshleifer and I.Welch.
<a href = papers/atheoryoffads.pdf>
A Theory of Fads, Fashion, Custom, and Cultural Change as Information
Cascades</a>. Journal of Political Economy. Vol. 100, pp. 992-1026, 1992.
</li>

<li>S. Bikhchandani, D Hirshleifer and I.Welch.
<a href = papers/Fads.pdf>
Learning from the Behavior of Others:
Conformity, Fads, and Informational Cascades </a>
</li>



<li>L. Anderson and C. Halt.
<a href = papers/Information_cascades_in_the_lab-anderson.pdf >
Information Cascades in the Laboratory</a>. The American Economic Review, Vol. 87, No. 5 (Dec., 1997), pp. 847-862
</li>
<li>Pierre Lemieux.
<a href = papers/Lemieux-following_the_herd.pdf>
Following the Herd </a>. Regulation, Winter 2003-2004
</li>


<li>
Chapter 16. <a href= papers/networks-book-ch19.pdf>Information Cascades</a>. D. Easley and J. Kleinberg. "Networks, Crowds, and Markets: Reasoning About a Highly Connected
World". 
</li>

-->

<br> <b>Lecture 19:</b>

<li> Thomas C. Schelling
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/Schelling_Seg_Models.pdf">
Dynamic Models of Segregation </a>, Journal of Mathematical Sociology,
Vol. 1, pp 143-186, 1971.

</li>

<li>Arnaud Banos
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/Banos-HAL.pdf">
Network effects in Schellin's model of segregation: new evidences from
agent-based simulations</a>. Environment and Planning B: Planning and
Design Vol.39, no. 2, pp. 393-405, 2012.

</li>
<li>Giorgio Gagiolo, Marco Valente, Nicolaas Vriend
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/jebo3.pdf">
Segregation in netwroks</a>. Journal of Econ. Behav. &amp; Organization,
Vol. 64, pp 316-336, 2007.
</li>

<br> <b>Lecture 20:</b>
<li>Matthew O. Jackson.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/jackson-netect.pdf">
The Economics of Social Networks</a>. California Institute of
Technology, 2005.
</li>
<li>
Matthew O. Jackson.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/jackson-wolinsky-1996.pdf">
A Strategic Model of Social and Economic Networks</a>.
Journal of Economic Theory, Vol 71, pp 44-74, 1996.
</li>
<li>
Chapter 6. Strategic Network Formation. Matthew O. Jackson. "Social and Economic Networks". 
</li>

</ul>


<a name="textbooks"></a>
<h2>Textbooks</h2>
  
 
<h2> Books</h2>
<ul>
<li>
"Networks: An Introduction", Mark Newman. Oxford University Press, 2010.
</li>
<li>
"Social and Economic Networks", Matthew O. Jackson. Princeton
University Press, 2010.
</li>

<li>
<a href="http://www.cs.cornell.edu/home/kleinber/networks-book/"> "Networks, Crowds, and Markets: Reasoning About a Highly Connected
World."</a> David Easley and John Kleinberg, Cambridge University Press 2010.
</li>

<li>
 "Social Network Analysis. Methods and
Applications."  Stanley Wasserman
and Katherine Faust, Cambridge University Press, 1994
</li>

</ul>
<h2>Reviews</h2>

<ul>
<li>
 R. Albert and A-L. Barabasi.
  <a href="http://www.leonidzhukov.net/hse/2015/networks/papers/StatMechanicsComplexNetworks-Barabsi.pdf">Statistical
  mechanics of complex networks</a>.
  Rev. Mod. Phys, Vol. 74, p 47-97, 2002
</li>
<li>
 M. E. J. Newman.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/newman-siam-review.pdf">The Structure and Function of
Complex Networks</a>. SIAM Review, Vol. 45, p
167-256, 2003
</li>
<li>
S. Boccaletti et al.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/boccaletti2006a.pdf"> Complex networks:
Structure and dynamics</a>. Phys. Reports,
Vol. 424, p 175-308, 2006
</li>
<li>
 S. N. Dorogovtsev and J. F. F. Mendes.
<a href="http://www.leonidzhukov.net/hse/2015/networks/papers/dorogovsev-mednez-review.pdf">Evolution of
Networks</a>.
Adv. Phys. Vol. 51, N 4,  p 1079-1187
</li>
</ul>


<h2>Collections</h2>
<ul>
<li>
"The Structure and Dynamics of Networks". Eds.M. Newman, A.-L. Barabasi, D. Watts. Princeton University Press, 2006. 
</li>
<li>
"Network Analysis". Eds. Ulrik Brandes, Thomas Erlebach. Lecture Notes in Computer Science. Springer, 2005
</li>
<li>
"Social Network Data Analysis. Ed. Charu C. Aggarwal. Springer, 2011
</li>

</ul>




<a name="software"></a> 
<h2>Software</h2>


<ul>
<li>
Computations: <a href="http://www.python.org">Python</a> and <a href="http://ipython.org">iPython</a>
</li>
<li>
Python libraries:
<ul>
<li>
  Numerical algorithms:
  <a href="http://www.numpy.org">Numpy</a>,  <a href="http://www.scipy.org">SciPy</a>
</li>
<li>
 Graph algorithms and visualizaton: <a href="http://networkx.github.com">NetworkX</a>
</li>
</ul>  
</li>

<li>
Visualization:
<ul>
<li>
 Open Graph Vizulization platform <a href="https://gephi.github.io">Gephi</a>
</li>
<li>
 yEd Graph Editor <a href="http://www.yworks.com/en/products/yfiles/yed/"> yEd </a>
</li>

<li>
Graph Visualization Software <a href="http://www.graphviz.org"> GraphViz</a> 

</li>
</ul>  

</li>
</ul>


<h2>Similar courses</h2>
<ul>
<li> <a href="http://www.stanford.edu/class/cs224w/">Social and Information Network Analysis</a>, Jure Leskovec, Stanford
</li>
<li>
<a href="http://www.cs.cornell.edu/Courses/cs6850/2011sp/">The
structure of Information Networks </a>,
Jon Kleinberg, Cornell University
</li>
<li>
<a href="http://courses.cit.cornell.edu/info2040_2012fa/"> Networks</a>,
Jon Kleinberg, Eva Tardos, David Easley, Cornell University
</li>
<li>
<a href="http://www-bcf.usc.edu/~dkempe/CS673/index.html">
Structure and Dynamics of Networked Information</a>,
David Kempe, University of Southern California
</li>
<li>
<a href="http://www.cis.upenn.edu/~mkearns/teaching/NetworkedLife/">
Networked Life </a>,
Michael Kearns, University of Pennsylvania 
</li>

<br>
<b>Coursera</b>
<li>
<a href="https://www.coursera.org/course/networksonline">
Social and Economic Networks: Models and Analysis</a>, Matthew
O. Jackson, Stanford University
</li>
<li>
<a href="https://www.coursera.org/course/sna">
Social Network Analysis</a>, Lada Adamic, University of Michigan
</li>
<li>
<a href="https://www.coursera.org/course/networks"> Networked Life
</a>,
Michael Kearns, University of Pennsylvania
</li>
<br>
<b>EdX</b>
<li>
<a href="https://www.edx.org/course/networks-crowds-markets-cornellx-info2040x"> Networks, Crowds and Markets </a>,
David Easley, Jon Kleinberg, Eva Tardos, Cornell University
</li>
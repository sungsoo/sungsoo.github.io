---
layout: post
title: SQL Query Optimization Meets Deep Reinforcement Learning
date: 2019-02-10
categories: [computer science]
tags: [machine learning]

---

## Article Source
* Title: [SQL Query Optimization Meets Deep Reinforcement Learning](https://rise.cs.berkeley.edu/blog/sql-query-optimization-meets-deep-reinforcement-learning/)

---

## SQL Query Optimization Meets Deep Reinforcement Learning

<blockquote><p><i></i><span style="font-weight: 400;">We show that deep reinforcement learning is successful at optimizing SQL joins, a problem studied for decades in the database community. &nbsp;Further, on large joins, we show that this technique executes up to 10x faster than classical dynamic programs and 10,000x faster than exhaustive enumeration. &nbsp;This blog post introduces the problem and summarizes our key technique; details can be found in our latest preprint, </span><a href="https://arxiv.org/abs/1808.03196"><i><span style="font-weight: 400;">Learning to Optimize Join Queries With Deep Reinforcement Learning.</span></i></a></p></blockquote>
<p><span style="font-weight: 400;">SQL query optimization has been studied in the database community for almost 40 years, dating all the way back from System R’s </span><a href="https://dl.acm.org/citation.cfm?id=582099"><span style="font-weight: 400;">classical dynamic programming approach</span></a><span style="font-weight: 400;">. &nbsp;Central to query optimization is the problem of join ordering. &nbsp;Despite the problem’s rich history, there is still a continuous stream of research projects that aim to </span><a href="http://www.vldb.org/pvldb/vol9/p204-leis.pdf"><span style="font-weight: 400;">better understand</span></a><span style="font-weight: 400;"> the performance of join optimizers in realistic multi-join queries, or to </span><a href="https://db.in.tum.de/~radke/papers/hugejoins.pdf"><span style="font-weight: 400;">tackle the very large join queries</span></a><span style="font-weight: 400;"> that are ubiquitous in enterprise-scale “data lakes”.</span></p>
<p><span style="font-weight: 400;">In our latest </span><a href="https://arxiv.org/abs/1808.03196"><span style="font-weight: 400;">preprint</span></a><span style="font-weight: 400;">, we show that deep reinforcement learning (deep RL) provides a new angle of attack at this decade-old challenge. &nbsp;We formulate the join ordering problem as a Markov Decision Process (MDP), and we build an optimizer that uses a </span><a href="https://deepmind.com/research/publications/playing-atari-deep-reinforcement-learning/"><span style="font-weight: 400;">Deep Q-Network</span></a><span style="font-weight: 400;"> (DQN) to efficiently order joins.&nbsp; We evaluate our approach on the Join Order Benchmark (a recently proposed workload to specifically stress test join optimization).&nbsp; Using only a moderate amount of training data, our deep RL-based optimizer can achieve plan costs within </span><b>2x</b><span style="font-weight: 400;"> of the optimal solution on all cost models that we considered, and it improves on the next best heuristic by up to </span><b>3x</b><span style="font-weight: 400;"> — all at a planning latency that is up to 10x faster than dynamic programs and 10,000x faster than exhaustive enumeration.</span></p>

<h2>Background: Join ordering</h2>
<p><span style="font-weight: 400;">Why is reinforcement learning a promising approach for join ordering? &nbsp;To answer this question, let’s first recap the traditional dynamic programming (DP) approach.</span></p>
<p><span style="font-weight: 400;">Assume a database consisting of three tables, </span><span style="font-weight: 400;">Employees</span><span style="font-weight: 400;">, </span><span style="font-weight: 400;">Salaries</span><span style="font-weight: 400;">, and </span><span style="font-weight: 400;">Taxes</span><span style="font-weight: 400;">. &nbsp;Here’s a query that calculates “the total tax owned by all Manager 1 employees”:</span></p>
<p><span style="font-weight: 400;">SELECT SUM(S.salary * T.rate)</span><br>
<span style="font-weight: 400;">FROM Employees as E, Salaries as S, Taxes as T</span><br>
<span style="font-weight: 400;">WHERE E.position = S.position AND</span><br>
<span style="font-weight: 400;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="font-weight: 400;">T.country = S.country AND</span> <span style="font-weight: 400;"><br>
</span><span style="font-weight: 400;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; E.position = ‘Manager 1’</span></p>
<p><span style="font-weight: 400;">This query performs a three-relation join. &nbsp;In the following example, we use </span><span style="font-weight: 400;">J(R)</span><span style="font-weight: 400;"> to denote the cost of accessing a base relation </span><span style="font-weight: 400;">R</span><span style="font-weight: 400;">, and </span><span style="font-weight: 400;">J(T1,T2)</span><span style="font-weight: 400;"> the cost of joining </span><span style="font-weight: 400;">T1</span><span style="font-weight: 400;"> and </span><span style="font-weight: 400;">T2</span><span style="font-weight: 400;">. &nbsp;This is the cost model that we assume a DBMS has built in (e.g., a deterministic scoring function). &nbsp;For simplicity, we assume one access method, one join method, and a symmetric join cost (i.e., </span><span style="font-weight: 400;">J(T1, T2) = J(T2, T1)</span><span style="font-weight: 400;">).</span></p>
<p><span style="font-weight: 400;">The classical “left-deep” DP approach first calculates the cost of optimally accessing the three base relations; the results are put in a table:</span></p>
<table>
<tbody>
<tr>
<td><b>Remaining Relations</b></td>
<td><b>Joined Relations</b></td>
<td><b>Best</b></td>
</tr>
<tr>
<td><span style="font-weight: 400;">{E, S}</span></td>
<td><span style="font-weight: 400;">{T}</span></td>
<td><span style="font-weight: 400;">J(T)</span><span style="font-weight: 400;">, i.e., scan cost of T </span></td>
</tr>
<tr>
<td><span style="font-weight: 400;">{E, T}</span></td>
<td><span style="font-weight: 400;">{S}</span></td>
<td><span style="font-weight: 400;">J(S)</span></td>
</tr>
<tr>
<td><span style="font-weight: 400;">{T, S}</span></td>
<td><span style="font-weight: 400;">{E}</span></td>
<td><span style="font-weight: 400;">J(E)</span></td>
</tr>
</tbody>
</table>
<p><span style="font-weight: 400;">Then, it builds off of this information and enumerates all 2-relations. &nbsp;For instance, when calculating the best cost to join </span><span style="font-weight: 400;">{E,S}</span><span style="font-weight: 400;">, it looks up the the relevant, previously computed results as follows:</span></p>
<p><span style="font-weight: 400;"> &nbsp;&nbsp;&nbsp;&nbsp;Best({E, S}) = Best({E}) + Best({S}) + J({E}, S)</span></p>
<p><span style="font-weight: 400;">which results in the following row to be added into the table:</span></p>
<table>
<tbody>
<tr>
<td><b>Remaining Relations</b></td>
<td><b>Joined Relations</b></td>
<td><b>Best</b></td>
</tr>
<tr>
<td><span style="font-weight: 400;">{T}</span></td>
<td><span style="font-weight: 400;">{E, S}</span></td>
<td><span style="font-weight: 400;">Best({E}) + Best({S}) + J({E}, S)</span></td>
</tr>
</tbody>
</table>
<p><span style="font-weight: 400;">The algorithm proceeds through other 2-relation sets, and eventually to the final best cost for joining all three tables. &nbsp;This entails taking the minimum over all possible “left-deep” combinations of 2-relations and a base relation:</span></p>
<table>
<tbody>
<tr>
<td><b>Remaining Relations</b></td>
<td><b>Joined Relations</b></td>
<td><b>Best</b></td>
</tr>
<tr>
<td>{}</td>
<td>{E, S, T}</td>
<td>minimum { Best({E,T}) + J(S) + J({E,T}, S),<br>
Best({E,S}) + J(T) + J({E,S}, T),<br>
Best({T,S}) + J(E) + J({T,S}, E) }</td>
</tr>
</tbody>
</table>
<p><span style="font-weight: 400;">The dynamic program is now complete. &nbsp;Note that J’s second operand (relation on the right) is always a base relation, whereas the left could be an intermediate join result (hence the name “left-deep”). &nbsp;This algorithm has a space and time complexity exponential in the number of relations, which is why it’s often used only for queries with ~10-15 relations.</span></p>
<h2>Join Ordering via Reinforcement Learning</h2>
<p><span style="font-weight: 400;">The main insight of our work is the following: instead of solving the join ordering problem using dynamic programming as shown above, we formulate the problem as a Markov Decision Process (MDP) and solve it using reinforcement learning (RL), a general stochastic optimizer for MDPs.</span></p>
<p><span style="font-weight: 400;">First, we formulate join ordering as an MDP:</span></p>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">States, G: the remaining relations to be joined.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Actions, c: a valid join out of the remaining relations.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Next states, G’: naturally, this is the old “remaining relations” set with two relations removed and their resultant join added.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Reward, J: estimated cost of the new join.</span></li>
</ul>
<p><span style="font-weight: 400;"> Or (G, c, G’, J) for short.</span></p>
<p><span style="font-weight: 400;">We apply </span><i><span style="font-weight: 400;">Q-learning</span></i><span style="font-weight: 400;">, a popular RL technique, to solve the join-ordering MDP. &nbsp;Let us define the Q-function, Q(G, c), which, intuitively, describes the long-term cost of each join: the cumulative cost if we act optimally for all subsequent joins after the current join decision.</span></p>
<p><span style="font-weight: 400;">Q(G, c) = J(c) + \min_{c’} Q(G’, c’)</span></p>
<p><span style="font-weight: 400;">Notice how if we have access to the true Q-function, we can order joins in a greedy fashion:</span></p>
<p><em><span style="font-weight: 400;">Algorithm 1<br>
</span></em><em><span style="font-weight: 400;">(1) Start with the initial query graph,<br>
</span><span style="font-weight: 400;">(2) Find the join with the lowest Q(G, c),<br>
</span><span style="font-weight: 400;">(3) Update the query graph and repeat.</span></em></p>
<p><span style="font-weight: 400;">As it turns out, </span><a href="https://en.wikipedia.org/wiki/Bellman_equation#Bellman's_Principle_of_Optimality"><span style="font-weight: 400;">Bellman’s Principle of Optimality</span></a><span style="font-weight: 400;"> tells us that this algorithm is </span><i><span style="font-weight: 400;">provably optimal</span></i><span style="font-weight: 400;">. What’s fascinating about this algorithm is that it has a computational complexity of O(n^3), which, while still high, is much lower than the exponential runtime complexity of exact dynamic programming.</span></p>
<p style="text-align: center;"><b><img class="wp-image-2672 aligncenter" src="https://rise.cs.berkeley.edu/wp-content/uploads/2018/09/Screen-Shot-2018-09-17-at-23.25.33.png" alt="">Figure 1: Using a neural network to approximate the Q-function. </b><span style="font-weight: 400;">&nbsp;Intuitively, the output means “If we make a join c on the current query graph G, how much does it minimize the cost of the long-term join plan?”</span></p>
<p><span style="font-weight: 400;">Of course, in reality we don’t have access to the true Q-function and would need to approximate it. &nbsp;To do so we use a neural network (NN). When an NN is used to learn the Q-function, the technique is called Deep Q-network (DQN). This is the same technique used to successfully learn to </span><a href="https://deepmind.com/research/publications/playing-atari-deep-reinforcement-learning/"><span style="font-weight: 400;">play Atari games</span></a><span style="font-weight: 400;"> with expert-level capability. &nbsp;To summarize, our goal is to train a neural net that takes in (G, c) and outputs an estimated Q(G,c); see Figure 1.</span></p>
<h2>Meet DQ, the Deep Reinforcement Learning Optimizer</h2>
<p><span style="font-weight: 400;">Enter DQ, our deep RL-based optimizer. &nbsp;</span></p>
<p><i><span style="font-weight: 400;">Data collection.</span></i><span style="font-weight: 400;"> &nbsp;To learn the Q-function we first need to observe past execution data. &nbsp;DQ can accept a list of (G, c, G’, J) from any underlying optimizer. For instance, we can run a classical left-deep dynamic program (as shown in the Background section) and calculate a list of “join trajectories” from the DP table. &nbsp;A tuple out of a complete trajectory could look something like (G, c, G’, J) = ({E, S, T}, join(S, T), {E, ST}, 110), which represents the step of starting with the initial query graph (state) and joining S and T together (action). &nbsp;</span></p>
<p><span style="font-weight: 400;">Although we’ve described J to be the estimated cost of a join, we can use the actual runtime too if data is collected from a real database execution. </span></p>
<p><i><span style="font-weight: 400;">Featurization of states and actions.</span></i><span style="font-weight: 400;"> &nbsp;Since we are using a neural net to represent Q(G, c), we need to feed states G and actions c into the network as </span><i><span style="font-weight: 400;">fixed-length feature vectors</span></i><span style="font-weight: 400;">. &nbsp;DQ’s featurization scheme is very simple: we use 1-hot vectors to encode (1) the set of all attributes present in the query graph, out of all attributes in the schema, (2) the participating attributes from left side of the join, and (3) those from right side of the join. &nbsp;This is pictorially depicted in Figure 2.</span></p>
<p><span style="font-weight: 400;"><img class="aligncenter wp-image-2633 size-full" src="https://rise.cs.berkeley.edu/wp-content/uploads/2018/09/featurization.png" alt="" ></span></p>
<p style="text-align: center;"><b>Figure 2: A query and its corresponding featurizations.</b><span style="font-weight: 400;"> &nbsp;We assume a database of Employees, Positions, and Salaries. &nbsp;A partial join and a full join are shown. The final feature vector of (G,c) is the concatenation of A_G (attributes of query graph), A_L (attributes of the left side), and A_R (attributes of the right side).</span></p>
<p><span style="font-weight: 400;">Although this scheme is extremely straightforward, we’ve found it to be sufficiently expressive. &nbsp;Note that our scheme (and the learned network) assumes a fixed database since it needs to know the exact set of attributes/tables.</span></p>
<p><i><span style="font-weight: 400;">Neural network training &amp; planning.</span></i><span style="font-weight: 400;"> &nbsp;By default, DQ uses a simple 2-layer fully connected network. &nbsp;Training is done with standard stochastic gradient descent. Once trained, DQ accepts a SQL query in plain text, parses it into an abstract syntax tree form, featurizes the tree, and invokes the neural network whenever a candidate join is scored (i.e., the neural net is invoked in step 2 of Algorithm 1).&nbsp; Lastly, DQ can be periodically re-tuned using the feedback from real execution.</span></p>
<h2>Evaluation</h2>
<p><span style="font-weight: 400;">To evaluate DQ, we use the recently published </span><a href="http://www.vldb.org/pvldb/vol9/p204-leis.pdf"><span style="font-weight: 400;">Join Order Benchmark (JOB)</span></a><span style="font-weight: 400;">. &nbsp;The database consists of 21 tables from IMDB. &nbsp;There are 33 query templates and a total of 113 queries. The join sizes in the queries range from 5 to 15 relations. &nbsp;Here, DQ collects training data from exhaustive enumeration when the number of relations to join is no larger than 10, and from a greedy algorithm for the additional relations.</span></p>
<p><i><span style="font-weight: 400;">Comparison.</span></i><span style="font-weight: 400;"> &nbsp;We compare against several heuristic optimizers (QuickPick; KBZ) as well as classical dynamic programs (left-deep; right-deep; zig-zag). &nbsp;The plans produced by each optimizer are scored and compared to the optimal plans, which we obtain via exhaustive enumeration.</span></p>
<p><i><span style="font-weight: 400;">Cost models.</span></i><span style="font-weight: 400;"> With new hardware innovations (e.g., <a href="https://en.wikipedia.org/wiki/Non-volatile_random-access_memory">NVRAM</a>) and a move towards serverless RDBMS architectures (e.g., <a href="https://aws.amazon.com/rds/aurora/serverless/.">Amazon Aurora Serverless</a>), we expect to see a multitude of new query cost models that capture distinct hardware characteristics. &nbsp;To show a learning-based optimizer can <i>adapt</i> to different environments unlike fixed heuristics, we design 3 cost models</span><span style="font-weight: 400;">:</span></p>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Cost Model 1 (Index Mostly): models a main-memory database and encourages index joins. </span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Cost Model 2 (Hybrid Hash): considers only hash joins and nested loop joins with a memory budget.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Cost Model 3 (Hash Reuse): accounts for the reuse of already-built hash tables.</span></li>
</ul>
<p><span style="font-weight: 400;">As we go from CM1 to CM3, the costs are designed to have more non-linearity, posing challenges to static strategies.</span></p>
<p><span style="font-weight: 400;">We do 4-fold cross validation to ensure DQ is only evaluated on queries not seen in the training workload (in each case, we train on 80 queries and test on 33). &nbsp;We calculate the </span><em>mean sub-optimality</em><span style="font-weight: 400;"> of the queries, i.e., “cost(plan from each algorithm) / cost(plan from optimal plan)”, so lower is better. &nbsp;For instance, on Cost Model 1, DQ is on average 1.32x away from optimal plans.&nbsp; The results are shown in Figure 3.</span></p>
<p style="text-align: center;"><span style="font-weight: 400;"><br>
<img class="size-full wp-image-2664 aligncenter" src="https://rise.cs.berkeley.edu/wp-content/uploads/2018/09/blogpost-costmodels-2.png" alt=""></span><b>Figure 3: Mean plan sub-optimality</b><span style="font-weight: 400;"> (w.r.t. exhaustive enumeration) under different cost models.</span></p>
<p><span style="font-weight: 400;">Across all cost models, DQ is competitive with the optimal solution without </span><i><span style="font-weight: 400;">a priori</span></i><span style="font-weight: 400;"> knowledge of the index structure. &nbsp;This is not true for fixed dynamic programs: for instance, left-deep produces good plans in CM1 (encourages index joins), but struggles in CM2 and CM3. &nbsp;Likewise, right-deep plans are uncompetitive in CM1 but if CM2 or CM3 are used, the right-deep plans suddenly become not so bad. The takeaway is that <em><strong>a learning-based optimizer are</strong> </em></span><em><b>more robust than hand-designed algorithms and can adapt to changes in workload, data, or cost models.</b></em></p>
<p><span style="font-weight: 400;">Furthermore, we show that DQ produces good plans at a much faster speed than classical dynamic programs (Figure 4).</span></p>
<p><b><img class="aligncenter wp-image-2615 " src="https://rise.cs.berkeley.edu/wp-content/uploads/2018/09/planning-latency-grouped-1.png" alt="" width="596" height="253"></b></p>
<p style="text-align: center;"><b>Figure 4: Optimizer latency on all 113 JOB queries (log-scaled)</b><span style="font-weight: 400;">, grouped by the number of relations in the query. &nbsp;Error bars represent ± standard deviation around the mean; a total of 5 trials were run.</span></p>
<p><span style="font-weight: 400;">In the large-join regime, DQ achieves drastic speedups: for the largest joins DQ wins by up to 10,000x compared to exhaustive enumeration, over 1,000x faster than zig-zag, and more than 10x faster than left/right-deep enumeration. &nbsp;The gain mostly comes from the abundant batching opportunities in neural nets — for all candidate joins of an iteration, DQ batches them and invokes the NN once on the entire batch. We believe this is a profound performance argument for such a learned optimizer: it would have an even more unfair advantage when applied to larger queries or executed on specialized accelerators (e.g., GPUs, </span><a href="https://cloud.google.com/tpu/"><span style="font-weight: 400;">TPUs</span></a><span style="font-weight: 400;">).</span></p>
<h2>Summary</h2>
<p><span style="font-weight: 400;">In this work, we argue that joining ordering </span><i><span style="font-weight: 400;">is</span></i><span style="font-weight: 400;"> a natural problem amenable to deep RL. &nbsp;Instead of fixed heuristics, deep RL uses a data-driven approach to tailor the query plan search to a specific dataset, query workload, and observed join costs. &nbsp;To select a query plan, DQ uses a neural network that encodes the compressed versions of the classical dynamic programming tables observed at training time.</span></p>
<p><span style="font-weight: 400;">DQ touches only the tip of the iceberg. &nbsp;In the </span><a href="https://arxiv.org/abs/1712.01208"><span style="font-weight: 400;">database</span></a> <a href="https://www.cs.cmu.edu/~dvanaken/papers/forecasting-sigmod18.pdf"><span style="font-weight: 400;">and</span></a> <a href="http://people.cs.uchicago.edu/~junchenj/docs/DnnVisualizationAPNet_CameraReady.pdf"><span style="font-weight: 400;">systems</span></a> <a href="https://conferences.sigcomm.org/events/apnet2018/papers/auto.pdf"><span style="font-weight: 400;">communities</span></a><span style="font-weight: 400;">, </span><a href="https://dawn.cs.stanford.edu/2018/01/11/index-baselines/"><span style="font-weight: 400;">intensifying</span></a> <a href="https://arxiv.org/abs/1802.00884"><span style="font-weight: 400;">debate</span></a><span style="font-weight: 400;"> has revolved around putting more learning, or in other words, </span><i><span style="font-weight: 400;">data adaptivity</span></i><span style="font-weight: 400;">, into existing systems. &nbsp;We hope our work represents the first step in enabling more intelligent query optimizers. &nbsp;For more details, please refer to </span><a href="https://arxiv.org/abs/1808.03196"><span style="font-weight: 400;">our Arxiv preprint</span></a><span style="font-weight: 400;">. &nbsp;</span></p>

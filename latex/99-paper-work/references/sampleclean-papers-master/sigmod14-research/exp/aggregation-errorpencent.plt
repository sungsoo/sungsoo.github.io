# SampleClean v.s. BiasCorrect for different aggregation error ratio
reset

set terminal postscript eps enhanced color font "Times-Roman, 16"
set output "aggregation-errorpercent.eps"

set ylabel "Error Bound" font "Times-Roman, 20"
set xlabel "Aggregation-Error Percentage" offset 0, 0.2 font "Times-Roman, 20"

#set xtics scale 0.5
#set xtics font "Times-Roman, 18"
#set ytics scale 0.5
#set ytics font "Times-Roman, 18"
#set key font "Times-Roman, 22"
#set key spacing 0.7
#set key samplen 1

#set size 1,0.9
set nomxtics
set noxtics


set grid xtics ytics
set grid mytics, mxtics
set pointsize 1


#set logscale y 10
#unset logscale y


set format y "%g%%"
set format x "%g%%"



set size 0.5, 0.5
set xrange [ 0 : 100 ]
set yrange [ 0 : 4]
set key at graph 0.6, graph 0.94
set xtics 20
set mxtics 2
set ytics 1
set mytics 2

#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


0	1.575079608
5	1.584322856
10	1.55978184
15	1.572018197
20	1.559019325
25	1.55632206
30	1.550078105
35	1.579248148
40	1.559286447
45	1.567598101
50	1.570093052
55	1.568421026
60	1.565442741
65	1.567665635
70	1.560296297
75	1.574136913
80	1.573440194
85	1.564077209
90	1.592022549
95	1.570546401
100	1.576714653


e 

0	0
5	1.183581306
10	1.611191398
15	1.829473152
20	2.244622411
25	2.49893348
30	2.554792543
35	2.777478566
40	2.829396102
45	2.917705965
50	2.939907823
55	2.934912967
60	3.21240703
65	3.21883022
70	3.284251554
75	3.197819983
80	3.23119964
85	3.239664733
90	3.26937528
95	3.19690424
100	3.056228538
e 


     
# SampleClean v.s. BiasCorrect for different aggregation error ratio
reset

set terminal postscript eps enhanced color font "Times-Roman, 16"
set output "predicate-errorpercent.eps"

set ylabel "Error Bound" font "Times-Roman, 20"
set xlabel "False-Positive Percentage" offset 0, 0.2 font "Times-Roman, 20"

#set xtics scale 0.5
#set xtics font "Times-Roman, 20"
#set ytics scale 0.5
#set ytics font "Times-Roman, 20"
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
set yrange [ 0 : 40]
set key at graph 0.6, graph 0.94
set xtics 20
set mxtics 2
set ytics 10
set mytics 2

#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


0	1.571874674
5	1.621209824
10	1.64711598
15	1.703173098
20	1.754389381
25	1.786261903
30	1.888098713
35	1.965282287
40	1.991909287
45	2.167485513
50	2.246860293
55	2.34105272
60	2.529979121
65	2.609530079
70	2.89580689
75	3.162344132
80	3.723735456
85	4.152373192
90	4.85667802
95	7.086569206
e 

0	0
5	0.730802863
10	1.045205692
15	1.362852044
20	1.752616727
25	1.861872654
30	2.155080317
35	2.445476479
40	2.809189877
45	3.177835184
50	3.584255851
55	3.986939054
60	4.704867488
65	5.213965591
70	6.330697229
75	7.687085079
80	9.81894696
85	12.71875281
90	16.90246716
95	34.85372913
e 


     

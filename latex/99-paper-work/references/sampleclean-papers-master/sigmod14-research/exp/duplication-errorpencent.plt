# SampleClean v.s. BiasCorrect for different aggregation error ratio
reset

set terminal postscript eps enhanced color font "Times-Roman, 16"
set output "duplication-errorpercent.eps"

set ylabel "Error Bound" font "Times-Roman, 20"
set xlabel "Duplication-Error Percentage" offset 0, 0.2 font "Times-Roman, 20"

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
set yrange [ 0 : 4]
set key at graph 0.6, graph 0.94
set xtics 20
set mxtics 2
set ytics 1
set mytics 2

#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


0	1.561575068
5	1.679256699
10	1.752003143
15	1.801755908
20	1.910372244
25	1.931410727
30	1.986734302
35	2.037885099
40	2.05708149
45	2.094433195
50	2.065148571
55	2.098160652
60	2.111155128
65	2.062786958
70	2.068423199
75	2.018640075
80	1.954501847
85	1.945043642
90	1.874972403
95	1.781381387
100	1.735260301
e 

0	0
5	0.59239746
10	0.847806844
15	1.029285905
20	1.13831607
25	1.28441216
30	1.429034526
35	1.495300615
40	1.559895764
45	1.631754157
50	1.75752049
55	1.81230046
60	1.824677641
65	1.894391137
70	1.946249847
75	1.966123602
80	2.04530218
85	2.043503827
90	2.0803593
95	2.104285037
100	2.058750755
e 


     
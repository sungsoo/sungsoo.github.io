# SampleClean v.s. BiasCorrect for Predicate Error = 5% and 50%

reset

set terminal postscript eps enhanced color font "Times-Roman, 16"
set output "predicate-samplesize.eps"

set size 1, 0.5
set multiplot

set ylabel "Error Bound" font "Times-Roman, 20"
set xlabel "Cleaned Sample Size" offset 0, 0.2 font "Times-Roman, 20"

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
set grid mxtics mytics
set pointsize 1


#set logscale y 10
#unset logscale y


set format y "%g%%"

set origin 0, 0
set mxtics  2
set size 0.5, 0.5
set xrange [ 0 : 10000 ]
set yrange [ 0 : 12]
set key at graph 0.8, graph 0.9
set xtics 2000
set ytics 2
set mytics 2
#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


500	5.068706794
1000	3.641492475
1500	3.017858972
2000	2.617000407
2500	2.33466714
3000	2.129411793
3500	1.973942772
4000	1.835601409
4500	1.725427195
5000	1.624367381
5500	1.549865538
6000	1.48303385
6500	1.421612296
7000	1.368073186
7500	1.317549153
8000	1.275045978
8500	1.236076355
9000	1.200445371
9500	1.166744877
10000	1.137584559
e 
       
500	2.064540572
1000	1.765326762
1500	1.381994866
2000	1.164651217
2500	1.035640367
3000	0.9095283
3500	0.843969262
4000	0.783140484
4500	0.773640209
5000	0.753843316
5500	0.723780989
6000	0.702137584
6500	0.671193279
7000	0.636324508
7500	0.617975406
8000	0.591741051
8500	0.570981431
9000	0.55991706
9500	0.542005535
10000	0.541195068
e 


set origin 0.5, 0
set size 0.5, 0.5
set xrange [ 0 : 10000 ]
set yrange [ 0 : 12]
#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


500	7.037546732
1000	4.888689754
1500	3.934556962
2000	3.457062021
2500	3.083794126
3000	2.837988355
3500	2.624549573
4000	2.462053152
4500	2.301513416
5000	2.183057629
5500	2.092968248
6000	2.012449017
6500	1.933848693
7000	1.859541537
7500	1.801372406
8000	1.754430005
8500	1.698667964
9000	1.65042162
9500	1.60715853
10000	1.558176068
e

500	10.53803697
1000	8.096534309
1500	6.592091276
2000	5.627820162
2500	5.081476472
3000	4.657007194
3500	4.296457521
4000	4.057891826
4500	3.786230534
5000	3.598064216
5500	3.470460498
6000	3.311183729
6500	3.154566415
7000	3.002952279
7500	2.897091924
8000	2.807448046
8500	2.745525453
9000	2.652072272
9500	2.575329973
10000	2.514748624
e    

unset multiplot       

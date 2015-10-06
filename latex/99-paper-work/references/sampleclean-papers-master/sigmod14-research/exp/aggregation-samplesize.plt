# SampleClean v.s. BiasCorrect for Aggregation Error = 5% and 50%
reset

set terminal postscript eps enhanced color font "Times-Roman, 16"
set output "aggregation-samplesize.eps"

set size 1, 0.5
set multiplot layout 1, 2
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


set mxtics  2
set size 0.5, 0.5
set xrange [ 0 : 10000 ]
set yrange [ 0 : 10]
set key at graph 0.8, graph 0.9
set xtics 2000
set ytics 2
set mytics 2
#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


500	4.83989594
1000	3.492554192
1500	2.839441458
2000	2.476984576
2500	2.214430629
3000	2.031651875
3500	1.873315257
4000	1.761607493
4500	1.656547493
5000	1.570034086
5500	1.495561886
6000	1.436000875
6500	1.380645236
7000	1.332973824
7500	1.285177913
8000	1.241343783
8500	1.20442338
9000	1.171417074
9500	1.137272197
10000	1.107007789
e 
       
500	3.068313337
1000	2.573361897
1500	2.32558949
2000	1.899981585
2500	1.717059448
3000	1.569122088
3500	1.475090978
4000	1.394199433
4500	1.277528473
5000	1.225768647
5500	1.162075813
6000	1.132461087
6500	1.098847086
7000	1.04094859
7500	1.009039388
8000	0.984975671
8500	0.94975981
9000	0.919263048
9500	0.893889603
10000	0.862083769
e 

set size 0.5, 0.5
set xrange [ 0 : 10000 ]
set yrange [ 0 : 10]
#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


500	5.1834057
1000	3.643740726
1500	2.89722253
2000	2.504659307
2500	2.236381609
3000	2.030689618
3500	1.873063886
4000	1.750904714
4500	1.646053269
5000	1.561011945
5500	1.488054079
6000	1.418238523
6500	1.360870769
7000	1.311407612
7500	1.270116998
8000	1.231026215
8500	1.192823139
9000	1.158353113
9500	1.126191144
10000	1.097164688
e
500	9.881206536
1000	7.08201948
1500	5.627686946
2000	4.997610544
2500	4.425307913
3000	4.027289238
3500	3.691063781
4000	3.43057963
4500	3.208498233
5000	3.050790897
5500	2.901969194
6000	2.75155985
6500	2.640372535
7000	2.531656115
7500	2.438346092
8000	2.34658248
8500	2.287438268
9000	2.228217925
9500	2.162794788
10000	2.111273228
e    

unset multiplot       

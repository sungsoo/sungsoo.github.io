# SampleClean v.s. BiasCorrect for Duplication Error = 5% and 50%

reset

set terminal postscript eps enhanced color font "Times-Roman, 16"
set output "duplication-samplesize.eps"

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
set yrange [ 0 : 8]
set key at graph 0.8, graph 0.9
set xtics 2000
set ytics 2
set mytics 2
#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


500	5.652406562
1000	3.941362308
1500	3.236567356
2000	2.779361069
2500	2.472154623
3000	2.252318062
3500	2.078548307
4000	1.932160722
4500	1.820512147
5000	1.712299491
5500	1.629484739
6000	1.55342323
6500	1.488505183
7000	1.429370419
7500	1.38270513
8000	1.336812708
8500	1.297367248
9000	1.257157228
9500	1.224648588
10000	1.191160614
e 
       
500	1.856687589
1000	1.324778206
1500	1.08710372
2000	0.955296758
2500	0.846851961
3000	0.770155918
3500	0.68738595
4000	0.633937525
4500	0.623221404
5000	0.581338673
5500	0.55640796
6000	0.532634316
6500	0.512252027
7000	0.492953286
7500	0.478058335
8000	0.467099748
8500	0.454108703
9000	0.448378521
9500	0.438820904
10000	0.428493194
e 

set size 0.5, 0.5
set xrange [ 0 : 10000 ]
set yrange [ 0 : 8]
#set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "SampleClean" w l lw 2, '-' title "BiasCorrect" w l lw 2


500	6.512811885
1000	4.68817678
1500	3.857312339
2000	3.364462257
2500	2.997275742
3000	2.73646026
3500	2.533615708
4000	2.35285282
4500	2.224338029
5000	2.105067269
5500	1.989564396
6000	1.905465617
6500	1.8286033
7000	1.762930884
7500	1.702178499
8000	1.650598247
8500	1.600452995
9000	1.554965846
9500	1.51157365
10000	1.472659029
e

500	5.560860681
1000	3.927073132
1500	3.215779343
2000	2.745739108
2500	2.501225434
3000	2.241795402
3500	2.076599023
4000	1.948022655
4500	1.829793637
5000	1.724515972
5500	1.647140966
6000	1.581848707
6500	1.521603055
7000	1.468330367
7500	1.422234373
8000	1.384192189
8500	1.345765966
9000	1.309114323
9500	1.271550684
10000	1.238174834
e    

unset multiplot       

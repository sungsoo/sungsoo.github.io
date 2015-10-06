reset
set terminal pdfcairo mono enhanced font "Times-Roman, 16" 
set output "line1.pdf"
#set terminal postscript eps enhanced "Times-Roman, 16"
#set output "line.eps"

set multiplot layout 1, 2
set ylabel "Running Time (10^3)" offset 1, 0
set xlabel "# of Records" offset 0, 0.5

#set xtics scale 0.5
#set xtics font "Times-Roman, 20"
#set ytics scale 0.5
#set ytics font "Times-Roman, 20"
#set key font "Times-Roman, 22"
#set key spacing 0.7
#set key samplen 1

#set size 1,0.9
set nomxtics
set nomytics 
set noxtics


set grid noxtics noytics
set pointsize 1


#set logscale y 10
#unset logscale y


set size 0.5, 0.5
set xrange [ 0 : 9.0 ]
set yrange [ 0 : 400]
set key at graph 0.52, graph 0.9
set ytics 100
set mytics 2
set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "A ({/Symbol t}=1)" w lp pointtype 1 ps 1 lw 1,\
     '-' title "B ({/Symbol t}=2)" w lp pointtype 2 ps 1 lw 1,\
     '-' title "C ({/Symbol t}=3)" w lp pointtype 3 ps 1 lw 1

0 10.79 
1	10.884061
2	11.16685 
3	11.34043 
4	11.4996  
5	11.65617 
6	11.80831 
7	11.94828 
8	12.08526 
9	12.22584 
e	  
0 6.88 
1	9.14378
2	16.7088
3	17.8803
4	18.8425
5	19.7859
6	20.7923
7	21.5602
8	22.3171
9	23.1852
e	
0 48.74 	
1	81.2248
2	122.005
3	193.093
4	217.579
5	240.773
6	265.371
7	287.599
8	278.558
9	332.838
e	 
        

set size 0.5, 0.5
set xrange [ 0 : 9.0 ]
set yrange [ 0 : 1200]
set ytics 200
set xtics ("0" 0, "1" 1,"2" 2,"3" 3,"4" 4,"5" 5,"6" 6,"7" 7,"8" 8,"9" 9) font ",20"
#set ytics ("0.1" 0.1,"1" 1,"10^1" 10,"10^2" 100,"10^3" 1000,"10^4" 10000,"10^5" 100000,"10^6" 1000000)  font ",20"
plot '-' title "A ({/Symbol t}=1)" w lp pointtype 1 ps 1 lw 1,\
     '-' title "B ({/Symbol t}=2)" w lp pointtype 2 ps 1 lw 1,\
     '-' title "C ({/Symbol t}=3)" w lp pointtype 3 ps 1 lw 1 


0	10.82     
1	11.69     
2	12.59     
3	13.11     
4	14.28     
5	15.32     
6	15.77     
7	16.22     
8	17.01     
9 17.66     
e	          
0	6.88   
1	15.4   
2	24.57  
3	33     
4	47.86  
5	56.81  
6	68.94  
7	79.29  
8	89.26  
9 104.65 
e		      
0	48.74    
1	129.27   
2	226.64   
3	348.91   
4	503.24 
5	630.34 
6	742.23 
7	832.12 
8	910.68 
9 1066.12
e      

unset multiplot       
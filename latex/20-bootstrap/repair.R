############################################
#SYSTEM FAILS WHEN 4 MACHINES FAIL
#
#GENERATE ONE SYSTEM LIFE TIME
#
############################################
 set.seed(1235); r=0 
 x=NULL;  for (i in 1:4)x[i]=rexp(1,1)
 t.failure.arrival=min(x) #FIRST FAILURE TIME
 t.end.of.repair=Inf #NO end.of.repair EVENT PENDING
 clock=min(t.failure.arrival, t.end.of.repair)  #TURN THE CLOCK
 #########################################################################
 while (r < 4) #SYSTEM IS RUNNING
 {#WHILE
   if (clock == t.failure.arrival) #ARRIVAL OF failure.arrival EVENT
     {
       r=r+1 #INCREASE NO. OF FAILED MACHINES
       if (r == 4) {break} # SYSTEM CRASHES
       ############### SCHEDULE NEXT FAILURE ARRIVAL
       x[which.min(x)]=clock+rexp(1,1)
       t.failure.arrival=min(x)
       #####################################################
       ############ HANDLE THIS ARRIVING FAILURE
       if (r == 1) #START REPAIRING AND SCHEDULE ITS end.of.repair
         t.end.of.repair=clock+rexp(1,2) 
       # else #THE CURRENT ARRIVING FAILURE WAITS IN Q
          #{########DO NOTHING  
          #}
       
     }
   else #ARRIVAL OF end.of.repair EVENT
     {
      r=r-1 #UPDATE SYSTEM STATE 
      ###SEE IF REPAIRMAN CAN TAKE A BREAK
       if (r > 0) t.end.of.repair=clock+rexp(1,2) #START A NEW REPAIR AND SCHEDULE ITS end.of.repair
       else #SET REPAIRMAN IDLE
         t.end.of.repair=Inf
     }   
   clock=min(t.failure.arrival, t.end.of.repair) #TURN THE CLOCK
 }#WHILE
##########################################################################
 T=clock
 T
##################################################
##################################################

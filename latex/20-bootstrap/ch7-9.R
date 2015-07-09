 t0=Sys.time()
 one.M=function()
  {
   U1=runif(1); U2=runif(1); M=2
   while (U1 <= U2)
     {
       M=M+1
       U1=U2
       U2=runif(1)
     }
   return(M)
  }
#############
 set.seed(1235) #seed initialization
 n.rep=100000 #sample size
 iid.sample=replicate(n.rep, one.M())
 est=mean(iid.sample)
 se=sd(iid.sample)/n.rep^.5
 L=est-2*se; U=est+2*se
 cat("L=",L,"U=",U)
 Sys.time()-t0
#####################

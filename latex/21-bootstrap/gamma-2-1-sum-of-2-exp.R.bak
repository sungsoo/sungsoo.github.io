# generating Gamma(2,1) by rejection method
# using exponential(beta=2) as the majorizing density
t0=Sys.time()
one.X=function()
{
  n=1
  c=4*exp(-1)
  Y=-2*log(runif(1))
  U=runif(1)
  while (U*c*(0.5)*exp(-0.5*Y) > Y*exp(-Y))  
  { 
    Y=-2*log(runif(1))
    U=runif(1)
    n=n+1
  }
   return(c(Y,n))
} 
################ 
set.seed(1235)
n.rep=100000
iid.sample=replicate(n.rep, one.X())
plot(density(iid.sample[1,]))
mean(iid.sample[2,])
x=seq(0,10,.01)
lines(x,dgamma(x,2,1),col="red")
Sys.time()-t0

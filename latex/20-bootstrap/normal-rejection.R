# generating N(0,1) by rejection method
# using exponential(beta=1) as the majorizing density
t0=Sys.time()
one.X=function()
{
  n=1
  c=(2/pi)^.5*exp(.5)
  Y=-log(runif(1))
  U=runif(1)
  while (U*c*exp(-Y) > (2/pi)^.5*exp(-.5*Y^2))  
  { 
    Y=-log(runif(1))
    U=runif(1)
    n=n+1
  }
  Y=Y*(2*rbinom(1,1,.5)-1)
   return(c(Y,n))
} 
################ 
set.seed(1235)
n.rep=100000
iid.sample=replicate(n.rep, one.X())
plot(density(iid.sample[1,]))
mean(iid.sample[2,])
x=seq(-4,4,.01)
lines(x,dnorm(x),col="red")
Sys.time()-t0

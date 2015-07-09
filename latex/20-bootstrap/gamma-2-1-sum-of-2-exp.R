# generating Gamma(2,1) as the sum of 2 exponential(beta=1)
t0=Sys.time()
one.X=function()
{ U1=runif(1); U2=runif(1)
  X=-log(U1)-log(U2)
   return(X)
} 
################ 
set.seed(1235)
n.rep=100000
iid.sample=replicate(n.rep, one.X())
plot(density(iid.sample))
x=seq(0,10,.01)
lines(x,dgamma(x,2,1),col="red")
Sys.time()-t0

 #theta=sigma.sq
 #estimator=sample variance
 #population: N(mu,sigma^2)
 #
 # study performance of bootstrapping technique for different values
 # of mu, sigma, n, b (bootstrapping replication no.)
 t0=Sys.time()
 x=NULL; y=NULL; BS=NULL
 set.seed(1235); n=100000; b=100; mu=5; sigma=10; x=mu+sigma*rnorm(n)
 theta.Fe=var(x)*(n-1)/n
 for (j in 1:b){
   for (i in 1:n)y[i]=x[floor(n*runif(1)+1)]
   BS[j]=(var(y)-theta.Fe)^2
 }
 theoretical.MSE=2*sigma^4/(n-1)
 bootstrap.MSE=mean(BS); se=sd(BS)/b^.5
 L=bootstrap.MSE-2*se;  U=bootstrap.MSE+2*se 
 cat("theoretical.MSE=", theoretical.MSE,
   "bootstrap.MSE=",bootstrap.MSE,
   "L=", L, "U=", U, "\n")
 Sys.time()-t0

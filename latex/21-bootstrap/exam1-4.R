t0=Sys.time()
 one.X=function()
 { Y=-log(runif(1))-log(runif(1))
  X=(runif(1))^(1/(Y)^.5)
   return(X)
}
 ################
 set.seed(1235)
 n.rep=1000
s=replicate(n.rep,one.X())
x=seq(0.001,1,.001)
 for (i in 1:1000)
   {e.f[i]=mean(s <=x[i])
   }
plot(x,e.f)
Sys.time()-t0

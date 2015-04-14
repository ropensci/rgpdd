fit_ssg <- function(y, 
                    init = c(dt = mean(y), Tt = 1, 
                             HHt = log(var(y)/2), GGt = log(var(y)/2)),
                    ...){
    o <- optim(init,
                 fn =  function(par, ...)
                   -fkf(dt = matrix(par[1]),
                        Tt = matrix(par[2]),
                        HHt = matrix(exp(par[3])), 
                        GGt = matrix(exp(par[4])), 
                        ...)$logLik,   
                 a0 = y[1], 
                 P0 = matrix(10), 
                 ct = matrix(0),
                 Zt = matrix(1), 
                 yt = rbind(y), 
                 check.input = FALSE, 
                 ...)
  o$par[["HHt"]] <- exp(o$par[["HHt"]])
  o$par[["GGt"]] <- exp(o$par[["GGt"]])
  c(o, list(a0 = y[1], n = length(y)))
}

fit_ssrw <- function(y, 
                     init = c(dt=mean(y), HHt = log(var(y)/2), 
                              GGt = log(var(y)/2)), 
                     ...){
    o <- optim(init,
                 fn =  function(par, ...)
                   -fkf(dt = matrix(par[1]), HHt = matrix(exp(par[2])), 
                        GGt = matrix(exp(par[3])), ...)$logLik,   
                 a0 = y[1], P0 = matrix(10), ct = matrix(0), Tt = matrix(1),
                 Zt = matrix(1), yt = rbind(y), check.input = FALSE, ...)
  o$par[["HHt"]] <- exp(o$par[["HHt"]])
  o$par[["GGt"]] <- exp(o$par[["GGt"]])
  c(o, list(a0 = y[1], n = length(y)))
}

fit_g <- function(y, init = c(dt = mean(y), Tt=1, HHt = log(var(y))), ...){
  o <- optim(init,
                 fn =  function(par, ...)
                   -fkf(dt = matrix(par[1]), Tt = matrix(par[2]), 
                        HHt = matrix(exp(par[3])), ...)$logLik,   
                 a0 = y[1], P0 = matrix(10), ct = matrix(0), GGt = matrix(0),
                 Zt = matrix(1), yt = rbind(y), check.input = FALSE, ...)
  o$par[["HHt"]] <- exp(o$par[["HHt"]])  
  c(o, list(a0 = y[1], n = length(y)))
}

fit_rw <- function(y, init = c(dt=mean(y), HHt = log(var(y))), ...){
 o <-  optim(init, 
                 fn =  function(par, ...)
                   -fkf(dt = matrix(par[1]), 
                        HHt = matrix(exp(par[2])), ...)$logLik,   
                 a0 = y[1], P0 = matrix(10), ct = matrix(0),
                 Tt = matrix(1), GGt = matrix(0), Zt = matrix(1),
                 yt = rbind(y), check.input = FALSE, ...)
  o$par[["HHt"]] <- exp(o$par[["HHt"]])
  c(o, list(a0 = y[1], n = length(y)))
}

robust_fit <- function(model = c("ssg", "ssrw", "g", "rw"), y, N = 50, all = FALSE, ...){
  
  ## Set the model and the mean initial condition
  m <- switch(model,
              ssg = list(fit = fit_ssg, 
                         init = c(dt = mean(y), Tt = 1, 
                                 HHt = log(var(y)/2), GGt = log(var(y)/2))),
              ssrw = list(fit = fit_ssrw, 
                          init = c(dt = mean(y), HHt = log(var(y)/2), 
                                   GGt = log(var(y)/2))),
              g = list(fit = fit_g, 
                       init = c(dt = mean(y), Tt = 1, HHt = log(var(y)/2))),
              rw = list(fit = fit_rw, 
                        init = c(dt = mean(y), HHt = log(var(y)/2))))  
  
  
  ## Create the inital conditions
  inits <- data.frame(id = 1:N, sapply(m$init, 
                      function(m) rnorm(N, m, sqrt(abs(m)))))  
  
  ## Attempt the requested fit or return NAs
  f <- function(init){
    o <- tryCatch(
      m$fit(y, init = init[-1]), 
      error = function(e) list(par = c(dt = NA, Tt=NA, HHt = NA, GGt= NA),
                               value=NA, convergence=1, n=length(y), a0=y[1]))
    data.frame(t(c(o$par, mloglik = o$value, converge =
                   as.numeric(o$convergence), n=o$n, a0=o$a0)))
  }
  
  ## Apply the function to each initial condition, 
  inits %>% group_by(id) %>% do(f(.)) %>% ungroup() -> output
  
  if(!all) ## drop unconverged, and select only the best scoring run
    output %>% filter(converge == 0) %>% slice(which.min(mloglik)) -> output 
  
  output
}


kalman <- function(df, ...){
  y <- df$logN
  ssg <- robust_fit("ssg", y, ...) 
  ssrw <- robust_fit("ssrw", y, ...) 
  g <- robust_fit("g", y, ...) 
  rw <- robust_fit("rw", y, ...)
  options(stringsAsFactors=FALSE)
  rbind(ssg  = ssg,
        ssrw = cbind(ssrw, Tt = 1),
        g    = cbind(g, GGt = 0), 
        rw   = cbind(rw, Tt = 1, GGt = 0))
                              
}


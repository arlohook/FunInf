#' Estimates correlation and multiplicity adjusted confidence bands
#'
#' @description Estimates correlation and multiplicity adjusted confidence bands for a set of bootstrap replicates of a functional linear model coefficient.
#'
#' @param boot.grid An N x length(ind) matrix of replicates.
#' @param est The original estimate to perform the correction around. If NULL (default) then the row-wise mean of boot.grid is used.
#' @param se The original standard error estimate to perform the correction with. If NULL (default) the row-wise sd of boot.grid is used.
#' @param ind The grid points which the N functions are observed at. Ff NULL (default) seq(0,1, length = nrow(boot.grid) is used).
#' @param alpha specifies the significance level for estimated bands i.e. 1-alpha. Defaults to 0.05/
#'
#'
#'@return A dataframe containing ind, value, se, the CMA correction factor, and upper and lower confidence intervals.
#'
#'@export
estimate.CMA = function(boot.grid, est = NULL, se = NULL, ind = NULL, alpha = 0.05){

  N = ncol(boot.grid)
  L = nrow(boot.grid)

  if(is.null(ind)){
    ind = seq(0,1, length = L)
  }

  if(is.null(est)){
    est = apply(boot.grid, 1, mean)
  }

  if(is.null(se)){
    se = apply(boot.grid, 1, sd)
  }

  # checks

  if(length(se) != L){
    stop("Error: se not equal to nrow(boot.grid)")
  }

  if(length(est) != L){
    stop("Error: est not equal to nrow(boot.grid)")
  }



  Q = apply(boot.grid, 2, function(b){

    max((abs(b-est)/se))

  })

  adj.fac = quantile(Q, 1-alpha)

  data.frame("ind" = ind, "est" = est, "se" = se, "adj.fac" = adj.fac,
             "UCI" = est+(adj.fac*se), "LCI" = est-(adj.fac*se))

}

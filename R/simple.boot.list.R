#' Generate a list of observation level bootstrap samples
#'
#' @description Re-samples data at the observation level to form a list of dataframes.
#'
#' @param df The dataframe to be re sampled.
#' @param B The number of bootstrap samples to generate.
#'
#' @return A list of dataframes.
#'
#' @export
simple.boot.list = function(df, B){

  n = nrow(df)

  samp.inds = matrix(
    data = sample(1:n, n*B, replace = T),
    nrow = n,
    ncol = B
  )

  lapply(1:B, function(b){df[samp.inds[,b],]})

}

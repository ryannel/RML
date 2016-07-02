RML$Regression$LinearRegression <- function(weights = NULL) {
  LinearRegression <- new.env()
  LinearRegression$weights <- weights
  LinearRegression$Model <- lm
  return(LinearRegression)
}
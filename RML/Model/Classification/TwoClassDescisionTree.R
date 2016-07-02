RML$Classification$TwoClassDescisionTree <- function(method = NULL, minSplit = 30, minBucket = 0, cp = 0.001) {
  library(rpart)
  
  LinearRegression <- new.env()
  LinearRegression$Control <- rpart.control(minsplit = minSplit, minBucket = minBucket, cp = cp)
  LinearRegression$Method <- method
  LinearRegression$Model <- rpart
  return(LinearRegression)
}
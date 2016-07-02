RML$Train$TrainModel <- function(model, dataSet, column) {
  library(rpart)

  removeDuplicateColumns <- function (dataSet, column) {
    for(columnName in names(dataSet)){
      if (identical(dataSet[, columnName], column)) {
        dataSet[, columnName] <- NULL
      }
    }
    return(dataSet)
  }
  
  trainLinearModel <- function (model, trainData, column) {
    cat('training')
    fit <- lm(column ~ trainData, weights=model$Weights)
  }

  trainDescisionTree <- function (model, trainData, column) {
    cat('training')
    fit <- rpart(column ~ trainData, control=model$control, method=model$Method)
  }

  trainData <- removeDuplicateColumns(dataSet, column)
  if (identical(model$Model, lm)) {
    result <- trainLinearModel(model, trainData, column)
  } else if (identical(model$Model, rpart)) {
    result <- trainLinearModel(model, trainData, column)
  }
  return(result)
}
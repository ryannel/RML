RML$Evaluate$TrainModel <- function(model, dataSet, column) {
  removeDuplicateColumns <- function (dataSet, column) {
    for(columnName in names(dataSet)){
      if (identical(dataSet[, columnName], column)) {
        dataSet[, columnName] <- NULL
      }
    }

    return(dataSet)
  }
  
  trainLinearModel <- function (model, trainData, column) {
    fit <- lm(column ~., weights=model$Weights, data=trainData)
  }

  trainData <- removeDuplicateColumns(dataSet, column)
  if (identical(model$Model, lm)) {
    result <- trainLinearModel(model, trainData, column)
  }
  return(result)
}
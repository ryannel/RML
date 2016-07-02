RML$Train$TrainModel <- function(model, dataSet, column) {
    library(rpart)

    removeDuplicateColumns <- function(dataSet, column) {
        for (columnName in names(dataSet)) {
            if (identical(dataSet[, columnName], column)) {
                dataSet[, columnName] <- NULL
            }
        }
        
        return(dataSet)
    }

    trainLinearModel <- function(model, trainData, column) {
        fit <- lm(column ~., data = trainData, weights = model$Weights)
    }

    trainDescisionTree <- function(model, trainData, column) {
        if (is.null(model$Methd)) {
            fit <- rpart(column ~., data = trainData, control = model$control)
        } else {
            fit <- rpart(column ~., data = trainData, control = model$control, method = model$Method)
        }

        return(fit)
    }

    trainData <- removeDuplicateColumns(dataSet, column)
    if (identical(model$Model, lm)) {
        result <- trainLinearModel(model, trainData, column)
    } else if (identical(model$Model, rpart)) {
        result <- trainDescisionTree(model, trainData, column)
    } else {
        stop('Model not supported. Please ensure that this is a valid RML model.')
    }

    return(result)
}
RML$SampleAndSplit$SplitData <- function (dataSet, percentage) {
    trainIndex <- caret::createDataPartition(dataSet[,1], p=percentage, list=FALSE, times = 1)

    result <- new.env()
    result$Train <- dataSet[trainIndex, ]
    result$Test <- dataSet[-trainIndex, ]
    return(result)
}
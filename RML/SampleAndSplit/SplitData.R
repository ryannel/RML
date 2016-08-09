RML$SampleAndSplit$SplitData <- function (dataSet, percentage) {
    library(caret)
    
    trainIndex <- createDataPartition(dataSet, p=percentage, list=FALSE, times = 1)

    result <- new.env()
    result$Train <- dataSet[trainIndex, ]
    result$Test <- dataSet[-trainIndex, ]
    return(result)
}
App$Model$Tree$Model <- (function () {
    
    getCachedData <- function (key) {
        dataSet <- App$Data$CacheService$Cache(key, function () {
            dataSet <- App$Data$DataService$GetFromCSV("BingoBI.csv")
            dataSet <- App$Feature$FeatureService$CreateArtificialFeatures(dataSet)
            return(dataSet)
        })
        
        return(dataSet)
    }
    
    getSplitDataSetFromCache <- function (key) {
        library(caret)
        
        cachedData <- getCachedData(key)
        
        trainIndex <- createDataPartition(seq(1, nrow(cachedData), by=1), p=0.7, list=FALSE)
        trainData <- cachedData[trainIndex,]
        testData <- cachedData[-trainIndex,]
        
        dataSet = new.env()
        dataSet$train = trainData
        dataSet$test = testData
        return(dataSet)
    }

    DescisionTree <- function (dataSet) {
        library(tree)

        # fit = tree(independant ~. , dataSet)
        return(fit)
    }


    Tree <- new.env()
    Tree$DescisionTree <- DescisionTree
    return(Tree)
})()
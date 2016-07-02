App$Model$Linear$Model <- (function() {
    GetCachedData <- function () {
        dataSet <- App$Data$CacheService$Cache("LinearModelData", function () {
            dataSet <- App$Feature$FeatureService$GetFilteredBingoBIData()
            return(dataSet)
        })
        
        return(dataSet)
    }
    
    BenchMark <- function() {
        dataSet <- GetCachedData()

        return(model)
    }
    
  LinearModel <- new.env()
  LinearModel$BenchMark             <- BenchMark
  return(LinearModel)
})()
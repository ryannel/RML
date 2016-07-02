App$Feature$FeatureService <- (function() {
  DataService <- App$Data$DataService
  DateTimeFeature <- App$Feature$DateTimeFeature
  FilterService <- App$Filter$FilterService
  GameTemplateFeature <-App$Feature$GameTemplateFeature
  
  GetGameProfitFactor <- function (data) {
      data$GoodGame <- as.integer(data$GameProfit > 0)
      return(data)
  }
  
  CreateArtificialFeatures <- function (data) {
    cat("Creating Artificial Features\n")
    data <- DateTimeFeature$SplitTimeFactorsFromSimeSlotStart(data)
    data <- DateTimeFeature$CalculateBuyWindow(data)
    data <- GameTemplateFeature$CalculateTemplateStats(data)
    data <- GetGameProfitFactor(data)
    
    return(data)
  }
  
  GetFilteredBingoBIData <- function() {
    data <- DataService$GetFromCSV("BingoBI.csv")
    
    data <- CreateArtificialFeatures(data)
    
    cat("Removing Unused Columns\n")
    data <- FilterService$RemoveUnusedColumns(data)
    
    cat("Log transforming data with postivie skew\n")
    data <- FilterService$LogTransformBingoBIData(data)
    
    return(data)
  }
  
  LinearModel <- new.env()
  LinearModel$GetFilteredBingoBIData <- GetFilteredBingoBIData
  LinearModel$CreateArtificialFeatures <- CreateArtificialFeatures
  return(LinearModel)
})()
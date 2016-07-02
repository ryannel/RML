App$Data$DataService <- (function() {
  CacheService <- App$Data$CacheService
  
  GetFromCSV <- function(path) {
    path = paste("./data/", path, sep="")
    
    if (CacheService$InCache(path)) return(CacheService$Get(path))
    
    cat(paste("Loading", path, "from file\n", sep=" "))
    result <- read.csv(path, row.names=1, sep=";")

    CacheService$Set(path, result)
    return(result)
  }
  
  DataService <- new.env()
  DataService$GetFromCSV <- GetFromCSV
  return(DataService)
})()
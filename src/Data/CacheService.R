if (!exists("cache")) {
  cache = list()
} 

App$Data$CacheService <- (function () {
  Get <- function (key) {
    cat(paste("Loading:", key, "from Cache\n", sep=" "))
    return(cache[[key]])
  }
  
  Set <- function (key, value) {
    cat(paste("Caching:", key, "\n", sep=" "))
    cache[[key]] <<- value
  }
  
  Clear <- function (key) {
    cache[[key]] <<- NULL
  }
  
  ClearAll <- function () {
    cache <- list()
  }
  
  InCache <- function (key) {
    key %in% names(cache)
  }
  
  Cache <- function (key, getter) {
    if (InCache(key)) return(Get(key))
    
    data <- getter()
    Set(key, data) 
    return(data)
  }
  
  CacheService <- new.env()
  CacheService$InCache <- InCache
  CacheService$Get <- Get
  CacheService$Set <- Set
  CacheService$Clear <- Clear
  CacheService$ClearAll <- ClearAll
  CacheService$Cache <- Cache
  return(CacheService)
})()


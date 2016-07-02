App$Feature$DateTimeFeature <- (function() {
  UtilService <- App$Util$UtilService
  
  SplitTimeFactorsFromSimeSlotStart <- function (BingoBI) {
    BingoBI$TimeSlotStartWeekday <- UtilService$GetWeekdayFromDateTime(BingoBI$TimeSlotStart)
    BingoBI$TimeSlotStartHour <- UtilService$GetHoursFromDateTime(BingoBI$TimeSlotStart)
    
    return(BingoBI)
  }
  
  CalculateBuyWindow <- function (BingoBI) {
    timeSlotStart <- as.Date(BingoBI$TimeSlotStart)
    preBuyOpenTime <- as.Date(BingoBI$PreBuyOpenTime)
    
    dateDiff <- difftime(timeSlotStart, preBuyOpenTime, units='hours')
    BingoBI$BuyWindow <- as.numeric(dateDiff)
    
    return(BingoBI)  
  }
  
  DateTimeFeature <- new.env()
  DateTimeFeature$SplitTimeFactorsFromSimeSlotStart <- SplitTimeFactorsFromSimeSlotStart
  DateTimeFeature$CalculateBuyWindow <- CalculateBuyWindow
  return(DateTimeFeature)
})()

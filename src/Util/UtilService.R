App$Util$UtilService <- (function () {
    GetWeekdayFromDateTime <- function (dateTime) {
        as.POSIXlt(dateTime)$wday
    }
	
	GetHoursFromDateTime <- function (dateTime) {
	   as.POSIXlt(dateTime)$hour
	}

	UtilService <- new.env()
	UtilService$GetWeekdayFromDateTime <- GetWeekdayFromDateTime
	UtilService$GetHoursFromDateTime <- GetHoursFromDateTime
	return(UtilService)
})()
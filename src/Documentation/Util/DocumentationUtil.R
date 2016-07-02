App$Documentation$Util <- (function () {
    PrintMethod <- function(closure, name) {
        output <- capture.output(closure)
        output <- paste(output, "\n")
        output <- head(output, -1)
        output <- gsub("function", paste("function", name, "", sep=" "), output)
        return(output)
    }    
    
    Util <- new.env()
    Util$PrintMethod <- PrintMethod
    return(Util)
})()
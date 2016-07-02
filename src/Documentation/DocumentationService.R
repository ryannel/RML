App$Documentation$DocumentationService <- (function () {
    library(rmarkdown)
    
    Generate <- function () {
        PrintMethod <- App$Documentation$Util$PrintMethod
        dataSet <- App$Data$DataService$GetFromCSV("BingoBI.csv")
        filteredDataSet <- App$Feature$FeatureService$GetFilteredBingoBIData()
    
        render(
            "./src/Documentation/MarkDown/Main.rmd", 
            output_dir="./documentation"
        )
    }
    
    DocumentationService <- new.env()
    DocumentationService$Generate <- Generate
    return(DocumentationService)
})()
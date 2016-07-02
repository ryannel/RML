App$Model$Linear$Util$CrossValidation <- (function () {
    KFold <- function (lm, dataSet, folds) {
        library(DAAG)
        crossValidate <- cv.lm(df=dataSet, lm, m=folds, printit=FALSE)
        return(crossValidate)
    }
    
    CrossValidation <- new.env()
    CrossValidation$KFold <- KFold
    return(CrossValidation)
})()
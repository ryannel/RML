RML$Evaluate <- (function() {
    library(ROCR)

    GetIndependantVariable <- function(fit, dataSet) {
        xLabels <- attr(delete.response(fit$terms), "term.labels")
        yLabel <- setdiff(names(dataSet), xLabels)
        return(dataSet[yLabel])
    }

    BinaryCrossValidation <- function (model, testDataSet, threshold = 0.5) {
        predictions <- predict(model, testDataSet)

        if (is.null(ncol(predictions))) {
            stop("Please ensure your independant variable is a factor.")
        }

        independantVariable <- GetIndependantVariable(model, testDataSet)

        predicted = ordered(predictions[,1] > threshold, levels=c(TRUE, FALSE))
        actual = as.character(independantVariable[,1]) == colnames(predictions)[1]
        actual = ordered(actual, levels=c(TRUE, FALSE))

        print(caret::confusionMatrix(predicted, actual))

        rocrPrediction <- ROCR::prediction(predictions[,1], ordered(actual, levels= c(FALSE, TRUE)))
        plot(ROCR::performance(rocrPrediction, "tpr", "fpr"), main='ROC Curve')
    }
   
    Evaluate <- new.env()
    Evaluate$BinaryCrossValidation <- BinaryCrossValidation
    return(Evaluate)
})()
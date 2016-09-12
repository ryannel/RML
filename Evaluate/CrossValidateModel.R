RML$Evaluate$CrossValidate <- function(model, testDataSet, threshold = 0.5) {
    pred <- predict(model, testDataSet)

    xLabels <- attr(delete.response(fit$terms), "term.labels")
    yLabel <- setdiff(names(testDataSet), xLabels)

    xtab = table(as.character(pred > threshold), as.character(testDataSet[yLabel] == 1))
    print(caret::confusionMatrix(xtab, positive = 'TRUE'))

    pred <- ROCR::prediction(pred, testDataSet[yLabel]) 
    plot(ROCR::performance(pred, "tpr", "fpr"))
}
source("./RML/rml.R", chdir = TRUE)

dataSet <- iris

model <- RML$Classification$TwoClassDescisionTree()

trainModel <- RML$Train$TrainModel(model, dataSet, dataSet$Species)

fit <- lm(column ~ as.data.frame(dataSet), weights=model$Weights)

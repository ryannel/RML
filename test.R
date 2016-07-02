source("./RML/rml.R", chdir = TRUE)

dataSet <- iris

#model <- RML$Classification$TwoClassDescisionTree()

model <- RML$Regression$LinearRegression()

dataSet$Species

trainModel <- RML$Train$TrainModel(model, dataSet, dataSet$Sepal.Length)

summary(trainModel)
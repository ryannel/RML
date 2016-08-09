source("./RML/rml.R", chdir = TRUE)

dataSet <- iris

dataSet <- RML$SampleAndSplit$SplitData(dataSet, 0.7)

#model <- RML$Classification$TwoClassDescisionTree()
#model <- RML$Regression$LinearRegression()
model <- RML$Classification$KMeans(centroids = 3)

trainModel <- RML$Train$TrainModel(model, dataSet$Train[, 1:4])

summary(trainModel)

table(trainModel$cluster, dataSet$Species)

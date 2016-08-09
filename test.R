source("./RML/rml.R", chdir = TRUE)

dataSet <- iris

#model <- RML$Classification$TwoClassDescisionTree()
#model <- RML$Regression$LinearRegression()
model <- RML$Classification$KMeans(centroids = 3)

trainModel <- RML$Train$TrainModel(model, dataSet[, 1:4])

summary(trainModel)

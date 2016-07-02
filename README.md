# RML
R Machine Learning Framework - A simpler way to do machine learning in R. 

# About
Inspired by Microsoft's Azure Machine Learning, this is an attempt to provide a simple, clean workflow for rapid prototyping in R.  

# Example 
Current workflow

## Linear Regression
A simple linear regression using lm. This is supported simply to match Microsoft Azure ML's functionality. 

### Basic 
```
source("./RML/rml.R", chdir = TRUE)

dataSet <- iris
model <- RML$Regression$LinearRegression()
trainModel <- RML$Train$TrainModel(model, dataSet, dataSet$Sepal.Length)
```

### Advanced
Here it is best to use the lm syntax correctly. 

## Two Class Descision Tree
Using the rpart package.

### Basic
Assumes a set of default parameters.

* method = auto
* min split = 30
* min bucket = 0
* cp = 0.001

```
source("./RML/rml.R", chdir = TRUE)

dataSet <- iris
model <- RML$Classification$TwoClassDescisionTree()
trainModel <- RML$Train$TrainModel(model, dataSet, dataSet$Species)
```

### Advanced
Custom parameters can be set and tuned explicitly. 

```
source("./RML/rml.R", chdir = TRUE)

dataSet <- iris
model <- RML$Classification$TwoClassDescisionTree(method='anova', minSplit='10', minBucket='5', cp=0.02)
trainModel <- RML$Train$TrainModel(model, dataSet, dataSet$Species)
```
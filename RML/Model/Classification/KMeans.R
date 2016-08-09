RML$Classification$KMeans <- function(centroids = NULL, numberOfStarts = 20, iterations = 100) {
  KMeans <- new.env()
  KMeans$Model <- kmeans
  KMeans$Centroids <- centroids
  KMeans$Iterations <- iterations
  KMeans$NumberOfStarts <- numberOfStarts
  return(KMeans)
}
install.packages("mlbench")

install.packages("caret")

install.packages("ggplot2")

install.packages("randomForest")

library(mlbench)
library(caret)


iris <-  read.csv("C:\\Users\\student\\Downloads\\iris.csv")
iris

preproc <- preProcess(iris[, -1], method = c("center", "scale"))
iris[, -1] <- predict(preproc, iris[, -1])

set.seed(123)  
#split 80% to training and 20% to test data
splitIndex <- createDataPartition(iris$petal.width, p = 0.8, list = FALSE)
training_data <- iris[splitIndex, ]
training_data
testing_data <- iris[-splitIndex, ]
testing_data

library(class)

k <- 3

# Train the KNN model
model <- knn(train = training_data[, -5], test = testing_data[, -5], cl = training_data$petal.width, k = k)
model


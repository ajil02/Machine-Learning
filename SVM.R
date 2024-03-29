install.packages("e1071")
library(e1071)

data(iris)
head(iris)

set.seed(123)
indices <- sample(1:nrow(iris), 0.8 * nrow(iris))
train_data <- iris[indices, -5] 
train_labels <- iris$Species[indices]
test_data <- iris[-indices, -5]
test_labels <- iris$Species[-indices]

svm_model <- svm(train_data, train_labels, kernel = "radial", cost = 1)

svm_predictions <- predict(svm_model, test_data)

confusion_matrix <- table(Actual = test_labels, Predicted = svm_predictions)
confusion_matrix
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Confusion Matrix:\n","\n")
confusion_matrix
cat("Accuracy: ", accuracy, "\n")

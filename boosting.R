install.packages("gbm")
library(gbm)

data(iris)
iris$Species <-as.numeric(factor(iris$Species))

set.seed(123)
model <- gbm(Species ~ .,data=iris,distribution="multinomial",n.trees=100,interaction.depth=3,shrinkage=0.1)

predictions <- predict(model,newdata = iris,n.trees=100,type="response")

predicted_labels <- apply(predictions,1,which.max)

matrix <- table(predicted_labels,iris$Species)
matrix

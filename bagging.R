install.packages("ipred")
library(ipred)

data(iris)

set.seed(123)
model <- bagging(Species~.,data=iris,nbagg=50)

predictions <-predict(model,newdata = iris)

matrix <-table(predictions,iris$Species)
matrix

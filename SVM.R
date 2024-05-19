install.packages("e1071")
library("e1071")
install.packages("GGally")
library(GGally)
library(caTools)
library(caret)

str(iris)
head(iris, 10)

set.seed(42)
sample_split <- sample.split(Y = iris$Species, SplitRatio = 0.75)
train_set <-subset(x=iris, sample_split==TRUE)
test_set <-subset(x=iris, sample_split==FALSE)

svm1 <- svm(Species ~., data = train_set, kernel="radial")
svm1
ggpairs(train_set, ggplot2::aes(color=Species, alpha=0.4))
plot(svm1, data= train_set, Petal.Width~Petal.Length, slice=list(Sepal.Width=3, Sepal.Length=4))

pred1<-predict(svm1, test_set)
pred1

table1=table(pred1, test_set$Species)

confusionMatrix(pred1, test_set$Species)

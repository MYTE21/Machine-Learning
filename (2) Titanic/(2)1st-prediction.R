setwd("/home/myte/Only Me/Machine-Learning/(2) Titanic")

# Train Data 
train <- read.csv("/home/myte/Only Me/Machine-Learning/(2) Titanic/train.csv")
train
View(train)
str(train)

# Test Data
test <- read.csv("/home/myte/Only Me/Machine-Learning/(2) Titanic/test.csv")
test
View(test)
str(test)

# 1st Prediction
table(train$Survived)
prop.table(table(train$Survived))*100
barplot(table(train$Survived), xlab="Survived", ylab="People", main="Train Data Survival")

test$Survived <- rep(0, 418)

# Submission file create
prediction1 <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction1, file = "prediction1.csv", row.names = FALSE)
    
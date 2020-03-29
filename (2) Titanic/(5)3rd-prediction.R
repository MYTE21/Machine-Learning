setwd("/home/myte/Only Me/Machine-Learning/(2) Titanic")
train <- read.csv("/home/myte/Only Me/Machine-Learning/(2) Titanic/train.csv")
test <- read.csv("/home/myte/Only Me/Machine-Learning/(2) Titanic/test.csv")

# New variable Fare2
train$Fare2 <- '30+'
train$Fare2[train$Fare < 30 & train$Fare >= 20] <- '20-30'
train$Fare2[train$Fare < 20 & train$Fare >= 10] <- '10-20'
train$Fare2[train$Fare < 10] <- '<10'
train$Fare2[train$Fare > 30] <- '30+'
train$Fare2

# Test
table(train$Sex, train$Survived)
summary(train$Sex)
aggregate(Survived ~ Sex, data=train, FUN=sum)
aggregate(Survived ~ Sex, data=train, FUN=length)
aggregate(Survived ~ Sex, data=train, FUN=function(x) {sum(x)/length(x)})
 
# Prediction 3
aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=sum)
aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=length)
aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x)})

test$Survived <- 0
test$Survived[test$Sex == 'female'] <- 1
test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 20] <- 0

# Submission File
prediction3 <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction3, file = "prediction3.csv", row.names = FALSE)

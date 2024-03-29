#Loading packages
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)
library(caret)

#Opening file directory
setwd("C:/Users/Henry.Nketeh/Desktop")

#Opening team attendance file and assign it to a variable 
attendance <- read.csv("capstone_project.csv")

#Removing columns from the dataframe 
attendance$X <- NULL 
attendance$Teams.Operating.Income <- NULL
attendance$metro.area.population <- NULL
attendance$X2018.2019.season.Road.Game.Attendance <- NULL
attendance$Teams.Roster.Salary <- NULL
attendance$star.expenses <- NULL

#creating column to show teams that met/did not meet the guarentee increase rate. 
attendance$Increase<- ifelse(attendance$Teams.Revenue >= 169.99,1,0)

#Renaming data frame variables
colnames(attendance)[colnames(attendance)=="Teams.Revenue"] <- "Difference"
colnames(attendance)[colnames(attendance)=="win.to.player.cost.ratio.increase"] <- "Percentage increase"
colnames(attendance)[colnames(attendance)=="Teams.location.median.income"] <- "1 percent increase of attendance"

#saving the clean team attendance data to new file
write.csv(attendance, "teamAttendance5.csv")


#Validation results
#Opening file directory
setwd("C:/Users/Henry.Nketeh/Desktop")

#Opening team attendance file and assign it to a variable 
Adata3 <-  read.csv("teamAttendance5.csv")

# create a list of 80% of the rows in the original dataset we can use for training
validation_index <- createDataPartition(Adata3$Team.Rating, p=0.80, list=FALSE)

# select 20% of the data for testing 
validation <- Adata3[-validation_index,]
# use the remaining 80% of data to training and testing the models
Adata <- Adata3[validation_index,]

#summary of 80% of data 
summary(Adata)

#Creating Scatter plot and assigning x and y axis and title
ggplot(Adata, aes(y =Teams, x = Difference , color=Increase)) +
  geom_point() + ggtitle("2019 NBA Team Attendance Increase")

#Saving Scatter plot to a new file
write.csv(attendance, "ScatterPlot.csv")
summary(Adata)

#Machine learning       
#Linear regression model for dependant variable
model = lm( Team.Rating ~ NRTG, data= Adata)
summary(model)

#Calculating the root mean squared
new_model <- predict(model,Adata)
new_model
difference <- new_model - Adata$Team.Rating
rmse <- sqrt(mean(difference^2))
rmse

#Creating a second model for training data 
model2 =lm(Team.Rating ~ NRTG + Difference, data=Adata)
summary(model2)

#Randomly going through the training data set and an it 5 times to get the best model out of the 5
control <- trainControl(method="cv", number=5)
set.seed(7)
fit <- train(Team.Rating ~ NRTG,data=Adata, method="lm", metric="RMSE", trControl=control)

# display results
print(fit)

#Saving new file for overall project code
write.csv(PlayerR, "CapstoneProjectFinal.csv")


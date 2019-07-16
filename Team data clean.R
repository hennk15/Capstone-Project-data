#Loading packages
library(dplyr)
library(tidyr)
library(readr)
#Opening file directory
setwd("C:/Users/Henry.Nketeh/Desktop")
#Opening specific file and assign it to a variable 
attendance <- read.csv("capstone_project.csv")
#Removing columns from the dataframe 
attendance$Teams.Operating.Income <- NULL
attendance$metro.area.population <- NULL
attendance$X2018.2019.season.Road.Game.Attendance <- NULL
attendance$Teams.Roster.Salary <- NULL
attendance$star.expenses <- NULL
#creating column to show teams that met/did not meet the guarentee increase rate during the 2019 season. 
attendance$Increase<- ifelse(attendance$Teams.Revenue >= 169.99,1,0)
#Renaming data frame variables
colnames(attendance)[colnames(attendance)=="Teams.Revenue"] <- "Difference of 1% home attendance increase and home attendance"
colnames(attendance)[colnames(attendance)=="win.to.player.cost.ratio"] <- "Percantage increase"
colnames(attendance)[colnames(attendance)=="Teams.location.median.income"] <- "1% increase of Home game attendance"
#saving new file
write.csv(attendance, "teamAttendance.csv")

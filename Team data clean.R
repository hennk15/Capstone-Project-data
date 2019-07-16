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
#Renaming data frame variables
colnames(attendance)[colnames(attendance)=="Teams.Revenue"] <- "Difference of 1% home attendance increase and home attendance"
colnames(attendance)[colnames(attendance)=="win.to.player.cost.ratio"] <- "Percantage increase"
colnames(attendance)[colnames(attendance)=="Teams.location.median.income"] <- "1% increase of Home game attendance"

#Loading packages
library(dplyr)
library(tidyr)
#Opening file directory
setwd("C:/Users/Henry.Nketeh/Desktop")
#Opening specific file and assign it to a variable 
refine_original <- read.csv("PlayerRating.csv")
#Renaming file variable to be more project-oriented 
PlayerR <- refine_original 
#Renaming data frame variables
colnames(PlayerR)[colnames(PlayerR)=="X4545"] <- "MPG"
colnames(PlayerR)[colnames(PlayerR)=="X"] <- "FGA"
colnames(PlayerR)[colnames(PlayerR)=="X.1"] <- "FGM"
colnames(PlayerR)[colnames(PlayerR)=="X1"] <- "Number"
#Removing columns from the dataframe 
PlayerR$MPG <- NULL
PlayerR$FGA <- NULL
PlayerR$FGM <- NULL
#overwritting and saving new file
write.csv(PlayerR, "CleanPLAYERR.csv")


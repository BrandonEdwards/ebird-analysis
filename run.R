#####################################
# Brandon Edwards
# ebird-analysis
# run.R
# Created December 2017
# Last Updated December 2017
#####################################

#####################################
# Clear Memory
#####################################

remove(list = ls())

#####################################
# Set Constants
#####################################

analysisYear <- 2017

#####################################
# Import Libraries and Files
#####################################

#####################################
# Read Data
#####################################

data <- read.csv("MyEBirdData.csv")

# Add Month and Year field
data$Month <- substr(data$Date,0,2)
data$Year <- substr(data$Date,7,10)

# Replace NA with 0
data[is.na(data)] <- 0


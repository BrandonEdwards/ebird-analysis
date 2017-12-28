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
inputFile <- "MyEBirdData.csv"

#####################################
# Import Libraries and Files
#####################################

source("src/effort-functions.R")

#####################################
# Read Data
#####################################

data <- read.csv(inputFile)

# Add Month and Year field
data$Month <- substr(data$Date,0,2)
data$Year <- substr(data$Date,7,10)

# Replace NA with 0
data[is.na(data)] <- 0

numChecklists <- getNumChecklists(data)


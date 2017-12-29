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

# install.packages("ggplot2")
# install.packages("reshape")

library(ggplot2)
library(reshape)

source("src/effort-functions.R")
source("src/plot-recipes.R")

#####################################
# Read Data
#####################################

data <- read.csv(inputFile)

# Add Day, Month, and Year field
data$Day <- substr(data$Date, 4, 5)
data$Month <- substr(data$Date, 0, 2)
data$Year <- substr(data$Date, 7, 10)

# Replace NA with 0
data[is.na(data)] <- 0

#####################################
# Analyze Effort Data
#####################################

# Yearly checklists
p <- plotYearlyNumChecklists(getNumYearlyChecklists(data))
  
png("yearlyNumChecklists.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

# Monthly Checklists for 2017
p <- plotMonthlyNumChecklists(getNumMonthlyChecklists(data, analysisYear), analysisYear)

png("monthlyNumChecklists.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()
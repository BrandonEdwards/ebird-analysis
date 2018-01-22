#####################################
# Brandon Edwards
# ebird-analysis
# generate-plots.R
# Created December 2017
# Last Updated January 2018
#####################################

#####################################
# Clear Memory
#####################################

remove(list = ls())

#####################################
# Set Constants
#####################################

analysisYear <- 2018
inputFile <- "MyEBirdData.csv"

#####################################
# Import Libraries and Files
#####################################

# install.packages("ggplot2")
# install.packages("reshape")
# install.packages("stringr")

library(ggplot2)
library(reshape)
library(stringr)

source("src/plot/effort-functions.R")
source("src/plot/location-functions.R")
source("src/plot/plot-recipes.R")
source("src/plot/total-birds-functions.R")
source("src/plot/life-birds-functions.R")
source("src/helper.R")

#####################################
# Create Output Directories
#####################################

dir.create("output")
dir.create("output/effort")
dir.create("output/life")
dir.create("output/location")
dir.create("output/total")

#####################################
# Read Data
#####################################

data <- read.csv(inputFile)

# Add Day, Month, and Year field
data$Day <- substr(data$Date, 4, 5)
data$Month <- substr(data$Date, 0, 2)
data$Year <- substr(data$Date, 7, 10)

# Change date format
data$Date <- as.Date(paste(data$Year, "-", data$Month, "-", data$Day, sep=""))

# Replace NA with 0
data[is.na(data)] <- 0

#####################################
# Analyze Effort Data
#####################################

# Yearly checklists
p <- plotYearlyNumChecklists(getNumYearlyChecklists(data))
png("output/effort/yearlyNumChecklists.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

# Monthly Checklists for 2017
p <- plotMonthlyNumChecklists(getNumMonthlyChecklists(data, analysisYear), analysisYear)
png("output/effort/monthlyNumChecklists.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

# Cumulative Checklists for 2017
p <- plotCumulativeChecklists(getCumulativeChecklists(data, analysisYear), analysisYear)
png("output/effort/monthlyCumulativeChecklists.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

#####################################
# Analyze Location Data
#####################################

# Total Yearly Counties
p <- plotYearlyNumCounties(getYearlyTotalCounties(data))
png("output/location/yearlyNumCounties.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

# Top 10 Counties
p <- plotTopTenCounties(getTopTenCounties(data, analysisYear), analysisYear)
png("output/location/topTenCounties.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

#####################################
# Analyze Total Species Data
#####################################

#From here on in, we will want data only at the species level
data.sp <- removeNonSpecies(data)

# Total Yearly Species
p <- plotYearlyTotalSpecies(getNumYearlySpecies(data.sp))
png("output/total/yearlyNumSpecies.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

# Total Monthly Species
p <- plotMonthlyTotalSpecies(getNumMonthlySpecies(data.sp, analysisYear), analysisYear)
png("output/total/monthlyNumSpecies.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

# Cumulative Year Species
p <- plotCumulativeYearSpecies(getCumulativeSpecies(data.sp, analysisYear), analysisYear)
png("output/total/cumulativeSpecies.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

#####################################
# Analyze Life Birds Data
#####################################

# Cumulative Life Species
p <- plotCumulativeLifeSpecies(getCumulativeLifeSpecies(data.sp, analysisYear), analysisYear)
png("output/life/cumulativeLifeSpecies.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

#Yearly Life Species
p <- plotYearlyLifeSpecies(getYearlyLifeSpecies(data.sp))
png("output/life/yearlyLifeSpecies.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()

#Yearly Available Life Species
p <- plotYearlyAvailableLifeSpecies(getYearlyAvailableLifeSpecies(data.sp))
png("output/life/yearlyAvailableLifeSpecies.png", width = 10.5, height = 4, units = "in", res = 300)
print(p)
dev.off()
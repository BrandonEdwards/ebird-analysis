#####################################
# Brandon Edwards
# ebird-analysis
# generate-winter-lists.R
# Created January 2018
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

source("src/helper.R")

#####################################
# Create Output Directories
#####################################

dir.create("output")
dir.create("output/winter-lists")

#####################################
# Read Data
#####################################

data <- read.csv(inputFile)

# Fix some date issues and deal with NAs
data <- cleanData(data)

# Remove non-species data
data <- removeNonSpecies(data)

#####################################
# Create and Output Winter Lists
#####################################

years <- as.numeric(sort(unique(data$Year)))

for (year in years)
{
  # Create empty data frame
 # winterList <- data.frame(Species = character(),
#                           Date = character(),
#                           Location = character(),
#                           stringsAsFactors = FALSE)
  
  winterObs <- data.frame()
  for (month in c("12", "01", "02"))
  {
    if (month == "12")
    {
      temp <- data[ which(data$Year == (year - 1)), ]
    }
    else
    {
      temp <- data[ which(data$Year == year), ]
    }
    
    winterObs <- rbind(winterObs, temp[ which(temp$Month == month), ])
  }
  
  winterList <- as.data.frame(unique(winterObs$Scientific.Name))
  write.table(winterList, paste("output/winter-lists/", year - 1, "-", year, ".csv", sep=""), row.names = FALSE, col.names = FALSE)
  
}



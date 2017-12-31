#####################################
# Brandon Edwards
# ebird-analysis
# src/total-birds-functions.R
# Created December 2017
# Last Updated December 2017
#####################################

getCumulativeSpecies <- function(data, analysisYear)
{
  data <- data[ which(data$Year == analysisYear), ]
  
  dates <- seq(as.Date(paste(analysisYear, "-01-01", sep = "")), as.Date(paste(analysisYear, "-12-31", sep = "")), by="+1 day")
  totalSpecies <- NULL
  yearTickedSpecies <- NULL
  prevTotal <- 0
  
  for (date in dates)
  {
    temp <- data[ which(data$Date == date), ]
    
    dayTickedSpecies <- unique(temp$Scientific.Name)
    
    for (sp in dayTickedSpecies)
    {
      if ((sp %in% yearTickedSpecies) == FALSE)
      {
        yearTickedSpecies <- c(yearTickedSpecies, sp)
        prevTotal <- prevTotal + 1
      }
    }
    
    totalSpecies <- c(totalSpecies, prevTotal)
  }
  
  cumulative <- data.frame(cbind(as.Date(dates), totalSpecies))
  names(cumulative) <- c("Date", "Total")
  
  cumulative$Date <- factor(cumulative$Date, as.Date(dates))
  
  return(cumulative)
}

getNumYearlySpecies <- function(data)
{
  years <- sort(unique(data$Year))
  totalSpecies <- NULL
  
  for (year in years)
  {
    temp <- data[ which(data$Year == year), ]
    totalSpecies <- c(totalSpecies, length(unique(temp$Scientific.Name)))
  }
  
  numSpecies <- data.frame(cbind(years, totalSpecies))
  names(numSpecies) <- c("Year", "Total")
  
  numSpecies$Year <- factor(numSpecies$Year, as.character(years))
  numSpecies$Total <- as.numeric(as.character(numSpecies$Total))
  
  return(numSpecies)
}

getNumMonthlySpecies <- function(data, analysisYear)
{
  data <- data[ which(data$Year == analysisYear), ]
  
  months <- sort(unique(data$Month))
  totalSpecies <- NULL
  
  for (month in months)
  {
    temp <- data[ which(data$Month == month), ]
    totalSpecies <- c(totalSpecies, length(unique(temp$Scientific.Name)))
  }
  
  numSpecies <- data.frame(cbind(month.abb[as.numeric(months)], totalSpecies))
  names(numSpecies) <- c("Month", "Total")
  
  numSpecies$Month <- factor(numSpecies$Month, as.character(month.abb[as.numeric(months)]))
  numSpecies$Total <- as.numeric(as.character(numSpecies$Total))
  
  return(numSpecies)
}
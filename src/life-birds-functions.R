#####################################
# Brandon Edwards
# ebird-analysis
# src/life-birds-functions.R
# Created December 2017
# Last Updated December 2017
#####################################

getCumulativeLifeSpecies <- function(data, analysisYear)
{
  dates <- seq(as.Date(paste(sort(unique(data$Year))[1], "-01-01", sep = "")), as.Date(paste(analysisYear, "-12-31", sep = "")), by="+1 day")
  totalSpecies <- NULL
  lifeTickedSpecies <- NULL
  prevTotal <- 0
  
  for (date in dates)
  {
    temp <- data[ which(data$Date == date), ]
    
    dayTicked <- unique(temp$Scientific.Name)
    
    for (sp in dayTicked)
    {
      if ((sp %in% lifeTickedSpecies) == FALSE)
      {
        lifeTickedSpecies <- c(lifeTickedSpecies, sp)
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

getYearlyLifeSpecies <- function(data)
{
  years <- sort(unique(data$Year))
  totalSpecies <- NULL
  lifeTickedSpecies <- NULL
  
  for (year in years)
  {
    temp <- data[ which(data$Year == year), ]
    yearTicked <- unique(temp$Scientific.Name)
    yearTotal <- 0
    
    for (sp in yearTicked)
    {
      if ((sp %in% lifeTickedSpecies) == FALSE)
      {
        lifeTickedSpecies <- c(lifeTickedSpecies, sp)
        yearTotal <- yearTotal + 1
      }
    }
    
    totalSpecies <- c(totalSpecies, yearTotal)
  }
  
  numSpecies <- data.frame(cbind(years, totalSpecies))
  names(numSpecies) <- c("Year", "Total")
  
  numSpecies$Year <- factor(numSpecies$Year, as.character(years))
  numSpecies$Total <- as.numeric(as.character(numSpecies$Total))
  
  return(numSpecies)
}

getYearlyAvailableLifeSpecies <- function(data)
{
  years <- sort(unique(data$Year))
  totalSpecies <- NULL
  lifeTickedSpecies <- NULL
  availableSpecies <- 496
  
  for (year in years)
  {
    temp <- data[ which(data$Year == year), ]
    yearTicked <- unique(temp$Scientific.Name)
    yearTotal <- 0
    
    for (sp in yearTicked)
    {
      if ((sp %in% lifeTickedSpecies) == FALSE)
      {
        lifeTickedSpecies <- c(lifeTickedSpecies, sp)
        yearTotal <- yearTotal + 1
      }
    }
    
    totalSpecies <- c(totalSpecies, round((yearTotal/availableSpecies)*100, digits = 2))
    availableSpecies <- availableSpecies - yearTotal
  }
  
  numSpecies <- data.frame(cbind(years, totalSpecies))
  names(numSpecies) <- c("Year", "Total")
  
  numSpecies$Year <- factor(numSpecies$Year, as.character(years))
  numSpecies$Total <- as.numeric(as.character(numSpecies$Total))
  
  return(numSpecies)
}
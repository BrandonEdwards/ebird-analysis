#####################################
# Brandon Edwards
# ebird-analysis
# src/effort-functions.R
# Created December 2017
# Last Updated December 2017
#####################################

getCumulativeChecklists <- function(data, analysisYear)
{
  data <- data[ which(data$Year == analysisYear), ]
  
  dates <- seq(as.Date("2017-01-01"), as.Date("2017-12-31"), by="+1 day")
  totalChecklists <- NULL
  previousTotal <- 0
  completeChecklists <- NULL
  complete <- 0
  targetChecklists <- seq(from = 1, to = 365, by = 1)
  
  for (date in dates)
  {
    temp <- data[ which(data$Date == date), ]
    previousTotal <- previousTotal + length(unique(temp$Submission.ID))
    totalChecklists <- c(totalChecklists, previousTotal)
    
    for (id in unique(temp$Submission.ID))
    {
      listData <- temp[ which(temp$Submission.ID == id), ]
      if ('X' %in% listData$Count)
      {
        next
      }
      else if (listData$Protocol[1] == "eBird - Casual Observation")
      {
        next
      }
      else if (listData$Protocol[1] == "PriMig - Pri Mig Banding Protocol")
      {
        next
      }
      else
      {
        complete <- complete + 1
      }
    }
    
    completeChecklists <- c(completeChecklists, complete)
  }
  
  numChecklists <- cbind(as.Date(dates), targetChecklists, completeChecklists, totalChecklists)
  numChecklists <- data.frame(numChecklists)
  names(numChecklists) <- c("Date", "Target", "Complete.Checklists", "Total.Checklists")
  
  numChecklists$Date <- factor(numChecklists$Date, as.Date(dates))
  numChecklists <- melt(numChecklists, id.vars = "Date")
  #numChecklists$value <- as.numeric(as.character(numChecklists$value))
  
  return(numChecklists)
  
}

getNumYearlyChecklists <- function(data)
{
  years <- sort(unique(data$Year))
  totalChecklists <- NULL
  completeChecklists <- NULL
  
  for (year in years)
  {
    temp <- data[ which(data$Year == year), ]
    totalChecklists <- c(totalChecklists, length(unique(temp$Submission.ID)))
    
    complete <- 0
    for (id in unique(temp$Submission.ID))
    {
      listData <- temp[ which(temp$Submission.ID == id), ]
      if ('X' %in% listData$Count)
      {
        next
      }
      else if (listData$Protocol[1] == "eBird - Casual Observation")
      {
        next
      }
      else if (listData$Protocol[1] == "PriMig - Pri Mig Banding Protocol")
      {
        next
      }
      else
      {
        complete <- complete + 1
      }
    }
    
    completeChecklists <- c(completeChecklists, complete)
  }
  
  numChecklists <- cbind(years, completeChecklists, totalChecklists)
  numChecklists <- data.frame(numChecklists)
  names(numChecklists) <- c("Year", "Complete.Checklists", "Total.Checklists")
  
  numChecklists$Year <- factor(numChecklists$Year, as.character(years))
  numChecklists <- melt(numChecklists, id.vars = "Year")
  numChecklists$value <- as.numeric(as.character(numChecklists$value))
  
  return(numChecklists)
}

getNumMonthlyChecklists <- function(data, analysisYear)
{
  data <- data[ which(data$Year == analysisYear), ]
  
  months <- sort(unique(data$Month))
  totalChecklists <- NULL
  completeChecklists <- NULL
  
  for (month in months)
  {
    temp <- data[ which(data$Month == month), ]
    totalChecklists <- c(totalChecklists, length(unique(temp$Submission.ID)))
    
    complete <- 0
    for (id in unique(temp$Submission.ID))
    {
      listData <- temp[ which(temp$Submission.ID == id), ]
      if ('X' %in% listData$Count)
      {
        next
      }
      else if (listData$Protocol[1] == "eBird - Casual Observation")
      {
        next
      }
      else if (listData$Protocol[1] == "PriMig - Pri Mig Banding Protocol")
      {
        next
      }
      else
      {
        complete <- complete + 1
      }
    }
    
    completeChecklists <- c(completeChecklists, complete)
  }
  
  numChecklists <- cbind(month.abb[as.numeric(months)], completeChecklists, totalChecklists)
  numChecklists <- data.frame(numChecklists)
  names(numChecklists) <- c("Month", "Complete.Checklists", "Total.Checklists")
  
  numChecklists$Month <- factor(numChecklists$Month, as.character(month.abb[as.numeric(months)]))
  numChecklists <- melt(numChecklists, id.vars = "Month")
  numChecklists$value <- as.numeric(as.character(numChecklists$value))
  
  return(numChecklists)
}
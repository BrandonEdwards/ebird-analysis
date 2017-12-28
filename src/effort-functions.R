#####################################
# Brandon Edwards
# ebird-analysis
# src/effort-functions.R
# Created December 2017
# Last Updated December 2017
#####################################

getNumChecklists <- function(data)
{
  years <- as.numeric(sort(unique(data$Year)))
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
  
  numChecklists <- cbind(years, totalChecklists, completeChecklists)
  numChecklists <- data.frame(numChecklists)
  names(numChecklists) <- c("Year", "Total.Checklists", "Complete.Checklists")
  
  return(numChecklists)
}
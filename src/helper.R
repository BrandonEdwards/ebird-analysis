#####################################
# Brandon Edwards
# ebird-analysis
# src/helper.R
# Created December 2017
# Last Updated December 2017
#####################################

cleanData <- function(data)
{
  # Add Day, Month, and Year field
  data$Day <- substr(data$Date, 4, 5)
  data$Month <- substr(data$Date, 0, 2)
  data$Year <- substr(data$Date, 7, 10)
  
  # Change date format
  data$Date <- as.Date(paste(data$Year, "-", data$Month, "-", data$Day, sep=""))
  
  # Replace NA with 0
  data[is.na(data)] <- 0
  
  return(data)
}

removeNonSpecies <- function(data)
{
  data <- data[ which((word(data$Scientific.Name, -1) == "sp.") == FALSE), ]
  data <- data[ which(str_detect(data$Scientific.Name, "/") == FALSE), ]
  data <- data[ which(str_detect(data$Common.Name, "hybrid") == FALSE), ]
  data <- data[ which(data$Count != 0), ]
  data$Scientific.Name <- word(string = data$Scientific.Name, start = 1, end = 2, sep = fixed(" "))
  
  # Need one more of these for good measure
  data <- data[ which((word(data$Scientific.Name, -1) == "sp.") == FALSE), ]
  
  return(data)
}
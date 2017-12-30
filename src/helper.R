#####################################
# Brandon Edwards
# ebird-analysis
# src/helper.R
# Created December 2017
# Last Updated December 2017
#####################################

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
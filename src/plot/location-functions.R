#####################################
# Brandon Edwards
# ebird-analysis
# src/location-functions.R
# Created December 2017
# Last Updated December 2017
#####################################

getYearlyTotalCounties <- function(data)
{
  years <- sort(unique(data$Year))
  totalCounties <- NULL
  
  for (year in years)
  {
    temp <- data[ which(data$Year == year), ]
    totalCounties <- c(totalCounties, length(unique(temp$County)))
  }
  
  numCounties <- data.frame(cbind(years, totalCounties))
  names(numCounties) <- c("Year", "Total.Counties")
  numCounties$Year <- factor(numCounties$Year, as.character(years))
  numCounties$Total.Counties <- as.numeric(as.character(numCounties$Total.Counties))
  
  return(numCounties)
}

getTopTenCounties <- function(data, analysisYear)
{
  data <- data[ which(data$Year == analysisYear), ]
  data <- removeNonSpecies(data)
  
  counties <- unique(data$County)
  totalSpecies <- NULL
  
  for (county in counties)
  {
    temp <- data[ which(data$County == county), ]
    totalSpecies <- c(totalSpecies, length(unique(temp$Scientific.Name)))
  }
  
  totalCountySpecies <- data.frame(cbind(as.character(counties), totalSpecies))
  names(totalCountySpecies) <- c("County", "Total")
  totalCountySpecies$County <- factor(totalCountySpecies$County, as.character(counties))
  totalCountySpecies$Total <- as.numeric(as.character(totalCountySpecies$Total))
  
  totalCountySpecies <- totalCountySpecies[order(-totalCountySpecies$Total),]
  
  return(totalCountySpecies[1:10,])
}
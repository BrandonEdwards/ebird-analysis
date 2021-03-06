#####################################
# Brandon Edwards
# ebird-analysis
# src/plot-recipes.R
# Created December 2017
# Last Updated December 2017
#####################################

#####################################
# Effort Plots
#####################################
plotCumulativeChecklists <- function(numChecklists, analysisYear)
{
  return(ggplot(numChecklists,
                aes(x = as.Date(Date), value)) + 
           geom_line(aes(group = variable, colour = variable), size = 1) +
           scale_x_date(date_breaks = "1 month",
                        date_labels = "%b") +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = paste("Cumulative Checklists: ", analysisYear), x = "Month", y = "Number of Checklists") +
           scale_color_manual(name = "Checklist Type", 
                              values=c("#000000", "#E69F00", "#56B4E9"), 
                              labels = c("Target", "Complete", "Total")))
}

plotYearlyNumChecklists <- function(numChecklists)
{
  return(ggplot(numChecklists, 
                aes(Year, value)) +
           geom_bar(stat = "identity", 
                    aes(fill = variable), 
                    position = "dodge") +
           geom_text(aes(label = value, group = variable), 
                     position = position_dodge(0.9),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = "Total Checklists by Year", x = "Year", y = "Number of Checklists") +
           scale_fill_manual(name = "Checklist Type", values=c("#E69F00", "#56B4E9"), labels = c("Complete", "Total")))
}

plotMonthlyNumChecklists <- function(numChecklists, analysisYear)
{
  return(ggplot(numChecklists, 
                aes(Month, value)) +
           geom_bar(stat = "identity", 
                    aes(fill = variable), 
                    position = "dodge") +
           geom_text(aes(label = value, group = variable), 
                     position = position_dodge(0.9),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = paste("Total Checklists by Month: ", analysisYear), x = "Month", y = "Number of Checklists") +
           scale_fill_manual(name = "Checklist Type", values=c("#E69F00", "#56B4E9"), labels = c("Complete", "Total")))
}

#####################################
# Location Plots
#####################################

plotYearlyNumCounties <- function(numCounties)
{
  return(ggplot(numCounties, 
                aes(Year, Total.Counties)) +
           geom_bar(stat = "identity", fill = "#56B4E9") +
           geom_text(aes(label = Total.Counties),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = "Total Counties Birded by Year", x = "Year", y = "Number of Counties"))  
}

plotTopTenCounties <- function(topTen, analysisYear)
{
  return(ggplot(topTen, 
                aes(County, Total)) +
           geom_bar(stat = "identity", fill = "#56B4E9") +
           geom_text(aes(label = Total),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = paste("Top 10 Counties: ", analysisYear), x = "County", y = "Total Species"))    
}

#####################################
# Total Birds Plots
#####################################

plotCumulativeYearSpecies <- function(numSpecies, analysisYear)
{
  return(ggplot(numSpecies,
                aes(x = as.Date(Date), Total)) + 
           geom_line(size = 1, colour = "#56B4E9") +
           scale_x_date(date_breaks = "1 month",
                        date_labels = "%b") +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = paste("Cumulative Species: ", analysisYear), x = "Month", y = "Number of Species") +
           scale_color_manual(name = "Checklist Type", 
                              values=c("#56B4E9"), 
                              labels = c("Total")))
}

plotYearlyTotalSpecies <- function(numSpecies)
{
  return(ggplot(numSpecies, 
                aes(Year, Total)) +
           geom_bar(stat = "identity", fill = "#56B4E9") +
           geom_text(aes(label = Total),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = "Total Species by Year", x = "Year", y = "Number of Species"))  
}

plotMonthlyTotalSpecies <- function(numSpecies, analysisYear)
{
  return(ggplot(numSpecies, 
                aes(Month, Total)) +
           geom_bar(stat = "identity", fill = "#56B4E9") +
           geom_text(aes(label = Total),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = paste("Total Species by Month: ", analysisYear), x = "Month", y = "Number of Species"))  
}

#####################################
# Life Birds Plots
#####################################

plotCumulativeLifeSpecies <- function(numSpecies, analysisYear)
{
  return(ggplot(numSpecies,
                aes(x = as.Date(Date), Total)) + 
           geom_line(size = 1, colour = "#56B4E9") +
           scale_x_date(date_breaks = "1 year",
                        date_labels = "%Y") +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = paste("Cumulative Life Species: ", analysisYear), x = "Year", y = "Number of Species") +
           scale_color_manual(name = "Checklist Type", 
                              values=c("#56B4E9"), 
                              labels = c("Total")))
}

plotYearlyLifeSpecies <- function(numSpecies)
{
  return(ggplot(numSpecies, 
                aes(Year, Total)) +
           geom_bar(stat = "identity", fill = "#56B4E9") +
           geom_text(aes(label = Total),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = "Life Bird Additions by Year", x = "Year", y = "Number of Species"))  
}

plotYearlyAvailableLifeSpecies <- function(numSpecies)
{
  return(ggplot(numSpecies, 
                aes(Year, Total)) +
           geom_bar(stat = "identity", fill = "#56B4E9") +
           geom_text(aes(label = Total),
                     vjust = -0.1) +
           theme(plot.title = element_text(size = 20), 
                 axis.title = element_text(size = 15),
                 axis.text = element_text(size = 12), 
                 legend.title = element_text(size = 15), 
                 legend.text = element_text(size = 12), 
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(), 
                 panel.background = element_blank(), 
                 axis.line = element_line(colour = "black")) +
           labs(title = "% Yearly Life Birds of Available Birds: Ontario", x = "Year", y = "% Life Birds from Available"))  
}

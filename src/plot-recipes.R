#####################################
# Brandon Edwards
# ebird-analysis
# src/plot-recipes.R
# Created December 2017
# Last Updated December 2017
#####################################

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
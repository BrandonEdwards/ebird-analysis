#####################################
# Brandon Edwards
# ebird-analysis
# src/plot-recipes.R
# Created December 2017
# Last Updated December 2017
#####################################

plotNumChecklists <- function(numChecklists)
{
  return(ggplot() + 
    theme(plot.title = element_text(size = 30, face = "bold"), 
          axis.title = element_text(size = 20),
          axis.text = element_text(size = 18), 
          legend.title = element_text(size = 20), 
          legend.text = element_text(size = 18), 
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(), 
          panel.background = element_blank(), 
          axis.line = element_line(colour = "black")) + 
    labs(title = "Total Checklists by Year", x = "Year", y = "Checklists") +
    geom_bar(data = melt(numChecklists,id.vars="Year"), 
             aes(x=Year, y=value, fill=variable), 
             stat = "identity",
             position = "dodge",
             size = 1.5) + 
    scale_fill_manual(labels=c("Total","Complete"),name=NULL, values = c("blue", "orange")))
}
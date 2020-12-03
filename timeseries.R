#Then download and load the ggiraph package for interactive graphs
library(devtools)
# devtools::install_github('davidgohel/ggiraph')
library(ggiraph)

##########################################################

#Data can be found in the following link
#https://data.giss.nasa.gov/gistemp/
#(Look for ‘Global Mean Estimates Based on Land-Surface Air Temperature Anomalies Only’ then ‘Global-mean monthly, seasonal, and annual means’

land <- read.csv(file = "GLB.Ts.csv")
land
land[2:19] <- NULL
land
#########################Interactive plot############################

#ggiraph:  ggiraph package can be used to make ggplots interactive

gg <- ggplot(data = land,
             aes(Year, Median, colour = Median, tooltip = Median, data_id = Median)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(y = "Median land temperature anomaly (relative to 1961-1990)") +
  scale_x_continuous(breaks = c(1880, 1890, 1900, 1910, 1920,
                                1930, 1940, 1950, 1960, 1970,
                                1980, 1990, 2000, 2010)) +
  scale_y_continuous(breaks = c(-0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1, 1.2)) +
  theme(legend.position="none") +
  geom_line_interactive(size = .75)
ggiraph(code = {print(gg)}, hover_css = "stroke:red;")


#Note: Here, the argument geom_line_interactive() will generate the interactive plot, and
#defining the hover_css = "" you can choose the colour.
###################################################################

library(tidyverse)
library(plotly)
#merge the land and sea surface temperature datasets.
combined <- merge(data, land, by = "Year")
names(combined) <- c("Year", "Sea", "Land")
#Notice that the columns are renamed.
View(combined)

##############build ggplot graph###################

p <-ggplot(data = combined, aes(x = Year)) +
  geom_line(aes(y = Sea, colour = "Sea"), size = 1) +
  geom_line(aes(y = Land, colour = "Land"), size = 1) +
  scale_colour_manual("",
                      breaks = c("Land", "Sea"),
                      values = c("darkgreen", "blue")) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  labs(y = "Median sea & land temperature anomaly (relative to 1961-1990)") +
  scale_x_continuous(breaks = c(1880, 1890, 1900, 1910, 1920,
                                1930, 1940, 1950, 1960, 1970,
                                1980, 1990, 2000, 2010, 2018)) +
  scale_y_continuous(breaks = c(-0.8, -0.6, -0.4, -0.2, 0, 0.2,
                                0.4, 0.6, 0.8, 1, 1.2)) +
  theme(panel.background = element_rect(fill = "ivory2")) +
  theme(plot.background = element_rect(fill = "ivory2"))
p

############################################################

ggplotly(p)

##########googleVis library###################
library(googleVis)
line <- gvisLineChart(combined, options = list(title = "Global Temperature Time Series"))
plot(line)


#####to save #########

print(line, file = "plot.htm")
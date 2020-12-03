#Then download and load the ggiraph package for interactive graphs
library(devtools)
devtools::install_github('davidgohel/ggiraph')
library(ggiraph)

##########################################################

#Data can be found in the following link
#https://data.giss.nasa.gov/gistemp/
#(Look for ‘Global Mean Estimates Based on Land-Surface Air Temperature Anomalies Only’ then ‘Global-mean monthly, seasonal, and annual means’

setwd('.datasets/')

land <- read.csv(file = "GLB.Ts.csv")
land
land[2:19] <- NULL
land
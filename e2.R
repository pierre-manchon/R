library(rgdal)
library(leaflet)
library(raster)
library(mapview)

myspdf2 = readOGR(dsn=getwd(), layer='communes-20190101')
new_co <- subset(myspdf2, myspdf2$insee %in% c(""))

leaflet(new_co) %>%
  addPolygons(color = "red",
              weight = 1,
              smoothFactor = 0.5,
              opacity = 1.0,
              fillOpacity = 0.5,
              fillColor = "red",
              highlightOptions = highlightOptions(color = "white",
                                                  weight = 2,
                                                  bringToFront = TRUE))

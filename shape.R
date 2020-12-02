################ spplot
setwd("/cloud/project/TP2/countries_shp")
getwd()
library(raster)
library(rgeos)

#https://cran.r-project.org/web/packages/maptools/maptools.pdf
library(maptools)

########## how to deal with shape filesusing maptools library ###################

##############read shape file in dataframe l using readShapePoly######################


#####   readShapePoly: Read Polygon Shape Files Into SpatialPolygonsDataFrame Objects
######https://www.rdocumentation.org/packages/maptools/versions/1.0-2/topics/readShapePoly
l=readShapePoly("laos-eco1.shp")

plot(l)
names(l) 
summary(l)
#here we subset a part of shapefile on a base of a certain attribute specify the name of shape file dollar sign then the attribute 
part = l[l$ECO_CODE == "IM0202",]



plot(part)
#show axes(long , lat)  color and name 
plot(l,axes=TRUE, col="green",main="Laos Ecoregions")

plot(l,axes=TRUE, col="red",border="blue")
title(main="Laos Ecoregions")

###use spplot for plotting numerical Attribute- AREA
# needs sp package (imported alongside raster)
spplot(l, "AREA", main = "Area of Different Ecoregions", sub = "Average Area", col = "transparent")

#color palette

library(RColorBrewer)
display.brewer.all()

my.palette <- brewer.pal(n = 8, name = "Blues") #color selection no.8 #of blues
spplot(l, "AREA", col.regions = my.palette, cuts = 6, col = "transparent") #6 shades of blue

#display quantiles for color breaks
library(classInt)
my.palette2 <- brewer.pal(n = 8, name = "YlOrRd")

breaks.qt <- classIntervals(l$AREA, n = 6, style = "quantile", intervalClosure = "right")

spplot(l, "AREA", col = "transparent", col.regions = my.palette2, 
       at = breaks.qt$brks)

#Country mapping
world=readShapePoly("countries.shp")
library(RColorBrewer)
world$UNREG1 <- as.factor(iconv(as.character(world$UNREG1), "latin1", "UTF-8"))  # avoid the problems with 'tildes' 

spplot(world, "UNREG1",main="World Poltical Boundaries", col.regions = colorRampPalette(brewer.pal(12, "Set3"))(18), 
       col = "white")  # Plot the 'unreg1' form the 'world' object.

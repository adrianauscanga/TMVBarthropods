### This scrips measures the aproximate habitat area for each 
### sampled mountain, based on elevation.

## Load needed libraries
library(raster)
library(dplyr)
library(dismo)

## Source function previously used in Mastretta-Yanes et al. Mol. Ecol. (2018)
## to reclassify elevation map
source("reclassElev4circuit.R")

## Path to elevation raster 
## (available at https://doi.org/10.5061/dryad.f7248 download it
## and save it at the spatial directory of this repository.
inraster<-"spatial/alt_tmvb.asc"

## Get sampled mountains points for reference
points.info<-read.delim("spatial/surveyed_mountains.tsv")
points.info<-points.info[c(5,8,10,12, 13:15),]
points.info

## Reclassify elevation raster to desired min altitudes

# above 3100
reclassElev4circuit(inraster, minElev=3100, 
                    outraster="spatial/alt3100.asc", NotS=0.1)

# above 3200
reclassElev4circuit(inraster, minElev=3200, 
                    outraster="spatial/alt3200.asc", NotS=0.1)

# load data
alt3100<-raster("spatial/alt3100.asc")
alt3200<-raster("spatial/alt3200.asc")

## Plot to check buffer size

for(i in c("alt3100", "alt3200")){
  plot(get(i), main=i, legend=FALSE)
  points(points.info[,5:6], pch=19, cex=.05)
  buff<-circles(points.info[,5:6], d=20000, lonlat=TRUE)
  plot(polygons(buff), add=TRUE)
}

# estimate suitable area
suit.area<-data.frame(Pop=points.info[,3])
for(i in c("alt3100", "alt3200")){
  # extract in buffer
  buf.count <- extract(x = get(i), 
                       y = points.info[,5:6], 
                       buffer=20000,
                       df=TRUE)
  buf.count<-as.data.frame(buf.count)
  buf.count$ID<-as.factor(buf.count$ID)
  names(buf.count)[2]<-"layer"
  # count suitable pixels
  sumarea<-mutate(buf.count, layer=replace(layer, layer<1, 0))  %>%
    group_by(., ID) %>%
    summarise(., i=sum(layer, na.rm=TRUE))
  names(sumarea)<-c("ID", i)  
  suit.area<-cbind(suit.area, sumarea[,2]) 
}

suit.area

# >3100 area
sum(suit.area[1:3,2]) # east 
sum(suit.area[4:7,2]) # west

# >3200 area
sum(suit.area[1:3,3]) # east
sum(suit.area[4:7,3]) # west

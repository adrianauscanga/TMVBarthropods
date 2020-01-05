rm(list = ls())

########### Get data  ###############
# Source functions
source("read.effdist.R")

# For reference, get Population ID codes as used for Circuitscape and Map plotting
points.info<-read.delim("spatial/surveyed_mountains.tsv")
points.info
points.infoxy<-as.matrix(points.info[,c(5,6)], longlat=TRUE)

# get focal points
focpoints<-read.delim("spatial/arthropod_focal_points.txt", header=FALSE)

# get info of focal points
x<-points.info$ID %in% focpoints[,1] 
focpoints<- points.info[x,] 

# get PopNames in order of focal points
popNamesFP<-as.vector(focpoints$Key)
popNamesFP

# create vector with desired order (West to East:
popNames=c("An", "Bl", "To", "Aj", "Iz", "Ma", "Pe")


####### Get effective distance matrix for each raster ########
for(i in c("flat","2300", "3000", "3300", "4000")) {
  
  ## define resistances.out files
  resfile <- paste0("spatial/arthropods_", i, "_resistances")
  
  ### Get effective distances
  eff.dist<-read.effdist(file=resfile, popNames=popNamesFP, des.order=popNames)
  
  ### Print output
  print(paste("effective distances for", i))
  print(eff.dist)
}    

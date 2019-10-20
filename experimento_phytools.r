library(phytools)

## arbol
arbol<-Tgmyc$tree


plot(Tgmyc$tree)
nodelabels(frame="none")
x<-plot(Tgmyc$tree)
x$x.lim
x$y.lim
obj<-get("last_plot.phylo",envir=.PlotPhyloEnv)
obj$yy

lines(x=c(0.985,0.985),y=c(29,28.5),lwd=2, col="green")

tree<-arbol

d<-getDescendants(tree,node)
d<-sort(d[d<=Ntip(tree)])



deg<-atan(obj$yy[d]/obj$xx[d])*180/pi
ii<-intersect(which(obj$yy[d]>=0),which(obj$xx[d]<0))
deg[ii]<-180+deg[ii]
ii<-intersect(which(obj$yy[d]<0),which(obj$xx[d]<0))
deg[ii]<-180+deg[ii]
ii<-intersect(which(obj$yy[d]<0),which(obj$xx[d]>=0))
deg[ii]<-360+deg[ii]





draw.arc(x=0,y=0,radius=ln.offset*h,deg1=min(deg),
         deg2=max(deg))
x0<-lab.offset*cos(median(deg)*pi/180)*h
y0<-lab.offset*sin(median(deg)*pi/180)*h
text(x=x0,y=y0,label=text,
     adj=c(if(x0>=0) 0 else 1,if(y0>=0) 0 else 1),
     offset=0)



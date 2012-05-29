bilingualsize=c(100,200,400,800,1600,3200,6400,12800,25600,35027)

bifeats=c(2.34,2.56,2.62,2.50,2.78,3.82,4.34,5.51,6.82,7.41)
bimonofeats=c(2.16,2.57,2.50,2.50,2.92,3.72,4.58,5.11,5.92,6.42)
dictmonofeats=c(5.92,5.92,5.92,5.92,5.92,5.92,5.92,5.92,5.92,5.92)
bidictmono_bimonofeats=c(9.45,9.45,9.45,9.45,9.45,9.45,9.45,9.45,9.45,9.45)
hiero=c(9.81,9.81,9.81,9.81,9.81,9.81,9.81,9.81,9.81,9.81)
samt=c(9.85,9.85,9.85,9.85,9.85,9.85,9.85,9.85,9.85,9.85)


#add line for bilingual scoring, varying amounts of training data: standard squares
c=plot(bilingualsize,bifeats,xlab="",ylab="",main="Tamil -> English Translation", col="darkgreen",pch=15,cex=2.5, ylim=c(0,11), xaxt="n", yaxt="n")
lines(bilingualsize,bifeats,col="darkgreen",cex=3)
title(xlab="Training data sentences",cex.lab=1.5)
title(ylab="BLEU score",cex.lab=1.5)
axis(1,cex.axis=1.5)
axis(2,cex.axis=1.5)


#add line for bilingual+monolingual scoring, varying amounts of parallel training data: new circles
points(bilingualsize,bimonofeats,col="blue",pch=16,cex=2.5)
lines(bilingualsize,bimonofeats,col="blue",cex=3.0)

# add point for using dictionary + monolingual scoring only: new circles
points(c(0.0),c(5.92),col="orange",pch=16,cex=2.5)
lines(bilingualsize,dictmonofeats,col="orange",cex=3.0)

# add point for using bilingual training text + dictionaries + oov mining, monolingual scoring + bilingual scoring: new circles
points(c(35027),c(9.45),col="red",pch=16,cex=2.5)
lines(bilingualsize,bidictmono_bimonofeats,col="red",cex=3.0)

# add point for hiero: standard squares
points(c(35027),c(9.81),col="purple",pch=15,cex=2.5)
lines(bilingualsize,hiero,col="purple",cex=3.0)

# add point for SAMT: standard squares
points(c(35027),c(9.85),col="hotpink",pch=15,cex=2.5)
lines(bilingualsize,samt,col="hotpink",cex=3.0)

#add legend to plot
mylines=c("PT:bi+mono+oov, Score:bi+mono","SAMT","Hiero","PT:bi, Score:bi+mono","Standard bilingual phrase-based","PT: Dict+oov, Score: mono")
mycols=c("red","hotpink","purple","blue","darkgreen","orange")
mypoints=c(16,15,15,16,15,16)
legend(15000,4.5,mylines, cex=1.1, col=mycols,pch=mypoints)
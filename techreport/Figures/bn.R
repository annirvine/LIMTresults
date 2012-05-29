bilingualsize=c(100,200,400,800,1600,3200,6400,12800,20788)

bifeats=c(2.02,2.33,3.00,3.23,3.93,5.48,6.51,9.41,11.19)
bimonofeats=c(2.07,1.67,2.99,3.3,3.95,5.61,7.35,9.95,11.88)
dictmonofeats=c(7.51,7.51,7.51,7.51,7.51,7.51,7.51,7.51,7.51)
bidictmono_bimonofeats=c(15.38,15.38,15.38,15.38,15.38,15.38,15.38,15.38,15.38)
hiero=c(12.72,12.72,12.72,12.72,12.72,12.72,12.72,12.72,12.72)
samt=c(13.53,13.53,13.53,13.53,13.53,13.53,13.53,13.53,13.53)

#add line for bilingual scoring, varying amounts of training data: standard squares
c=plot(bilingualsize,bifeats,xlab="",ylab="",main="Bengali -> English Translation", col="darkgreen",pch=15,cex=2.5, ylim=c(0,16), xaxt="n", yaxt="n")
lines(bilingualsize,bifeats,col="darkgreen",cex=3)
title(xlab="Training data sentences",cex.lab=1.5)
title(ylab="BLEU score",cex.lab=1.5)
axis(1,cex.axis=1.5)
axis(2,cex.axis=1.5)


#add line for bilingual+monolingual scoring, varying amounts of parallel training data: new circles
points(bilingualsize,bimonofeats,col="blue",pch=16,cex=2.5)
lines(bilingualsize,bimonofeats,col="blue",cex=3.0)

# add point for using dictionary + monolingual scoring only: new circles
points(c(0.0),c(7.51),col="orange",pch=16,cex=2.5)
lines(bilingualsize,dictmonofeats,col="orange",cex=3.0)

# add point for using bilingual training text + dictionaries + oov mining, monolingual scoring + bilingual scoring: new circles
points(c(20788),c(15.38),col="red",pch=16,cex=2.5)
lines(bilingualsize,bidictmono_bimonofeats,col="red",cex=3.0)

# add point for hiero: standard squares
points(c(20788),c(12.72),col="purple",pch=15,cex=2.5)
lines(bilingualsize,hiero,col="purple",cex=3.0)

# add point for SAMT: standard squares
points(c(20788),c(13.53),col="hotpink",pch=15,cex=2.5)
lines(bilingualsize,samt,col="hotpink",cex=3.0)

#add legend to plot
mylines=c("PT:bi+mono+oov, Score:bi+mono","SAMT","Hiero","PT:bi, Score:bi+mono","Standard bilingual phrase-based","PT: Dict+oov, Score: mono")
mycols=c("red","hotpink","purple","blue","darkgreen","orange")
mypoints=c(16,15,15,16,15,16)
legend(7500,6,mylines, cex=1.1, col=mycols,pch=mypoints)
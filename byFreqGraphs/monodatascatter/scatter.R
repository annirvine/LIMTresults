languages=c("Azeri","Bulgarian","Bengali","Bosnian","Welsh","Hindi","Indonesian","Latvian","Nepali","Polish","Romanian","Slovak","Somali","Albanian","Serbian","Tamil","Turkish","Ukrainian","Uzbek")#,"Spanish","Farsi","Russian","Urdu")
#in millions of tokens
monocrawl=c(.124,30.5,4,7.4,3.9,42.1,3.8,35.1,.127,7.8,2.9,109,.451,3.3,5.7,.189,9.1,15.2,.627)#,783,698,1500,285)
logmonocrawl=log(monocrawl)

top_10_at_f100=c(15,3.17,.24,14.5,11.67,0.33,15.5,16,3,13,31,17.5,21.5,26,20,0.1,12.2,0.8,23.5)

c=plot(monocrawl,top_10_at_f100,log="x",xlab="",ylab="",main="Monolingual Data vs. Lexicon Induction Performance", col="darkgreen",pch=15,cex=0, ylim=c(0,35), xlim=c(0.05,150), xaxt="n", yaxt="n")
text(monocrawl,top_10_at_f100,languages,cex=1.2,col="darkgreen")
title(xlab="Millions of Web Crawled Word Tokens",cex.lab=1.5)
title(ylab="Accuracy in top-10, word frequency 100",cex.lab=1.5)
axis(1,cex.axis=1.0)
axis(2,cex.axis=1.0)


#add legend to plot
#mylines=c("PT:bi+mono+oov, Score:bi+mono","SAMT","Hiero","PT:bi, Score:bi+mono","Standard bilingual phrase-based","PT: Dict+oov, Score: mono")
#mycols=c("red","hotpink","purple","blue","darkgreen","orange")
#mypoints=c(16,15,15,16,15,16)
#legend(15000,4.5,mylines, cex=1.1, col=mycols,pch=mypoints)
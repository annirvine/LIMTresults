from __future__ import division
import codecs
import sys

if len(sys.argv)!=2:
    print "Usage: %s output-file-name" % sys.argv[0]
    exit()

outfile=codecs.open(sys.argv[1],'w','utf-8')

langs=["az","bg","bn","bs","cy","hi","id","lv","ne","pl","ro","sk","so","sq","sr","ta","tr","uk","uz","fa"]

outfile.write('languages=c("Azeri","Bulgarian","Bengali","Bosnian","Welsh","Hindi","Indonesian","Latvian","Nepali","Polish","Romanian","Slovak","Somali","Albanian","Serbian","Tamil","Turkish","Ukrainian","Uzbek","Farsi")#,"Spanish","Russian","Urdu")')
outfile.write('\n')
#in millions of tokens
outfile.write('monocrawl=c(.124,30.5,4,7.4,3.9,42.1,3.8,35.1,.127,7.8,2.9,109,.451,3.3,5.7,.189,9.1,15.2,.627,698)#,783,1500,285)\n')
outfile.write('logmonocrawl=log(monocrawl)\n')


top_10_at_f_200=[]
#topk=3 corresponds to third column of accuracies in aggmrr.table.avgfreq
topk=3
freq=200
for lang in langs:
    threeestimates=[]
    for r in range(1,4):
        lines=codecs.open("../"+lang+"/run"+str(r)+"/aggmrr.table.avgfreq",'r','utf-8').readlines()
        belowrow=0
        below=0
        above=0
        belowFound=False
        for i, row in enumerate(lines):
            row=row.split("\t")
            if i>0:
                myfreq=float(row[0])
                if myfreq>freq:
                    aboverow=i
                    above=myfreq
                elif myfreq<=freq and not belowFound:
                    below=myfreq
        #now have two rows, interpolate for 100 (y=mx+b, find m and b and estimate y based on x=100)
        x1=below
        x2=above
        if aboverow<10:
            y1=float(lines[aboverow+1].split("\t")[topk])
            y2=float(lines[aboverow].split("\t")[topk])
            slope=(y2-y1)/(x2-x1)
            intercept=y1-(slope*x1)
            extrapolate=(slope*freq)+intercept
            threeestimates.append(extrapolate)
        else:
            threeestimates.append(below)
    top_10_at_f_200.append(sum(threeestimates)/3)

#top_10_at_f100=c(15,3.17,.24,14.5,11.67,0.33,15.5,16,3,13,31,17.5,21.5,26,20,0.1,12.2,0.8,23.5)
outfile.write('top_10_at_f100=c(')
outfile.write(','.join([str(x) for x in top_10_at_f_200]))
outfile.write(')\n')

outfile.write('c=plot(monocrawl,top_10_at_f100,log="x",xlab="",ylab="",main="Monolingual Data vs. Lexicon Induction Performance", col="darkgreen",pch=15,cex=0, ylim=c(0,35), xlim=c(0.05,700), xaxt="n", yaxt="n")\n')
outfile.write('text(monocrawl,top_10_at_f100,languages,cex=1.0,col="darkgreen")\n')
outfile.write('title(xlab="Millions of Web Crawled Word Tokens",cex.lab=1.5)\n')
outfile.write('title(ylab="Accuracy in top-10, word frequency '+str(freq)+'",cex.lab=1.5)\n')
outfile.write('axis(1,cex.axis=1.0)\n')
outfile.write('axis(2,cex.axis=1.0)\n')



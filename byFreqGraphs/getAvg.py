import sys
import os
import codecs
import re

#monotext file
infile=codecs.open(sys.argv[1],'r','utf-8')
tablefile=sys.argv[2]
outfile=sys.argv[2]+".avgfreq"

binavgs={}

line=infile.readline()
while line:
    if re.search("INFO lexinduct.FreqBinInductPreparer:  - Bin",line)!=None:
        line=line.split()
        for i,w in enumerate(line):
            if w.startswith("Bin"):
                binnum=line[i+1].strip(":")
            if w.startswith("average"):
                myavg=round(float(line[i+2]),1)
                binavgs[binnum]=myavg
    line=infile.readline()

tablefile=codecs.open(tablefile,'r','utf-8')
tableout=codecs.open(outfile,'w','utf-8')

line=tablefile.readline()
line=re.sub("Bin","Ave_Freq",line)
tableout.write(line)
line=tablefile.readline()
while line:
    line=line.strip().split("\t")
    avg=binavgs[line[0]]
    tableout.write(str(avg)+"\t")
    for i,w in enumerate(line[1:]):
        tableout.write(w)
        if i<(len(line)-2):
            tableout.write("\t")
    tableout.write("\n")
    line=tablefile.readline()

#This function needs to get the Average frequencies, which are printed in the monoextract.txt logs, and add them to the tables, along with the header "Ave_Freq." Did manually for AZ, but need to automate. Then the r script should run fine. Can add top-100 line if you want



import os
import sys

lang=sys.argv[1]

langdict={}
langdict["az"]="Azeri"
langdict["bn"]="Bangla"
langdict["bs"]="Bosnian"
langdict["sk"]="Slovak"
langdict["so"]="Somali"
langdict["sq"]="Albanian"
langdict["sr"]="Serbian"
langdict["lv"]="Latvian"
langdict["ur"]="Urdu"
langdict["uz"]="Uzbek"
langdict["cy"]="Welsh"
langdict["bg"]="Bulgarian"
langdict["fa"]="Farsi"
langdict["hi"]="Hindi"
langdict["id"]="Indonesian"
langdict["ta"]="Tamil"
langdict["es"]="Spanish"
langdict["pl"]="Polish"
langdict["ru"]="Russian"
langdict["tr"]="Turkish"
langdict["uk"]="Ukrainian"
langdict["ne"]="Nepali"
langdict["ro"]="Romanian"
langdict["ms"]="Malaysian"

os.system("mkdir "+lang)
os.system("scp -r anni@login.clsp.jhu.edu:lexinducresults/"+lang+"/* "+lang+"/")
os.system("sed 's/\$LANG\$/"+langdict[lang]+"/g' context.r > "+lang+"/context.r")
os.system("python getAvg.py "+lang+"/run1/monoextract.txt "+lang+"/run1/aggmrr.table")
os.system("python getAvg.py "+lang+"/run2/monoextract.txt "+lang+"/run2/aggmrr.table")
os.system("python getAvg.py "+lang+"/run3/monoextract.txt "+lang+"/run3/aggmrr.table")
os.chdir(lang)
os.system("cat context.r | R --vanilla")

import os,sys

lang=sys.argv[1]
os.system("rm -rf "+lang+"/")
os.system("scp -r airvine@external.hltcoe.jhu.edu:/home/hltcoe/airvine/inducePhraseTable/LIMT/Experiments/LexInductExps/rankCombine/"+lang+" .")
os.system("sed 's/\$LANG\$/"+lang+"/g' context.r > "+lang+"/context.r")
os.system("sed 's/\$LANG\$/"+lang+"/g' contextC.r > "+lang+"/contextC.r")
os.chdir(lang)
os.system("cat context.r | R --vanilla")
os.system("cat contextC.r | R --vanilla")



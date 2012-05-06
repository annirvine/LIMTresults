import os
import sys

lang=sys.argv[1]

os.system("scp -r anni@login.clsp.jhu.edu:lexinducresults/"+lang+"/summarystats/ "+lang)

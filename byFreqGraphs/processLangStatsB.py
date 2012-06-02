import os
import sys

lang=sys.argv[1]

os.system("scp -r anni@login.clsp.jhu.edu:lexinducresultsB/"+lang+"/summarystats/ "+lang+".T/")

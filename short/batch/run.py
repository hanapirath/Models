import os
import shutil
import time
from string import Template
	
def run(program_name, template_name, curr, next, step=0):
	inputfile = template_name + ".ctl"
	tpl = Template(open(template_name+'.tpl').read())
	file = open(inputfile,'w')
	print >> file, tpl.substitute(i1=curr,i2=next,inc=step)
	file.close()
	run_command = program_name + ".exe" + " -K " + inputfile
	print run_command
	os.system(run_command)

def check_zero_selected(curr):
	no_select = 0
	for line in open("PlanCompare.prn",'r'):
		if "No Trips were Selected for Output" in line:
			no_select = 1
	
	return no_select

def	log_microsim_iteration(curr):
	for line in open("Microsimulator.prn","r"):
		if "Average Travel Time for Completed Trips" in line:
			with open("Microsimulator.log","a") as log:
				log.write(curr + "\t" + line)

	
# input parameters
demand_trip = "../demand/Trip"
total_vehicle = 60000
percent_equip = 100
total_range = 7200 # 2hrs
step = 300
#

# clean old runs
os.system("del /Q ..\plan\*")
os.system("del /Q ..\control\*.ctl")
os.system("del /Q ..\control\*.prn")
os.system("del /Q ..\results\*.txt")
os.system("del /Q ..\control\*.log")

# generate initial data
os.system('generateHouseholdList.py %d %d' % (total_vehicle, percent_equip))

os.chdir('..\control')

# generate uninformed plan (noinfo plan)
run("Router", "Router01", "", "")


MaxN = 100

# Initial 
percent_selected = 10
i = 0
while i < MaxN:
	i = i + 1
	
	curr = str(i).zfill(3)
	next = str(i+1).zfill(3)
	prev = str(i-1).zfill(3)

	run("PlanPrep","PlanPrepMicrosim",curr,next)
	run("Microsimulator","Microsimulator",curr,next,step)

	log_microsim_iteration(curr)
	
	# average the link delay	
	# if i > 1:
		# shutil.copy2('../results/LinkDelay.txt','../results/PrevLinkDelay.txt')
		# run("LinkDelay","LinkDelay",curr,prev)
	# else:
		# shutil.copy2('../results/NewLinkDelay.txt','../results/LinkDelay.txt')
	
	#run("PlanSum","ReskimPlan",curr,next)
	shutil.copy2('../plan/Plan','../plan/PreviousPlan')
	
	run("RouterInstant","Router",curr,next)
	run("PlanPrep","MergePlanBeforeCompare",curr,next)
	run("PlanCompare","PlanCompare",curr,next,percent_selected)
	shutil.copy2("PlanCompare.prn","PlanCompare_"+curr+".prn")
	
	if check_zero_selected(curr): # TODO - Improve converge condition
		break
	
	#if i > 30:
	#	percent_selected = 5
	
	run("PlanPrep","MergePlan",curr,next)


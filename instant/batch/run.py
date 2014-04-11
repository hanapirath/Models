import os
import shutil
import time
from string import Template
	
def run(program_name, template_name, curr, next, step=0):
	inputfile = template_name + ".ctl"
	tpl = Template(open(template_name+'.tpl').read())
	file = open(inputfile,'w')
	print >> file, tpl.substitute(a=curr,b=next,inc=step)
	file.close()
	run_command = program_name + ".exe" + " -K " + inputfile
	print run_command
	os.system(run_command)

def shift_linkdelay_time(prev, curr, next, step):
	awk_line = "awk -v d=" + str(step) + \
	           " -f shifttime.awk " + \
	           "LinkDelay.txt > LinkDelay_prev.txt"
	os.chdir("..\\results")
	os.system( awk_line )
	time.sleep(3)
	os.chdir("..\\control")
	
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

# generate initial data
os.system('generateHouseholdList.py %d %d' % (total_vehicle, percent_equip))
os.system('select_time_periods.py %s %d %d' % (demand_trip, step, total_range))

os.chdir('..\control')

# generate uninformed plan (noinfo plan)
run("Router", "Router01", "", "")

# start loop
for i in range(0,total_range,step):
	curr = str(i).zfill(4)
	next = str(i+step).zfill(4)
	prev = str(i-step).zfill(4)
	
	if i != 0:
		shift_linkdelay_time(prev, curr, next, step)
		shutil.copyfile("../plan/Plan","../plan/Plan_prev")
		run("RouterInstant", "Router", curr, next)
		run("PlanPrep", "SelectPlan", curr, next)
		run("PlanPrep", "ReplacePlan", curr, next)
		run("PlanPrep", "CombinePlan", curr, next)
		run("PlanPrep", "PlanPrep", "0000", next)		
		run("Microsimulator", "Microsimulator", curr, next, step)
	else:
		run("PlanPrep", "SelectPlan", "0000", next)
		os.rename("../plan/OldPlan", "../plan/Plan")
		run("PlanPrep", "PlanPrep", "0000", next)
		run("Microsimulator", "Microsimulator", "0000", next, step)

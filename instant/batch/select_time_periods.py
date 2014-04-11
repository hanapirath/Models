import os, sys

demand_trip = sys.argv[1] 
step = int(sys.argv[2])
total_range = int(sys.argv[3])

print "Generate household list by start time period ..."

curr = 0
while (curr < total_range):
	next = curr + step
	line = "awk -v A=" + str(curr) + " -v B=" + str(next) \
	       + " \"BEGIN{ getline } ($7 >= A && $7 < B) { print $1 }\" " \
	       + demand_trip \
	       + " > ..\userclass\Households_" + str(curr).zfill(4) + "_" + str(next).zfill(4)
	print line
	os.system(line)
	curr = curr + step

print ""
import sys, string, array

input_plan = sys.argv[1]
#output_path = sys.argv[2]

plan = open(input_plan, 'rt')

print "HHOLD\tNNODES\tPATH"

done = False
while 1:
	if done: break
	
	line = plan.readline()
	if not line: break	
	cols = string.split(line)
	id = cols[0][:-2]
	
	for i in range(1,11):
		line = plan.readline()
		if not line: 
			done = True
			break
	
	num = int(line) - 2
	line = plan.readline()
	line = plan.readline().strip("\n")
		
	if num > 10:
		if num > 20:
			line2 = plan.readline().strip("\n")
			line3 = plan.readline().strip("\n")
			print id + "\t" + str(num) + "\t\"" + line + " " + line2 + " " + line3 + "\""		
		else:
			line2 = plan.readline().strip("\n")
			print id + "\t" + str(num) + "\t\"" + line + " " + line2 + "\""
	else:
		print id + "\t" + str(num) + "\t\"" + line + "\""
		
	for i in range(1,8):
		line = plan.readline()
		if not line: 
			done = True	
			break
		
plan.close()
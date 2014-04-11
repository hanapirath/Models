import random, os, sys

total = int(sys.argv[1])
percent = int(sys.argv[2])

out1 = open("..\userclass\EquippedHouseholds",'w')
out2 = open("..\userclass\NonEquippedHouseholds",'w')

nequipped = percent*total/100

print "Generate list of equipped/unequipped vehicles ..."
print "Total number of vehicles =", total

l = list(range(1,total+1))
random.seed(555)
random.shuffle(l)

for i in l[:nequipped]:
    print >> out1, i

for i in l[nequipped:]:
    print >> out2, i

print "Number of equipped vehicles generated = ", nequipped 
print ""
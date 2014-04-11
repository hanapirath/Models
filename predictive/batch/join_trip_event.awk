# Using: awk -f join_trip_event.awk Trip.file Event.file > Output.file
BEGIN {
	OFS="\t"
	print "HHOLD", "START", "ORIGIN", "ARRIVE", "DESTINATION", "SCHEDULE", "ACTUAL"
}

FNR == NR {
	v1[$1] = $7
	v2[$1] = $8
	v3[$1] = $9
	v4[$1] = $10	
	next
}
{
	if (v1[$1]) {
		print $1, v1[$1], v2[$1], v3[$1], v4[$1], $7, $8 
	}
}
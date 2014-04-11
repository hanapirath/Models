# Using: awk -f who_equipped.awk user.file trip.file > Output.file
BEGIN {
	OFS="\t"
}
NR == FNR {
	a[$1] = $1
	next
}
{
	if (a[$1])
		print $0, "Yes"
	else
		print $0, "No"
}
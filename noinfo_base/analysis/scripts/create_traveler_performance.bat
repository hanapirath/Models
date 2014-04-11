set trip_file="..\..\demand\Trip"
set event_file="..\..\results\Event.txt"
set plan_file="..\..\plan\Plan01"

set tripevent_file="TripEvent.txt"
set path_file="Path.txt"
set travelertrip_file="TravelerTrip.txt"

awk -f join_trip_event.awk %trip_file% %event_file% > %tripevent_file%
C:\Python27\python get_path_from_plan_file.py %plan_file% > %path_file%
awk "FNR==NR{a[$1]=$0; next}{if(a[$1]){print a[$1], $0}}" OFS="\t" %tripevent_file% %path_file% > %travelertrip_file%
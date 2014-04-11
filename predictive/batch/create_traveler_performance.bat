set trip_file="..\demand\Trip"
set event_file="..\results\Event.txt"
set plan_file="..\plan\Plan_0000_7200"
set equipped_file="..\userclass\EquippedHouseholds"

set travelertrip_file="TravelerTrip.txt"

awk -f join_trip_event.awk %trip_file% %event_file% > TripEvent.txt
C:\Python27\python get_path_from_plan_file.py %plan_file% > Path.txt
awk "FNR==NR{a[$1]=$0; next}{if(a[$1]){print a[$1], $0}}" OFS="\t" TripEvent.txt Path.txt > TripEventPath.txt
awk -f who_equipped.awk %equipped_file% TripEventPath.txt > %travelertrip_file%

del TripEvent.txt
del Path.txt
del TripEventPath.txt

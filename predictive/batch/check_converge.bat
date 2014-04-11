echo ITER NTRIPS PERCENT > tmp

grep "Number of Trips Selected" ../control/PlanCompare*.prn | awk -F"[^0-9]*" "{print $2, $3, $4+$5/10}" >> tmp

move tmp ..\analysis\data\convergence.txt
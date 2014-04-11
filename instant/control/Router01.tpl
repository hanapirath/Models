TITLE		Initial Route All Travelers 
 
#---- Input Files ----

PROJECT_DIRECTORY		../
NET_DIRECTORY                 ../network/
NET_NODE_TABLE                Node.txt
NET_LINK_TABLE                Link.txt
NET_PARKING_TABLE             Parking.txt
NET_LANE_CONNECTIVITY_TABLE   Lane_Connectivity.txt
NET_ACTIVITY_LOCATION_TABLE   Activity_Location.txt
NET_PROCESS_LINK_TABLE        Process_Link.txt

TRIP_FILE                     demand/Trip
VEHICLE_FILE                  demand/Vehicle

#---- Output Files ----

NEW_PROBLEM_FILE               plan/PlanProblems01
NEW_PLAN_FILE                  plan/UninformedPlan

#---- Parameters ----

TIME_OF_DAY_FORMAT		SECONDS
NODE_LIST_PATHS		YES
LIMIT_PARKING_ACCESS		YES
IGNORE_TIME_CONSTRAINTS		YES
WALK_PATH_DETAILS		YES

WALK_SPEED			1.0
WALK_TIME_VALUE		20.0
VEHICLE_TIME_VALUE		10.0
DISTANCE_VALUE		0.0
MAX_WALK_DISTANCE		500

RANDOM_NUMBER_SEED		1
PERCENT_RANDOM_IMPEDANCE	100

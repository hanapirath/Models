TITLE                                  Simulate the Trips for @RUN@.@ALT@ Year @YEAR@
DEFAULT_FILE_FORMAT                    @FORMAT@
PROJECT_DIRECTORY                      @PROJECT@

NET_DIRECTORY                          @NETWORK@
NET_NODE_TABLE                         Node.txt
NET_LINK_TABLE                         Link.txt
NET_POCKET_LANE_TABLE                  Pocket_Lane.txt
NET_PARKING_TABLE                      Parking.txt
NET_LANE_CONNECTIVITY_TABLE            Lane_Connectivity.txt
NET_ACTIVITY_LOCATION_TABLE            Activity_Location.txt
NET_PROCESS_LINK_TABLE                 Process_Link.txt
NET_UNSIGNALIZED_NODE_TABLE            Unsignalized_Node.txt
NET_SIGNALIZED_NODE_TABLE              Signalized_Node.txt
NET_TIMING_PLAN_TABLE                  Timing_Plan.txt
NET_PHASING_PLAN_TABLE                 Phasing_Plan.txt
NET_DETECTOR_TABLE                     Detector.txt
NET_SIGNAL_COORDINATOR_TABLE           Signal_Coordinator.txt

VEHICLE_FILE                           demand/Vehicle.txt
SORT_VEHICLES                          TRUE
VEHICLE_TYPE_FILE                      demand/Vehicle_Type.txt

PLAN_FILE                              demand/TimePlan.txt
NODE_LIST_PATHS                        Yes

CELL_SIZE                              7.5
TIME_STEPS_PER_SECOND                  1
TIME_OF_DAY_FORMAT                     24_HOUR_CLOCK
SIMULATION_START_TIME                  0:00
SIMULATION_END_TIME                    27:00

SPEED_CALCULATION_METHOD               CELL-BASED

DRIVER_REACTION_TIME                   0.7, 0.8, 0.9, 1.0
PERMISSION_PROBABILITY                 55
SLOW_DOWN_PROBABILITY                  10, 15, 20
SLOW_DOWN_PERCENTAGE                   10, 20
RANDOM_NUMBER_SEED                     1122687672

PLAN_FOLLOWING_DISTANCE                525
LOOK_AHEAD_DISTANCE                    260
LOOK_AHEAD_TIME_FACTOR                 1.0
LOOK_AHEAD_LANE_FACTOR                 4.0
MAXIMUM_SWAPPING_SPEED                 37.5
MAXIMUM_SPEED_DIFFERENCE               7.5
ENFORCE_PARKING_LANES                  Yes

MINIMUM_WAITING_TIME                   60
MAXIMUM_WAITING_TIME                   120
MAX_ARRIVAL_TIME_VARIANCE              60
MAX_DEPARTURE_TIME_VARIANCE            60

NEW_PROBLEM_FILE                       results/Msim_Problem.txt
MAX_SIMULATION_ERRORS                  100000

OUTPUT_SNAPSHOT_FILE_1                 results/Snapshot.txt
OUTPUT_SNAPSHOT_TIME_FORMAT_1          24_HOUR_CLOCK
OUTPUT_SNAPSHOT_INCREMENT_1            0:1
OUTPUT_SNAPSHOT_TIME_RANGE_1           0:00..3:00

OUTPUT_SUMMARY_FILE_1                  results/Performance.txt
OUTPUT_SUMMARY_TIME_FORMAT_1           24_HOUR_CLOCK
OUTPUT_SUMMARY_INCREMENT_1             0:15
OUTPUT_SUMMARY_TIME_RANGE_1            0:00..27:00
OUTPUT_SUMMARY_TURN_FLAG_1             YES

OUTPUT_OCCUPANCY_FILE_1                results/Occupancy_Avg.txt
OUTPUT_OCCUPANCY_TIME_FORMAT_1         24_HOUR_CLOCK
OUTPUT_OCCUPANCY_INCREMENT_1           0:15
OUTPUT_OCCUPANCY_TIME_RANGE_1          0..27:00
OUTPUT_OCCUPANCY_MAX_FLAG_2            NO

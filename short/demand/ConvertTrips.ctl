TITLE						Trip Table Conversion

PROJECT_DIRECTORY			  ./
NET_DIRECTORY                 ../network
NET_ACTIVITY_LOCATION_TABLE   Activity_Location.txt
NET_PROCESS_LINK_TABLE        Process_Link.txt

VEHICLE_TYPE_FILE             VEHICLE_TYPE.txt

#---- Output ----

NEW_TRIP_FILE                     Trip
NEW_POPULATION_FILE               Population
NEW_HOUSEHOLD_FILE                Household
NEW_VEHICLE_FILE                  Vehicle

STARTING_HOUSEHOLD_ID         1
STARTING_VEHICLE_ID           1
TIME_OF_DAY_FORMAT            SECONDS
ADDITIONAL_TRAVEL_TIME	600
RANDOM_NUMBER_SEED            10             

#---- auto trips ----

TRIP_TABLE_FILE_1             TripTable.txt
TRIP_TIME_FILE_1              TripTime1.txt
TIME_CONTROL_POINT_1          ORIGIN
#ORIGIN_WEIGHT_FIELD_1         ORG_WEIGHT
#DESTINATION_WEIGHT_FIELD_1    DES_WEIGHT
TRIP_PURPOSE_CODE_1           1
TRAVEL_MODE_CODE_1            2
AVERAGE_TRAVEL_SPEED_1        10
VEHICLE_TYPE_1                1
VEHICLE_SUBTYPE_1             0


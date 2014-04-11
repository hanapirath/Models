TITLE                               10x10 Grids
DEFAULT_FILE_FORMAT                 TAB_DELIMITED

#---- Input Files ----

NET_DIRECTORY                       ./
NET_NODE_TABLE                      Input_Node.txt
NET_LINK_TABLE                      Input_Link.txt

#---- Output Files ----

NEW_DIRECTORY                       ./
NEW_NODE_TABLE                      Node.txt
NEW_LINK_TABLE                      Link.txt
#NEW_SHAPE_TABLE                    Shape.txt
NEW_ACTIVITY_LOCATION_TABLE         Activity_Location.txt
NEW_PARKING_TABLE                   Parking.txt
NEW_PROCESS_LINK_TABLE              Process_Link.txt
NEW_POCKET_LANE_TABLE               Pocket_Lane.txt
NEW_LANE_CONNECTIVITY_TABLE         Lane_Connectivity.txt
NEW_UNSIGNALIZED_NODE_TABLE         Unsignalized_Node.txt
NEW_SIGNALIZED_NODE_TABLE           Signalized_Node.txt

#---- Parameters -----

FACILITY_TYPE_ACCESS_FLAGS		0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0

MAXIMUM_ACCESS_POINTS		1
MINIMUM_SPLIT_LENGTHS		500
ADD_UTURN_TO_DEADEND_LINKS		NO
INTERSECTION_SETBACK_DISTANCE		0.0

#!/bin/bash

# Update rosdep
rosdep update

# Create a catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src

# Create a ROS package
catkin_create_pkg beginner_tutorials std_msgs rospy roscpp

# Build the workspace
cd ~/catkin_ws
catkin_make

# Source the workspace
source ~/catkin_ws/devel/setup.bash
#!/bin/bash
set -e

# Setup ROS environment
source "/opt/ros/$ROS_DISTRO/setup.bash"

# Source catkin workspace if it exists
if [ -f "/home/$USER/catkin_ws/devel/setup.bash" ]; then
    source "/home/$USER/catkin_ws/devel/setup.bash"
fi

exec "$@"
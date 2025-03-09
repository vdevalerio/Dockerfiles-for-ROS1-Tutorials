#!/bin/bash

# Variable that will be userd to set image and container name and tag.
NAME="focal:latest"

# Build docker image from Dockerfile.
docker build -t $NAME .
# Explanation:
#   docker  Calls docker executable.
#   build   Command to build an image from a Dockerfile.
#   -t      An option to attribute a name, and optionally a tag (name:tag),
#           to Docker Container. If no tag is passed, it will use the default
#           tag, 'latest'.
#   $NAME   The valuue of $NAME, will be the name and tag of our image,
#           you could choose another name.
#   .       Path of Dockerfile. If it's in the same directory of this script,
#           you should use '.', if it's in a different repository, you
#           should pass it explicitly.

# Allow X11 access for the current user
xhost +local:root

# Build docker container and remove it after execution.
docker run -i -t --rm \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="LIBGL_ALWAYS_SOFTWARE=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    $NAME
# Explanation:
#   docker      Calls docker executable.
#   run         Create and run a new container from an image.
#   -i          Allows us to input commands on the terminal
#   -t          This option allocates a pseudo-TTY (terminal) for the container.
#   --rm        Deletes the container after executions is completed.
#   $NAME       The valuue of $NAME, will be the name of our container, you could
#               choose another name.
#   --env       Sets environment variable
#   --volume    Bind mount a volume

# Revoke X11 access for the current user
xhost -local:root

# Remove docker image
docker rmi $NAME
# Explanation:
#   docker  Calls docker executable.
#   rmi     Says docker to remove one or more images
#   $NAME   The name we used on our image.

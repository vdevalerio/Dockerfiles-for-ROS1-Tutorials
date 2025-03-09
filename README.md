# Dockerfiles for ROS1 Tutorials
This repo is intended to give you an out of the box environment to complete [ROS Tutorials](https://wiki.ros.org/ROS/Tutorials).

## Note
At first, this was intended to be used modularly, i.e, entering each tutorial folder and running ```./setup.sh```, but you may wish start from Tutorial X and keep your container. You may remove '--rm' from docker image building and comment the command that removes the image, so your setup.sh looks like:
```
#!/bin/bash
docker build -t $NAME .
docker run -it $NAME
```
# [01. Installing ROS](https://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment)

## Requirements
- Basic skills on CLI text editors, such as Vim or Nano, to edit Ubuntu repositories.
  - Once we are running on Docker with a minimal setup, we won't rely on GUI. ROS tutorial points to a [guide that relies on GUI](https://help.ubuntu.com/community/Repositories/Ubuntu), but we'll be using a [CLI equivalent one](https://help.ubuntu.com/community/Repositories/CommandLine).

## Scripts
If you're on a Linux machine, you can run these scripts to handle docker. If not, open the script and read it, it's explained, you can use it as reference to run docker on your OS.

Attribute execution permissions to make the script executable:
```
$ sudo chmod +x setup.sh
```

Execute the script:
```
$ sh setup.sh
```
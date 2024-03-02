# go1-dockerfile

This repository provides a Dockerfile for setting up the BitDog environment, allowing for seamless containerization. The Docker commands enable easy building and execution of the container. Additionally, the README guides users through launching the Robot Operating System (ROS) with specific configurations for the Unitree robot, facilitating a smooth development and testing process.

## Docker

All commands should be run within the folder containing the repository files.

```sh 
docker build -t bitdog:1.0 .
```

```sh 
source docker_gazebo.bash
```

To enter the container in another terminal:

```sh 
docker exec -it bitdog_container bash
```

Hint: The container name can be obtained by pressing Tab while typing the command or by using the `docker ps` command.

## ROS

```sh 
roslaunch unitree_gazebo normal.launch rname:=go1
```

```sh 
rosrun unitree_controller unitree_servo
```

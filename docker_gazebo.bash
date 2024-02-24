#!/bin/bash

xhost +local:
docker run \
        -it \
        --rm \
        --privileged \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --cpu-shares 1024  \
        --memory 2g \
        --net=host \
        --name bitdog_container \
        bitdog:1.0

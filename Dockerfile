FROM ros:melodic-ros-core

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        build-essential \
        ros-melodic-gazebo-ros-pkgs \
        ros-melodic-rviz \
        python-catkin-tools \
        ros-melodic-xacro \
        ros-melodic-robot-state-publisher \
        ros-melodic-joint-state-controller \
        ros-melodic-controller-manager \
        ros-melodic-teleop-twist-keyboard \
        ros-melodic-controller-interface \
        ros-melodic-gazebo-ros-control \
        ros-melodic-effort-controllers \
        ros-melodic-joint-trajectory-controller \
        git \
        cmake

RUN mkdir -p /gazebo_ws/src
WORKDIR /gazebo_ws/src
RUN git clone https://github.com/unitreerobotics/unitree_ros.git 
RUN git clone https://github.com/unitreerobotics/unitree_ros_to_real.git
WORKDIR /gazebo_ws/src/unitree_ros_to_real
RUN git clone -b v3.5.1 https://github.com/unitreerobotics/unitree_legged_sdk
RUN mv unitree_legged_msgs/ ..

WORKDIR $HOME
RUN git clone -b v1.4.0 https://github.com/lcm-proj/lcm

RUN cd lcm && \
    mkdir build && \
    cd build && \
    cmake ../ && \
    make && \
    make install

WORKDIR /gazebo_ws
RUN /bin/bash -c '. /opt/ros/${ROS_DISTRO}/setup.bash; catkin build go1_description unitree_legged_msgs unitree_controller unitree_gazebo unitree_legged_control' && \ 
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.bashrc && \ 
    echo "source /gazebo_ws/devel/setup.bash" >> /root/.bashrc 

RUN sysctl -w kernel.shmmax=4294967296

CMD ["bash"]

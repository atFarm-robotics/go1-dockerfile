# go1-dockerfile

## Docker

Todos comandos devem ser rodadaos dentro da pasta que contém os arquivos do repositório.

```sh 
docker build -t bitdog:1.0 .
```

```sh 
source docker_gazebo.bash
```
Entrar no container em outro terminal:

```sh 
docker exec -it <nome_container> bash
```
Hint: o nome do container pode ser obtido dando Tab na hora que estiver escrevendo o comando ou com o comando docker ps

## ROS

```sh 
roslaunch unitree_gazebo normal rname:go1
```

```sh 
rosrun unitree_controllers unitree_servo
```


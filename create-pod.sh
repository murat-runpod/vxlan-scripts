#!/bin/sh

echo ~~~Creating container~~~
docker run -d --name pod --net vxlan-bridge --ip 172.18.0.12 --gpus all nvidia/cuda:12.4.0-base-ubuntu22.04 sleep 10000
docker exec pod apt update
docker exec pod apt install iproute2 -y

echo ~~~Configuring interface~~~
#docker exec pod ip link set dev eth0 mtu 8950
docker exec pod ip a | grep mtu

echo ~~~Starting Pod~~~
docker exec -it pod bash


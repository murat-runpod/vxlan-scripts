#!/bin/sh

# install docker

apt update

apt install docker.io -y
apt install iproute2 -y
apt install net-tools -y
apt install jq -y

# create new docker bridge network

docker network create --subnet 172.18.0.0/16 vxlan-bridge

# create VXLAN tunnel interface 

# "vxlan-tunnel" - arbitrary interface name

# "type vxlan" - interface type

# "id 100" - VNI (VXLAN Network Idenfitifer)

# "remote 213.173.111.95" - target host machine

# "dstport 4789" - standard UDP port over VXLAN

# "dev bond0" - find default host interface with "ip route"

ip link add vxlan-tunnel type vxlan id 100 remote 213.173.111.95 dstport 4789 dev bond0.2636

# show new interface

ip a | grep vxlan-tunnel

# set interface to "UP"

ip link set vxlan-tunnel up

# attach new VXLAN-tunnel interface to our docker bridge network

sudo brctl addif br-`sudo docker inspect vxlan-bridge | jq -r '.[].Id'` vxlan-tunnel

# show routing table

route -n 
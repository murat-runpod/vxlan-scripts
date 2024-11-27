#!/bin/sh

# install docker

apt install docker.io -y
apt install iproute2 -y
apt install net-tools -y
apt install jq -y

# create new docker bridge network
echo ~~~Creating docker bridge network~~~
docker network create --subnet 172.18.0.0/16 vxlan-bridge
bridge_id=$(sudo docker network inspect -f {{.Id}} vxlan-bridge)

# create VXLAN tunnel interface 
echo ~~~Creating VXLAN tunnel interface~~~

# "vxlan-tunnel" - arbitrary interface name

# "type vxlan" - interface type

# "id 100" - VNI (VXLAN Network Idenfitifer)

# "remote 213.173.111.95" - target host machine

# "dstport 4789" - standard UDP port over VXLAN

# "dev bond0" - find default host interface with "ip route"

ip link add vxlan-tunnel type vxlan id 100 remote 213.173.111.95 dstport 4789 dev bond0.2636

# set interface to "UP"

ip link set vxlan-tunnel up

# show new interface

ip a | grep vxlan-tunnel

# attach new VXLAN-tunnel interface to our docker bridge network
echo ~~~Attaching VXLAN tunnel to docker bridge~~~
brctl addif br-${bridge_id} vxlan-tunnel

# show bridge interfaces

brctl show